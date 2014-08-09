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
        
        $Mail = new PHPMailer();
        $Mail->IsSMTP(); // Use SMTP relay:hosting.secureserver.net
        $Mail->Host = "smtpout.secureserver.net"; // Sets SMTP server
        $Mail->SMTPDebug = 2; // 2 to enable SMTP debug information 
        $Mail->SMTPAuth = TRUE; // enable SMTP authentication
        $Mail->SMTPSecure = "false"; //Secure conection
        $Mail->Port = 25; // set the SMTP port
        $Mail->Username = 'customercontact@viewfindar.com'; // SMTP account username
        $Mail->Password = 'customer'; // SMTP account password
        $Mail->Priority = 1; // Highest priority - Email priority (1 = High, 3 = Normal, 5 = low)
        $Mail->CharSet = 'UTF-8';
        $Mail->Encoding = '8bit';
        $Mail->Subject = 'ViewFindAR';
        $Mail->ContentType = 'text/html; charset=utf-8\r\n';
        $Mail->From = 'customercontact@viewfindar.com';
        $Mail->FromName = 'ViewFindAR';
        $Mail->WordWrap = 900; // RFC 2822 Compliant for Max 998 characters per line

        $Mail->AddAddress('subramanyam_a@hotmail.com'); // To:
        $Mail->isHTML(TRUE);
        $mailbody = "Dear Client,<br /><br />";
        $mailbody = $mailbody . "Our user, Mr. Subramanyam Iyer, wants to meet you regarding the Tag Title. He is currently residing in the Sarjapura Road area and has been looking at rental properties since March 25, 2014. This is the first property that he has expressed interest in. Kindly contact him directly for further discussion.<br /><br />";
        $mailbody = $mailbody . "Mr. Subramanyam Iyer<br />";
        $mailbody = $mailbody . "Mobile: 9880522149<br />";
        $mailbody = $mailbody . "Email: subramanyam.a.iyer@outlook.com<br /><br />";
        $mailbody = $mailbody . "Sincerely,<br />";
        $mailbody = $mailbody . "Client Services Team<br />";
        $Mail->Body = $mailbody;
//        $Mail->AltBody = '<b>test</b>';
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
