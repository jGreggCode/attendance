<?php 
// Copyright © 2025 John Gregg [Your Last Name]
// All rights reserved. Unauthorized use is prohibited.

declare(strict_types=1);

require_once '../model/user.model.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['signinUserId'])) {
  
  // Grabbing data from the form
  $username = $_POST["signinUserId"];
  $password = $_POST["signinPassword"];

  // Initialize your database connection
  $db = $conn; 

  // Instantiate signin controller
  include_once "../database/dbh.inc.php";
  include_once "../controller/signin.contr.php";
  $signin = new SignInController($db, $username, $password);
  $response = $signin->signInUser();

  // Running Error handling
  if ($response['status'] === 'success') {
    //accountActivatedEmail($accountType, $accountEmail);
    
    $message = 'Login Successful!';
    $response = ['status' => 'success', 'message' => $message, 'session' => $_SESSION];
  } else {
    $message = $response['message'];
    $response = ['status' => 'error', 'message' => $message];
  }

  // Going back to frontpage
  echo json_encode($response);
  exit();
}