<?php
// Connect to your database
$host = 'localhost';
$user = 'root';
$pass = '';
$dbname = 'saclitms';

$conn = new mysqli($host, $user, $pass, $dbname);
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Set headers so the browser downloads the file
header('Content-Type: text/csv');
header('Content-Disposition: attachment; filename="attendance_report.csv"');

// Open PHP output stream as a file handle
$output = fopen('php://output', 'w');

// Write the column headers
fputcsv($output, ['RFID Code', 'Full Name', 'Last Name', 'User Type', 'Course', 'Date', 'Time In', 'Time Out']);

// Get attendance joined with users
$query = "
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

$result = $conn->query($query);

// Loop through results and write each row to the CSV
while ($row = $result->fetch_assoc()) {
  fputcsv($output, [
    $row['rfid_code'],
    $row['first_name'],
    $row['last_name'],
    $row['user_type'],
    $row['course'],
    $row['date'],
    $row['time_in'],
    $row['time_out']
  ]);
}

fclose($output);
$conn->close();
exit;
?>