<?php
require_once "../database/dbh.inc.php";

$cutoffDate = date('Y-m-d', strtotime('-5 years'));

// Fetch column names from users table
$columnsStmt = $conn->prepare("DESCRIBE users");
$columnsStmt->execute();
$columns = $columnsStmt->fetchAll(PDO::FETCH_COLUMN);

// Main query: all user columns + latest attendance
$sql = "
  SELECT u.*, MAX(a.date) AS last_attendance
  FROM users u
  INNER JOIN attendance a ON u.rfid_code = a.rfid_code
  WHERE u.user_type = 'Employee'
  GROUP BY u.rfid_code
  HAVING last_attendance < :cutoffDate
";

$stmt = $conn->prepare($sql);
$stmt->execute([':cutoffDate' => $cutoffDate]);
$users = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Headers for CSV
header('Content-Type: text/csv');
header('Content-Disposition: attachment; filename="purged_employees_' . date('Ymd_His') . '.csv"');

$output = fopen('php://output', 'w');

// Add last_attendance to column list
$columns[] = 'last_attendance';
fputcsv($output, $columns);

// Output each user's data
foreach ($users as $user) {
  $row = [];
  foreach ($columns as $col) {
    $row[] = $user[$col] ?? '';
  }
  fputcsv($output, $row);
}

fclose($output);
exit;
