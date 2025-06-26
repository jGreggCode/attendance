<?php
require_once '../session/config.session.inc.php';
require_once '../utils/dompdf/autoload.inc.php';

use Dompdf\Dompdf;
use Dompdf\Options;

// Start session if not already started
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

$rfid_code = $_SESSION['user']['rfid_code'] ?? null;
if (!$rfid_code) {
    die("No RFID code found in session.");
}

// DB Connection
$dsn = 'mysql:host=localhost;dbname=saclitms;charset=utf8mb4';
$user = 'root';
$pass = '';

try {
    $pdo = new PDO($dsn, $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}

// Fetch attendance data
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

// --- Dompdf Setup ---

// Configure all options ONCE.
$options = new Options();
$options->set('isHtml5ParserEnabled', true);
$options->set('isPhpEnabled', true);
$options->set('isRemoteEnabled', true); // Crucial for Base64 images in HTML <img> tags

// Instantiate Dompdf ONCE with all options.
$dompdf = new Dompdf($options);
$dompdf->setPaper('A4', 'landscape');

// Get image path and encode to Base64
$logoPath = realpath('../../assets/saclilogo.png');
if (!$logoPath || !file_exists($logoPath)) {
    // Provide a fallback or log an error, but don't die if it's not absolutely critical
    // for the report generation to proceed without the logo.
    // For this example, we'll continue but the logo won't appear.
    // You might want to remove this if the logo is mandatory.
    error_log("CRITICAL ERROR: Logo file could not be found. Path checked: " . htmlspecialchars($logoPath ?: '../../assets/saclilogo.png'));
    $logoBase64 = null; // Set to null if image not found
} else {
    $logoData = file_get_contents($logoPath);
    if ($logoData === false) {
        error_log("CRITICAL ERROR: Could not read logo file. Check file permissions.");
        $logoBase64 = null;
    } else {
        $logoBase64 = 'data:image/png;base64,' . base64_encode($logoData);
    }
}

// --- Build HTML ---
$generatedAt = date('F j, Y g:i A');
$html = '
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Attendance Report</title>
    <style>
        body { font-family: sans-serif; position: relative; margin: 0; padding: 0; }
        
        /* Watermark style */
        .watermark {
            position: fixed; /* Fixed position relative to the viewport/page */
            top: 50%;
            left: 50%;
            transform: translate(-58%, -58%); /* Center the image */
            opacity: 0.8; /* Desired opacity */
            width: 500px; /* Adjust size as needed */
            z-index: -1000; /* Ensure it stays behind content */
            pointer-events: none; /* Prevent interaction */
        }

        table { 
            border-collapse: collapse; 
            width: 100%; 
            page-break-inside: auto; 
            margin-top: 20px; /* Add some space from the header */
        }
        th, td { 
            border: 1px solid #000; 
            padding: 8px; 
            font-size: 11px; 
            text-align: left; 
        }
        th { 
            background-color: #3fae60; 
            color: white; 
        }
        tr { 
            page-break-inside: avoid; 
            page-break-after: auto; 
        }
        thead { 
            display: table-header-group; 
        }
        .header { 
            text-align: center; 
            margin-bottom: 20px; 
        }
        .header h2 { 
            margin: 0; 
        }
        .header p { 
            margin: 5px 0 0 0; 
            font-size: 12px; 
        }
    </style>
</head>
<body>';

// Add the watermark image if available
if ($logoBase64) {
    $html .= '<img src="' . $logoBase64 . '" class="watermark" alt="Watermark Logo">';
}

$html .= '
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
        <td>' . htmlspecialchars($row['rfid_code']) . '</td>
        <td>' . htmlspecialchars($row['first_name'] . ' ' . $row['last_name']) . '</td>
        <td>' . htmlspecialchars($row['user_type']) . '</td>
        <td>' . htmlspecialchars($row['course'] ?? 'N/A') . '</td>
        <td>' . htmlspecialchars($row['date']) . '</td>
        <td>' . ($row['time_in'] ? date('h:i A', strtotime($row['time_in'])) : 'N/A') . '</td>
        <td>' . ($row['time_out'] ? date('h:i A', strtotime($row['time_out'])) : 'N/A') . '</td>
    </tr>';
}

$html .= '</tbody></table>
</body>
</html>';

// Render and stream the PDF
$dompdf->loadHtml($html);
$dompdf->render();
// Stream the file to the browser to open in a new tab
$dompdf->stream('attendance_report.pdf', ['Attachment' => false]);