<?php
//session_start();
$hostname = "localhost";
$username = "root";
$password = "";
$dbname = "simpletest";
//new connection
$dbc = mysqli_connect($hostname, $username, $password, $dbname) OR die("something wrong");
//check connection
if(mysqli_connect_errno($dbc))
{
    echo 'Failed to connect to database: '.mysqli_connect_error();
}
define('HOSTNAME','localhost');
define('DB_USERNAME','root');
define('DB_PASSWORD','');
define('DB_NAME', 'simpletest');

//global $con;
$con = mysqli_connect(HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_NAME) or die ("error");
// Check connection
if(mysqli_connect_errno($con))	echo "Failed to connect MySQL: " .mysqli_connect_error();
?>