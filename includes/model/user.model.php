<?php
require_once '../database/dbh.inc.php';

class User {
  private $db;

  public function __construct($db) {
      $this->db = $db;
  }

  public function getUserByRFID($rfid) {
    try {
      $stmt = $this->db->prepare('
        SELECT * FROM users WHERE rfid_code = :rfid_code
      ');

      $stmt->execute([
        ':rfid_code' => $rfid
      ]);

      if ($stmt->rowCount() === 0) {
        return ['status' => 'error', 'message' => 'No user found with this RFID code.', 'data' => null];
      } else {
        return [
          'status' => 'success',
          'data' => $stmt->fetch(PDO::FETCH_ASSOC)
        ];

      }
    } catch (\Throwable $th) {
      $message = 'Database error: ' . $th->getMessage();
      return ['status' => 'error', 'message' => $message, 'data' => null];
    }
  }

  public function createUser($student_photo, $rfid_code, $user_id, $first_name, $middle_name, $last_name, $age, $birthday, $course, $year_level, $department, $user_type, $username, $password, $email) {
    try {
      // Concatenate and capitalize the full name
      $fullName = ucwords(strtolower(trim($first_name . ' ' . $middle_name . ' ' . $last_name)));

      $options = [
        'cost' => 12,
      ];

      $stmt = $this->db->prepare('
        INSERT INTO users (student_photo, rfid_code, user_id, first_name, middle_name, last_name, age, birthday, course, year_level, department, user_type, username, password, email) 
        VALUES (:student_photo, :rfid_code, :user_id, :first_name, :middle_name, :last_name, :age, :birthday, :course, :year_level, :department, :user_type, :username, :password, :email);
      ');

      // If there is no username and password
      // Meaning the user is a student
      $emptyPassword = null;
      $emptyUsername = null;

      // Prevent empty password from hashing 
      if (!empty($password)) {
        $emptyPassword = password_hash($password, PASSWORD_BCRYPT, $options);
      }

      // Making the username value to null not just an empty value
      if (empty($username)) {
        $username = $emptyUsername;
      } 

      $stmt->execute([
        'student_photo' => $student_photo,
        'rfid_code' => $rfid_code,
        'user_id' => $user_id,
        'first_name' => $first_name,
        'middle_name' => $middle_name,
        'last_name' => $last_name,
        'age' => $age,
        'birthday' => $birthday,
        'course' => $course,
        'year_level' => $year_level,
        'department' => $department,
        'user_type' => $user_type,
        'username' => $username,
        'password' => $emptyPassword, // More Secured Hashing
        'email' => $email
      ]);

      $stmt = null; // Close the statement
      return ['status' => 'success', 'message' => 'Account Created Successfully!'];
    } catch (PDOException $th) {
      $message = 'Database error: ' . $th->getMessage();
      return ['status' => 'error', 'message' => $message];
    }

  }

  public function checkUser($user_id, $email) {
    $result;
    try {
      $stmt = $this->db->prepare('SELECT user_id FROM users WHERE user_id = :user_id OR email = :email;');
      $stmt->execute([
        'user_id' => $user_id,
        'email' => $email
      ]);

      if ($stmt->rowCount() > 0) {
        $result = true;
      } else {
        $result = false;
      }

      $stmt = null; // Close the statement
      return $result;

    } catch (PDOException $e) {
      $message = 'Database error: ' . $e->getMessage();
      return ['status' => 'error', 'message' => $message];
    }
  }

}