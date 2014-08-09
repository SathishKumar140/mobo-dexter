<?php //
// require_once "Mail.php";
// 
// $from = "customercontact@viewfindar.com";
// $to = "gpradeep24@outlook.com";
// $subject = "Hi!";
// $body = "Hi,\n\nHow are you?";
// 
// $host = "smtpout.secureserver.net";
// $username = "customercontact@viewfindar.com";
// $password = "customer";
// 
// $headers = array ('From' => $from,
//   'To' => $to,
//   'Subject' => $subject);
// $smtp = Mail::factory('smtp',
//   array ('host' => $host,
//     'auth' => true,
//     'username' => $username,
//     'password' => $password));
// 
// $mail = $smtp->send($to, $headers, $body);
// 
// if (PEAR::isError($mail)) {
//   echo("<p>" . $mail->getMessage() . "</p>");
//  } else {
//   echo("<p>Message successfully sent!</p>");
//  }
 ?>

<?php //
// require_once "Mail.php";
// 
// $from = "customercontact@viewfindar.com";
// $to = "gpradeep24@outlook.com";
// $subject = "Hi!";
// $body = "Hi,\n\nHow are you?";
// 
// $host = "relay-hosting.secureserver.net";
// $port = "25";
// $username = "customercontact@viewfindar.com";
// $password = "customer";
// 
// $headers = array ('From' => $from,
//   'To' => $to,
//   'Subject' => $subject);
// $smtp = Mail::factory('smtp',
//   array ('host' => $host,
//     'port' => $port,
//     'auth' => true,
//     'username' => $username,
//     'password' => $password));
// 
// $mail = $smtp->send($to, $headers, $body);
// 
// if (PEAR::isError($mail)) {
//   echo("<p>" . $mail->getMessage() . "</p>");
//  } else {
//   echo("<p>Message successfully sent!</p>");
//  }
 ?>

<?php
include('Mail.php');
// 
//$from = "customercontact@viewfindar.com";
//$to = "gpradeep24@outlook.com";
//$subject = "What's up";
//$body = "Hi,\n\nHow are you? What is happening";
// 
//$headers = array (
//    'From' => $from,
//    'To' => $to,
//    'Subject' => $subject);
// 
// $smtp = Mail::factory('smtp' );
// 
// $mail = $smtp->send($to, $headers, $body);
// 
// if (PEAR::isError($mail)) {
//   echo("<p>" . $mail->getMessage() . "</p>");
//  } else {
//   echo("<p>Message successfully sent!</p>");
//  }
?>