<?php
// ==== HANDLE AJAX REQUEST ====

require_once "../model/Email.php";
require_once "../database/dbh.inc.php";

$db = $conn;
$mailer = new AccountMailer($db);

// Sample structure: action=activate, email=abc@example.com, etc.
$action = $_POST['action'] ?? '';
$response = ['status' => 'error', 'message' => 'Invalid request'];

switch ($action) {
  case 'timein':
    $response = $mailer->handleTimein(
        $_POST['email'],
        $_POST['type'],
        $_POST['fullname'],
        $_POST['dateToday'],
        $_POST['nowTime'],
    );
    break;

  case 'timeout':
    $response = $mailer->handleTimeout(
        $_POST['email'],
        $_POST['type'],
        $_POST['fullname'],
        $_POST['dateToday'],
        $_POST['nowTime'],
    );
    break;
}

echo json_encode($response);
exit;
