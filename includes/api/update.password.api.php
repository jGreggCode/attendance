<?php 
// Copyright © 2025 John Gregg [Your Last Name]
// All rights reserved. Unauthorized use is prohibited.

declare(strict_types=1);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once '../model/user.model.php';
include_once "../database/dbh.inc.php";
include_once "../controller/UpdatePasswordController.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['user_id'])) {

  $user_id = $_POST["user_id"];
  $currentPassword = $_POST["currentPassword"];
  $newPassword = $_POST["newPassword"];
  $newRePassword = $_POST["newRePassword"];

  // Create controller instance
  $update = new UpdatePasswordController(
    $conn, 
    $user_id, 
    $currentPassword, 
    $newPassword, 
    $newRePassword, 
  );

  // Call update
  $response = $update->updatePassword();

  // Running Error handling
  if ($response['status'] === 'success') {
    //accountActivatedEmail($accountType, $accountEmail);
    
    $message = 'Account Updated Successfully';
    $response = ['status' => 'success', 'message' => $message];
  } else {
    $message = $response['message'];
    $response = ['status' => 'error', 'message' => $message];
  }

  // Going back to frontpage
  echo json_encode($response);
  exit();

}
