<?php

//

error_reporting(0);
require_once '../conf/config.php';
require 'PHPMailer-master/PHPMailerAutoload.php';

//$user_phone_no = isset($_POST['phno']) ? $_POST['phno'] : "";
//$tag_id = isset($_POST['tagid']) ? $_POST['tagid'] : "";
//echo 'inside file';

$user_phone_no = isset($_POST['phno']) ? $_POST['phno'] : "9945252686";
$tag_id = isset($_POST['tagid']) ? $_POST['tagid'] : "33";

//$user_phone_no = '9945252686';
//$tag_id = 28;

///////////////////////////////////////////////Authenticated Mail Function///////////////////////////////////////

function auth_mail_send($from_adress, $to_address, $tag_title) {
    $Mail = new PHPMailer();
    $Mail->IsSMTP(); // Use SMTP relay:hosting.secureserver.net
    $Mail->Host = "smtpout.secureserver.net"; // Sets SMTP server
    $Mail->SMTPDebug = 0; // 2 to enable SMTP debug information 
    $Mail->SMTPAuth = TRUE; // enable SMTP authentication
    $Mail->SMTPSecure = "false"; //Secure conection
    $Mail->Port = 25; // set the SMTP port
    $Mail->Username = $from_adress; // SMTP account username
    $Mail->Password = 'customer'; // SMTP account password
    $Mail->Priority = 1; // Highest priority - Email priority (1 = High, 3 = Normal, 5 = low)
    $Mail->CharSet = 'UTF-8';
    $Mail->Encoding = '8bit';
    $Mail->Subject = 'ViewFindAR';
    $Mail->ContentType = 'text/html; charset=utf-8\r\n';
    $Mail->From = $from_adress;
    $Mail->FromName = 'ViewFindAR';
    $Mail->WordWrap = 900; // RFC 2822 Compliant for Max 998 characters per line

    $Mail->AddAddress($to_address); // To:
    $Mail->isHTML(TRUE);
    $mailbody = "Dear Client,<br /><br />";
    $mailbody = $mailbody . "Our user, Mr. Subramanyam Iyer, wants to meet you regarding the " . $tag_title . ". He is currently residing in the Sarjapura Road area and has been looking at rental properties since March 25, 2014. This is the first property that he has expressed interest in. Kindly contact him directly for further discussion.<br /><br />";
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
        return $Mail->ErrorInfo;
    } else {
        return 'true';
    }
}

