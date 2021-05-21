<?php include("db.php"); ?>
<?php
	if(!get_magic_quotes_gpc()){
	foreach($_GET as $num => $val){$_GET[$num]=mysqli_real_escape_string($conn, $val);}
	foreach($_POST as $num => $val){$_POST[$num]=mysqli_real_escape_string($conn, $val);}
	foreach($_COOKIE as $num => $val){$_COOKIE[$num]=mysqli_real_escape_string($conn, $val);}
	foreach($_FILES as $num => $val){$_FILES[$num]['name']=mysqli_real_escape_string($conn, $val['name']);} 
	}
	function err($msg){ die("<script>alert('".$msg."'); window.location.href='index.php';</script>"); }

	$uid = $_GET['no'];
	if(is_numeric($uid)!=True){
		err("invalid parameter");
	}

	$title = '';		// project name
	$desc = '';			// project description
	$fuzzer = '';		// fuzzer download URL
	$server = '';		// Master server URL
	$time = '';			// project creation time
	$cov_pay = '';		// reward for coverage discovery
	$crash_pay = '';	// reward for crash discovery
	$hash_pay = '';		// reward for hash discovery
	$mid = '';			// maintainer ID

	$sql = "select * from projects where uid=".$uid;
	$res = mysqli_query($conn, $sql) or die("error1. tell admin");
	if($row = mysqli_fetch_array($res)){
		$mid = $row['mid'];
		$title = $row['name'];
		$fuzzer = $row['fuzzer'];
		$server = $row['server'];
		$time = $row['time'];
		$desc = $row['description'];
		$cov_pay = $row['cov_pay'];
		$crash_pay = $row['crash_pay'];
		$hash_pay = $row['hash_pay'];
	}
	else{
		err("project doesn't exist");
	}

	// get maintainer name
	$sql = "select name from users where id='".$mid."'";
	$res2 = mysqli_query($conn, $sql) or die("error2. tell admin");
	if($row2 = mysqli_fetch_array($res2)){
		$maintainer = $row2['name'];
	}
	else{
		err("maintainer doesn't exist");
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
                                    <li class="active"><a href="index.php">Project List</a></li>
                                    <li><a href="myinfo.php">My Information</a></li>
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
                                                <span>Project Description Page</span>
                                            </div>
                                            <div class="iv-right col-6 text-md-right">
                                                <span>PROJECT #<?php echo $uid; ?></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row align-items-center">
                                        <div class="col-md-6">
                                            <div class="invoice-address">
                                                <h3><?php echo $title; ?></h3>
                                                <h5>Maintainer: <?php echo $maintainer; ?></h5>
                                                <textarea cols=80 rows=8><?php echo $desc; ?></textarea>
                                                <p>Started Since <?php echo $time; ?></p>
												<p><a href="<?php echo $fuzzer; ?>">Download Miner </a></p>
												<p><a href="<?php echo $server; ?>">Maintainer Website </a></p>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="invoice-table table-responsive mt-5">
										<h4>Participants</h4>
                                        <table class="table table-bordered table-hover text-right">
                                            <thead>
                                                <tr class="text-capitalize">
                                                    <th class="text-center" style="width: 5%;">Rank</th>
                                                    <th class="text-left" style="width: 45%; min-width: 130px;">Miner</th>
                                                    <th># Finished Transactions</th>
                                                    <th style="min-width: 100px"># found coverage</th>
                                                    <th># found bugs</th>
                                                </tr>
                                            </thead>

			<?php
				$sql = "select name, n_hash, n_cov, n_crash from project_".$uid." order by n_crash, n_cov, n_hash, time desc";
				$res = mysqli_query($conn, $sql) or die("error. tell admin");
				$rank = 1;
				$total_crash = 0;
				while($row = mysqli_fetch_array($res)){
					$name = $row['name'];
					if($row2['n_hash']=="") $n_hash = 0;
					else $n_hash = $row2['n_hash'];
					if($row2['n_cov']=="") $n_cov = 0;
					else $n_cov = $row2['n_cov'];
					if($row2['n_crash']=="") $n_crash = 0;
					else $n_crash = $row2['n_crash'];
			?>
					<tbody><tr><td class="text-center"><?php echo $rank;?>.</td><td class="text-left">
					<?php echo $name;?>
					</td><td>
					<?php echo $n_hash;?>
					</td><td>
					<?php echo $n_cov;?>
					</td><td>
					<?php echo $n_crash;?>
					</td></tr></tbody>
			<?php
					$total_crash = $total_crash + $n_crash;
					$rank = $rank+1;
				}
            ?>

                                            <tfoot>
                                                <tr>
                                                    <td colspan="4"># total bugs :</td>
                                                    <td><?php echo $total_crash; ?></td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                                <div class="invoice-buttons text-right">
                                    <a href='lib.php?cmd=enroll&project_no=<?php echo $uid;?>' onclick='return confirm("Do you want to join?");' class="invoice-btn">Join Project</a>
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
            <div id="settings" class="tab-pane fade">
                <div class="offset-settings">
                    <h4>General Settings</h4>
                    <div class="settings-list">
                        <div class="s-settings">
                            <div class="s-sw-title">
                                <h5>Notifications</h5>
                                <div class="s-swtich">
                                    <input type="checkbox" id="switch1" />
                                    <label for="switch1">Toggle</label>
                                </div>
                            </div>
                            <p>Keep it 'On' When you want to get all the notification.</p>
                        </div>
                        <div class="s-settings">
                            <div class="s-sw-title">
                                <h5>Show recent activity</h5>
                                <div class="s-swtich">
                                    <input type="checkbox" id="switch2" />
                                    <label for="switch2">Toggle</label>
                                </div>
                            </div>
                            <p>The for attribute is necessary to bind our custom checkbox with the input.</p>
                        </div>
                        <div class="s-settings">
                            <div class="s-sw-title">
                                <h5>Show your emails</h5>
                                <div class="s-swtich">
                                    <input type="checkbox" id="switch3" />
                                    <label for="switch3">Toggle</label>
                                </div>
                            </div>
                            <p>Show email so that easily find you.</p>
                        </div>
                        <div class="s-settings">
                            <div class="s-sw-title">
                                <h5>Show Task statistics</h5>
                                <div class="s-swtich">
                                    <input type="checkbox" id="switch4" />
                                    <label for="switch4">Toggle</label>
                                </div>
                            </div>
                            <p>The for attribute is necessary to bind our custom checkbox with the input.</p>
                        </div>
                        <div class="s-settings">
                            <div class="s-sw-title">
                                <h5>Notifications</h5>
                                <div class="s-swtich">
                                    <input type="checkbox" id="switch5" />
                                    <label for="switch5">Toggle</label>
                                </div>
                            </div>
                            <p>Use checkboxes when looking for yes or no answers.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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

