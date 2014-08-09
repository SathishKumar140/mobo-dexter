<?php

error_reporting(0);
session_start();
//
require_once '../conf/config.php';
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$mob = isset($_POST['mob']) ? $_POST['mob'] : "";
$tagname = isset($_POST['pName']) ? $_POST['pName'] : "";
$tagdesc = isset($_POST['pDesc']) ? $_POST['pDesc'] : "";
$latlng = isset($_POST['latlng']) ? $_POST['latlng'] : "";
$subtagnme = isset($_POST['subtagnme']) ? $_POST['subtagnme'] : "";
$tagtype = isset($_POST['tagtype']) ? $_POST['tagtype'] : "";
$tagsubtype = isset($_POST['tagsubtype']) ? $_POST['tagsubtype'] : "";
$tagctgry = isset($_POST['tagctgry']) ? $_POST['tagctgry'] : "";
$tagsbctgry = isset($_POST['tagsbctgry']) ? $_POST['tagsbctgry'] : "";
$user_mail = isset($_POST['mailid']) ? $_POST['mailid'] : "";
$populate = isset($_POST['populate']) ? $_POST['populate'] : "";
$business_tag = isset($_POST['business']) ? $_POST['business'] : "business";

$user_id = isset($_POST['userid']) ? $_POST['userid'] : "";

