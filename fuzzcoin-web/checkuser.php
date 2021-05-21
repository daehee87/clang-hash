<?php include("board/db.php"); ?>
<?php
if (!isset($_GET['user_id']) || is_array($_GET['user_id']) ) { 
	die('0'); 
}

if (!isset($_GET['user_tk']) || is_array($_GET['user_tk']) ) { 
	die('0'); 
}
# Let`s check user token
$user_id = mysqli_real_escape_string($conn, $_GET['user_id']);
$user_tk = mysqli_real_escape_string($conn, $_GET['user_tk']);
$query = "SELECT pw FROM users WHERE id='".$user_id."'";
$result = mysqli_query($conn, $query);
$row = mysqli_fetch_array($result);
if ($row['pw']!=$user_tk) { 
	die('0'); 
}
die('1');
?>

