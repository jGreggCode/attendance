<?php
require_once '../session/config.session.inc.php';
require_once '../utils/dompdf/autoload.inc.php';

use Dompdf\Dompdf;
use Dompdf\Options;

$rfid_code = $_SESSION['user']['rfid_code'] ?? null;
if (!$rfid_code) die("No RFID code found in session.");

// DB
$dsn = 'mysql:host=localhost;dbname=saclitms;charset=utf8mb4';
$user = 'root';
$pass = 'jgadmin';

try {
    $pdo = new PDO($dsn, $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}

// Fetch attendance
$stmt = $pdo->prepare("
  SELECT 
    a.rfid_code,
    u.first_name,
    u.last_name,
    u.user_type,
    u.course,
    a.date,
    a.time_in,
    a.time_out
  FROM attendance a
  INNER JOIN users u ON a.rfid_code = u.rfid_code
  WHERE a.rfid_code = ?
  ORDER BY a.date DESC, a.time_in DESC
");
$stmt->execute([$rfid_code]);
$data = $stmt->fetchAll();

// Setup DOMPDF
$options = new Options();
$options->set('isHtml5ParserEnabled', true);
$options->set('isPhpEnabled', true);

$dompdf = new Dompdf($options);
$dompdf->setPaper('A4', 'landscape');

// Set watermark callback
$logoPath = realpath('../../assets/saclilogo.png');

if (!file_exists($logoPath)) {
    echo "Logo not found: $logoPath";
    exit;
}

$dompdf->setCallbacks([
    'page' => function ($pdf) {
      $canvas = $pdf->get_canvas();
      $canvas->set_opacity(0.08);
      @$canvas->image('../../assets/saclilogo.png', 130, 140, 300); // try without realpath
      $canvas->set_opacity(1);
    }
  ]);

// Build HTML
$generatedAt = date('F j, Y g:i A');
$html = '
<style>
  body { font-family: sans-serif; position: relative; }
  table { border-collapse: collapse; width: 100%; page-break-inside: auto; }
  th, td { border: 1px solid #000; padding: 6px; font-size: 12px; }
  th { background-color: #3fae60; }
  tr { page-break-inside: avoid; page-break-after: auto; }
  thead { display: table-header-group; }
  .header { text-align: center; margin-bottom: 20px; }
</style>

<div class="header">
  <h2>Attendance Report</h2>
  <p>Generated on: ' . $generatedAt . '</p>
</div>

<table>
  <thead>
    <tr>
      <th>RFID Code</th>
      <th>Full Name</th>
      <th>User Type</th>
      <th>Course</th>
      <th>Date</th>
      <th>Time In</th>
      <th>Time Out</th>
    </tr>
  </thead>
  <tbody>';

foreach ($data as $row) {
    $html .= '<tr>
      <td>' . $row['rfid_code'] . '</td>
      <td>' . $row['first_name'] . ' ' . $row['last_name'] . '</td>
      <td>' . $row['user_type'] . '</td>
      <td>' . $row['course'] . '</td>
      <td>' . $row['date'] . '</td>
      <td>' . ($row['time_in'] ? date('h:i A', strtotime($row['time_in'])) : '') . '</td>
      <td>' . ($row['time_out'] ? date('h:i A', strtotime($row['time_out'])) : '') . '</td>
    </tr>';
}

$html .= '</tbody></table>';

// Render and stream
$dompdf->loadHtml($html);
$dompdf->render();
$dompdf->stream('attendance_report.pdf', ['Attachment' => false]); // open in new tab
