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
      <h2 class="table-heading">Student List</h2>
      <table id="studentTable" class="display" style="width: 100%;">
        <thead>
          <tr>
            <th>Photo</th>
            <th>User ID</th>
            <th>RFID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Program</th>
            <th>Academic Year</th>
            <th>Semester</th>
            <th>Year Level</th>
            <th>Actions</th>
          </tr>
        </thead>
      </table>
    </div>
  </div>

  <div id="editProfileModal" class="modal">
    <div class="modal-content">
      <span class="close-btn">&times;</span>

      <h2 id="formTitle">Register RFID</h2>
      <form id="editPasswordForm">
        <label for="profile_image">Profile Image:</label>
        <input type="file" id="profile_image" name="profile_image" required>

        <label for="rfid">RFID:</label>
        <input type="text" id="rfid_code" name="rfid_code" maxlength="10" required>

        <label for="user_id">User ID:</label>
        <input type="text" id="user_id" name="user_id" required>

        <label for="first_name">First Name:</label>
        <input type="text" id="first_name" name="first_name" required>

        <label for="middle_name">Middle Name:</label>
        <input type="text" id="middle_name" name="middle_name" required>

        <label for="last_name">Last Name:</label>
        <input type="text" id="last_name" name="last_name" required>

        <label for="age">Age:</label>
        <input type="number" id="age" name="age" required>

        <label for="birthday">Birthday:</label>
        <input type="date" id="birthday" name="birthday" required>

        <label for="course">Program:</label>
        <input type="text" id="course" name="course" required>

        <!-- <label for="">What is this</label>
        <select name="" id="">
          <option value="">BS IT</option>
          <option value="">WOW</option>
        </select> -->

        <label for="year_level">Year Level:</label>
        <input type="text" id="year_level" name="year_level" required>

        <label for="department">Department:</label>
        <input type="text" id="department" name="department" required>

        <label for="user_type">User Type:</label>
        <input type="text" id="user_type" name="user_type" required>

        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <div class="error-message" id="suErrorMessage"></div>

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
  <!-- <script src="../public/js/dashboard.js"></script> -->
  <script src="../public/js/signup.js"></script>
  <script src="../public/js/signout.js"></script>
  <script type="module" src="../public/js/students.js"></script>

  <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
</body>
</html>