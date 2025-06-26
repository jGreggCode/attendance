<?php
include_once "../database/dbh.inc.php";

$sql = "SELECT * FROM users WHERE user_type = 'Employee'";

$stmt = $conn->prepare($sql);

$stmt->execute();
$employees = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode(['data' => $employees]);
