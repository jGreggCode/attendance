<?php
include_once "../includes/database/dbh.inc.php";

$courseFilter = isset($_GET['course']) && $_GET['course'] !== 'selected' ? $_GET['course'] : null;

$sql = "SELECT student_photo, id, user_id, first_name, middle_name, last_name, rfid_code, email, course, academic_year, semester, year_level FROM users WHERE user_type = 'Student'";

if ($courseFilter) {
  $sql .= " AND course = :course";
}

$stmt = $conn->prepare($sql);

if ($courseFilter) {
  $stmt->bindParam(':course', $courseFilter);
}

$stmt->execute();
$students = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode(['data' => $students]);
