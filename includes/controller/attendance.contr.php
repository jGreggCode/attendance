<?php
// Copyright © 2025 John Gregg [Your Last Name]
// All rights reserved. Unauthorized use is prohibited.

require_once '../model/user.model.php';
require_once '../model/attendance.model.php';

date_default_timezone_set('Asia/Manila');

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['rfid_code'])) {
    $rfid = $_POST['rfid_code'];
    $date = date('Y-m-d');
    $time = date('h:i:s');

    $userid = null;
    $username = null;

    // Initialize your database connection
    $db = $conn; 
    
    include_once "../database/dbh.inc.php";
    $user = new User($db);
    $userData = $user->getUserByRFID($rfid);

    if ($userData['status'] === 'error') {
        echo json_encode([
            'status' => 'error',
            'message' => 'RFID not recognized. Please try again or contact the administrator.',
            'data' => null
        ]);
        exit();
    }
    
    $userData = $userData['data'];

    $fullName = $userData['first_name'] . " " . $userData['middle_name'] . " " . $userData['last_name'];
    $user_id = $userData['user_id'] ? $userData['user_id'] : 'N/A';
    $userType = $userData['user_type'];
    $rfidid = $userData['rfid_code'];
    $courseAndYear = $userData['course'] . " " . $userData['year_level'];
    $imageUrl = $userData['student_photo'];

    $user = [
        'id' => $userData['id'],
        'full_name' => $fullName,
        'user_id' => $user_id,
        'rfid_code' => $rfidid,
        'user_type' => $userType,
        'course_and_year' => $courseAndYear,
        'image_url' => $imageUrl
    ];

    $attendance = new Attendance($db);
    $existing = $attendance->getTodayAttendance($rfid, $date);
		if ($existing['status'] === 'error') {
			echo json_encode([
					'status' => 'error',
					'message' => $existing['message'],
					'data' => null
			]);
			exit();
		} 

    $existing = $existing['data'];

    if (!$existing) {
			$result = $attendance->logTimeIn($rfid, $userType, $date, $time);
			if ($result['status'] === 'error') {
				echo json_encode([
						'status' => 'error',
						'message' => $result['message'],
						'data' => null
				]);
				exit();
			} else if ($result['status'] === 'success') {
				echo json_encode([
						'status' => 'timein',
						'message' => "Hello there $userType! - Time In: $time",
						'data' => $user
				]);
			} else {
				echo json_encode([
						'status' => 'error',
						'message' => 'Something went wrong while logging time in.',
						'data' => null
				]);
				exit();
			}
	} else if ($existing['time_out'] === null) {
			$result = $attendance->logTimeOut($existing['id'], $time);

			if ($result['status'] === 'error') {
					echo json_encode([
							'status' => 'error',
							'message' => $result['message'],
							'data' => null
					]);
					exit();
			} else if ($result['status'] === 'success') {
					echo json_encode([
							'status' => 'timeout',
							'message' => "Take care $userType! - Time Out: $time",
							'data' => $user
					]);
			} else {
					echo json_encode([
							'status' => 'error',
							'message' => 'Something went wrong while logging time out.',
							'data' => null
					]);
					exit();
			}
	} else {
			echo json_encode([
					'status' => 'warning',
					'message' => 'You have already time in today.', 
					'data' => $user
			]);
	}
}
