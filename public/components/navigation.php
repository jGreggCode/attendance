<nav class="navigation">
  <div class="left-nav">
    <div class="logo">
      <img src="../assets/BSITSACLI.png" height="32" alt="SACLI LOGO">
      <p>TMS</p>
    </div>
    <div class="nav-links">
      <ul>
        <?php 
          if ($user_type === "Admin") {?>
            <li class="nav-link"><a class="active" href="dashboard.php">Overview</a></li>
            <li class="nav-link"><a href="students.php">Student's List</a></li>
            <li class="nav-link"><a href="employees.php">Employee's List</a></li>
            <!-- <li class="nav-link"><a href="">Reports</a></li> -->
          <?php } 
        ?>
        <li class="nav-link"><a href="attendance.php">Attendance</a></li>
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
        <i class="fa-solid fa-angle-down fa-lg profile" id="profile" style="cursor: pointer;"></i>
      </div>
      <div class="profile-dropdown profileDropdown" id="profileDropdown">
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