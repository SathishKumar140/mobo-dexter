<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$tag_id = $_POST['p'] ? $_POST['p'] : "";
//echo '$tag_id=',$tag_id;
//$tag_id = 11;
//echo $tag_id;
if ($tag_id) {
//    echo 'data captured';
    $hostname = 'viewfind.clpupa6oe9nj.us-west-2.rds.amazonaws.com';
    $username = 'schmouli07';
    $password = 'schmouli07';
    $darabasename = 'vewfindTest';
    $con = mysql_connect($hostname, $username, $password) or die("Could not Connect");
    $selected = mysql_select_db($darabasename, $con) or die("Could not select examples");

    $sql_tag_det = "SELECT `tagMaster`.`TAG_ID`,
                    `tagMaster`.`TAG_NAME`,
                    `tagMaster`.`TAG_DESCRIPTION`,
                    `tagMaster`.`TAG_TYPE`,
                    `tagMaster`.`TAG_SUBTYPE`,
                    `tagMaster`.`TAG_CATEGORY`,
                    `tagMaster`.`TAG_SUBCATERGORY`,
                    `tagMaster`.`TAG_IMG_PATH`
                    FROM `tagMaster`
                    WHERE `tagMaster`.`TAG_ID` = '" . $tag_id . "';"; 

    $result_tag_det = mysql_query($sql_tag_det, $con) or die("could not select");
    $res = array();
    $count_tag_det = mysql_num_rows($result_tag_det);

    if ($count_tag_det > 0) {
        while ($row_tag_det = mysql_fetch_assoc($result_tag_det)) {

            $arr = array();

            $arr["TAG_ID"] = $row_tag_det['TAG_ID'];
            $arr["TAG_NAME"] = $row_tag_det['TAG_NAME'];
            $arr["TAG_DESCRIPTION"] = $row_tag_det['TAG_DESCRIPTION'];
            $arr["TAG_TYPE"] = $row_tag_det['TAG_TYPE'];
            $arr["TAG_SUBTYPE"] = $row_tag_det['TAG_SUBTYPE'];
            $arr["TAG_CATEGORY"] = $row_tag_det['TAG_CATEGORY'];
            $arr["TAG_SUBCATERGORY"] = $row_tag_det['TAG_SUBCATERGORY'];
            $arr["TAG_IMG_PATH"] = $row_tag_det['TAG_IMG_PATH'];
        }
        array_push($res, $arr);
    echo "{\"Real\":" . json_encode($res) . "}";
//        echo $tag_id;
    } else {
        echo 'Fail';
    }
}
?>