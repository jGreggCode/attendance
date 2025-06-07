<?php
include_once "../includes/database/dbh.inc.php";

$stmt = $conn->prepare("SELECT id, first_name, rfid_code, email FROM users WHERE user_type = 'Student'");
$stmt->execute();
$students = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode(['data' => $students]);