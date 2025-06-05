<?php
// Copyright © 2025 John Gregg [Your Last Name]
// All rights reserved. Unauthorized use is prohibited.

// Database
include_once "../database/dbh.inc.php";

// Session Data needed for props
require_once "../session/config.session.inc.php";

// Fetch Model Class
require_once '../model/fetching_data.model.php';

// Users RFID
$rfid = $_SESSION['user']['rfid_code'];

$db = $conn;

$fetchData = new FetchData($db);

// Example start and end date (can be modified dynamically via JS)
$startDate = date('2025-05-01');
$endDate = date('Y-m-t');

$attendance = $fetchData->getAttendance($rfid, $startDate, $endDate);
$attendanceSummary = $fetchData->getAttendanceSummary($rfid);

header('Content-Type: application/json');
echo json_encode([
  'attendance' => $attendance,
  'attendanceSum' => $attendanceSummary
]);

