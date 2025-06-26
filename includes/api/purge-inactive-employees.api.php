<?php
require_once "../database/dbh.inc.php";
header('Content-Type: application/json');

try {
  $cutoffDate = date('Y-m-d', strtotime('-5 years'));

  $sql = "
    SELECT u.rfid_code
    FROM users u
    INNER JOIN attendance a ON u.rfid_code = a.rfid_code
    WHERE u.user_type = 'Employee'
    GROUP BY u.rfid_code
    HAVING MAX(a.date) < :cutoffDate
  ";

  $stmt = $conn->prepare($sql);
  $stmt->execute([':cutoffDate' => $cutoffDate]);
  $rfids = $stmt->fetchAll(PDO::FETCH_COLUMN);

  if (empty($rfids)) {
    echo json_encode(['success' => true, 'message' => 'No employees inactive for 5+ years.']);
    exit;
  }

  $inPlaceholders = implode(',', array_fill(0, count($rfids), '?'));
  $deleteSql = "DELETE FROM users WHERE rfid_code IN ($inPlaceholders)";
  $deleteStmt = $conn->prepare($deleteSql);
  $deleteStmt->execute($rfids);

  echo json_encode([
    'success' => true,
    'message' => count($rfids) . " employee(s) deleted."
  ]);

} catch (Exception $e) {
  echo json_encode(['success' => false, 'message' => 'Server error: ' . $e->getMessage()]);
}
