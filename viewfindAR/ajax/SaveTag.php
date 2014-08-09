<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

error_reporting(0);
require_once '../conf/config.php';

//$user_phone_no = isset($_POST['phno']) ? $_POST['phno'] : "";
$tag_id = isset($_POST['tagid']) ? $_POST['tagid'] : "";
$mob = isset($_POST['mob']) ? $_POST['mob'] : "";
$user_mail = isset($_POST['mail']) ? $_POST['mail'] : "";
$user_id = isset($_POST['userid']) ? $_POST['userid'] : "";
//$tag_id = 1;
//$user_id = 1;
//$user_mail = 'gpradeep24@gmail.com';
//$flag_exist_tag = 0;


if ($mob) {
    $sql_user_id = "SELECT `user`.`USER_ID`
                    FROM `user`
                    WHERE `user`.`USER_EMAIL` = '" . $user_mail . "';";

    $result_user_id = mysql_query($sql_user_id);

    $count_user_id = mysql_num_rows($result_user_id);
    if ($count_user_id == 1) {
        $row_user_id = mysql_fetch_assoc($result_user_id);
        $user_id = $row_user_id['USER_ID'];
    }
}

$sql_existing_tag = "SELECT `save_tag`.`save_tag_id`
                    FROM `save_tag`
                    WHERE `save_tag`.`user_id` = " . $user_id . "
                    AND `save_tag`.`tag_id` = '" . $tag_id . "';";

$result_existing_tag = mysql_query($sql_existing_tag);

$count_existing_tag = mysql_num_rows($result_existing_tag);
if (!$count_existing_tag > 0) {
    $sql_save_tag = "INSERT INTO `save_tag` (`save_tag`.`save_tag_id`, `save_tag`.`tag_id`, `save_tag`.`user_id`, `save_tag`.`save_date`)
                    VALUES (NULL," . $tag_id . "," . $user_id . ",NOW())";

//    echo '$sql_create_tag=', $sql_save_tag;

    $result_create_tag = mysql_query($sql_save_tag);

    if ($result_create_tag) {
        ######################################### Update History Table #####################################################################
        $sql_history = "INSERT INTO `app_history`(`app_history`.`HISTORY_ID`, `app_history`.`ACTION_TYPE`, `app_history`.`USER_ID`, `app_history`.`TAG_ID`, `app_history`.`RESPONSE`, `app_history`.`COMMENTS`, `app_history`.`CREATED_DATE`)
                            VALUES (NULL, 'Save Tag', '" . $user_id . "', '" . $tag_id . "', 'Success', 'Tag succesfully saved by user', NOW())";

//        echo '$sql_history=', $sql_history;

        $result_history = mysql_query($sql_history);

        ###################################################################################################################################
    }

    if ($mob) {
        echo "Success";
    } else {
        echo 'Succesfully Saved The Tag';
    }
} else {

    ######################################### Update History Table #####################################################################
    $sql_history = "INSERT INTO `app_history`(`app_history`.`HISTORY_ID`, `app_history`.`ACTION_TYPE`, `app_history`.`USER_ID`, `app_history`.`TAG_ID`, `app_history`.`RESPONSE`, `app_history`.`COMMENTS`, `app_history`.`CREATED_DATE`)
                            VALUES (NULL, 'Save Tag', '" . $user_id . "', '" . $tag_id . "', 'Fail', 'Tag Already Saved By User', NOW())";

//    echo '$sql_history=', $sql_history;

    $result_history = mysql_query($sql_history);

    ###################################################################################################################################

    if ($mob) {
        echo 'Saved';
    } else {
        echo 'Tag is Already Saved';
    }
}
?>