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
  $phone_number = $_SESSION['user']['phone_number'];
  $program = $_SESSION['user']['course'];
  $academic_year = $_SESSION['user']['academic_year'];
  $semester = $_SESSION['user']['semester'];
  $department = $_SESSION['user']['department'];
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- WEB ICON -->
  <link
    rel="shortcut icon"
    href="../assets/saclilogo.png"
    type="image/x-icon"
  />
  <link rel="stylesheet" href="../public/css/main.css" />
  <link rel="stylesheet" href="../public/css/dashboard.css" />
  <link rel="stylesheet" href="../public/css/employee.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
  <!-- TOASTIFY  -->
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
  <title>SACLI - TMS Employee</title>
</head>

<body style="background-color: #ededed;">

  <?php
  include_once 'components/navigation.php';
  ?>

  <div class="container">

    <?php
    include_once 'components/navigation.php';
    ?>

    <section class="main-content employee-main-content">
      <div class="content content-employee">
        <form class="form-filter">
          <div>
            <span></span>
            <h3>Profile Details</h3>
          </div>
          <div>
            <!-- <div class="form-group custom-select-wrapper">
              <select name="courses" id="courses">
                <option value="selected" selected>This Year</option>
              </select>
              <i class="fa-solid fa-angle-down fa-sm custom-select-icon" id="profile" style="cursor: pointer;"></i>
            </div> -->
            <?php 
            if ($user_type === "Admin") {
              ?> <a href="allattendance.php" class="button attendance-link">Manage All Attendance</a> <?php
            }
            ?>
            
            <button id="btnEditProfile" type="button"><i class="fa-solid fa-pen-to-square"></i> Edit
              Profile</button>
              <!-- Edit Password Modal -->
          </div>
        </form>
        <div class="welcome">
          <div class="profile-icon">
            <img src="<?php echo $profile_photo; ?>" id="" height="120" alt="Profile Photo">
          </div>
          <div class="profile-text">
            <h3><?php echo $full_name . ' (' . $userid . ')' ?></h3>
            <div class="profile-text-bottom">
              <div class="profile-info">
                <h4>Role</h4>
                <p><?php echo $user_type; ?></p>
              </div>
              <div class="profile-info">
                <h4>Email Address</h4>
                <p><?php echo $email; ?></p>
              </div>
              <div class="profile-info">
                <h4>Program</h4>
                <p><?php echo $program . "( " . $department . " )"; ?></p>
              </div>
              <div class="profile-info">
                <h4>Academic Year</h4>
                <p><?php echo $academic_year . " / " . $semester ?></p>
              </div>
              <div class="profile-info">
                <h4>Phone Number</h4>
                <p><?php echo $phone_number; ?></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="stats-content">
      <div class="stats-section">
        <div class="stat">
          <div>
            <i class="fa-solid fa-arrow-right-to-bracket"></i>
          </div>
          <div class="stat-content-text">
            <h2 id="totalAttendance">0</h2>
            <p>TOTAL ATTENDANCE</p>
          </div>
        </div>
        <div class="stat">
          <div>
            <i class="fa-solid fa-clock"></i>
          </div>
          <div class="stat-content-text">
            <h2 id="avgTimeIn">00:00</h2>
            <p>AVG Check In Time</p>
          </div>
        </div>
        <div class="stat">
          <div>
            <i class="fa-solid fa-house"></i>
          </div>
          <div class="stat-content-text">
            <h2 id="avgTimeOut">00:00</h2>
            <p>AVG Check Out Time</p>
          </div>
        </div>
        <div class="stat">
          <div>
            <i class="fa-solid fa-lightbulb"></i>
          </div>
          <div class="stat-content-text">
            <h2 id="totalHours">0</h2>
            <p>TOTAL HOURS</p>
          </div>
        </div>
      </div>
    </section>

    <section class="emp-attendance">
      <div class="emp-attendance-content">
        <!-- HEADING TITLE -->
        <div class="top">
          <span></span>
          <h3>Attendance History</h3>
        </div>

        <!-- FILTER -->
        <div class="date-range-filter">
          <label for="startDate">Start Date:</label>
          <input type="date" id="startDate" name="start_date" required>

          <label for="endDate">End Date:</label>
          <input type="date" id="endDate" name="end_date" required>

          <button type="button" id="filterAttendance">Filter</button>
          <button type="button" id="downloadAttendance">Download Attendance</button>

          
        </div>

        <!-- CALENDAR VIEW -->
        <div class="middle">
          <div class="calendar" id="calendar">

            <div class="calendar-title">
              <h3>June 03, 2025 | Tuesday</h3>
            </div>

            <div class="calendar-schedule">
              <div>
                <div class="IN">
                  <h3>IN</h3>
                  <p>7:00 AM</p>
                </div>
                <div class="OUT">
                  <h3>OUT</h3>
                  <p>5:00 PM</p>
                </div>
              </div>
            </div>

            <div class="calendar-total-hours">
              <h3>8 Hours</h3>
            </div>
          </div>
        </div>

        <!-- PAGINATION CONTROLS -->
        <div class="bottom">
          <div class="pagination" id="calendarPagination">
            <div class="buttons">
              <button id="prevBtn">PREV</button>
              <button id="nextBtn">NEXT</button>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>

  <div id="downloadModal" class="modal-download">
    <div class="modal-content">
      <span class="close-button">&times;</span>
      <h2>Download Attendance</h2>
      <p>Choose your preferred download format:</p>
      <button id="downloadPdf">Download PDF</button>
      <button id="downloadCsv">Download CSV</button>
    </div>
  </div>

  <div id="editProfileModal" class="modal">
    <div class="modal-content">
      <span class="close-btn">&times;</span>

      <div class="restriction-notice">
        <p id="user_id" style="display: none;"><?php echo $userid; ?></p>
        <p>⚠️ Profile editing is blocked due to a restriction.</p>
        <a href="#" class="request-link">Click here to request an update from the admin.</a>
      </div>

      <h2>Edit Password</h2>
      <form id="editPasswordForm">
        <label for="current_password">Current Password:</label>
        <input type="password" id="current_password" name="current_password" required>

        <label for="new_password">New Password:</label>
        <input type="password" id="new_password" name="new_password" required>

        <label for="confirm_password">Confirm Password:</label>
        <input type="password" id="confirm_password" name="confirm_password" required>

        <button id="changePassword">Save Changes</button>
      </form>
    </div>
  </div>

  <?php
  include_once 'components/footer.php';
  ?>

  <!-- JQUERY VENDOR -->
  <script src="../public/vendor/jquery/jquery.min.js"></script>
  <!-- Page Javascript Code -->
  <script src="../public/js/signout.js"></script>
  <script src="../public/js/changePass.js"></script>
  <script type="module" src="../public/js/dashboard.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
</body>
</html>