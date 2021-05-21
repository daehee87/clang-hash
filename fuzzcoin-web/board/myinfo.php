<?php include("db.php"); ?>
<?php
	if(!get_magic_quotes_gpc()){
	foreach($_GET as $num => $val){$_GET[$num]=mysqli_real_escape_string($conn, $val);}
	foreach($_POST as $num => $val){$_POST[$num]=mysqli_real_escape_string($conn, $val);}
	foreach($_COOKIE as $num => $val){$_COOKIE[$num]=mysqli_real_escape_string($conn, $val);}
	foreach($_FILES as $num => $val){$_FILES[$num]['name']=mysqli_real_escape_string($conn, $val['name']);} 
	}
	function err($msg){ die("<script>alert('".$msg."'); window.location.href='index.php';</script>"); }

	$title = '';		// project name
	$desc = '';			// project description
	$fuzzer = '';		// fuzzer download URL
	$server = '';		// Master server URL
	$time = '';			// project creation time
	$cov_pay = '';		// reward for coverage discovery
	$crash_pay = '';	// reward for crash discovery
	$hash_pay = '';		// reward for hash discovery
	$mid = '';			// maintainer ID

	$sql = "select * from users where id='".$_SESSION['fuzzcoin_login']."'";
	$res = mysqli_query($conn, $sql) or die("error. tell admin");
	if($row = mysqli_fetch_array($res)){
		$id = $row['id'];
		$token = $row['pw'];
		$type = $row['type'];
		$name = $row['name'];
		$email = $row['email'];
		$point = $row['point'];
		$time = $row['time'];
		$n_hash = $row['n_hash'];
		$n_crash = $row['n_crash'];
		$n_cov = $row['n_cov'];
	}
	else{
		err("User doesn't exist");
	}

?>

<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>FuzzCoin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/png" href="assets/images/icon/favicon.ico">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/metisMenu.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/slicknav.min.css">
    <!-- amchart css -->
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <!-- others css -->
    <link rel="stylesheet" href="assets/css/typography.css">
    <link rel="stylesheet" href="assets/css/default-css.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
    <!-- modernizr css -->
    <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
    <!-- preloader area start -->
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <!-- preloader area end -->
    <!-- page container area start -->
    <div class="page-container">
        <!-- sidebar menu area start -->
        <div class="sidebar-menu">
            <div class="sidebar-header">
                <div class="logo">
                    <a href="index.php"><img src="assets/images/icon/logo.png" alt="logo"></a>
                </div>
            </div>
            <div class="main-menu">
                <div class="menu-inner">
                    <nav>
                        <ul class="metismenu" id="menu">
                            <li class="active">
                                <a href="javascript:void(0)" aria-expanded="true"><i class="ti-dashboard"></i><span>Dashboard</span></a>
                                <ul class="collapse">
                                    <li><a href="index.php">Project List</a></li>
                                    <li class="active"><a href="myinfo.php">My Information</a></li>
									<li><a href="genproject.php">Create Project</a></li>
                                    <li><a href="help.html">About Fuzzcoin</a></li>
                                </ul>
                            </li>
                            <li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <!-- sidebar menu area end -->
        <!-- main content area start -->
        <div class="main-content">
            <!-- header area start -->
            <div class="header-area">
                <div class="row align-items-center">
                    <!-- nav and search button -->
                    <div class="col-md-6 col-sm-8 clearfix">
                        <div class="nav-btn pull-left">
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                        <div class="search-box pull-left">
                            <form action="#">
                                <input type="text" name="search" placeholder="Search..." required>
                                <i class="ti-search"></i>
                            </form>
                        </div>
                    </div>
                    <!-- profile info & task notification -->
                   <div class="col-sm-6 clearfix">
                        <div class="user-profile pull-right">
                            <img class="avatar user-thumb" src="assets/images/author/avatar.png" alt="avatar">

				<?php
				if(isset($_SESSION['fuzzcoin_login'])){
					$sql = "select * from users where id='".$_SESSION['fuzzcoin_login']."'";
					$row = mysqli_fetch_array(mysqli_query($conn, $sql));
					$name = $row['name'];
					$balance = $row['point'];
					$token = $row['pw'];
				}
				else{
					echo '<script>window.location.href="../index.php"</script>';
				}
				?>
                            <h4 class="user-name dropdown-toggle" data-toggle="dropdown"><?php echo $name." (".$balance." Coin)"; ?> <i class="fa fa-angle-down"></i></h4>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Settings</a>
                                <a class="dropdown-item" href="lib.php?cmd=logout">Log Out</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- header area end -->
            <!-- page title area end -->
            <div class="main-content-inner">
                <div class="row">
                    <div class="col-lg-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <div class="invoice-area">
                                    <div class="invoice-head">
                                        <div class="row">
                                            <div class="iv-left col-6">
                                                <span>My Information</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row align-items-center">
                                        <div class="col-md-6">
                                            <div class="invoice-address">
                                                <h6>Your Name: <?php echo $name; ?></h6>
												<hr>
                                                <p>Your Token: <font color=red><?php echo $token;?></font> (required to run fuzzer)</p>
                                                <p>Joined Since: <?php echo $time;?></p>
                                                <p>Email: <?php echo $email;?></p>
                                                <p>Coins: <?php echo $point;?></p>
                                                <p>Total# of Discovered Crashes: <?php echo $n_crash;?></p>
                                                <p>Total# of Discovered Code Coverages: <?php echo $n_cov;?></p>
                                                <p>Total# of Reported PoFW: <?php echo $n_hash;?></p>   
												<hr>
                                            </div>
                                        </div>

                                    </div>
  
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- main content area end -->
        <!-- footer area start-->
        <footer>
            <div class="footer-area">
                <p>© Copyright 2019. All right reserved. Template by <a href="https://colorlib.com/wp/">Colorlib</a>.</p>
            </div>
        </footer>
        <!-- footer area end-->
    </div>
    <!-- page container area end -->
    <!-- offset area start -->

         
 
    <!-- offset area end -->
    <!-- jquery latest version -->
    <script src="assets/js/vendor/jquery-2.2.4.min.js"></script>
    <!-- bootstrap 4 js -->
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/metisMenu.min.js"></script>
    <script src="assets/js/jquery.slimscroll.min.js"></script>
    <script src="assets/js/jquery.slicknav.min.js"></script>

    <!-- start chart js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
    <!-- start highcharts js -->
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <!-- start zingchart js -->
    <script src="https://cdn.zingchart.com/zingchart.min.js"></script>
    <script>
    zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "ee6b7db5b51705a13dc2339db3edaf6d"];
    </script>
    <!-- all line chart activation -->
    <script src="assets/js/line-chart.js"></script>
    <!-- all pie chart -->
    <script src="assets/js/pie-chart.js"></script>
    <!-- others plugins -->
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/scripts.js"></script>
</body>

</html>

