<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <title>Offers</title>
        <meta name="description" content="Simple, innovative and powerful tool for generating data-bound grid control, specially designed for web developers." />
        <meta name="author" content="ApPHP Company - Advanced Power of PHP">
            <meta name="generator" content="ApPHP DataGrid">
                </head>
                <body>
                    <?php
                    $tag_id = $_GET['tagid'] ? $_GET['tagid'] : "";
                    $bus_id = $_GET['usrid'] ? $_GET['usrid'] : "";
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
                    $sql = "SELECT `offer`.`offer_id`,
                            `offer`.`offer_name`,
                            `business`.`BUSINESS_NAME`,
                            `tagMaster`.`TAG_NAME`,
                            `offer`.`offer_type`,
                            `offer`.`offer_status`,
                            `offer`.`offer_start_datetime`,
                            `offer`.`offer_end_datetime`

                            FROM `offer`, `tagMaster`, `business`

                            WHERE `offer`.`tag_id` = `tagMaster`.`TAG_ID`
                            AND `offer`.`business_id` = `business`.`BUSINESS_ID`
                            AND `offer`.`tag_id` = ".$tag_id."
                            AND `offer`.`business_id` = ".$bus_id.";";

                    ##  *** set needed options
                    $debug_mode = TRUE;
                    $messaging = true;
                    $unique_prefix = "offer_";
                    $dgrid = new DataGrid($debug_mode, $messaging, $unique_prefix, DATAGRID_DIR);

                    ##  *** set data source with needed options
                    $default_order_field = "offer_id";
                    $default_order_type = "ASC";
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

                    $http_get_vars = array('tagid','usrid');
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
                        "Offer Name" => array("table" => "offer", "field" => "offer_name", "source" => "self", "operator" => true, "default_operator" => "like", "type" => "textbox", "case_sensitive" => true, "comparison_type" => "string"),
                    );
                    $dgrid->setFieldsFiltering($filtering_fields);

                    ##  *** set columns in view mode
                    $vm_columns = array(
                        "offer_id" => array("header" => "Offer Id", "type" => "label", "width" => "130px", "align" => "left",'visible'=>'true', "wrap" => "nowrap", "text_length" => "-1", "case" => "normal"),
                        "offer_name" => array("header" => "Offer Name", "type" => "linktoedit", "align" => "left", "width" => "130px", "wrap" => "nowrap", "text_length" => "-1", "case" => "normal", "summarize" => false, "on_js_event" => "","visible" => FALSE),
                        "BUSINESS_NAME" => array("header" => "Business Name", "type" => "label", "summarize" => false, "align" => "right", "wrap" => "nowrap", "text_length" => "-1", "case" => "normal"),
                        "TAG_NAME" => array("header" => "Tag Name", "type" => "label", "summarize" => false, "align" => "right", "wrap" => "nowrap", "text_length" => "-1", "case" => "normal"),
                        "offer_type" => array("header" => "Offer Type", "type" => "label", "align" => "left", "wrap" => "wrap", "text_length" => "30", "case" => "lower"),
                        "offer_status" => array("header" => "Offer Status", "type" => "label", "align" => "left", "wrap" => "wrap", "text_length" => "30", "case" => "lower"),
                        "offer_start_datetime" => array("header" => "Offer Start DateTime", "type" => "label", "align" => "left", "wrap" => "wrap", "text_length" => "30", "case" => "lower"),
                        "offer_end_datetime" => array("header" => "Offer End DateTime", "type" => "label", "align" => "left", "wrap" => "wrap", "text_length" => "30", "case" => "lower"),
                    );
                    $dgrid->setColumnsInViewMode($vm_columns);

                    ##  ***  set settings for add/edit/details modes
                    $table_name = "offer";
                    $primary_key = "offer_id";
                    $condition = "";
                    $dgrid->setTableEdit($table_name, $primary_key, $condition);
                    $em_columns = array(
//                        "offer_id" => array("header" => "Offer Id", "type" => "textbox", "width" => "210px", "req_type" => "rt", "title" => "Offer Id", "visible" => false),
                        "tag_id" => array("header" => "Tag Id", "type" => "textbox", "width" => "210px", "req_type" => "rt", "title" => "Tag Name", "readonly" => true, "default" => $tag_id, "visible" => "true"),
                        "business_id" => array("header" => "Business Id", "type" => "textbox", "width" => "210px", "req_type" => "rt", "title" => "Tag Name", "readonly" => true, "default" => $bus_id, "visible" => "true"),
                        "offer_name" => array("header" => "Offer Name", "type" => "textbox", "width" => "210px", "req_type" => "rt", "title" => "Offer Name"),
//                        "redeem_status" => array("header" => "Redeem Status", "type" => "textbox", "width" => "210px", "req_type" => "rt", "title" => "Redeem Status"),
                        "redeem_status" => array("header" => "Redeem Status", "type" => "enum", "source" => $fill_from_array, "view_type" => "dropdownlist", "width" => "139px", "req_type" => "ri", "title" => "Redeem Status"),
                        "offer_status" => array("header" => "Offer Status", "type" => "textbox", "width" => "210px", "req_type" => "rt", "title" => "Offer Status"),
                        "offer_type" => array("header" => "Offer Type", "type" => "textbox", "width" => "210px", "req_type" => "rt", "title" => "Offer Type"),
                        "offer_code" => array("header" => "Offer Code", "type" => "textbox", "width" => "210px", "req_type" => "rt", "title" => "Offer Code"),
                        "offer_start_datetime" => array("header" => "Offer Start DateTime", "type" => "date", "width" => "210px", "req_type" => "rt", "title" => "Start Age", "calendar_type"=>"floating"),
                        "offer_end_datetime" => array("header" => "Offer End DateTime", "type" => "date", "width" => "210px", "req_type" => "rt", "title" => "End Age", "calendar_type"=>"floating"),
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

