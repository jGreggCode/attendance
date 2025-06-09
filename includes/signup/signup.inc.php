<?php 
// Copyright © 2025 John Gregg [Your Last Name]
// All rights reserved. Unauthorized use is prohibited.

declare(strict_types=1);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once '../model/user.model.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['user_id'])) {
  if (isset($_FILES['student_photo']) && $_FILES['student_photo']['error'] === UPLOAD_ERR_OK) {
    $fileTmpPath = $_FILES['student_photo']['tmp_name'];
    $fileName = $_FILES['student_photo']['name'];
    $fileSize = $_FILES['student_photo']['size'];
    $fileType = $_FILES['student_photo']['type'];
    $fileExt = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));

    $maxFileSize = 30 * 1024 * 1024; // 30MB
    $allowedExtensions = ['jpg', 'jpeg', 'png', 'gif', 'webp'];

    if ($fileSize > $maxFileSize) {
      echo json_encode(['status' => 'error', 'message' => 'Image must be less than 30MB.']);
      exit();
    }

    if (!in_array($fileExt, $allowedExtensions)) {
      echo json_encode(['status' => 'error', 'message' => 'Invalid image file type.']);
      exit();
    }

    $user_id = $_POST['user_id']; // or however you're collecting this

    // Create folder if not exists
    $uploadDir = "../../assets/Users/$user_id/";
    $dbDirectory = "../assets/Users/$user_id/";
    if (!file_exists($uploadDir)) {
        mkdir($uploadDir, 0777, true);
    }

    $newFileName = uniqid() . '.' . $fileExt;
    $student_photo = $uploadDir . $newFileName;

    if (!move_uploaded_file($fileTmpPath, $student_photo)) {
      echo json_encode([
          'status' => 'error',
          'message' => 'Failed to move uploaded file.'
      ]);
      exit();
    }

    $student_photo = $dbDirectory . $newFileName;

    // Grabbing data from the form
    $studentID = $_POST["user_id"];
    $rfid_code = $_POST["rfid_code"];
    $first_name = $_POST["first_name"];
    $middle_name = $_POST["middle_name"];
    $last_name = $_POST["last_name"];
    $age = $_POST["age"];
    $birthday = $_POST["birthday"];
    $course = $_POST["course"];
    $year_level = $_POST["year_level"];
    $department = $_POST["department"];
    $user_type = $_POST["user_type"];
    $username = $_POST["username"];
    $password = $_POST["password"];
    $repassword = $_POST["repassword"];
    $email = $_POST["email"];
    $phone_number = $_POST["phone_number"];

    // Initialize your database connection
    $db = $conn; 

    // Instantiate signup controller
    include_once "../database/dbh.inc.php";
    include_once "../controller/signup.contr.php";
    $signup = new SignUpController($db, $student_photo, $rfid_code, $user_id, $first_name, $middle_name, $last_name, $age, $birthday, $course, $year_level, $department, $user_type, $username, $password, $repassword, $email, $phone_number);
    $response = $signup->signupUser();

    // Running Error handling
    if ($response['status'] === 'success') {
      //accountActivatedEmail($accountType, $accountEmail);
      
      $message = 'Registered Successfully! Please check your email for activation link.';
      $response = ['status' => 'success', 'message' => $message];
    } else {
      $message = $response['message'];
      $response = ['status' => 'error', 'message' => $message];
    }

    // Going back to frontpage
    echo json_encode($response);
    exit();
  }
}