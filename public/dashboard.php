<?php
// SESSION
require_once "../includes/session/config.session.inc.php";

$userid = null;
$first_name = null;
$name_in_initial = null;
$profile_photo = null;

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

  <div class="container">

    <?php
    include_once 'components/navigation.php';
    ?>

    <section class="main-content employee-main-content">


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
              <option value="selected" selected hidden>Select Course </option>
            </select>
            <i class="fa-solid fa-angle-down fa-sm custom-select-icon" id="profile" style="cursor: pointer;"></i>
          </div>
          <div class="form-group custom-select-wrapper">
            <select name="days" id="days">
              <option value="30" selected>All time</option>
              <option value="30">Last 30 days</option>
              <option value="7">Last 7 days</option>
              <option value="1">Today</option>
            </select>
            <i class="fa-solid fa-calendar-days fa-sm custom-select-icon" id="profile" style="cursor: pointer;"></i>
          </div>
          <button id="buttonFilter" type="button"><i class="fa-solid fa-filter"></i> Filter</button>
        </form>
      </div>
    </section>

    <?php
    include_once 'components/stats.php';
    ?>

  </div>

  <section class="charts-content">
    <div class="charts-section">
      <div class="chart">
        <div class="chart-icon">
          <i class="fa-solid fa-ellipsis setting"></i>
        </div>
        <h3>Total Attendance Report</h3>
        <div class="chart-container">
          <div id="lineChart"></div>
        </div>
      </div>

      <div class="chart">
        <div class="chart-icon">
          <i class="fa-solid fa-ellipsis setting"></i>
        </div>
        <h3>Students By Course <span id="barChartLoading" style="display: none;">Loading</span></h3>
        <div class="chart-container">
          <div id="barChart"></div>
        </div>
      </div>
    </div>

    <div class="charts-section" style="margin-bottom: 20px;">
      <div class="chart">
        <div class="chart-icon">
          <i class="fa-solid fa-ellipsis setting"></i>
        </div>
        <h3>Students by Year</h3>
        <div class="chart-container">
          <div id="donutChart"></div>
        </div>
      </div>

      <div class="chart">
        <div class="chart-icon">
          <i class="fa-solid fa-ellipsis setting"></i>
        </div>
        <h3>Top 5 Attendance</h3>
        <!-- MAKE SURE TO LOOP THIS PART -->
        <div class="chart-container top-attendace-list">
          <!-- <div class="top-attenance">
            <div class="attendance">
              <div class="attendance-left">
                <img src="../assets/Users/Gregg/gregg.jpeg" width="50" alt="">
                <p>John Gregg V. Felicisimo</p>
                <span>100%</span>
              </div>
              <div class="attendance-right">
                <p>30 <span>days</span></p>
              </div>
            </div>
          </div>
          <div class="top-attenance">
            <div class="attendance">
              <div class="attendance-left">
                <img src="../assets/Users/Gregg/gregg.jpeg" width="50" alt="">
                <p>Euncie M. Amponin</p>
                <span>99%</span>
              </div>
              <div class="attendance-right">
                <p>30 <span>days</span></p>
              </div>
            </div>
          </div>
          <div class="top-attenance">
            <div class="attendance">
              <div class="attendance-left">
                <img src="../assets/Users/Gregg/gregg.jpeg" width="50" alt="">
                <p>Andrei Dumaop</p>
                <span>98.3%</span>
              </div>
              <div class="attendance-right">
                <p>30 <span>days</span></p>
              </div>
            </div>
          </div>
          <div class="top-attenance">
            <div class="attendance">
              <div class="attendance-left">
                <img src="../assets/Users/Gregg/gregg.jpeg" width="50" alt="">
                <p>Mark Jovan Cananca</p>
                <span>95.4%</span>
              </div>
              <div class="attendance-right">
                <p>30 <span>days</span></p>
              </div>
            </div>
          </div>
          <div class="top-attenance">
            <div class="attendance">
              <div class="attendance-left">
                <img src="../assets/Users/Gregg/gregg.jpeg" width="50" alt="">
                <p>Vincent Pabon</p>
                <span>94%</span>
              </div>
              <div class="attendance-right">
                <p>30 <span>days</span></p>
              </div>
            </div>
          </div> -->
        </div>
      </div>

      <div class="chart">
        <div class="chart-icon">
          <i class="fa-solid fa-ellipsis setting"></i>
        </div>
        <h3>Weekly Absent</h3>
        <div class="chart-container">
          <div id="radarChart"></div>
        </div>
      </div>
    </div>
  </section>

  <!-- FOOTER SECTION -->
  <?php
  include_once 'components/footer.php';
  ?>

  <!-- APEXCHART -->
  <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
  <!-- JQUERY VENDOR -->
  <script src="../public/vendor/jquery/jquery.min.js"></script>
  <!-- Page Javascript Code -->
  <script src="../public/js/dashboard.js"></script>
  <script src="../public/js/chart.js"></script>
  <script src="../public/js/signout.js"></script>
</body>

</html>