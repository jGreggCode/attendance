<?php
include_once "../includes/database/dbh.inc.php";

$sql = "SELECT id, rfid_code, user_type, date, time_in, time_out FROM attendance;";

$stmt = $conn->prepare($sql);

$stmt->execute();
$attendance = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode(['data' => $attendance]);
