<?php
// Copyright © 2025 John Gregg [Your Last Name]
// All rights reserved. Unauthorized use is prohibited.

declare(strict_types=1);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once '../database/dbh.inc.php';

class User {
  private $db;

  public function __construct($db) {
    $this->db = $db;
  }

  public function getUserByRFID($rfid) {
    try {
      $stmt = $this->db->prepare('SELECT * FROM users WHERE rfid_code = :rfid_code');
      $stmt->execute([':rfid_code' => $rfid]);

      if ($stmt->rowCount() === 0) {
        return ['status' => 'error', 'message' => 'No user found with this RFID code.', 'data' => null];
      } else {
        return ['status' => 'success', 'data' => $stmt->fetch(PDO::FETCH_ASSOC)];
      }
    } catch (\Throwable $th) {
      $message = 'Database error: ' . $th->getMessage();
      return ['status' => 'error', 'message' => $message, 'data' => null];
    }
  }

  public function createUser($student_photo, $rfid_code, $user_id, $first_name, $middle_name, $last_name, $age, $birthday, $course, $year_level, $department, $user_type, $username, $password, $email, $phone_number) {
    try {
      $fullName = ucwords(strtolower(trim($first_name . ' ' . $middle_name . ' ' . $last_name)));

      $options = ['cost' => 12];
      $hashedPassword = !empty($password) ? password_hash($password, PASSWORD_BCRYPT, $options) : null;
      $username = !empty($username) ? $username : null;

      $stmt = $this->db->prepare('
        INSERT INTO users (student_photo, rfid_code, user_id, first_name, middle_name, last_name, age, birthday, course, year_level, department, user_type, username, password, email, phone_number) 
        VALUES (:student_photo, :rfid_code, :user_id, :first_name, :middle_name, :last_name, :age, :birthday, :course, :year_level, :department, :user_type, :username, :password, :email, :phone_number)
      ');

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
        'password' => $hashedPassword,
        'email' => $email,
        'phone_number' => $phone_number
      ]);

      return ['status' => 'success', 'message' => 'Account Created Successfully!'];
    } catch (PDOException $th) {
      $message = 'Database error: ' . $th->getMessage();
      return ['status' => 'error', 'message' => $message];
    }
  }

  public function updateUser($student_photo, $rfid_code, $user_id, $first_name, $middle_name, $last_name, $age, $birthday, $course, $year_level, $department, $user_type, $username, $password, $email, $phone_number) {
    try {
        $username = !empty($username) ? $username : null;
        $options = ['cost' => 12];
        $hashedPassword = null;

        // Base update query
        $query = '
            UPDATE users SET
                rfid_code = :rfid_code,
                first_name = :first_name,
                middle_name = :middle_name,
                last_name = :last_name,
                age = :age,
                birthday = :birthday,
                course = :course,
                year_level = :year_level,
                department = :department,
                user_type = :user_type,
                username = :username,
                email = :email,
                phone_number = :phone_number';

        // Optional photo update
        if (!empty($student_photo)) {
            $query .= ', student_photo = :student_photo';
        }

        // Optional password update
        if (!empty($password)) {
            $hashedPassword = password_hash($password, PASSWORD_BCRYPT, $options);
            $query .= ', password = :password';
        }

        $query .= ' WHERE user_id = :user_id';

        $stmt = $this->db->prepare($query);

        // Bind parameters
        $params = [
            'rfid_code' => $rfid_code,
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
            'email' => $email,
            'phone_number' => $phone_number,
            'user_id' => $user_id
        ];

        if (!empty($student_photo)) {
            $params['student_photo'] = $student_photo;
        }

        if (!empty($password)) {
            // Hash the password securely
            $params['password'] = $hashedPassword;
        }

        $stmt->execute($params);

        return ['status' => 'success', 'message' => 'Account updated successfully!'];

    } catch (PDOException $e) {
        return ['status' => 'error', 'message' => 'Database error: ' . $e->getMessage()];
    }
  }

  public function changeUserPassword($user_id, $current_password, $new_password) {
    try {
        // Fetch the existing hashed password
        $stmt = $this->db->prepare('SELECT password FROM users WHERE user_id = :user_id');
        $stmt->execute(['user_id' => $user_id]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$user) {
            return ['status' => 'error', 'message' => 'User not found.'];
        }

        // Verify the current password
        if (!password_verify($current_password, $user['password'])) {
            return ['status' => 'error', 'message' => 'Current password is incorrect.'];
        }

        // Hash the new password
        $options = ['cost' => 12];
        $hashedPassword = password_hash($new_password, PASSWORD_BCRYPT, $options);

        // Update the password
        $updateStmt = $this->db->prepare('UPDATE users SET password = :password WHERE user_id = :user_id');
        $updateStmt->execute([
            'password' => $hashedPassword,
            'user_id' => $user_id
        ]);

        return ['status' => 'success', 'message' => 'Password updated successfully.'];

    } catch (PDOException $e) {
        return ['status' => 'error', 'message' => 'Database error: ' . $e->getMessage()];
    }
  }



  public function getUser($user_id, $password) {
    try {
      $stmt = $this->db->prepare('SELECT password FROM users WHERE user_id = :user_id');
      $stmt->execute(['user_id' => $user_id]);

      if ($stmt->rowCount() > 0) {
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        if (password_verify($password, $row['password'])) {
          $this->getAccountDetails($user_id);
          return ['status' => 'success', 'message' => 'Login Successful!'];
        } else {
          return ['status' => 'error', 'message' => 'Invalid Password!'];
        }
      } else {
        return ['status' => 'error', 'message' => 'User Not Found!'];
      }
    } catch (PDOException $th) {
      $message = 'Database error: ' . $th->getMessage();
      return ['status' => 'error', 'message' => $message];
    }
  }

  public function checkUser($user_id, $email) {
    try {
      $stmt = $this->db->prepare('SELECT user_id FROM users WHERE user_id = :user_id OR email = :email');
      $stmt->execute(['user_id' => $user_id, 'email' => $email]);
      $result = $stmt->rowCount() > 0;
      return $result;
    } catch (PDOException $e) {
      return ['status' => 'error', 'message' => 'Database error: ' . $e->getMessage()];
    }
  }

  public function getAccountDetails($user_id) {
    $stmt = $this->db->prepare('SELECT * FROM users WHERE user_id = :user_id');
    $stmt->execute(['user_id' => $user_id]);

    require_once "../session/config.session.inc.php";

    if ($stmt->rowCount() > 0) {
      $row = $stmt->fetch(PDO::FETCH_ASSOC);
      $_SESSION['user'] = [
        'id' => $row['id'],
        'profile_photo' => $row['student_photo'],
        'rfid_code' => $row['rfid_code'],
        'user_id' => $row['user_id'],
        'first_name' => $row['first_name'],
        'middle_name' => $row['middle_name'],
        'last_name' => $row['last_name'],
        'age' => $row['age'],
        'birthday' => $row['birthday'],
        'course' => $row['course'],
        'year_level' => $row['year_level'],
        'academic_year' => $row['academic_year'],
        'semester' => $row['semester'],
        'department' => $row['department'],
        'user_type' => $row['user_type'],
        'username' => $row['username'],
        'email' => $row['email'],
        'phone_number' => $row['phone_number'],
        'is_logged_in' => true
      ];

      regenerate_session_id();
    }
  }
}
