<?php
require_once '../database/dbh.inc.php'; // adjust path as needed

header('Content-Type: application/json');

if (!isset($_GET['id'])) {
  echo json_encode(['success' => false, 'message' => 'No ID provided']);
  exit;
}

$id = $_GET['id'];

try {
  $stmt = $conn->prepare("SELECT * FROM attendance WHERE id = ?");
  $stmt->execute([$id]);
  $data = $stmt->fetch(PDO::FETCH_ASSOC);

  if ($data) {
    echo json_encode(['success' => true, 'data' => $data]);
  } else {
    echo json_encode(['success' => false, 'message' => 'No record found']);
  }
} catch (PDOException $e) {
  echo json_encode(['success' => false, 'message' => 'Query failed', 'error' => $e->getMessage()]);
}
