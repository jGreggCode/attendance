<?php
require_once '../database/dbh.inc.php';
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
  echo json_encode(['success' => false, 'message' => 'Invalid request method']);
  exit;
}

// Extract POST data
$id = $_POST['id'] ?? null;
$time_in = $_POST['time_in'] ?? null;
$time_out = $_POST['time_out'] ?? null;
$reason = $_POST['reason'] ?? null;

// Basic validation
if (!$id || !$time_in || !$time_out || !$reason) {
  echo json_encode(['success' => false, 'message' => 'Missing required fields']);
  exit;
}

try {
  $stmt = $conn->prepare("UPDATE attendance SET time_in = ?, time_out = ?, status = 'Edited', reason = ? WHERE id = ?");
  $success = $stmt->execute([$time_in, $time_out, $reason, $id]);

  echo json_encode(['success' => $success]);
} catch (PDOException $e) {
  echo json_encode(['success' => false, 'message' => 'Database error', 'error' => $e->getMessage()]);
}
