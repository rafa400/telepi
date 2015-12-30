<?php
/*
UserCake Version: 2.0.2
http://usercake.com
*/

//Database Information
$db_host = "/home/rafa400/MEGA/Comunes/telepi/telepi/var/lib/telepi/telepi.db"; //Host address (most likely localhost)
$db_name = "telepi"; //Name of Database
//$db_user = "202"; //Name of database user
//$db_pass = "password"; //Password for database user
$db_table_prefix = "uc_";

GLOBAL $errors;
GLOBAL $successes;

$errors = array();
$successes = array();

/* Create a new mysqli object with database connection parameters */
//$mysqli = new mysqli($db_host, $db_user, $db_pass, $db_name);
class TelepiDB extends SQLite3
{
    function __construct()
    {
        $this->open($db_host);
    }
}
$sqlite=new TelepiDB();
GLOBAL $sqlite; // $mysqli

if(mysqli_connect_errno()) {
	echo "Connection Failed: " . mysqli_connect_errno();
	exit();
}

//Direct to install directory, if it exists
if(is_dir("install/"))
{
	header("Location: install/");
	die();

}

?>
