<?php 
// Copyright © 2025 John Gregg [Your Last Name]
// All rights reserved. Unauthorized use is prohibited.

declare(strict_types=1);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once '../model/user.model.php';

class UpdateUserController extends User {
  private $student_photo;
  private $rfid_code;
  private $user_id;
  private $first_name;
  private $middle_name;
  private $last_name;
  private $age;
  private $birthday;
  private $course;
  private $year_level;
  private $department;
  private $user_type;
  private $username;
  private $password;
  private $email;
  private $phone_number;

  public function __construct($db, $student_photo, $rfid_code, $user_id, $first_name, $middle_name, $last_name, $age, $birthday, $course, $year_level, $department, $user_type, $username, $password, $email, $phone_number) {
    parent::__construct($db);
    $this->student_photo = $student_photo;
    $this->rfid_code = $rfid_code;
    $this->user_id = $user_id;
    $this->first_name = $first_name;
    $this->middle_name = $middle_name;
    $this->last_name = $last_name;
    $this->age = $age;
    $this->birthday = $birthday;
    $this->course = $course;
    $this->year_level = $year_level;
    $this->department = $department;
    $this->user_type = $user_type;
    $this->username = $username;
    $this->password = $password;
    $this->email = $email;
    $this->phone_number = $phone_number;
  }

  public function updateUserData() {
    if ($this->emptyInput() !== null) {
      return $this->emptyInput();
    } elseif ($this->invalidUserID() !== null) {
      return $this->invalidUserID();
    } elseif ($this->invalidEmail() !== null) {
      return $this->invalidEmail();
    } else {
      $response = $this->updateUser(
        $this->student_photo,
        $this->rfid_code,
        $this->user_id,
        $this->first_name,
        $this->middle_name,
        $this->last_name,
        $this->age,
        $this->birthday,
        $this->course,
        $this->year_level,
        $this->department,
        $this->user_type,
        $this->username,
        $this->password,
        $this->email,
        $this->phone_number
      );
      return $response;
    }
  }

  private function emptyInput() {
    $result = null;

    $requiredFields = [
      'rfid_code' => $this->rfid_code,
      'user_id' => $this->user_id,
      'first_name' => $this->first_name,
      'middle_name' => $this->middle_name,
      'last_name' => $this->last_name,
      'age' => $this->age,
      'birthday' => $this->birthday,
      'course' => $this->course,
      'year_level' => $this->year_level,
      'department' => $this->department,
      'user_type' => $this->user_type,
      'email' => $this->email,
      'phone_number' => $this->phone_number
    ];

    foreach ($requiredFields as $field => $value) {
      if (empty($value)) {
        $message = ucfirst(str_replace('_', ' ', $field)) . ' cannot be empty.';
        return ['status' => 'error', 'message' => $message];
      }
    }

    return $result;
  }

  private function invalidUserID() {
    $result = null;

    if (!preg_match('/^[0-9-]+$/', $this->user_id)) {
      $message = 'Invalid Student ID!';
      $result = ['status' => 'error', 'message' => $message];
    } 

    return $result;
  }

  private function invalidEmail() {
    $result = null;

    if (!filter_var($this->email, FILTER_VALIDATE_EMAIL)) {
      $message = 'Invalid Email!';
      $result = ['status' => 'error', 'message' => $message];
    } 

    return $result;
  }
}
