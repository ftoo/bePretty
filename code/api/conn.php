<?php

$servername = "localhost";
$username = "codeninj_ftoo";
$password = "F@1thtoo1992";
$dbname="codeninj_bePretty";

// Create connection
$conn = mysqli_connect($servername, $username, $password,$dbname);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysql_error());
} 

 