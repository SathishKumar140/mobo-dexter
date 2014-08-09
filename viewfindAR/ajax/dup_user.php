<?php

require_once '../conf/config.php';

$username = $_POST['email'];
//$username = 'Pradeep';

if ($username) {

    $sql_login = "SELECT `user`.`USER_PASSWORD`
                        FROM `user`
                        WHERE `user`.`USER_EMAIL` = '" . $username . "';";
    $result_login = mysql_query($sql_login);

    $count_login = mysql_num_rows($result_login);

    if ($count_login == 1) {
        echo 'Duplicate';
    }
} 
?>