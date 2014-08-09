<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
        <title>PHPMailer - SMTP without auth test</title>
    </head>
    <body>
        <?php
//SMTP needs accurate times, and the PHP time zone MUST be set
//This should be done in your php.ini, but this is how to do it if you don't have access to that
        date_default_timezone_set('Etc/UTC');
//        echo 'inside';
        require 'PHPMailer-master/PHPMailerAutoload.php';

//        $Mail = new PHPMailer();
//        $Mail->IsSMTP(); // Use SMTP relay:hosting.secureserver.net
//        $Mail->Host = "smtpout.secureserver.net"; // Sets SMTP server
//        $Mail->SMTPDebug = 2; // 2 to enable SMTP debug information 
//        $Mail->SMTPAuth = FALSE; // enable SMTP authentication
//        $Mail->SMTPSecure = "tls"; //Secure conection
//        $Mail->Port = 25; // set the SMTP port
//        $Mail->Username = 'customercontact@viewfindar.com'; // SMTP account username
//        $Mail->Password = 'customer'; // SMTP account password
//        $Mail->Priority = 1; // Highest priority - Email priority (1 = High, 3 = Normal, 5 = low)
//        $Mail->CharSet = 'UTF-8';
//        $Mail->Encoding = '8bit';
//        $Mail->Subject = 'Test Email Using ViewFindAR';
//        $Mail->ContentType = 'text/html; charset=utf-8\r\n';
//        $Mail->From = 'customercontact@viewfindar.com';
//        $Mail->FromName = 'GMail Test';
//        $Mail->WordWrap = 900; // RFC 2822 Compliant for Max 998 characters per line
//
//        $Mail->AddAddress('arasan8990@outlook.com'); // To:
//        $Mail->isHTML(TRUE);
//        $Mail->Body = '<b>test</b>';
//        $Mail->AltBody = '<b>test</b>';
//        $Mail->Send();
//        $Mail->SmtpClose();
//
//        if ($Mail->IsError()) {
//            echo "Mailer Error: " . $Mail->ErrorInfo;
//        } else {
//            echo "<br /><br /><br /><br />OK Sent<br /><br />";
//        }


        $Mail = new PHPMailer();
        $Mail->IsSMTP(); // Use SMTP
        $Mail->Host = "smtp.gmail.com"; // Sets SMTP server
        $Mail->SMTPDebug = 2; // 2 to enable SMTP debug information
        $Mail->SMTPAuth = TRUE; // enable SMTP authentication
        $Mail->SMTPSecure = "tls"; //Secure conection
        $Mail->Port = 587; // set the SMTP port
        $Mail->Username = 'pradeepgowda241989@gmail.com'; // SMTP account username
        $Mail->Password = 'gowda1989fxff'; // SMTP account password
        $Mail->Priority = 1; // Highest priority - Email priority (1 = High, 3 = Normal, 5 = low)
        $Mail->CharSet = 'UTF-8';
        $Mail->Encoding = '8bit';
        $Mail->Subject = 'Test Email Using Gmail';
        $Mail->ContentType = 'text/html; charset=utf-8\r\n';
        $Mail->From = 'pradeepgowda241989@gmail.com';
        $Mail->FromName = 'GMail Test';
        $Mail->WordWrap = 900; // RFC 2822 Compliant for Max 998 characters per line

        $Mail->AddAddress('gpradeep24@outlook.com'); // To:
        $Mail->isHTML(TRUE);
        $Mail->Body = '<b>test</b>';
        $Mail->AltBody = '<b>test</b>';
        $Mail->Send();
        $Mail->SmtpClose();

        if ($Mail->IsError()) {
            echo "Mailer Error: " . $Mail->ErrorInfo;
        } else {
            echo "<br /><br /><br /><br />OK Sent<br /><br />";
        }
        ?>
    </body>
</html>
