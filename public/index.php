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
      <img src="../assets/saclibg.jpg" alt="Background Image" />
    </div>

    <div class="section-header">
      <div class="header-left">
        <div class="logo">
          <img src="../assets/saclilogo.png" alt="Sacli Logo" height="64">
          <div class="logo-text">
            <h2>Saint Anne College Lucena INC.</h2>
            <p>Class Beyond Quezon</p>
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
            <p class="user-message" id="time">12:00 Am</p>
          </div>

          <div class="time-now">
            <p id="timeNow"></p>
          </div>
          <div class="date-today">
            <p id="dateToday">October 1, 2023</p>
          </div>
        </div>
      </div>
    </div>

    <!-- ADMIN AND EMPLOYEE SIGNIN -->
    <div class="section-signin">

    </div>
  </div> 

  <!-- JQUERY VENDOR -->
  <script src="./vendor/jquery/jquery.min.js"></script>
  <!-- For Sign In & Sign Up AJAX -->
  <script src="./js/main.js"></script>
</body>
</html>