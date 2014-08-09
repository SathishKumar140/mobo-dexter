<?php

$hostname = 'localhost';
$username = 'root';
$password = 'root';
$databasename = 'vewfindTest';
$con = mysql_connect($hostname, $username, $password) or die("Could not Connect");
$selected = mysql_select_db($databasename, $con) or die("Could not select examples");

?>
