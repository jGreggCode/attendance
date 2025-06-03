<?php

declare(strict_types=1);

require_once '../database/dbh.inc.php';

class FetchData
{
  private $db;

  public function __construct($db)
  {
    $this->db = $db;
  }

  public function getAbsentsEachDay()
  {
    try {
      // Get all students
      $studentsStmt = $this->db->prepare("SELECT rfid_code FROM users WHERE user_type = 'Student'");
      $studentsStmt->execute();
      $students = $studentsStmt->fetchAll(PDO::FETCH_COLUMN);
      $totalStudents = count($students);

      // Initialize results
      $absents = [];

      // Loop through this week's days (Mon to Sun)
      $daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
      foreach ($daysOfWeek as $day) {
        // Get the actual date of this week's $day
        $date = date('Y-m-d', strtotime("this week $day"));

        // Get distinct rfid_codes who were present on this day
        $attendStmt = $this->db->prepare("SELECT DISTINCT rfid_code FROM attendance WHERE date = ?");
        $attendStmt->execute([$date]);
        $presentRFIDs = $attendStmt->fetchAll(PDO::FETCH_COLUMN);

        // Calculate absent count
        $absentCount = $totalStudents - count(array_intersect($students, $presentRFIDs));
        $absents[] = [
          'day' => $day,
          'absent' => $absentCount
        ];
      }

      return $absents;

    } catch (Exception $th) {
      return ['status' => 'error', 'message' => $th->getMessage(), 'data' => null];
    }
  }

  public function getStudentsByYear()
  {
    try {
      $stmt = $this->db->prepare("
          SELECT 
            year_level, 
            COUNT(*) AS total 
          FROM users 
          WHERE user_type = 'Student'
          GROUP BY year_level
          ORDER BY year_level ASC
      ");
      $stmt->execute();
      $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

      return $result;
    } catch (Throwable $th) {
      return ['status' => 'error', 'message' => $th->getMessage(), 'data' => null];
    }
  }

  public function getTopAttendingStudents()
  {
    try {
      $stmt = $this->db->prepare('
        SELECT 
        u.first_name,
        u.middle_name,
        u.last_name,
        u.student_photo, -- assume you have this column for image path
        COUNT(a.rfid_code) AS total_attendance
        FROM attendance a
        JOIN users u ON a.rfid_code = u.rfid_code
        WHERE 
            MONTH(a.date) = MONTH(CURRENT_DATE()) 
            AND YEAR(a.date) = YEAR(CURRENT_DATE())
            AND u.user_type = "Student"
        GROUP BY a.rfid_code
        ORDER BY total_attendance DESC
        LIMIT 5
      ');

      $stmt->execute();
      $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

      return $result;
    } catch (\Throwable $th) {
      return ['status' => 'error', 'message' => $th->getMessage(), 'data' => null];
    }
  }

  public function getAllCoursesWithCounts()
  {
    try {
      $sql = "
      SELECT 
        c.course_name_shorten, 
        c.course_ini, 
        COUNT(u.id) AS student_count
      FROM courses c
      LEFT JOIN users u ON u.course = c.course_name_shorten
      GROUP BY c.course_name_shorten, c.course_ini
      ORDER BY c.course_name_shorten ASC
    ";

      $stmt = $this->db->prepare($sql);
      $stmt->execute();

      return $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (\Throwable $th) {
      $message = 'Database error: ' . $th->getMessage();
      return ['status' => 'error', 'message' => $message, 'data' => null];
    }
  }

  public function countEmployee()
  {
    try {
      $stmt = $this->db->prepare('
        SELECT COUNT(*) AS employee_count FROM users WHERE user_type = :user_type
      ');

      $stmt->execute([
        ':user_type' => 'Employee'
      ]);

      $result = $stmt->fetch(PDO::FETCH_ASSOC);

      return $result;
    } catch (\Throwable $th) {
      $message = 'Database error: ' . $th->getMessage();
      return ['status' => 'error', 'message' => $message, 'data' => null];
    }
  }

  public function countStudents()
  {
    try {
      $stmt = $this->db->prepare('
        SELECT COUNT(*) AS students_count FROM users WHERE user_type = :user_type
      ');

      $stmt->execute([
        ':user_type' => 'Student'
      ]);

      $result = $stmt->fetch(PDO::FETCH_ASSOC);

      return $result;
    } catch (\Throwable $th) {
      $message = 'Database error: ' . $th->getMessage();
      return ['status' => 'error', 'message' => $message, 'data' => null];
    }
  }

  public function countPresent()
  {
    try {
      $stmt = $this->db->prepare('
          SELECT COUNT(*) AS present_today
          FROM attendance
          WHERE date = :date AND time_in IS NOT NULL AND time_in != ""
      ');

      $stmt->execute([
        ':date' => date('Y-m-d') // today’s date
      ]);

      $result = $stmt->fetch(PDO::FETCH_ASSOC);

      return $result;
    } catch (\Throwable $th) {
      $message = 'Database error: ' . $th->getMessage();
      return ['status' => 'error', 'message' => $message, 'data' => null];
    }
  }

  public function countLeftCampus()
  {
    try {
      $stmt = $this->db->prepare('
          SELECT COUNT(*) AS left_today
          FROM attendance
          WHERE date = :date AND time_out IS NOT NULL AND time_out != ""
      ');

      $stmt->execute([
        ':date' => date('Y-m-d') // today’s date
      ]);

      $result = $stmt->fetch(PDO::FETCH_ASSOC);

      return $result;
    } catch (\Throwable $th) {
      $message = 'Database error: ' . $th->getMessage();
      return ['status' => 'error', 'message' => $message, 'data' => null];
    }
  }
}