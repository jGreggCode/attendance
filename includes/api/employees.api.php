<?php
include_once "../database/dbh.inc.php";

$sql = "SELECT student_photo, id, user_id, first_name, middle_name, last_name, rfid_code, email, department, academic_year, semester FROM users WHERE user_type = 'Employee'";

$stmt = $conn->prepare($sql);

$stmt->execute();
$employees = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode(['data' => $employees]);