////////////////////////////////////////////For Creating A New Tag////////////////////////////////////
//$user_id = 1;
if ($mob == 'mob') {
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

//Stip Brackets
//$tagname = 'TagG';
//$tagdesc = 'TagG';
//$latlng = "(12.891427,77.641971)";

if ($latlng) {
    $latlng = trim($latlng, '()');

    $lat_lng_array = explode(",", $latlng);

    $latitude = $lat_lng_array[0];
    $longtitude = $lat_lng_array[1];
}
if ($mob == 'mob') {
    $latitude = isset($_POST['lat']) ? $_POST['lat'] : "";
    $longtitude = isset($_POST['lng']) ? $_POST['lng'] : "";
}

//lat long plus 2
$latitude_plus2 = $latitude + 0.00002;
$longtitude_plus2 = $longtitude + 0.00002;

//lat long plus 2
$latitude_minus2 = $latitude - 0.00002;
$longtitude_minus2 = $longtitude - 0.00002;

if ($business_tag == 'business') {
    $sql_create_tag = "INSERT INTO `tagMaster` (`tagMaster`.`TAG_ID`, `tagMaster`.`TAG_NAME`, `tagMaster`.`TAG_DESCRIPTION`,`tagMaster`.`SUBTAG_NAME`,`tagMaster`.`TAG_TYPE`,`tagMaster`.`TAG_SUBTYPE`,`tagMaster`.`TAG_CATEGORY`,`tagMaster`.`TAG_SUBCATERGORY`,`tagMaster`.`STATUS`,`tagMaster`.`TAG_LATITUDE`, `tagMaster`.`TAG_LONGITUDE`, `tagMaster`.`TAG_LATPLUS2`, `tagMaster`.`TAG_LATMINUS2`, `tagMaster`.`TAG_LONGPLUS2`, `tagMaster`.`TAG_LONGMINUSS2`, `tagmaster`.`CREATED_BY_BUSNSS`, `tagmaster`.`CREATED_DATE_BUSNSS`)
                        VALUES (NULL, '" . $tagname . "','" . $tagdesc . "','" . $subtagnme . "','" . $tagtype . "','" . $tagsubtype . "','" . $tagctgry . "','" . $tagsbctgry . "','Created','" . $latitude . "','" . $longtitude . "','" . $latitude_plus2 . "','" . $latitude_minus2 . "','" . $longtitude_plus2 . "','" . $longtitude_minus2 . "','" . $user_id . "', DATE(NOW()))";

    $result_create_tag = mysql_query($sql_create_tag);

    if ($result_create_tag) {

        $last_insert_id = mysql_insert_id();

        ######################################### Update History Table #####################################################################
        $sql_history = "INSERT INTO `app_history`(`app_history`.`HISTORY_ID`, `app_history`.`USE_CASE`, `app_history`.`ACTION_TYPE`, `app_history`.`USER_ID`, `app_history`.`TAG_ID`, `app_history`.`RESPONSE`, `app_history`.`COMMENTS`, `app_history`.`CREATED_DATE`)
                            VALUES (NULL,'Business', 'Tag Create', '" . $user_id . "', '" . $last_insert_id . "', 'Success', 'Tag Succesfully Created', NOW())";

//        echo '$sql_history=', $sql_history;

        $result_history = mysql_query($sql_history);

        ###################################################################################################################################
    } else {
        ######################################### Update History Table #####################################################################
        $sql_history = "INSERT INTO `app_history`(`app_history`.`HISTORY_ID`, `app_history`.`USE_CASE`, `app_history`.`ACTION_TYPE`, `app_history`.`USER_ID`, `app_history`.`TAG_ID`, `app_history`.`RESPONSE`, `app_history`.`COMMENTS`, `app_history`.`CREATED_DATE`)
                            VALUES (NULL,'Business', 'Tag Create', '" . $user_id . "', '', 'Fail', 'Problem in creating Tag', NOW())";

//        echo '$sql_history=', $sql_history;

        $result_history = mysql_query($sql_history);

        ###################################################################################################################################
    }
} else {
    if ($tagname && $tagdesc) {

        $sql_create_tag = "INSERT INTO `tagMaster` (`tagMaster`.`TAG_ID`, `tagMaster`.`TAG_NAME`, `tagMaster`.`TAG_DESCRIPTION`,`tagMaster`.`SUBTAG_NAME`,`tagMaster`.`TAG_TYPE`,`tagMaster`.`TAG_SUBTYPE`,`tagMaster`.`TAG_CATEGORY`,`tagMaster`.`TAG_SUBCATERGORY`,`tagMaster`.`STATUS`,`tagMaster`.`TAG_LATITUDE`, `tagMaster`.`TAG_LONGITUDE`, `tagMaster`.`TAG_LATPLUS2`, `tagMaster`.`TAG_LATMINUS2`, `tagMaster`.`TAG_LONGPLUS2`, `tagMaster`.`TAG_LONGMINUSS2`, `tagMaster`.`CREATED_BY`, `tagMaster`.`CREATED_DATE`)
                        VALUES (NULL, '" . $tagname . "','" . $tagdesc . "','" . $subtagnme . "','" . $tagtype . "','" . $tagsubtype . "','" . $tagctgry . "','" . $tagsbctgry . "','Created','" . $latitude . "','" . $longtitude . "','" . $latitude_plus2 . "','" . $latitude_minus2 . "','" . $longtitude_plus2 . "','" . $longtitude_minus2 . "','" . $user_id . "', DATE(NOW()))";

        $result_create_tag = mysql_query($sql_create_tag);

        if ($result_create_tag) {

            $last_insert_id = mysql_insert_id();

            ######################################### Update History Table #####################################################################
            $sql_history = "INSERT INTO `app_history`(`app_history`.`HISTORY_ID`, `app_history`.`USE_CASE`, `app_history`.`ACTION_TYPE`, `app_history`.`USER_ID`, `app_history`.`TAG_ID`, `app_history`.`RESPONSE`, `app_history`.`COMMENTS`, `app_history`.`CREATED_DATE`)
                            VALUES (NULL,'User', 'Tag Create', '" . $user_id . "', '" . $last_insert_id . "', 'Success', 'Tag Succesfully Created', NOW())";

//        echo '$sql_history=', $sql_history;

            $result_history = mysql_query($sql_history);

            ###################################################################################################################################
        } else {
            ######################################### Update History Table #####################################################################
            $sql_history = "INSERT INTO `app_history`(`app_history`.`HISTORY_ID`, `app_history`.`USE_CASE`, `app_history`.`ACTION_TYPE`, `app_history`.`USER_ID`, `app_history`.`TAG_ID`, `app_history`.`RESPONSE`, `app_history`.`COMMENTS`, `app_history`.`CREATED_DATE`)
                            VALUES (NULL,'User', 'Tag Create', '" . $user_id . "', '', 'Fail', 'Problem in creating Tag', NOW())";

//        echo '$sql_history=', $sql_history;

            $result_history = mysql_query($sql_history);

            ###################################################################################################################################
        }
    }
}


//echo 'mysql_insert_id=',mysql_insert_id();;
//if ($_FILES["file"]["error"] > 0) { 
//    echo "Error: " . $_FILES["file"]["error"] . "<br>";
//} else {
//    echo "Upload: " . $_FILES["file"]["name"] . "<br>";
//    echo "Type: " . $_FILES["file"]["type"] . "<br>";
//    echo "Size: " . ($_FILES["file"]["size"] / 1024) . " kB<br>";
//    echo "Stored in: " . $_FILES["file"]["tmp_name"];
//}
//$count = 0;

$file_name = array();
$file_type = array();
$file_tmp_name = array();
$file_error = array();
$file_size = array();
$reset = 0;
$target_path = "../images/";

foreach ($_FILES as $file_property_id => $file_property_arry) {
    foreach ($file_property_arry as $file_index_id => $file_index_array) {
        foreach ($file_index_array as $file_value_index => $file_value) {
            if ($reset == 0) {
                array_push($file_name, $file_value);
            } elseif ($reset == 1) {
                array_push($file_type, $file_value);
            } elseif ($reset == 2) {
                array_push($file_tmp_name, $file_value);
            } elseif ($reset == 3) {
                array_push($file_error, $file_value);
            } elseif ($reset == 4) {
                array_push($file_size, $file_value);
            }
            $file_value1 = $file_value1 . $file_value;
        }
        $reset = $reset + 1;
    }
    $reset = 0;
}

//echo '$count=', $file_value1;
//echo $file_name[0],$file_type[0],$file_tmp_name[0],$file_error[0],$file_size[0];

$no_of_files = count($file_name);
//echo '$no_of_files=', $no_of_files;

for ($i = 0; $i < $no_of_files; $i++) {
    $temp = explode(".", $file_name[$i]);
    $extension = end($temp);

    if (file_exists($target_path . $file_name[$i])) {
        echo $file_name[$i] . " already exists. ";
    } else {
        if (move_uploaded_file($file_tmp_name[$i], $target_path . $file_name[$i])) {
            echo "Stored in: " . $target_path . $file_name[$i];
        } else {
            echo 'Fail';
        }
    }
} 


    
//$countarray = count($_FILES['file']['name']);
//$countarray = $countarray + count($_FILES['file']['name']);
//$countarray = $countarray + count($_FILES['file2']['name']);
//echo '$countarray=',$countarray;
//$newarray = array();
//for ($i = 0; $i < $countarray; $i++) { 
//    $newarray[$i]['name'] = $_FILES['file']['name'][$i];
//    $newarray[$i]['type'] = $_FILES['file']['type'][$i];
//    $newarray[$i]['tmp_name'] = $_FILES['file']['tmp_name'][$i];
//    $newarray[$i]['error'] = $_FILES['file']['error'][$i];
//    $newarray[$i]['size'] = $_FILES['file']['size'][$i];
//    echo $i;
//}
//
//echo $countarray;