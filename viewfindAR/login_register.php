<?php
session_start();
//require_once 'sidebarmenu/index.html';
require_once 'conf/config.php';
require_once 'conf/verticalsidebar.php';

$login = isset($_POST['login']) ? $_POST['login'] : "";
$register = isset($_POST['register']) ? $_POST['register'] : "";
$auto_login = isset($_POST['autologin']) ? $_POST['autologin'] : "";
$mob = isset($_POST['mob']) ? $_POST['mob'] : "";
?>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Login And Registration</title>
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
    </head>
    <body>
        <?php
        if ($login) {
            $user_mail = $_POST['usermail'];
            $password = $_POST['password'];


            $sql_login = "SELECT `user`.`USER_ID`, `user`.`USER_PASSWORD`, `user`.`USER_FIRSTNAME`, `user`.`ROLE_ID`
                            FROM `user`
                            WHERE `user`.`USER_EMAIL` = '" . $user_mail . "';";
            $result_login = mysql_query($sql_login);

            $count_login = mysql_num_rows($result_login);
//            echo '$sql_login=',$sql_login;
            if ($count_login == 1) {

                $password_history = $password;
                $password = md5($password);

                $row_login = mysql_fetch_assoc($result_login);
                $user_id = $row_login['USER_ID'];
                $password_db = $row_login['USER_PASSWORD'];
                $user_name = $row_login['USER_FIRSTNAME'];
                $user_role = $row_login['ROLE_ID'];

                if ($password == $password_db) {
                    $_SESSION['userid'] = $user_id;
                    $_SESSION['username'] = $user_name;
                    $_SESSION['usermail'] = $user_mail;


                    ######################################### Update History Table #####################################################################
                    $sql_history = "INSERT INTO `app_history`(`app_history`.`HISTORY_ID`, `app_history`.`ACTION_TYPE`, `app_history`.`USER_ID`, `app_history`.`USER_PASSWORD`, `app_history`.`RESPONSE`, `app_history`.`COMMENTS`, `app_history`.`CREATED_DATE`)
                            VALUES (NULL, 'LOGIN', '" . $user_id . "', '" . $password_history . "', 'Success', 'Logged in succesfully', NOW())";

                    echo '$sql_history=', $sql_history;

                    $result_history = mysql_query($sql_history);

                    ###################################################################################################################################

                    if ($mob) {

                        $concat_last_login = $usermail . $password;
                        $concat_md5_last_login = md5($concat_last_login);

                        $sql_update_last_app_login = "UPDATE `user`
                                                        SET `user`.`USER_LAST_APP_LOGIN` = '" . $concat_md5_last_login . "'
                                                        WHERE `user`.`USER_EMAIL` = '" . $usermail . "';";
//                        echo '$sql_update_last_app_login=',$sql_update_last_app_login;
                        $result_update_last_app_login = mysql_query($sql_update_last_app_login);

                        echo $concat_md5_last_login;
                    } else {
                        header("location:/Front/ViewUserTag.php");
                    }
                } else {

                    ######################################### Update History Table #####################################################################
                    $sql_history = "INSERT INTO `app_history`(`app_history`.`HISTORY_ID`, `app_history`.`ACTION_TYPE`, `app_history`.`USER_ID`, `app_history`.`USER_PASSWORD`, `app_history`.`RESPONSE`, `app_history`.`COMMENTS`, `app_history`.`CREATED_DATE`)
                            VALUES (NULL, 'LOGIN', '" . $user_id . "', '" . $password_history . "', 'Fail', 'Password Mismatch', NOW())";

                    echo '$sql_history=', $sql_history;

                    $result_history = mysql_query($sql_history);

                    ###################################################################################################################################

                    if ($mob) {
                        echo 'Fail';
                    } else {
                        echo 'Login UnSuccess';
                    }
                }
            } else {

                ######################################### Update History Table #####################################################################
                $sql_history = "INSERT INTO `app_history`(`app_history`.`HISTORY_ID`, `app_history`.`ACTION_TYPE`, `app_history`.`USER_ID`, `app_history`.`USER_PASSWORD`, `app_history`.`RESPONSE`, `app_history`.`COMMENTS`, `app_history`.`CREATED_DATE`)
                            VALUES (NULL, 'LOGIN', '" . $user_id . "', '" . $password_history . "', 'FAIL', 'No user with the mail ID " . $user_mail . " or multiple users with same ID', NOW())";

                echo '$sql_history=', $sql_history;

                $result_history = mysql_query($sql_history);

                ###################################################################################################################################

                if ($mob) {
                    echo 'Fail';
                }
            }
        }

        if ($register) {

            $firstname = isset($_POST['firstname']) ? $_POST['firstname'] : "";
            $lastname = isset($_POST['lastname']) ? $_POST['lastname'] : "";
            $nickname = isset($_POST['nickname']) ? $_POST['nickname'] : "";
            $emailsignup = isset($_POST['emailsignup']) ? $_POST['emailsignup'] : "";
            $passwordsignup = isset($_POST['passwordsignup']) ? $_POST['passwordsignup'] : "";
            $mobileno = isset($_POST['mobno']) ? $_POST['mobno'] : "";
            $phoneno = isset($_POST['phno']) ? $_POST['phno'] : "";
            $doorno = isset($_POST['doorno']) ? $_POST['doorno'] : "";
            $street = isset($_POST['street']) ? $_POST['street'] : "";
            $area = isset($_POST['area']) ? $_POST['area'] : "";
            $city = isset($_POST['city']) ? $_POST['city'] : "";
            $areacode = isset($_POST['areacode']) ? $_POST['areacode'] : "";
            $country = isset($_POST['country']) ? $_POST['country'] : "";
            $bdate = isset($_POST['birdate']) ? $_POST['birdate'] : "";
            $bmonth = isset($_POST['birmonth']) ? $_POST['birmonth'] : "";
            $byear = isset($_POST['biryear']) ? $_POST['biryear'] : "";

            $password_history = $passwordsignup;
            $passwordsignup = md5($passwordsignup);

            $sql_register = "INSERT INTO `user`(USER_ID,USER_FIRSTNAME,USER_SECONDNAME,USER_NICKNAME,USER_MOBILE,USER_PHONE,USER_EMAIL,USER_PASSWORD,USER_ADDRESS_NO,USER_ADDRESS_STREET,USER_ADDRESS_AREA,USER_ADDRESS_CITY,USER_ADDRESS_AREA_CODE,USER_ADDRESS_COUNTRY,USER_REGISTERED_DATE,USER_BIRTH_DATE,USER_BIRTH_MONTH,USER_BIRTH_YEAR)
                            VALUES (NULL,'" . $firstname . "','" . $lastname . "','" . $nickname . "','" . $mobileno . "','" . $phoneno . "','" . $emailsignup . "','" . $passwordsignup . "','" . $doorno . "','" . $street . "','" . $area . "','" . $city . "','" . $areacode . "','" . $country . "',CURDATE(),'" . $bdate . "','" . $bmonth . "','" . $byear . "')";

            $result_login = mysql_query($sql_register);
//            echo '$sql_register=', $sql_register;

            $last_insert_id = mysql_insert_id();

            if ($result_login) {

                ######################################### Update History Table #####################################################################
                $sql_history = "INSERT INTO `app_history`(`app_history`.`HISTORY_ID`, `app_history`.`ACTION_TYPE`, `app_history`.`USER_ID`, `app_history`.`USER_PASSWORD`, `app_history`.`RESPONSE`, `app_history`.`COMMENTS`, `app_history`.`CREATED_DATE`)
                            VALUES (NULL, 'REGISTER', '" . $last_insert_id . "', '" . $password_history . "', 'Success', 'Account Succesfully Created', NOW())";

//                echo '$sql_history=', $sql_history;

                $result_history = mysql_query($sql_history);

                ###################################################################################################################################

                if ($mob) {
                    echo "Success";
                }
            }
        }

        if ($auto_login) {
            $app_last_id = isset($_POST['applastid']) ? $_POST['applastid'] : "";

            $sql_app_last_id = "SELECT `user`.`USER_ID`
                                FROM `user`
                                WHERE `user`.`USER_LAST_APP_LOGIN` = '" . $app_last_id . "';";

            $result_app_last_id = mysql_query($sql_app_last_id);

            $count_app_last_id = mysql_num_rows($result_app_last_id);

            if ($count_app_last_id == 1) {

                ######################################### Update History Table #####################################################################
                $sql_history = "INSERT INTO `app_history`(`app_history`.`HISTORY_ID`, `app_history`.`ACTION_TYPE`, `app_history`.`USER_ID`, `app_history`.`USER_PASSWORD`, `app_history`.`RESPONSE`, `app_history`.`COMMENTS`, `app_history`.`CREATED_DATE`)
                            VALUES (NULL, 'AutoLogin', '', '" . $app_last_id . "', 'Success', 'Succesfully Logged In', NOW())";

//                echo '$sql_history=', $sql_history;

                $result_history = mysql_query($sql_history);

                ###################################################################################################################################

                echo 'Success';
            } else {

                ######################################### Update History Table #####################################################################
                $sql_history = "INSERT INTO `app_history`(`app_history`.`HISTORY_ID`, `app_history`.`ACTION_TYPE`, `app_history`.`USER_ID`, `app_history`.`USER_PASSWORD`, `app_history`.`RESPONSE`, `app_history`.`COMMENTS`, `app_history`.`CREATED_DATE`)
                            VALUES (NULL, 'AutoLogin', '', '" . $app_last_id . "', 'Fail', 'No Users With this auto login Id', NOW())";

//                echo '$sql_history=', $sql_history;

                $result_history = mysql_query($sql_history);

                ###################################################################################################################################

                echo 'Fail';
            }
        }
        ?>

    </body>
</html>