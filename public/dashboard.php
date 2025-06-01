<?php
// SESSION
require_once "../includes/session/config.session.inc.php";

$userid = null;
$first_name = null;
$name_in_initial = null;
$profile_photo = null;

if(!isset($_SESSION['user'])){
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
  $first_name = $_SESSION['user']['first_name'];
  $name_in_initial = $initials;
  $profile_photo = $_SESSION['user']['profile_photo'];
  $user_type = $_SESSION['user']['user_type'];
  $rfid = $_SESSION['user']['rfid_code'];
} 
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../public/css/main.css" />
  <link rel="stylesheet" href="../public/css/dashboard.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
  <title>SACLI - TMS Admin</title>
</head>
<body style="background-color: #ededed;">
  <!-- LOADING -->
  <div id="loadingMessage" class="loading-message" style="display: none;">
    <div class="spinner"></div>
    <p>Please wait, processing...</p>
  </div>

  <div class="bacground-gradient"> 
  </div>

  <div class="container">

    <nav class="navigation">
      <div class="left-nav">
        <div class="logo">
          <img src="../assets/saclilogo.png" height="32" alt="SACLI LOGO">
          <p>SACLI - TMS</p>
        </div>
        <div class="nav-links">
          <ul>
            <li class="nav-link"><a class="active" href="">Overview</a></li>
            <li class="nav-link"><a href="">Manage Attendance</a></li>
            <li class="nav-link"><a href="">Student's List</a></li>
            <li class="nav-link"><a href="">Reports</a></li>
          </ul>
        </div>
      </div>

      <div class="right-nav">
        <div class="icons">
          <div class="fav-icon">
            <i class="fa-solid fa-bell fa-lg" id="notification" style="cursor: pointer;"></i>
          </div>
          <div class="fav-icon">
            <i class="fa-solid fa-gear fa-lg" id="setting" style="cursor: pointer;"></i>
          </div>
        </div>
        <div class="user">
          <img src="<?php echo $profile_photo; ?>" id="" height="28" alt="User Icon">
          <p><?php echo $name_in_initial ?></p>
          <div class="fav-icon">
            <i class="fa-solid fa-angle-down fa-lg" id="profile" style="cursor: pointer;"></i>
          </div>
          <div class="profile-dropdown" id="profileDropdown">
          <div class="profile-info">
            <p>Welcome <?php echo $user_type; ?>!</p>
            <p>User Id: <?php echo $userid; ?></p>
            <p>RFID: <?php echo $rfid; ?></p>
          </div>
          <a id="buttonSignOut" class="logout-btn">Logout</a>
        </div>
        </div>
      </div>
    </nav>

    <section class="main-content">
      <div class="content">
        <div class="welcome">
          <div class="profile-icon">
            <img src="<?php echo $profile_photo; ?>" id="" height="60" alt="Profile Photo">
          </div>
          <div class="profile-text">
            <h3>Hello <?php echo $first_name ?>! 👋</h3>
            <p>We hope you're having a great day.</p>
          </div>
        </div>
        <form class="form-filter">
          <div class="form-group custom-select-wrapper">
            <select name="courses" id="courses">
              <option value="selected" selected>Select Course </option>
            </select>
            <i class="fa-solid fa-angle-down fa-sm custom-select-icon" id="profile" style="cursor: pointer;"></i>
          </div>
          <div class="form-group custom-select-wrapper">
            <select name="days" id="days">
              <option value="30" selected>Last 30 days</option>
              <option value="7">Last 7 days</option>
              <option value="1">Today</option>
            </select>
            <i class="fa-solid fa-calendar-days fa-sm custom-select-icon" id="profile" style="cursor: pointer;"></i>
          </div>
          <button id="buttonFilter" type="button"><i class="fa-solid fa-filter"></i> Filter</button>
        </form>
      </div>
    </section>
    
    <section class="stats-content">
      <div class="stats-section">
        <div class="stat">
          <div class="stat-icon">
            <i class="fa-solid fa-ellipsis setting"></i>
          </div>
          <div>
            <i class="fa-solid fa-graduation-cap"></i>
          </div>
          <div class="stat-content-text">
            <h2>304</h2>
            <p>TOTAL STUDENTS</p>
          </div>
        </div>
        <div class="stat">
          <div class="stat-icon">
            <i class="fa-solid fa-ellipsis setting"></i>
          </div>
          <div>
            <i class="fa-solid fa-user-tie"></i>
          </div>
          <div class="stat-content-text">
            <h2>47</h2>
            <p>TOTAL EMPLOYEE</p>
          </div>
        </div>
        <div class="stat">
          <div class="stat-icon">
            <i class="fa-solid fa-ellipsis setting"></i>
          </div>
          <div>
            <i class="fa-solid fa-right-to-bracket"></i>
          </div>
          <div class="stat-content-text">
            <h2>250</h2>
            <p>PRESENT TODAY</p>
          </div>
        </div>
        <div class="stat">
          <div class="stat-icon">
            <i class="fa-solid fa-ellipsis setting"></i>
          </div>
          <div>
            <i class="fa-solid fa-door-open"></i>
          </div>
          <div class="stat-content-text">
            <h2>100</h2>
            <p>LEFT CAMPUS</p>
          </div>
        </div>
      </div>
    </section>

  </div>

  <section class="charts-content">
    <div class="charts-section">
      <div class="chart">
        <div class="chart-icon">
          <i class="fa-solid fa-ellipsis setting"></i>
        </div>
        <h3>Total Attendance Report</h3>
        <div id="chart1">

        </div>
      </div>
      
      <div class="chart">
        <div class="chart-icon">
          <i class="fa-solid fa-ellipsis setting"></i>
        </div>
        <h3>Students By Course</h3>
        <div id="chart2">

        </div>
      </div>
    </div>

    <div class="charts-section" style="margin-bottom: 20px;">
      <div class="chart">
        <div class="chart-icon">
          <i class="fa-solid fa-ellipsis setting"></i>
        </div>
        <h3>Students by Gender</h3>
        <div id="pieChart">

        </div>
      </div>

      <div class="chart" id="nothing">
        <div class="chart-icon">
          <i class="fa-solid fa-ellipsis setting"></i>
        </div>
        <h3>Top Attendance</h3>
        <div id="">

        </div>
      </div>

      <div class="chart">
        <div class="chart-icon">
          <i class="fa-solid fa-ellipsis setting"></i>
        </div>
        <h3>Weekly Absent</h3>
        <div id="radarChart">

        </div>
      </div>

      
    </div>
  </section>

  
  <!-- APEXCHART -->
  <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

  <script>
    const profile = document.getElementById("profile");
    const dropdown = document.getElementById("profileDropdown");

    profile.addEventListener("click", function (e) {
      e.stopPropagation(); // Prevent click from bubbling
      dropdown.style.display = dropdown.style.display === "flex" ? "none" : "flex";
    });

    // Hide when clicking outside
    document.addEventListener("click", function () {
      dropdown.style.display = "none";
    });

  </script>
  
  <!-- JQUERY VENDOR -->
  <script src="../public/vendor/jquery/jquery.min.js"></script>
  <!-- Page Javascript Code -->
  <script src="../public/js/chart.js"></script>
  <script src="../public/js/signout.js"></script>
  <script src="../public/js/dashboard.js"></script>
</body>
</html>