function auth_mail_send_user($from_adress, $to_address) {
    ob_start();
    $Mail = new PHPMailer();
    $Mail->IsSMTP(); // Use SMTP relay:hosting.secureserver.net
    $Mail->Host = "smtpout.secureserver.net"; // Sets SMTP server
    $Mail->SMTPDebug = 0; // 2 to enable SMTP debug information 
    $Mail->SMTPAuth = TRUE; // enable SMTP authentication
    $Mail->SMTPSecure = "false"; //Secure conection
    $Mail->Port = 25; // set the SMTP port
    $Mail->Username = $from_adress; // SMTP account username
    $Mail->Password = 'customer'; // SMTP account password
    $Mail->Priority = 1; // Highest priority - Email priority (1 = High, 3 = Normal, 5 = low)
    $Mail->CharSet = 'UTF-8';
    $Mail->Encoding = '8bit';
    $Mail->Subject = 'ViewFindAR';
    $Mail->ContentType = 'text/html; charset=utf-8\r\n';
    $Mail->From = $from_adress;
    $Mail->FromName = 'ViewFindAR';
    $Mail->WordWrap = 900; // RFC 2822 Compliant for Max 998 characters per line

    $Mail->AddAddress($to_address); // To:
    $Mail->isHTML(TRUE);
    $mailbody = "Dear Client,<br /><br />";
    $mailbody = $mailbody . "Our user, Mr. Subramanyam Iyer, wants to meet you regarding the " . $tag_title . ". He is currently residing in the Sarjapura Road area and has been looking at rental properties since March 25, 2014. This is the first property that he has expressed interest in. Kindly contact him directly for further discussion.<br /><br />";
    $mailbody = $mailbody . "Mr. Subramanyam Iyer<br />";
    $mailbody = $mailbody . "Mobile: 9880522149<br />";
    $mailbody = $mailbody . "Email: subramanyam.a.iyer@outlook.com<br /><br />";
    $mailbody = $mailbody . "Sincerely,<br />";
    $mailbody = $mailbody . "Client Services Team<br />";
    $Mail->Body = $mailbody;
//        $Mail->AltBody = '<b>test</b>';
    $Mail->Send();
    $Mail->SmtpClose();
    ob_get_clean();
    if ($Mail->IsError()) {
        return $Mail->ErrorInfo;
    } else {
        return 'true';
    }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////


$sql_user_mail = "SELECT `user`.`USER_EMAIL`
                    FROM `user`
                    WHERE `user`.`USER_MOBILE` = '" . $user_phone_no . "';";

$result_user_mail = mysql_query($sql_user_mail, $con);

//echo '$sql_user_mail=', $sql_user_mail;
//echo "<br />";

$count_user_mail = mysql_num_rows($result_user_mail);

//echo '$count_user_mail=', $count_user_mail;
//echo "<br />";
//SMS Function
//$sql_user_messg = "SELECT `business`.`BUSINESS_MOBILE`, `business`.`BUSINESS_EMAIL`
//                    FROM `business`
//                    WHERE `business`.`BUSINESS_ID` IN (SELECT DISTINCT `offer`.`business_id`
//                    FROM `offer`
//                                                                        WHERE `offer`.`tag_id` = " . $tag_id . ");";

$sql_user_messg = "SELECT `business`.`BUSINESS_MOBILE`,
                    `business`.`BUSINESS_EMAIL`,
                    `tagMaster`.`TAG_NAME`
                    FROM `business`,`tagMaster`
                    WHERE `business`.`BUSINESS_ID` = `tagMaster`.`CREATED_BY_BUSNSS`
                    AND `tagMaster`.`TAG_ID` = " . $tag_id . ";";

//echo '$sql_user_messg=',$sql_user_messg;
//echo "<br />";

$result_user_messg = mysql_query($sql_user_messg, $con);

$count_user_messg = mysql_num_rows($result_user_messg);
//echo '$count_user_messg=',$count_user_messg;
//echo "<br />";

if ($count_user_messg == 1) {
    $row_user_messg = mysql_fetch_assoc($result_user_messg);
    $business_phone_no = $row_user_messg['BUSINESS_MOBILE'];
    $business_mail = $row_user_messg['BUSINESS_EMAIL'];
    $tag_name = $row_user_messg['TAG_NAME'];

    if ($count_user_mail == 1 && $business_mail) {
        $row_user_mail = mysql_fetch_assoc($result_user_mail);
        $user_mail = $row_user_mail['USER_EMAIL'];

        // Business mail part
//        echo '$business_mail=',$business_mail,'$tag_name=',$tag_name;
        $to_business = auth_mail_send('customercontact@viewfindar.com', $business_mail, $tag_name);
//        echo "<br />";
//        echo '$to_business=',$to_business;
//        echo "<br />";
//        $subject = "User is Interested in the business contact with the following e-mail:" . $user_mail;
//        $txt = "Customer For Business";
//        $headers = "From: admin@mobodexter.com" . "\r\n" .
//                "CC: gpradeep24@gmail.com";
//
//        $mail = mail($business_mail, $subject, $txt, $headers);
//        if ($mail) {
//            $mail_success = 'true';
//        } else {
//            $mail_success = 'false';
//        }
        //User mail part
//        $to_user = auth_mail_send('usercontact@viewfindar.com', $user_mail);
//        echo "<br />";
//        echo '$to_user=',$to_user;
//        echo "<br />";
//        $subject = "Thanks for showing interest will get back to u soon";
//        $txt = "Mobodexter Greeting";
//        $headers = "From: admin@mobodexter.com" . "\r\n" .
//                "CC: gpradeep24@gmail.com";
//
//        $mail = mail($user_mail, $subject, $txt, $headers);
    }

    function sendSMS_business($bus_phone_no, $bus_mail, $tag_name) {
        $user = "Pratham1990";
        $password = "997775";
        $sender = "WEBSMS";
        $text = urlencode("Our user wishes to contact you regarding $tag_name.  Details have been emailed to your inbox ($bus_mail). Thanks! - Client Services Team");
//        $url = "http://login.smsgatewayhub.com/smsapi/pushsms.aspx?user=$user&pwd=$password&to=$bus_phone_no&sid=$sender&msg=$text&fl=0";
        $url = "http://login.smsgatewayhub.com/smsapi/pushsms.aspx?user=$user&pwd=$password&to=$bus_phone_no&sid=$sender&msg=$text&fl=0";
//        echo '$url=',$url;
//        $ret = file($url);
//        $sess = explode("+", trim($ret[1]));
//
//        if ($sess[2] == "Successfully") {
//            $response['success'] = true;
//            echo 'true';
//        } else {
//            $response['success'] = false;
//            echo 'true';
//        }
    }

//    function sendSMS_user($bus_phone_no) {
//        $user = "Pradeep24g";
//        $password = "287816";
//        $sender = "WEBSMS";
//        $text = urlencode("Thanks For the Interest will get back to u soon from ViewFindAr");
//        $url = "http://login.smsgatewayhub.com/smsapi/pushsms.aspx?user=$user&pwd=$password&to=$bus_phone_no&sid=$sender&msg=$text&fl=0";
////        $ret = file($url);
//    }
//    echo '$business_phone_no=',$business_phone_no,'$business_mail=',$business_mail, '$tag_name=',$tag_name;
//    Calling function For Business
//    echo '$bus_phone_no=',$business_phone_no; 
    sendSMS_business($business_phone_no, $business_mail, $tag_name);
    //    Calling function For User
//    sendSMS_user($user_phone_no);


    if ($to_business == 'true') {
        echo 'Success';
    } else {
        echo 'NULL';
    }
}
?>