<?php include("board/db.php"); ?>
<?php
if (!isset($_GET['user_id']) || is_array($_GET['user_id'])) { 
	die('0'); 
}

if (!isset($_GET['user_tk']) || is_array($_GET['user_tk']) ) { 
	die('0'); 
}

# Let`s check user token
$user_id = mysqli_real_escape_string($conn, $_GET['user_id']);
$user_tk = mysqli_real_escape_string($conn, $_GET['user_tk']);
$query = "update users set point=point+1 WHERE id='".$user_id."' and pw='".$user_tk."'";
$result = mysqli_query($conn, $query);

# implement more here.......
if($result==1){
	die('1');
}
else{
	die('0');
}
?>

