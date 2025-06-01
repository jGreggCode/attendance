<?php
// SESSION
require_once "../includes/session/config.session.inc.php";

$userid = null;
$first_name = null;

if(!isset($_SESSION['user'])){
  header('Location: admin.php');
  exit();
}

if (isset($_SESSION['user'])) {
  $userid = $_SESSION['user']['user_id'];
  $first_name = $_SESSION['user']['first_name'];
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
<body>
  <!-- LOADING -->
  <div id="loadingMessage" class="loading-message" style="display: none;">
    <div class="spinner"></div>
    <p>Please wait, processing...</p>
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
            <i class="fa-solid fa-cog fa-lg" id="setting" style="cursor: pointer;"></i>
          </div>
        </div>
        <div class="user">
          <p>Welcome Admin</p>
          <img src="../assets/Users/Gregg/gregg.jpeg" id="profile" height="32" alt="User Icon">

          <div class="profile-dropdown" id="profileDropdown">
          <div class="profile-info">
            User Id: <?php echo $userid; ?>
          </div>
          <a id="buttonSignOut" class="logout-btn">Logout</a>
        </div>
        </div>
      </div>
    </nav>

    <section class="main-content">
    </section>
  </div>

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
  <script src="../public/js/signout.js"></script>
</body>
</html>