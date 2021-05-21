<?php
session_start();
if(isset($_SESSION['fuzzcoin_login'])){
	echo '<script> window.location.href="board/index.php"; </script>';
}
else{
	include 'login.htm';
}
?>

