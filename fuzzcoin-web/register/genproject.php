<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Signup to FuzzCoin</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
</head>
<script>
function join_check_submit(){
        if(!document.join.name.value) 
        {
                alert("Input Project name");
                document.join.name.focus();
                return false;
        }  
        if(!document.join.url.value) 
        {
                alert("Input Server URL");
                document.join.url.focus();
                return false;
        }       
        if(!document.join.hash.value) 
        {
                alert("Input Hash Number. (user gets 1 coin from your wallet, once solving this amount of hash puzzles)");
                document.join.hash.focus();
                return false;
        }       
        if(!document.join.cov.value) 
        {
                alert("Input Cov Number. (user gets 1 coin from your wallet, once reporting this amount of unique Coverage updates)");
                document.join.cov.focus();
                return false;
        }       
        if(!document.join.crash.value) 
        {
                alert("Input Crash Number. (user gets 1 coin from your wallet, once reporting this amount of unique Crash updates)");
                document.join.crash.focus();
                return false;
        } 
        if(!document.join.fuzzer.value) 
        {
                alert("please upload your fuzzer. (user will run your fuzzer then automatically generate report.)");
                document.join.fuzzer.focus();
                return false;
        } 
        return true;
}

</script>

<body>

    <div class="main">

        <section class="signup">
            <!-- <img src="images/signup-bg.jpg" alt=""> -->
            <div class="container">
                <div class="signup-content">
                    <form enctype="multipart/form-data" method="POST" action="../board/lib.php?cmd=genproj" onsubmit="return join_check_submit()" name="join" class="signup-form">
                        <h2 class="form-title">Create New Fuzzing Project</h2>
                        <div class="form-group">
                            <input type="text" class="form-input" name="name" placeholder="Project Name"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="url" placeholder="Fuzzing Server URL"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="hash" placeholder="# of PoFW for 1 Coin"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="cov" placeholder="# of Coverage Report for 1 Coin"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="crash" placeholder="# of Crash Report for 1 Coin"/>
                        </div>
						<div class="form-group">
							<textarea name="description" rows="10" cols="60">This project is to fuzz...</textarea>
                        </div>
                        <div class="form-group">
						Client Fuzzer Binary (zip/tgz): <input type="file" name="fuzzerfile">
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Create Project"/>
                        </div>
                    </form>
                    <p class="loginhere">
                        <a href="../index.php" class="loginhere-link">Go Back</a>
                    </p>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>



