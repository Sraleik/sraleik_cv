<?php

$mail_api = getenv('MAIL_API');
$mail_domain= getenv('MAIL_DOMAIN');
$mail_to = getenv('MAIL_TO');

// echo($_POST['email']);
// echo "";


// echo("curl -s --user 'api:". $mail_api ."' https://api.mailgun.net/v3/". $mail_domain ."/messages -F from='". $_POST['name'] .'  <'. $_POST['email'] .">' -F to=". $mail_to ." -F subject='Votre CV' -F text='". $_POST['message'] . "\n" . $_POST['phone'] . "\n" . $_POST['website'] ."'");

exec("curl -s --user 'api:". $mail_api ."' https://api.mailgun.net/v3/". $mail_domain ."/messages -F from='". $_POST['name'] .'  <'. $_POST['email'] .">' -F to=". $mail_to ." -F subject='Votre CV' -F text=\"". $_POST['message'] . "\n\n" . $_POST['phone'] . "\n" . $_POST['website'] ."\"");


header('Location: index.php?sent=true#contact');
?>
