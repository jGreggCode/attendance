<?php 
// Copyright © 2025 John Gregg [Your Last Name]
// All rights reserved. Unauthorized use is prohibited.

ini_set('session.use_only_cookies', 1);
ini_set('session.use.strict_mode', 1);
ini_set('session.gc_maxlifetime', 3600 * 24); // 24 hours
ini_set('session.gc_probability', 1);
ini_set('session.gc_divisor', 100);

$domain = ($_SERVER['HTTP_HOST'] !== 'localhost') ? $_SERVER['HTTP_HOST'] : false;

session_set_cookie_params([
    'lifetime' => 3600 * 24, 
    'path' => '/',
    'domain' => $domain,
    'secure' => isset($_SERVER['HTTPS']),
    'httponly' => true,
    'samesite' => 'Strict'
]);

session_start();

// Optional: Refresh the session cookie every request to keep it active
setcookie(session_name(), session_id(), [
  'expires' => time() + 3600 * 24,
  'path' => '/',
  'domain' => $_SERVER['HTTP_HOST'],
  'secure' => isset($_SERVER['HTTPS']),
  'httponly' => true,
  'samesite' => 'Strict'
]);

if (!isset($_SESSION['last_regeneration'])) {
  regenerate_session_id();
} else {
  $interval = 60 * 1; // 30 minutes
  if (time() - $_SESSION['last_regeneration'] >= $interval) {
    regenerate_session_id();
  }
}

function regenerate_session_id() {
  session_regenerate_id(true);
  $_SESSION['last_regeneration'] = time();
}