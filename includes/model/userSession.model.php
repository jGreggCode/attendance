<?php 
  require_once('../database/dbh.inc.php');

  function getAccountDetails($userId) {
    global $conn;
    $stmt = $conn->prepare('
      SELECT * FROM users WHERE user_id = :user_id;
    ');

    $stmt->execute([
      'user_id' => $userId,
    ]); 

    // Start the session
    require_once "../session/config.session.inc.php";

    if($stmt->rowCount() > 0) {
      $row = $stmt->fetch(PDO::FETCH_ASSOC);

      regenerate_session_id();
      $_SESSION['student'] = [
        'user_id' => $row['user_id'],
        'rfid_code' => $row['rfid_code'],
        'username' => $row['username'],
        'email' => $row['email'],
        'student_photo' => $row['student_photo'],
        'first_name' => $row['first_name'],
        'middle_name' => $row['middle_name'],
        'last_name' => $row['last_name'],
        'user_type' => $row['user_type'],
      ];
    }
    
  }