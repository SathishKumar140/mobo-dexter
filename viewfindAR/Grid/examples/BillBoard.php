<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <title>Bill Board</title>
        <meta name="description" content="Simple, innovative and powerful tool for generating data-bound grid control, specially designed for web developers." />
        <meta name="author" content="ApPHP Company - Advanced Power of PHP">
            <meta name="generator" content="ApPHP DataGrid">
                </head>
                <body>
                    <?php
                    $tag_id = $_GET['tagid'] ? $_GET['tagid'] : "";
//                    $tag_id = 21;
                    ##  *** only relative (virtual) path (to the current document)
                    define("DATAGRID_DIR", "../");
                    define("PEAR_DIR", "../pear/");

                    require_once(DATAGRID_DIR . 'datagrid.class.php');
                    require_once(PEAR_DIR . 'PEAR.php');
                    require_once(PEAR_DIR . 'DB.php');

                    ##  *** creating variables that we need for database connection 
                    include_once('install/config.inc.php');

                    $db_conn = DB::factory('mysql');
                    $db_conn->connect(DB::parseDSN('mysql://' . $DB_USER . ':' . $DB_PASS . '@' . $DB_HOST . '/' . $DB_NAME));

                    ##  *** put a primary key on the first place 
                    $sql = "SELECT `bill_board`.`BILLBOARD_ID`,
                            `tagMaster`.`TAG_NAME`,
                            `bill_board`.`BILL_BOARD_NAME`,
                            `bill_board`.`AREA`,
                            `bill_board`.`CITY`,
                            `bill_board`.`COUNTRY`,
                            `bill_board`.`GENDER`,
                            `bill_board`.`AGE_START`,
                            `bill_board`.`AGE_END`,
                            `bill_board`.`VIDEO_URL`
                            FROM `bill_board`, `tagMaster`
                            WHERE `tagMaster`.`TAG_ID` = `bill_board`.`TAG_ID`
                            AND `tagMaster`.`TAG_ID` = " . $tag_id . ";";

                    ##  *** set needed options
                    $debug_mode = TRUE;
                    $messaging = true;
                    $unique_prefix = "billboard_";
                    $dgrid = new DataGrid($debug_mode, $messaging, $unique_prefix, DATAGRID_DIR);

                    ##  *** set data source with needed options
                    $default_order_field = "BILLBOARD_ID";
                    $default_order_type = "DESC";
                    $dgrid->dataSource($db_conn, $sql, $default_order_field, $default_order_type);

                    $modes = array(
                        'add' => array('view' => true, 'edit' => false, 'type' => 'link', 'show_button' => true, 'show_add_button' => 'inside|outside'),
                        'edit' => array('view' => true, 'edit' => true, 'type' => 'link', 'show_button' => true, 'byFieldValue' => ''),
                        'details' => array('view' => false, 'edit' => false, 'type' => 'link', 'show_button' => true),
                        'delete' => array('view' => false, 'edit' => true, 'type' => 'image', 'show_button' => true)
                    );
                    $dgrid->SetModes($modes);

                    ##  *** allow mulirow operations
                    $multirow_option = false;
                    $dgrid->allowMultirowOperations($multirow_option);
                    $multirow_operations = array(
                        "delete" => array("view" => FALSE),
                        "details" => array("view" => FALSE)
                    );
                    $dgrid->setMultirowOperations($multirow_operations);

                    $css_class = 'default';
                    $dgrid->SetCssClass($css_class);

                    $http_get_vars = array('tagid');
                    $dgrid->SetHttpGetVars($http_get_vars);

                    ##  *** set other datagrid/s unique prefixes (if you use few datagrids on one page)
                    $anotherDatagrids = array("fp_" => array("view" => false, "edit" => true, "details" => true));
                    $dgrid->setAnotherDatagrids($anotherDatagrids);
                    ##  *** set DataGrid caption
                    $dgrid->setCaption('Bill Board');
                    ##  *** set filtering option: true or false(default)
                    $dgrid->allowFiltering(true);

                    ##  *** set aditional filtering settings
                    $fill_from_array = array("1" => "AND", "0" => "OR");
                    $filtering_fields = array(
                        "Name" => array("table" => "bill_board", "field" => "BILL_BOARD_NAME", "source" => "self", "operator" => true, "default_operator" => "like", "type" => "textbox", "case_sensitive" => true, "comparison_type" => "string"),
                    );
                    $dgrid->setFieldsFiltering($filtering_fields);

                    ##  *** set columns in view mode
                    $vm_columns = array(
                        "BILLBOARD_ID" => array("header" => "Bill Board Id", "type" => "label", "width" => "130px", "align" => "left",'visible'=>'true', "wrap" => "nowrap", "text_length" => "-1", "case" => "normal"),
                        "TAG_NAME" => array("header" => "Tag Name", "type" => "linktoedit", "align" => "left", "width" => "130px", "wrap" => "nowrap", "text_length" => "-1", "case" => "normal", "summarize" => false, "on_js_event" => "","visible" => FALSE),
                        "BILL_BOARD_NAME" => array("header" => "Name", "type" => "label", "summarize" => false, "align" => "right", "wrap" => "nowrap", "text_length" => "-1", "case" => "normal"),
                        "AREA" => array("header" => "Area", "type" => "label", "summarize" => false, "align" => "right", "wrap" => "nowrap", "text_length" => "-1", "case" => "normal"),
                        "CITY" => array("header" => "City", "type" => "label", "align" => "left", "wrap" => "wrap", "text_length" => "30", "case" => "lower"),
                        "COUNTRY" => array("header" => "Country", "type" => "label", "align" => "left", "wrap" => "wrap", "text_length" => "30", "case" => "lower"),
                        "GENDER" => array("header" => "Gender", "type" => "label", "align" => "left", "wrap" => "wrap", "text_length" => "30", "case" => "lower"),
                        "AGE_START" => array("header" => "Start Age", "type" => "label", "align" => "left", "wrap" => "wrap", "text_length" => "30", "case" => "lower"),
                        "AGE_END" => array("header" => "End Age", "type" => "label", "align" => "left", "wrap" => "wrap", "text_length" => "30", "case" => "lower"),
                        "VIDEO_URL" => array("header" => "Video", "type" => "label", "align" => "left", "wrap" => "wrap", "text_length" => "30", "case" => "lower"),
//                        "VIDEO_URL" => array("header" => "Video", "type" => "image", "align" => "center", "width" => "", "wrap" => "nowrap", "text_length" => "-1", "case" => "normal", "summarize" => false, "on_js_event" => "", "target_path" => "uploads/", "default" => "", "image_width" => "17px", "image_height" => "17px"),
                    );
                    $dgrid->setColumnsInViewMode($vm_columns);

                    ##  ***  set settings for add/edit/details modes
                    $table_name = "bill_board";
                    $primary_key = "BILLBOARD_ID";
                    $condition = "";
                    $dgrid->setTableEdit($table_name, $primary_key, $condition);
                    $em_columns = array(
//                        "BILLBOARD_ID" => array("header" => "Bill Board ID", "type" => "textbox", "width" => "210px", "req_type" => "rt", "title" => "Bill Board ID", "visible" => false),
                        "TAG_ID" => array("header" => "Tag Name", "type" => "textbox", "width" => "210px", "req_type" => "rt", "title" => "Tag Name", "readonly" => true, "default" => $tag_id, "visible" => "true"),
                        "BILL_BOARD_NAME" => array("header" => "Bill Board Name", "type" => "textbox", "width" => "210px", "req_type" => "rt", "title" => "Bill Board Name"),
                        "AREA" => array("header" => "Area", "type" => "textbox", "width" => "210px", "req_type" => "rt", "title" => "Area"),
                        "OP_AREA_CITY" => array("header" => "Area TO City", "type" => "enum", "source" => $fill_from_array, "view_type" => "dropdownlist", "width" => "139px", "req_type" => "ri", "title" => "Population (Peoples)"),
                        "CITY" => array("header" => "City", "type" => "textbox", "width" => "210px", "req_type" => "rt", "title" => "City"),
                        "OP_CITY_COUNTRY" => array("header" => "City To Country", "type" => "enum", "source" => $fill_from_array, "view_type" => "dropdownlist", "width" => "139px", "req_type" => "ri", "title" => "Population (Peoples)"),
                        "COUNTRY" => array("header" => "Country", "type" => "textbox", "width" => "210px", "req_type" => "rt", "title" => "Country"),
                        "OP_COUNTRY_GENDER" => array("header" => "Country To Gender", "type" => "enum", "source" => $fill_from_array, "view_type" => "dropdownlist", "width" => "139px", "req_type" => "ri", "title" => "Population (Peoples)"),
                        "GENDER" => array("header" => "Gender", "type" => "textbox", "width" => "210px", "req_type" => "rt", "title" => "Gender"),
                        "OP_GENDER_AGE" => array("header" => "Gender To Age", "type" => "enum", "source" => $fill_from_array, "view_type" => "dropdownlist", "width" => "139px", "req_type" => "ri", "title" => "Population (Peoples)"),
                        "AGE_START" => array("header" => "Start Age", "type" => "textbox", "width" => "210px", "req_type" => "rt", "title" => "Start Age"),
                        "AGE_END" => array("header" => "End Age", "type" => "textbox", "width" => "210px", "req_type" => "rt", "title" => "End Age"),
                        "VIDEO_URL" => array("header" => "Video", "type" => "image", "req_type" => "st", "width" => "210px", "title" => "Video", "readonly" => false, "maxlength" => "-1", "default" => "", "unique" => false, "unique_condition" => "", "on_js_event" => "", "target_path" => "BillBoardVideos/", "max_file_size" => "90000K", "image_width" => "100px", "image_height" => "100px", "file_name" => "", "host" => "local"),
                    );
                    $dgrid->setColumnsInEditMode($em_columns);
 
//                    ##  *** set foreign keys for add/edit/details modes (if there are linked tables)
//                    $foreign_keys = array(
//                        "TAG_ID" => array("table" => "tagMaster", "field_key" => "TAG_ID", "field_name" => "TAG_NAME", "view_type" => "textbox")
//                    );
//                    $dgrid->setForeignKeysEdit($foreign_keys);
                    ##  *** bind the DataGrid and draw it on the screen
                    $dgrid->bind();
                    ?>

