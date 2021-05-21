<?php
include("db.php");
$page="main";
if(!get_magic_quotes_gpc()){
foreach($_GET as $num => $val){$_GET[$num]=mysqli_real_escape_string($conn, $val);}
foreach($_POST as $num => $val){$_POST[$num]=mysqli_real_escape_string($conn, $val);}
foreach($_COOKIE as $num => $val){$_COOKIE[$num]=mysqli_real_escape_string($conn, $val);}
foreach($_FILES as $num => $val){$_FILES[$num]['name']=mysqli_real_escape_string($conn, $val['name']);} 
}

function check_xss($ck){
if(preg_match("/>/",$ck)) return false;
if(preg_match("/</",$ck)) return false;
if(preg_match("/\"/",$ck)) return false;
if(preg_match("/'/",$ck)) return false;
return true;
}

function isalphanum($input){
if($input=="") return true;
if(preg_match('/^[a-zA-Z]+[a-zA-Z0-9._]+$/', $input))
{
	return true;
}
else
{
    return false;
}
}


function check_sqli($ck){
if(preg_match("/\"/",$ck)) return false;
if(preg_match("/'/",$ck)) return false;
if(preg_match("/\(/",$ck)) return false;
if(preg_match("/\)/",$ck)) return false;
if(preg_match("/ /",$ck)) return false;
if(preg_match("/%/",$ck)) return false;
if(preg_match("/=/",$ck)) return false;
if(preg_match("/>/",$ck)) return false;
if(preg_match("/</",$ck)) return false;
if(preg_match("/^union/",$ck)) return false;
if(preg_match("/^select/",$ck)) return false;
if(preg_match("/^information_schema/",$ck)) return false;
return true;
}

function check_len($ck){
	if(strlen($ck) < 4) return false;
	if(strlen($ck) > 32) return false;
	return true;
}

function white_list($p){
	if(!in_array($p,Array("main","login","join","probs","rank","auth","myinfo","notice","memo","memodel","prob2","solver","vote","voteproc","finduser","rank2","writeup","enroll"))) $p="main"; // allow include
	return $p;
}

function move($p){ die("<script>window.location.href='".$p."';</script>"); }
function err2($msg, $p){ die("<script>window.location.href='".$p."';</script>"); }
function err($msg){ die("<script>alert('".$msg."'); window.location.href='index.php';</script>"); }

if(isset($_GET['p'])) $page = white_list($_GET['p']); else $page="main"; 

