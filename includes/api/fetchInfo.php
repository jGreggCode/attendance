<?php
require_once '../database/dbh.inc.php'; // Adjust if your DB config path is different
header('Content-Type: application/json');

// Check if user_id is passed
if (!isset($_GET['user_id'])) {
    echo json_encode([
        'status' => 'error',
        'message' => 'Missing user_id parameter'
    ]);
    exit();
}

$rfid_code = $_GET['user_id'];

$db = $conn;

// Prepare and execute query
try {
  $stmt = $db->prepare("SELECT student_photo, rfid_code, user_id, first_name, middle_name, last_name, age, birthday, course, year_level, department, user_type, username, email, phone_number FROM users WHERE rfid_code = :rfid_code");
  $stmt->bindParam(':rfid_code', $rfid_code);
  $stmt->execute();

  $user = $stmt->fetch(PDO::FETCH_ASSOC);

  if ($user) {
      echo json_encode([
          'status' => 'success',
          'data' => $user
      ]);
  } else {
      echo json_encode([
          'status' => 'error',
          'message' => 'User not found'
      ]);
  }
} catch (PDOException $e) {
  echo json_encode([
      'status' => 'error',
      'message' => 'Database error: ' . $e->getMessage()
  ]);
}