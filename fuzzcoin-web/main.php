<?php include("db.php"); ?>

<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Fuzzcoin Framework</title>
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />


<!--===============================================================================================-->
<!--	<link rel="stylesheet" type="text/css" href="mytable/vendor/bootstrap/css/bootstrap.min.css"> -->
<!--===============================================================================================-->
<!--	<link rel="stylesheet" type="text/css" href="mytable/fonts/font-awesome-4.7.0/css/font-awesome.min.css"> -->
<!--===============================================================================================-->
<!--	<link rel="stylesheet" type="text/css" href="mytable/vendor/animate/animate.css"> -->
<!--===============================================================================================-->
<!--	<link rel="stylesheet" type="text/css" href="mytable/vendor/select2/select2.min.css"> -->
<!--===============================================================================================-->
<!--	<link rel="stylesheet" type="text/css" href="mytable/vendor/perfect-scrollbar/perfect-scrollbar.css"> -->
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="mytable/css/util.css">
	<link rel="stylesheet" type="text/css" href="mytable/css/main.css">
<!--===============================================================================================-->



		<script src="js/modernizr.custom.js"></script>
	</head>
	<body>
		<div class="container">
			<ul id="gn-menu" class="gn-menu-main">
				<li class="gn-trigger">
					<a class="gn-icon gn-icon-menu"><span>Menu</span></a>
					<nav class="gn-menu-wrapper">
						<div class="gn-scroller">
							<ul class="gn-menu">
								<li><a href="./main.php?p=setting" class="gn-icon gn-icon-cog">Settings</a></li>
								<li><a class="gn-icon gn-icon-help">Help</a></li>
								<li><a class="gn-icon gn-icon-archive">My Projects</a></li>
							</ul>
						</div><!-- /gn-scroller -->
					</nav>
				</li>
				<li><a href="http://pwnable.kr/fuzzcoin">FuzzCoin</a></li>
				<li><a class="codrops-icon"><span>Welcome 				
				<?php
				if(isset($_SESSION['fuzzcoin_login'])){
					$sql = "select * from users where id='".$_SESSION['fuzzcoin_login']."'";
					$row = mysqli_fetch_array(mysqli_query($conn, $sql));
					echo $row['name'];
				}
				else{
					echo '<script>windows.location="index.php"</script>';
				}
				?>
				</span></a></li>
				<li><a class="codrops-icon"><span>	
				<?php
				if(isset($_SESSION['fuzzcoin_login'])){
					$sql = "select * from users where id='".$_SESSION['fuzzcoin_login']."'";
					$row = mysqli_fetch_array(mysqli_query($conn, $sql));
					echo "Current Balance: [".$row['point']."] FC";
				}
				else{
					echo '<script>windows.location="index.php"</script>';
				}
				?>
				</span></a></li>
				<li><a class="codrops-icon" href="lib.php?cmd=logout"><span>Sign Out</span></a></li>
			</ul>
			<header>

                        <?php
			$page = $_GET['p'];
			if($page == "setting"){
				$sql = "select pw from users where id='".$_SESSION['fuzzcoin_login']."'";
				$res = mysqli_query($conn, $sql) or die("error. tell admin");
				if($row = mysqli_fetch_array($res)){
					$token = $row['pw'];
					echo "your token : ".$token;
				}
				else{
					echo "your information is broken. tell admin";
				}
			}
			else{
				?>
			
				<h1>Full List of FuzzCoin Projects<span>You must get ENROLLED to a project before running their fuzzer!</span></h1><br>

			<div class="wrap-table50">
				<div class="table50">
					<table align=left style="width: 800px;">
						<thead>
							<tr class="table50-head">
								<th class="column1">Project Name</th>
								<th class="column2">Maintaner</th>
								<th class="column3">Total Users</th>
							</tr>
						</thead>
						<tbody>
			<?php
				$sql = "select uid, mid, left(name,16) as name from projects order by name";
				$res = mysqli_query($conn, $sql) or die("error. tell admin");

				while($row = mysqli_fetch_array($res)){
					echo "<tr align=center>";
					echo "<td class='column1'>".$row['name']."</td>";
					echo "<td class='column2'>".$row['mid']."</td>";
					echo "<td class='column3'>1337</td>";
					echo "</tr>";
				}
			}
                        ?>
						</tbody>
					</table>
				</div>
			</div>
		</header>

		</div><!-- /container -->
		<script src="js/classie.js"></script>
		<script src="js/gnmenu.js"></script>
		<script>
			new gnMenu( document.getElementById( 'gn-menu' ) );
		</script>
	</body>
</html>
