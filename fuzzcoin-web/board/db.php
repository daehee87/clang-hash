<?php
$dbh="localhost"; 
$dbu="fuzzcoin";
$dbp="dlatlqlqjs";
$dbn="fuzzcoin";
$conn=mysqli_connect($dbh,$dbu,$dbp);
mysqli_select_db($conn, $dbn);
session_start();
?>

