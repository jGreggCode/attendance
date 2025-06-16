<!-- 
  Copyright © 2025 John Gregg Felicisimo
  All rights reserved. Unauthorized use is prohibited.
-->

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
            </div>
          </div>
          <div class="form-body">
            <div class="form-group" id="StudentIDGroup">
              <i class="fas fa-user"></i>
              <input type="text" id="SIUsername" name="SIUsername" placeholder="User ID" required />
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

    <!-- For Sign In & Sign Up AJAX -->
    <script type="module" src="../public/js/signin.js"></script>

    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
  </body>
</html>
