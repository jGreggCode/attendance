<?php
// Copyright © 2025 John Gregg [Your Last Name]
// All rights reserved. Unauthorized use is prohibited.

require '../database/dbh.inc.php';
require_once "../session/config.session.inc.php";

$rfid_code = $_SESSION['user']['rfid_code'];
$user_type = $_SESSION['user']['user_type'];
$page = isset($_POST['page']) ? (int)$_POST['page'] : 1;

if (!$rfid_code || !$user_type) {
  echo json_encode(['error' => 'Missing parameters.']);
  exit;
}

// Calculate the start of the week based on the current page
$today = new DateTime();
$interval = new DateInterval('P7D');
$weekStart = clone $today;
$weekStart->modify('-' . (($page - 1) * 7) . ' days');
$weekStart->modify('last sunday'); // Set to the previous Sunday (start of week)

// Pre-fill week data (Sunday to Saturday)
$data = [];
for ($i = 0; $i < 7; $i++) {
  $dayDate = clone $weekStart;
  $dayDate->modify("+$i day");
  $formatted = $dayDate->format('Y-m-d'); // same as your DB format
  $dayOfWeek = $dayDate->format('l');
  
  $data[$formatted] = [
    'date' => $formatted,
    'day' => $dayOfWeek,
    'status' => '',
    'time_in' => '',
    'time_out' => ''
  ];
}

// Prepare the correct start and end date for SQL query
$startDate = $weekStart->format('Y-m-d');
$endDate = (clone $weekStart)->modify('+6 days')->format('Y-m-d');

// Fetch attendance for the selected week
$query = "
  SELECT a.date, a.time_in, a.time_out
  FROM attendance a
  WHERE a.rfid_code = :rfid_code 
    AND a.user_type = :user_type
    AND a.date BETWEEN :start_date AND :end_date
";

$stmt = $conn->prepare($query);
$stmt->execute([
  ':rfid_code' => $rfid_code,
  ':user_type' => $user_type,
  ':start_date' => $startDate,
  ':end_date' => $endDate
]);

while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
  $date = $row['date'];
  $status = (!$row['time_in'] && !$row['time_out']) ? 'Absent' : 'On time';

  if (isset($data[$date])) {
    $data[$date]['status'] = $status;
    $data[$date]['time_in'] = $row['time_in'];
    $data[$date]['time_out'] = $row['time_out'];
  }
}

// Output as JSON (numeric array)
echo json_encode(array_values($data));
