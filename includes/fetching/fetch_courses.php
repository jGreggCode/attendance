<?php 

declare(strict_types=1);

require_once '../database/dbh.inc.php';

class CourseFetcher {
  private $conn;

  public function __construct(PDO $db) {
    $this->conn = $db;
  }

  public function getAllCoursesWithCounts() {
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
    
    $stmt = $this->conn->prepare($sql);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }
}

// Create instance and fetch data
$fetcher = new CourseFetcher($conn);
$courses = $fetcher->getAllCoursesWithCounts();

// Return JSON response
header('Content-Type: application/json');
echo json_encode($courses);
?>