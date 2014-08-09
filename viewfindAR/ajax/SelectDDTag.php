<?php

error_reporting(0);
session_start();
//
require_once '../conf/config.php';

$changetagtype = isset($_POST['DDtype']) ? $_POST['DDtype'] : "";
$tagtype = isset($_POST['tag_type']) ? $_POST['tag_type'] : "";


############################# When Change in tag type##########################################################################################
if ($changetagtype == 'Changetagtype') {
    
    $sql_tag_type = "SELECT `mdefalut_val`.`DEF_ID`,
                `mdefalut_val`.`DEF_VAL`,
                `mdefalut_val`.`DEF_VAL_DISP`
                FROM `mdefalut_val`
                WHERE `mdefalut_val`.`DEF_TYPE` = 'TagSubType'
                AND `mdefalut_val`.`DEF_SUB_TYPE` = '" . $tagtype . "';";
}
##################################################################################################################################################


############################# When Change in tag Sub type##########################################################################################
if ($changetagtype == 'Changecategory') {
    
    $sql_tag_type = "SELECT `mdefalut_val`.`DEF_ID`,
                `mdefalut_val`.`DEF_VAL`,
                `mdefalut_val`.`DEF_VAL_DISP`
                FROM `mdefalut_val`
                WHERE `mdefalut_val`.`DEF_TYPE` = 'TagSubCategory'
                AND `mdefalut_val`.`DEF_SUB_TYPE` = '" . $tagtype . "';"; //tagtypr will be containing category value here for reusabilty of variable named as tagtype
}
##################################################################################################################################################

$result_tag_type = mysql_query($sql_tag_type);
$count_tag_type = mysql_num_rows($result_tag_type);
if ($count_tag_type > 0) {
    $tag_type = array();

//    $tag_type_select = '<select id="tagsubtype" class="save-subtagtype>';
    $tag_type_select = $tag_type_select . '<option value="">Select...</option>';
    while ($row_tag_type = mysql_fetch_array($result_tag_type)) {
        $tag_type_array['DEF_ID'] = $row_tag_type['DEF_ID'];
        $tag_type_array['DEF_VAL'] = $row_tag_type['DEF_VAL'];
        $tag_type_array['DEF_VAL_DISP'] = $row_tag_type['DEF_VAL_DISP'];

        //                array_push($tag_type, $tag_type_array);

        $tag_type_select = $tag_type_select . '<option value="' . $tag_type_array['DEF_VAL'] . '">';
        $tag_type_select = $tag_type_select . $tag_type_array['DEF_VAL_DISP'];
        $tag_type_select = $tag_type_select . '</option>';
    }
//    $tag_type_select = $tag_type_select . '</select>';
}

echo $tag_type_select;
?>
