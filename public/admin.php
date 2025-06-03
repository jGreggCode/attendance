<?php 
// SESSION
require_once "../includes/session/config.session.inc.php";
if(isset($_SESSION['user'])){
  header('Location: dashboard.php');
} 
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../public/css/main.css" />
    <link rel="stylesheet" href="../public/css/admin.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <!-- TOASTIFY  -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">

    <title>Login</title>
  </head>
  <body>
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
              <h2>Saint Anne College Lucena INC.</h2>
              <p>Class Beyond Quezon</p>
            </div>
            <div class="short-text">
              <h2>Saint Anne College Lucena INC.</h2>
              <p>Class Beyond Quezon</p>
            </div>
          </div>
        </div>
        <div class="header-right">
          <ul>
            <li><a href="https://sacli.edu.ph/" target="_blank">Official Website</a></li>
            <li><a href="./index.php">Attendance</a></li>
          </ul>
        </div>
      </div>

      <div class="section-signin">
        <form class="form-signin">
          <div class="form-header">
            <img src="../assets/saclilogo.png" alt="" height="80">
            <div class="form-header-text">
              <h2>Welcome to SACLI - TMS</h2>
              <p>Sign in to your account</p>
              
              <div class="error-message" id="errorMessage"></div>
              <div class="success-message" id="loginMessage"></div>
            </div>
          </div>
          <div class="form-body">
            <div class="form-group" id="StudentIDGroup">
              <i class="fas fa-user"></i>
              <input type="text" id="SIUsername" name="SIAdminID" placeholder="User ID" required />
            </div>
            <div class="form-group" id="StudentPasswordGroup" >
              <i class="fas fa-lock"></i>
              <input type="password" id="SIPassword" name="SIPassword" placeholder="Password" required >
              <i class="fas fa-eye-slash toggle-password" id="SITogglePassword" style="cursor: pointer;"></i>
              </input>
            </div>
            <button id="buttonSignIn" type="button">Sign In</button>
            <div class="form-check">
            </div>
            <div class="form-footer">
              <div class="divider"></div>
              <p>Don't have an account? <a href="https://sacli.edu.ph/sacliportal" target="_blank">Request</a></p>
            </div>
          </div>
        </form>
      </div>

      <!-- Sign Up Section -->
      <div class="section-signin" style="display: none;">
        <form class="form-signin" enctype="multipart/form-data">
          <div class="form-header">
            <img src="../assets/saclilogo.png" alt="" height="80">
            <div class="form-header-text">
              <h2>Hello Admin!</h2>
              <p>Register an RFID / User</p>
            </div>
          </div>
          <div class="form-body">
            <div class="form-group">
              <input type="text" id="SURfidCode" name="SURfidCode" placeholder="RFID" />
            </div>
            <div class="form-group">
              <input type="text" id="SUUserId" name="SUUserId" placeholder="User ID" />
            </div>
            <div class="form-group">
              <input type="text" id="SUFirstName" namespace="SUFirstName" placeholder="First Name" />
            </div>
            <div class="form-group">
              <input type="text" id="SUMiddleName" name="SUMiddleName" placeholder="Middle Name" />
            </div>
            <div class="form-group">
              <input type="text" id="SULastName" name="SULastName" placeholder="Last Name" />
            </div>
            <div class="form-group">
              <input type="number" id="SUAge" name="SUAge" min="0" max="100" placeholder="Age" />
            </div>
            <div class="form-group">
              <input type="date" id="SUBirthday" name="SUBirthday" placeholder="Birthday" />
            </div>
            <div class="form-group">
              <select name="SUCourse" id="SUCourse">
                <option value="AB Communication">AB Communication (AB Comm)</option>
                <option value="AB Psychology">AB Psychology (AB Psych)</option>
                <option value="BS Accountancy">BS Accountancy (BSA)</option>
                <option value="BS Business Administration">BS Business Administration (BSBA)</option>
                <option value="BS Civil Engineering">BS Civil Engineering (BSCE)</option>
                <option value="BS Criminilogy">BS Criminilogy (BS Crim)</option>
                <option value="BS Hospitality Management">BS Hospitality Management (BSHM/BSHRM)</option>
                <option value="BS Industrial Engineering">BS Industrial Engineering (BSIE)</option>
                <option value="BS Information Technology">BS Information Technology (BSIT)</option>
                <option value="BS Management Accounting">BS Management Accounting (BSMA)</option>
                <option value="BS Medcal Technology">BS Medcal Technology (BSMT)</option>
                <option value="BS Midwifery">BS Midwifery (BS Mid)</option>
                <option value="BS Nursing">BS Nursing (BSN)</option>
                <option value="BS Physical Therapy">BS Physical Therapy (BSPT)</option>
                <option value="BS Tourism Management">BS Tourism Management (BSTM)</option>
                <option value="Bachelor In Secondary Education">Bachelor In Secondary Education (BSEd)</option>
                <option value="BS in Elementary Education">BS in Elementary Education (BSed)</option>
                <option value="Doctor of Dental Medicine">Doctor of Dental Medicine (Dentistry)</option>
                <option value="Others">Others: Professional Education Uniting</option>
                <option value="TESDA Programs">TESDA Programs</option>
              </select>
            </div>
            <div class="form-group">
              <input type="number" id="SUYearLevel" name="SUYearLevel" min="1" max="6" placeholder="Year Level" />
            </div>
            <div class="form-group">
              <input type="text" id="SUDepartment" name="SUDepartment" placeholder="Department" />
            </div>
            <div class="form-group">
              <select name="SUUserType" id="SUUserType">
                <option value="student">Student</option>
                <option value="employee">Employee</option>
                <option value="admin">Admin</option>
              </select>
            </div>
            <div class="form-group">
              <input type="email" id="SUEmail" name="SUEmail" placeholder="Email" />
            </div>
            <div class="form-group">
              <input type="text" id="SUUsername" name="SUUsername" placeholder="Password" />
            </div>
            <div class="form-group">
              <input type="password" id="SUPassword" name="SUPassword" placeholder="Password" />
            </div>
            <div class="form-group">
              <input type="password" id="SURePassword" name="SURePassword" placeholder="Re-Password" />
            </div>
            <div class="form-group">
              <div class="file-upload-wrapper">
                <input type="file" id="SUPhoto" name="SUPhoto" hidden/>
                <label for="SUPhoto" class="custom-file-upload">
                  <i class="fa-solid fa-upload"></i> Choose Photo
                </label>
                <span id="fileName">No file selected</span>
              </div>  
            </div>
            <div class="error-message" id="suErrorMessage"></div>
            <div class="success-message" id="registerMessage"></div>
            <button id="buttonSignUp" type="button">Sign Up</button>
          </div>
        </form>
      </div>

      <!-- <div class="section-footer">
        <div class="footer-links">
          <a href="https://sacli.edu.ph/privacy-policy/" target="_blank">Privacy Policy</a>
          <span>|</span>
          <a href="https://sacli.edu.ph/terms-of-use/" target="_blank">Terms of Use</a>
          <span>|</span>
          <a href="https://sacli.edu.ph/sitemap/" target="_blank">Sitemap</a>
          <p>&copy; 2025 | <a class="programmer-name" href="" target="_blank">jgreggcode</a></p>
        </div>
      </div> -->
    </div> 
    <!-- JQUERY VENDOR -->
    <script src="../public/vendor/jquery/jquery.min.js"></script>
    <!-- For Sign In & Sign Up AJAX -->
    <script src="../public/js/signin.js"></script>
    <script src="../public/js/signup.js"></script>
    <script src="../public/js/admin.js"></script>

    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
  </body>
</html>
