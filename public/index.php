<!-- 
  Copyright © 2025 John Gregg Felicisimo
  All rights reserved. Unauthorized use is prohibited.
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- GLOBAL STYLING -->
  <link rel="stylesheet" href="./css/main.css" />
  <!-- MAIN STYLING  -->
  <link rel="stylesheet" href="./css/index.css" />
  <!-- FAVICON - for icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
  <title>SACLI - Attendance</title>
</head>
<body onload="focusInput()">
  <!-- LOADING -->
  <div id="loadingMessage" class="loading-message" style="display: none;">
    <div class="spinner"></div>
    <p>Please wait, processing...</p>
  </div>

  <div class="container">
    <div class="background"> 
      <img src="../assets/saclinewbg.png" alt="Background Image" />
    </div>

    <div class="section-header">
      <div class="header-left">
        <div class="logo">
          <img src="../assets/saclilogo.png" alt="Sacli Logo" height="64">
          <div class="logo-text">
            <h2>ST. Anne College Lucena, INC.</h2>
            <p>Class Beyond Quezon</p>
          </div>
        </div>
      </div>

      <div class="header-right">
        <div class="logo">
          <img src="../assets/BSITSACLI.png" alt="BSIT Logo" height="58">
          <div class="logo-text">
            <h2>BS Information Technology</h2>
            <p>ST. Anne College Of Lucena INC</p>
          </div>
        </div>
      </div>
    </div>

    <div class="section-attendance">
      <form class="form-attendance">
        <div class="form-header">
          <img src="../assets/saclilogo.png" alt="" height="80">
          <div class="form-header-text">
            <h2>Welcome to Saint Anne College!</h2>
            <p id="attendanceMessage">Please tap your ID card...</p>
            <div class="error-message" id="errorMessage"></div>
          </div>
        </div>
        <!-- RFID INPUT -->
        <input type="text" class="rfid-input" id="rfid_input" name="RFIDInput" placeholder="Your ID" required autocomplete="off" />
      </form>

      <div class="section-user-information hidden" id="sectionUserInformation">
        <div class="user-info">
          <div class="user-image">
            <img id="userImage" height="80" src="../assets/Users/Gregg/gregg.jpeg" alt="Profile Picture"/>
          </div>
          <div class="user-details">
            <h3 id="userFullName">John Gregg Virina Felicisimo</h3>
            <p id="userType">Student (2301-000512)</p>
            <p id="userCourseAndYear">BSIT III</p>
            <p class="user-message" id="tap-message">You have already logged in</p>
          </div>

          <div class="time-now">
            <p id="timeNow"></p>
          </div>
          <div class="date-today">
            <p id="dateToday"></p>
          </div>
        </div>
      </div>
    </div>
  </div> 

  <!-- TIME -->
  <div class="footer-clock">
    <div class="footer-clock-time">
      <div class="time">
        <p id="liveTime">June 6, 2025 (Wednesday) - 12:00 Am</p>
      </div>
    </div>
  </div>

  <!-- JQUERY VENDOR -->
  <script src="./vendor/jquery/jquery.min.js"></script>
  <!-- For Sign In & Sign Up AJAX -->
  <script src="./js/main.js"></script>
</body>
</html>