<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../Mail/src/Exception.php';
require '../Mail/src/PHPMailer.php';
require '../Mail/src/SMTP.php';
require_once '../database/dbh.inc.php';

header('Content-Type: application/json');

class AccountMailer
{
    private PHPMailer $mail;
    private PDO $db;

    public function __construct(PDO $conn)
    {
        $this->db = $conn;
        $this->mail = new PHPMailer(true);
        $this->configureSMTP();
    }

    private function configureSMTP(): void
    {
        $this->mail->isSMTP();
        $this->mail->Host = 'smtp.gmail.com';
        $this->mail->SMTPAuth = true;
        $this->mail->Username = 'jgdev101613@gmail.com';
        $this->mail->Password = 'bjbl usgj ajyp krqz';
        $this->mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $this->mail->Port = 587;
        $this->mail->setFrom('jgdev101613@gmail.com', 'Easy Assess');
        $this->mail->isHTML(true);
    }

    public function handleTimein(string $email, string $accountType, string $fullname, string $dateToday, string $nowTime): array
    {
        $this->sendTimeInEmail($accountType, $email, $fullname, $dateToday, $nowTime);

        return ['status' => 'success', 'message' => 'Email Sent'];
    }

    public function handleTimeout(string $email, string $accountType, string $fullname, string $dateToday, string $nowTime): array
    {

        $this->sendTimeOutEmail($accountType, $email, $fullname, $dateToday, $nowTime);

        return ['status' => 'success', 'message' => 'Email Sent'];
    }

    public function sendTimeInEmail(string $accountType, string $recipientEmail, string $fullname, $dateToday, $nowTime): void
    {
      $this->sendEmail(
          $recipientEmail,
          "$fullname",
          __DIR__ . '/../../assets/saclilogo.png',
          'Campus Time In',
          "<p>Date: $dateToday</p>",
          "<p>Time In: $nowTime</p>"
      );
    }

    public function sendTimeOutEmail(string $accountType, string $recipientEmail, string $fullname, string $dateToday, string $nowTime): void
    {
      $this->sendEmail(
        $recipientEmail,
        "($fullname)",
        __DIR__ . '/../../assets/saclilogo.png',
        'Campus Time Out',
        "<p>Date: $dateToday</p>",
        "<p>Time Out: $nowTime</p>"
    );
    }

    public function sendRegistrationEmail(string $accountType, string $recipientEmail): void
    {
        $this->sendEmail(
            $recipientEmail,
            "Account Registration ($accountType)",
            __DIR__ . '/../../assets/saclilogo.png',
            'Welcome to SACLI - Easy Assess',
            '<p>Your registration is under review by school administrator. You will receive an email once your account has been approved.</p>'
        );
    }

    public function sendForgotPasswordEmail(string $link, string $recipientEmail): void
    {
        $this->sendEmail(
            $recipientEmail,
            'Change Password',
            __DIR__ . '/data/item_images/logowithbg.jpg',
            'Password Reset Request',
            "<p>Click the link to reset your password:</p><a href='$link' style='padding:10px 20px;background:#000;color:#fff;text-decoration:none;'>Reset Password</a>"
        );
    }

    private function sendEmail(string $recipient, string $subject, string $imagePath, string $headerText, string $date, $time): void
    {
        try {
            $this->mail->clearAllRecipients();
            $this->mail->addAddress($recipient);
            $this->mail->Subject = $subject;
            $this->mail->AddEmbeddedImage($imagePath, 'logo_img');

            $this->mail->Body = "
                <html>
                <head><style>
                    body { font-family: Arial; background: #f4f4f4; padding: 20px; }
                    .email-container { max-width: 600px; margin: auto; background: #fff; padding: 20px; border-radius: 10px; }
                    .header img { width: 150px; }
                    .header h2 { margin: 10px 0; }
                    .content, .footer { text-align: center; font-size: 16px; line-height: 1.5; }
                </style></head>
                <body>
                    <div class='email-container'>
                        <div class='header' style='text-align:center;'>
                            <img src='cid:logo_img' alt='System Logo'>
                            <h2>$headerText</h2>
                        </div>
                        <div class='content'>
                        $date $time
                        </div>
                        <div class='content'><small>This is an auto mailer. Do not reply</small></div>
                        <div class='footer'><p>Need help? Contact us at <strong>+63 991 7822 877</strong></p></div>
                    </div>
                </body>
                </html>";
            $this->mail->send();
        } catch (Exception $e) {
            echo json_encode(['status' => 'error', 'message' => $this->mail->ErrorInfo]);
            exit;
        }
    }
}