<?php 

declare(strict_types=1);

require_once '../database/dbh.inc.php';

class CourseFetcher {
  private $conn;

  public function __construct(PDO $db) {
    $this->conn = $db;
  }

  public function getAllCourses() {
    $sql = "SELECT course_name_shorten, course_ini FROM courses ORDER BY course_name_shorten ASC";
    $stmt = $this->conn->prepare($sql);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }
}

// Create instance and fetch data
$fetcher = new CourseFetcher($conn);
$courses = $fetcher->getAllCourses();

// Return JSON response
header('Content-Type: application/json');
echo json_encode($courses);
?>