if(isset($_GET['cmd'])){
	switch($_GET['cmd']){
		case "main":
			move('index.php');
			break;

		case "genproj" :
			$proj_name = $_POST['name'];
			if(!check_sqli($proj_name)){
				err("no hack");
				break;
			}
			$proj_url = $_POST['url'];
			if(!check_sqli($proj_url)){
				err("no hack");
				break;
			}
			$proj_hash = $_POST['hash'];
			if(!check_sqli($proj_hash)){
				err("no hack");
				break;
			}
			$proj_cov = $_POST['cov'];
			if(!check_sqli($proj_cov)){
				err("no hack");
				break;
			}
			$proj_crash = $_POST['crash'];
			if(!check_sqli($proj_crash)){
				err("no hack");
				break;
			}
			$proj_desc = $_POST['description'];

			$sql = "select name from projects where name='".$proj_name."'";
			$row = mysqli_fetch_array(mysqli_query($conn, $sql));
			if($row[0] == $proj_name){
				err("Project name already exists.");
			}
			
			$sql = "select count(*) from projects";
			$row = mysqli_fetch_array(mysqli_query($conn, $sql));
			$proj_no = $row[0];

			$target_path = "../bin/";
			$target_path = $target_path.md5($proj_no.$_FILES['fuzzerfile']['name']).".tgz"; 
			if(move_uploaded_file($_FILES['fuzzerfile']['tmp_name'], $target_path)) {
				echo "ok";
			} else{
				err("Fuzzer upload error.");
			}

			$sql="insert into projects (uid,mid,fuzzer,server,name,time,cov_pay,crash_pay,hash_pay,description) values(";
			$sql=$sql.$proj_no.",'";
			$sql=$sql.$_SESSION['fuzzcoin_login']."','";
			$sql=$sql.$target_path."','";
			$sql=$sql.$proj_url."','";
			$sql=$sql.$proj_name."',";
			$sql=$sql."now(),"; 
			$sql=$sql.$proj_cov.","; 
			$sql=$sql.$proj_crash.","; 
			$sql=$sql.$proj_hash.",'"; 
			$sql=$sql.$proj_desc.",')"; 
			$result = mysqli_query($conn, $sql);
			if(!$result){
				die($sql.' inserto into project failed');
			}

			$sql = "create table project_".$proj_no." (sid varchar(64),n_crash integer,n_cov integer,n_hash integer,time datetime,name varchar(64));";			
			$result = mysqli_query($conn, $sql);
			err("Project ".$proj_name." is created. (project number: ".$proj_no);
			break;

		case "enroll" :
			if(!isset($_GET['project_no'])){
				err("Parameter missing");
				break;
			}

			$project_no = $_GET['project_no'];
			if(!check_sqli($project_no)){
				err("no hack");
				break;
			}

			if(!is_numeric($project_no)){
            	err("no webhacking");                
            	break;
            }

			$sql = "select name from users where id='".$_SESSION['fuzzcoin_login']."'";
			$row = mysqli_fetch_array(mysqli_query($conn, $sql));
			if($row[0] == ""){
				err("Failed to get user name");
			}
			$user_name = $row[0];


			$sql = "select name from projects where uid=".$project_no;
			$row = mysqli_fetch_array(mysqli_query($conn, $sql));
			if($row[0] == ""){
				err("Invalid Project ID");
			}
			$project_name = $row[0];

			$sql = "select pid from enroll where pid=".$project_no." and sid='".$_SESSION['fuzzcoin_login']."'";
			$row = mysqli_fetch_array(mysqli_query($conn, $sql));

			if($row[0] == ""){
				$sql="insert into enroll (pid,sid,time) values('";
				$sql=$sql.$project_no."','";
				$sql=$sql.$_SESSION['fuzzcoin_login']."',";
				$sql=$sql."now())"; 
				$result = mysqli_query($conn, $sql);
			
				# put recored to the project_# table
				$sql="insert into project_".$project_no." (sid,n_crash,n_cov,n_hash,time,name) values('";
				$sql=$sql.$_SESSION['fuzzcoin_login']."',";
				$sql=$sql."0,"; 
				$sql=$sql."0,"; 
				$sql=$sql."0,"; 
				$sql=$sql."now(),'".$user_name."')"; 
				$result = mysqli_query($conn, $sql);
				
				err("You are a project member of ".$project_name." now. Start fuzzing!");
			}else{
				err("You already joined ".$project_name." project..."); 
			}
			break;

		case "join" :
			if(!isset($_POST['id']) || !isset($_POST['pw']) || !isset($_POST['name']) || !isset($_POST['email'])){
				err("Parameter missing");
				break;
			}
			
			// check SQL injection
			if(!check_sqli($_POST['id'])){
				err("Do not use special charicters in ID");
				break;
			}
			if(!check_sqli($_POST['pw'])){
				err("Do not use special charicters in PW");
				break;
			}
			if(!check_sqli($_POST['name'])){
				err("Do not use special charicters in NAME");
				break;
			}
			if(!check_sqli($_POST['email'])){
				err("Do not use special charicters in EMAIL");
				break;
			}
			
			// check LEN
			if(!check_len($_POST['id'])){
				err("ID should be 4~31 byte");
				break;
			}
			if(!check_len($_POST['pw'])){
				err("PW should be 4~31 byte");
				break;
			}
			if(!check_len($_POST['email'])){
				err("EMAIL should be 4~31 byte(input correct one for wechall/password reset)");
				break;
			}
/*
			$gi = geoip_open("./GeoIP.dat",GEOIP_STANDARD);
			$country = geoip_country_code_by_addr($gi, $_SERVER['REMOTE_ADDR']);
*/
			$sql = "select id from users where id='".$_POST['id']."' or email='".$_POST['email']."'";
			$row = mysqli_fetch_array(mysqli_query($conn, $sql));

			if(empty($row[0])){
				$sql="insert into users (id,pw,name,email,time,point,type) values('";
				$sql=$sql.$_POST['id']."','";
				$sql=$sql.md5($_POST['id'].$_POST['pw'])."','";
				$sql=$sql.$_POST['name']."','";
				$sql=$sql.$_POST['email']."'";
				$sql=$sql.",now(), 0, 'slave')"; 
				$result = mysqli_query($conn, $sql);
				err("You are registered. Please Login.");
			}else{
				err("ID or EMAIL already exist!"); 
			}
			break;

		case "login" :
			die('site closed');
			$sql = "select id from users where id='".$_POST['id']."' and pw='".md5($_POST['id'].$_POST['pw'])."'";
			$row = mysqli_fetch_array(mysqli_query($conn, $sql));
			if(empty($row[0])){
				err("Login Failed");
			}else{
				$_SESSION['fuzzcoin_login'] = $_POST['id']; //login
				err2("login ok ".$_SESSION['fuzzcoin_login'], "index.php" );
			}
			break;

		case "logout" : 
			session_destroy(); // logout
			move("index.php");
			break; 

		case "auth" : 
			if(!isset($_SESSION['pwnable_login'])){
				err("Login first.");
				break;
			}

			if(isset($_POST['flag'])){
				sleep(1); // don't bruteforce!
				
				// see if the flag is already authenticated for this user.
				$sql = "select task_no from solved where user_id='".$_SESSION['pwnable_login']."' and flag='".md5($_POST['flag'])."'";
				$row = mysqli_fetch_array(mysqli_query($conn, $sql));
				if(!empty($row[0])){
					err2("You already authenticated this flag", "play.php");
				}

				$sql = "select point, no from task where flag='".md5($_POST['flag'])."'";				
				$row = mysqli_fetch_array(mysqli_query($conn, $sql));
				if(empty($row[0])){
					err2("Wrong", "play.php");
				}else{
					$sql = "insert into solved (task_no, flag, user_id, time) values(";
					$sql = $sql . $row[1].", '".md5($_POST['flag'])."', '".$_SESSION['pwnable_login']."', now())"; 
					$result = mysqli_query($conn, $sql);

					if($result!=1){
						err("Flag insert error. tell admin");
						break;
					}

					$sql = "update user set point=point+".$row[0]." where id='".$_SESSION['pwnable_login']."'"; 
					$result = mysqli_query($conn, $sql);
										
					$sql = "update user set lastauth=now() where id='".$_SESSION['pwnable_login']."'"; 
					$res = mysqli_query($conn, $sql);
					if($res!=1){
						err("Auth error. tell admin");
						break;
					}
					err2("Congratz!. you got ".$row[0]." points", "play.php"); 
				}
			}
			else{
				err2("Wrong", "play.php");
			}			
			break;

		case "myinfo" : 
			if(!isset($_SESSION['pwnable_login'])){
				err("Login first.");
				break;
			}

			if(!isset($_POST['pw']) || !isset($_POST['npw']) || !isset($_POST['name']) || !isset($_POST['comment'])){
				err("Parameter missing");
				break;
			}

			// user verification
			$sql = "select id from user where id='".$_SESSION['pwnable_login']."' and pw='".md5($_POST['pw'])."'";
			$row = mysqli_fetch_array(mysqli_query($conn, $sql));
			if(empty($row[0])){
				err("Incorrect Password");
			}			
		

			if(!isalphanum($_POST['Country'])){
				err("no hack");
				break;
			}
	
			// check SQL injection
			if(!check_xss($_POST['comment'])){
				err("Do not use < or > in COMMENT");
				break;
			}

			if(!check_sqli($_POST['name'])){
				err("Do not use special charicters in NAME");
				break;
			}

                        if(!check_xss($_POST['name'])){
                                err("Do not use special charicters in NAME");
                                break;
                        }
			
			// check LEN
			if(strlen($_POST['comment'])>127){
				err("COMMENT should be less than 128 byte");
				break;
			}

			// check duplicate name
			$sql = "select name from user where id!='".$_SESSION['pwnable_login']."' and binary name='".$_POST['name']."'";
			$row = mysqli_fetch_array(mysqli_query($conn, $sql));
			if(!empty($row[0])){
				err("nickname already exists.");
			}

			$sql="update user set comment='".$_POST['comment']."' ";
			$sql=$sql.", name='".$_POST['name']."' ";
			$sql=$sql.", country='".$_POST['Country']."' ";
			if(strcmp($_POST['npw'], "")){
				if(!check_sqli($_POST['npw'])){
					err("Do not use special charicters in new password");
					break;
				}
				if(!check_len($_POST['npw'])){
					err("NEW PW should be 4~31 byte");
					break;
				}
				$sql=$sql.", pw=md5('".$_POST['npw']."') ";
			}
			$sql=$sql."where id='".$_SESSION['pwnable_login']."'";
			$result=mysqli_query($conn, $sql);
			if($result==1)
				err("User info updated.");	
			else
				err("Error occured... tell admin");
			break;

		case "finduser":
			if(!check_sqli($_POST['user'])){
				err("do not try sql injection");
			}
			$sql = "select name, point, 1+(select count(*) from user A where A.point > B.point) as rank from user B where name='".$_POST['user']."' order by rank limit 1";
			$row = mysqli_fetch_array(mysqli_query($conn, $sql));
			if(empty($row[0])){
				err2("User ".$_POST['user']." not found", "rank.php");
			}
			err2("User ".$row['name']." has [".$row['point']."] points.(rank:".$row['rank'].")", "rank.php");
			break;

		case "pwreset2":
			$token = $_GET['token'];
			if(!check_sqli($token)){
				err("do not try sql injection");
				break;
			}
			if(!is_numeric($token)){
				err("do not try sql injection");
				break;
			}
			if($token == '0'){
				err("invalid token");
				break;
			}
			$row = mysqli_fetch_array(mysqli_query($conn, "select id from user where nlogin=".$token));
                        if(empty($row[0])){
                                err("invalid token");
				break;
                        }
			if(!check_sqli($row[0])){
                                err("do not try sql injection");
				break;
                        }
			$sql = "update user set pw=md5('1234') where id='".$row[0]."'";
                        $res = mysqli_query($conn, $sql);
                        if($res!=1){
                                err("update error 27. tell admin");
                                break;
                        }
			err("your password is changed to 1234");
			break;

		case "pwreset":
			if(!check_sqli($_POST['id'])){
				err("do not try sql injection");
			}
			$row = mysqli_fetch_array(mysqli_query($conn, "select email from user where id='".$_POST['id']."'"));
			if(empty($row[0])){
				err("id ".$_POST['id']." not found");
			}

			$token = rand(100000000, 999999999);
			$sql = "update user set nlogin=".$token." where id='".$_POST['id']."'"; 
			$res = mysqli_query($conn, $sql);
			if($res!=1){
				err("update error 59. tell admin");
				break;
			}

			$subject = 'password reset';
			$message = 'visit this url ( pwnable.kr/lib.php?cmd=pwreset2&token='.$token.' )';
			$message = $message . ' then your password will be changed to 1234';
			$to = $row[0];
		
			$T = base64_encode($to);
			$M = base64_encode($message);
			
			exec('/usr/bin/python2 /var/www/html/sendm.py '.$T.' '.$M);	
			err("pw-reset email sented to ".substr($to, 0, 2)."...???@?????.???");
			break;




		case "writeup" : 
			if(!isset($_SESSION['pwnable_login'])){
				err("Login first.");
				break;
			}

			if(!isset($_POST['content']) || !isset($_POST['task_no']) ){
				err("Parameter missing");
				break;
			}

			$task_no = $_POST['task_no'];
			if(!is_numeric($task_no)){
            	err("play webhacking somewhere else.");                
            	break;
            }

			// check if the user solved this task.
           	$solved = false;
			$sql = "select task_no from solved where user_id='".$_SESSION['pwnable_login']."'";
			$res = mysqli_query($conn, $sql);
			while($row = mysqli_fetch_array($res)){
				if($row[0] == $task_no){
					$solved = true;
					break;
				}
			}

			if(!$solved){
				err("you must solve the task to add writeups.");                
			}	

			$writeup = $_POST['content'];
			if(preg_match("/(textarea)/i",$writeup)){
				err("do not use 'textarea' in your writeup");
				break;
			}
						
			$sql="update solved set writeup='".$writeup."' ";
			$sql=$sql."where user_id='".$_SESSION['pwnable_login']."' and task_no=".$task_no;
			$result=mysqli_query($conn, $sql);
			if($result==1)
				err("writeup updated.");	
			else
				err("Error occured... tell admin");
			break;
	}
}
?>

