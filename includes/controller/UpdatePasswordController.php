<?php 
// Copyright © 2025 John Gregg [Your Last Name]
// All rights reserved. Unauthorized use is prohibited.

declare(strict_types=1);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once '../model/user.model.php';

class UpdatePasswordController extends User {
  private $user_id;
  private $currentPassword;
  private $newPassword;
  private $newRePassword;

  public function __construct($db, $user_id, $currentPassword, $newPassword, $newRePassword) {
    parent::__construct($db);
    $this->user_id = $user_id;
    $this->currentPassword = $currentPassword;
    $this->newPassword = $newPassword;
    $this->newRePassword = $newRePassword;
  }

  public function updatePassword() {
    if ($this->passwordMatch() !== null) {
      return $this->passwordMatch();
    } else if ($this->emptyInput() !== null) {
        return $this->emptyInput();
    } else {
      $response = $this->changeUserPassword(
        $this->user_id,
        $this->currentPassword,
        $this->newPassword,
      );
      return $response;
    }
  }

  private function emptyInput() {
    $result = null;

    $requiredFields = [
      'user_id' => $this->user_id,
      'currentPassword' => $this->currentPassword,
      'newPassword' => $this->newPassword,
      'newRePassword' => $this->newRePassword,
    ];

    foreach ($requiredFields as $field => $value) {
      if (empty($value)) {
        $message = ucfirst(str_replace('_', ' ', $field)) . ' cannot be empty.';
        return ['status' => 'error', 'message' => $message];
      }
    }

    return $result;
  }

  private function passwordMatch() {
    $result = null;

    if ($this->newPassword !== $this->newRePassword) {
      $message = 'Passwords Do Not Match!';
      $result = ['status' => 'error', 'message' => $message];
    } 

    return $result;
  }

}
