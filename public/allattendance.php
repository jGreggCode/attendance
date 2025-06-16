<!-- 
  Copyright © 2025 John Gregg Felicisimo
  All rights reserved. Unauthorized use is prohibited.
-->

<?php
// SESSION
require_once "../includes/session/config.session.inc.php";

$userid = null;
$first_name = null;
$name_in_initial = null;
$profile_photo = null;
$email = null;
$phone_number = null;

if (!isset($_SESSION['user'])) {
  header('Location: admin.php');
  exit();
}

if (isset($_SESSION['user'])) {

  $full_name = $_SESSION['user']['first_name'] . ' ' . $_SESSION['user']['last_name'];
  // Split by space and get initials
  $words = preg_split('/\s+/', trim($full_name));
  $initials = '';

  foreach ($words as $word) {
    $initials .= strtoupper($word[0]);
  }

  $userid = $_SESSION['user']['user_id'];
  $email = $_SESSION['user']['email'];
  $first_name = $_SESSION['user']['first_name'];
  $name_in_initial = $initials;
  $profile_photo = $_SESSION['user']['profile_photo'];
  $user_type = $_SESSION['user']['user_type'];
  $rfid = $_SESSION['user']['rfid_code'];
  $phone_number = $_SESSION['user']['phone_number'] ? '' : 'N/A';
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../public/css/main.css" />
  <link rel="stylesheet" href="../public/css/dashboard.css" />
  <link rel="stylesheet" href="../public/css/students.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
  <!-- TOASTIFY  -->
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
  <title>Student List</title>
</head>

<body style="background-color: #ededed;">

  <?php
  include_once 'components/navigation.php';
  ?>

  <?php
  include_once 'components/navigation.php';
  ?>

  <!-- START -->
  <div class="student-header">
    <div class="student-top">
      <div class="left">
        <div class="form-group custom-select-wrapper">
          <select name="courses" id="courses">
            <option value="selected" selected>All</option>
          </select>
          <i class="fa-solid fa-angle-down fa-sm custom-select-icon" id="profile" style="cursor: pointer;"></i>
        </div>
        <div class="student-add">
          <button id="addStdentBtn"><i class="fa-solid fa-user-plus"></i> Add a student</button>
        </div>
      </div>
    </div>
  </div>

  <div class="student-middle">
    <div class="student-table-wrapper">
      <h2 class="table-heading">Manage All Attendance</h2>
      <table id="studentTable" class="display" style="width: 100%;">
        <thead>
          <tr>
            <th>RFID</th>
            <th>User Type</th>
            <th>Date</th>
            <th>Time In</th>
            <th>Time Out</th>
            <th>Action</th>
          </tr>
        </thead>
      </table>
    </div>
  </div>

  <div id="editAttendanceModal" class="modal">
    <div class="modal-content">
      <span class="close-btn">&times;</span>

      <h2 id="formTitle">Edit Attendance</h2>
      <form id="editPasswordForm">

        <label for="profile_image">Time In:</label>
        <input type="time" id="time_in" name="time_in" required>
        
        <label for="profile_image">Time Out:</label>
        <input type="time" id="time_out" name="time_out" required>

        <label for="profile_image">Reason:</label>
        <input type="text" id="reason" name="reason" required>

        <button id="buttonSignUp" type="button" data-action="register">Register</button>
      </form>
    </div>
  </div>
</div>

  <?php
  include_once 'components/footer.php';
  ?>

  <!-- JQUERY VENDOR -->
  <script src="../public/vendor/jquery/jquery.min.js"></script>
  <!-- Page Javascript Code -->
  <script src="../public/js/dashboard.js"></script>
  <script src="../public/js/signup.js"></script>
  <script src="../public/js/signout.js"></script>
  <script src="../public/js/attendance.js"></script>

  <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
</body>
</html>