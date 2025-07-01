<?php
// Database connection
$conn = new mysqli("localhost", "root", "", "saclitms");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// User data
$student_photo = '../../assets/Dev.png';
$rfid_code = '0991782287';
$user_id = 'admin';
$first_name = 'John Gregg';
$middle_name = 'Virina';
$last_name = 'Felicisimo';
$age = 25;
$birthday = '2000-06-13';
$course = '';
$year_level = 3;
$department = 'Administrator';
$user_type = 'Admin';
$username = $user_id; // same as user_id
$password = 'admin123'; // plain password to be hashed
$email = 'felicisimojv@gmail.com';
$phone_number = '09917822877';

// Hash the password
$options = ['cost' => 12];
$hashedPassword = !empty($password) ? password_hash($password, PASSWORD_BCRYPT, $options) : null;

// Prepare SQL statement
$stmt = $conn->prepare("INSERT INTO users (student_photo, rfid_code, user_id, first_name, middle_name, last_name, age, birthday, course, year_level, department, user_type, username, password, email, phone_number) 
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

$stmt->bind_param("ssssssississssss",
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
    $hashedPassword,
    $email,
    $phone_number
);

// Execute and check
if ($stmt->execute()) {
    echo "User inserted successfully.";
} else {
    echo "Error: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>