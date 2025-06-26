<?php
// Connect to your database
require_once '../database/dbh.inc.php';
require_once '../session/config.session.inc.php';

// Set headers for CSV download
header('Content-Type: text/csv');
header('Content-Disposition: attachment; filename="attendance_report.csv"');

// Open output stream
$output = fopen('php://output', 'w');

// Column headers
fputcsv($output, ['RFID Code', 'First Name', 'Last Name', 'User Type', 'Course', 'Date', 'Time In', 'Time Out']);

// Query
$sql = "
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
  ORDER BY a.date DESC, a.time_in DESC
";

// Prepare and execute
$stmt = $conn->prepare($sql);
$stmt->execute();

// Output each row
while ($row = $stmt->fetch()) {
  fputcsv($output, [
    $row['rfid_code'],
    $row['first_name'],
    $row['last_name'],
    $row['user_type'],
    $row['course'],
    $row['date'],
    $row['time_in'] ? date('h:i A', strtotime($row['time_in'])) : '',
    $row['time_out'] ? date('h:i A', strtotime($row['time_out'])) : ''
]);
}

fclose($output);
exit;