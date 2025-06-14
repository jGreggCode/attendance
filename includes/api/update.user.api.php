<?php 
// Copyright © 2025 John Gregg [Your Last Name]
// All rights reserved. Unauthorized use is prohibited.

declare(strict_types=1);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once '../model/user.model.php';
include_once "../database/dbh.inc.php";
include_once "../controller/UpdateUserController.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['user_id'])) {

  $student_photo = null;

  // Image Upload
  if (isset($_FILES['profile_image']) && $_FILES['profile_image']['error'] === UPLOAD_ERR_OK) {
    $fileTmpPath = $_FILES['profile_image']['tmp_name'];
    $fileName = $_FILES['profile_image']['name'];
    $fileSize = $_FILES['profile_image']['size'];
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

    $user_id = $_POST['user_id'];
    $uploadDir = "../../assets/Users/$user_id/";
    $dbDirectory = "../assets/Users/$user_id/";

    // 🧹 Delete previous photo
    try {
      $stmt = $conn->prepare("SELECT student_photo FROM users WHERE user_id = :user_id");
      $stmt->execute(['user_id' => $user_id]);
      $result = $stmt->fetch(PDO::FETCH_ASSOC);

      if ($result && !empty($result['student_photo'])) {
        $oldPhotoPath = str_replace('../', '../../', $result['student_photo']);
        if (file_exists($oldPhotoPath)) {
          unlink($oldPhotoPath);
        }
      }
    } catch (PDOException $e) {
      echo json_encode(['status' => 'error', 'message' => 'Failed to delete previous image.']);
      exit();
    }


    if (!file_exists($uploadDir)) {
      mkdir($uploadDir, 0777, true);
    }

    $newFileName = uniqid() . '.' . $fileExt;
    $student_photo = $dbDirectory . $newFileName;

    if (!move_uploaded_file($fileTmpPath, $uploadDir . $newFileName)) {
      echo json_encode(['status' => 'error', 'message' => 'Failed to move uploaded file.']);
      exit();
    }
  }

  // Grabbing data from the form
  $user_id = $_POST["user_id"];
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
  $email = $_POST["email"];
  $phone_number = $_POST["phone_number"];

  // Create controller instance
  $update = new UpdateUserController(
    $conn, 
    $student_photo, 
    $rfid_code, 
    $user_id, 
    $first_name, 
    $middle_name, 
    $last_name, 
    $age, 
    $birthday, 
    $course, 
    $year_level, 
    $department, 
    $user_type, 
    $username, 
    $password,
    $email, 
    $phone_number
  );

  // Call update
  $response = $update->updateUserData();

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
