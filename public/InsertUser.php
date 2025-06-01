<?php
if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST['rfid_code'])) {

    require_once '../includes/User.php';
    $user = new User();

    // Handle file upload
    $uploadDir = "assets/Users/";
    $photoPath = "";

    if (isset($_FILES['student_photo']) && $_FILES['student_photo']['error'] === 0) {
        $rfidCode = $_POST['rfid_code'];
        $rfidFolder = $uploadBaseDir . $rfidCode . "/";
    
        // Create folder if it doesn't exist
        if (!is_dir($rfidFolder)) {
            mkdir($rfidFolder, 0755, true);
        }

        $fileName = basename($_FILES['student_photo']['name']);
        $targetPath = $uploadDir . time() . "_" . $fileName;

        if (move_uploaded_file($_FILES['student_photo']['tmp_name'], $targetPath)) {
            $photoPath = $targetPath;
        } else {
            die("Failed to upload photo.");
        }
    }

    // User data
    $userData = [
        'rfid_code' => $_POST['rfid_code'],
        'first_name' => $_POST['first_name'],
        'middle_name' => $_POST['middle_name'],
        'last_name' => $_POST['last_name'],
        'age' => $_POST['age'],
        'birthday' => $_POST['birthday'],
        'course' => $_POST['course'],
        'year_level' => $_POST['year_level'],
        'department' => $_POST['department'],
        'user_type' => $_POST['user_type'],
        'username' => $_POST['username'],
        'password' => $_POST['password']
    ];

    $success = $user->insertUser($userData, $photoPath);

    if ($success) {
        echo "User added successfully!";
    } else {
        echo "Failed to add user.";
    }
}
