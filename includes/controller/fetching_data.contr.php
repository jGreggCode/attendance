<?php
// Copyright © 2025 John Gregg [Your Last Name]
// All rights reserved. Unauthorized use is prohibited.

require_once '../model/fetching_data.model.php';
include_once "../database/dbh.inc.php";

// Start the session 
// Needed for Authentication
// Data will only be fetch if the user is ADMIN
require_once "../session/config.session.inc.php";

if ($_SESSION['user']['user_type'] === 'Admin') {
  $db = $conn;

  $fetchData = new FetchData($db);

  $employees = $fetchData->countEmployee();
  $students = $fetchData->countStudents();
  $present = $fetchData->countPresent();
  $leftCampus = $fetchData->countLeftCampus();

  $courses = $fetchData->getAllCoursesWithCounts();
  $topAttendingStudent = $fetchData->getTopAttendingStudents();
  $yearLevel = $fetchData->getStudentsByYear();
  $absentsEachDay = $fetchData->getAbsentsEachDay();

  header('Content-Type: application/json');
  echo json_encode([
    'status' => 'sucess',
    'message' => 'Data Collected, User Is Admin',
    'employees' => $employees,
    'students' => $students,
    'present' => $present,
    'left' => $leftCampus,
    'topAttendingStudents' => $topAttendingStudent,
    'course' => $courses,
    'yearLevel' => $yearLevel,
    'absentsEachDay' => $absentsEachDay
  ]);
  exit();
}


