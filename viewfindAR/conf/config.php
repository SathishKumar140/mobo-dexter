<?php

//error_reporting(0);

//$mysql_host = 'localhost';
//$mysql_user = 'root';
//$mysql_password = 'admin';
//$mysql_database = 'vewfindTest';
//
//$con = mysql_connect($mysql_host, $mysql_user, $mysql_password) or die("Could not Connect");
//$selected = mysql_select_db($mysql_database, $con) or die("Could not select examples");


$hostname = 'localhost';
$username = 'root';
$password = 'root';
$darabasename = 'vewfindTest';
$con = mysql_connect($hostname, $username, $password) or die("Could not Connect");
$selected = mysql_select_db($darabasename, $con) or die("Could not select examples");

?>
