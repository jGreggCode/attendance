<?php

declare(strict_types=1);

require_once '../database/dbh.inc.php';

class Attendance {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function getTodayAttendance($rfid, $date) {
      try {
        $stmt = $this->db->prepare('
          SELECT * FROM attendance WHERE rfid_code = :rfid_code AND date = :date
        ');

        $stmt->execute([
          ':rfid_code' => $rfid,
          ':date' => $date
        ]);

        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$result) {
          return ['status' => 'error', 'message' => 'No attendance record found for today.', 'data' => $result];
        } else {
          return ['status' => 'success','data' => $result];
        }
      } catch (\Throwable $th) {
        $message = 'Database error: ' . $th->getMessage();
        return ['status' => 'error', 'message' => $message, 'data' => $result];
      }
        
    }

    public function logTimeIn($rfid, $userType, $date, $time) {
      try {
        $stmt = $this->db->prepare('
          INSERT INTO attendance (rfid_code, user_type, date, time_in) VALUES (:rfid_code, :user_type, :date, :time_in)
        ');

        $stmt->execute([
          ':rfid_code' => $rfid,
          ':user_type' => $userType,
          ':date' => $date,
          ':time_in' => $time
        ]);

        if ($stmt->rowCount() === 0) {
          return ['status' => 'error', 'message' => 'Failed to log time in.'];
        } else {
          return ['status' => 'success', 'message' => 'Time in logged successfully.'];
        }

      } catch (\Throwable $th) {
        $message = 'Database error: ' . $th->getMessage() . '| usertype = ' . $userType ;
        return ['status' => 'error', 'message' => $message];
      }
    }

    public function logTimeOut($id, $time) {
      try {
        $stmt = $this->db->prepare('
          UPDATE attendance SET time_out = :time_out WHERE id = :id
        ');

        $stmt->execute([
          ':time_out' => $time,
          ':id' => $id
        ]);

        if ($stmt->rowCount() === 0) {
          return ['status' => 'error', 'message' => 'Failed to log time out.'];
        } else {
          return ['status' => 'success', 'message' => 'Time out logged successfully.'];
        }
      } catch (\Throwable $th) {
        $message = 'Database error: ' . $th->getMessage();
        return ['status' => 'error', 'message' => $message];
      }
    }
}