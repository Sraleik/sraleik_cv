<?php

require_once "vendor/autoload.php";

$mail = new PHPMailer;

$mail->CharSet = 'UTF-8';
//Set PHPMailer to use SMTP.
$mail->isSMTP();
//Set SMTP host name
$mail->Host = "smtp.gmail.com";
//Set this to true if SMTP host requires authentication to send email
$mail->SMTPAuth = true;
//Provide username and password
$mail->Username = getenv('MAIL_USER');
$mail->Password = getenv('MAIL_PASSWORD');
//If SMTP requires TLS encryption then set it
$mail->SMTPSecure = "tls";
//Set TCP port to connect to
$mail->Port = 587;

$mail->setFrom($_POST['mail'], 'Site CV'); // set the mail you configured to send the mail
$mail->addReplyTo($_POST['mail'], $_POST['nom']); // set the reply mail from the form
$mail->addAddress(getenv('MAIL_TO')); // set the destination mail, you configured

$mail->isHTML(false);

$mail->Subject = $_POST['objet'];
$mail->Body = $_POST['message'];

if(!$mail->send())
{
    echo "Mailer Error: " . $mail->ErrorInfo;
}
else
{
    echo "Message has been sent successfully";
}
