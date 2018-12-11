<?php
ob_start();
session_start();
require_once 'dbconnect.php';

if ( isset($_SESSION['user'])!="" ) {
	header("Location: quiz/index.php");
	exit;
}

$error = false;

if( isset($_POST['btn-login']) ) {	
	

	$email = trim($_POST['email']);
	$email = strip_tags($email);
	$email = htmlspecialchars($email);
	
	$pass = trim($_POST['pass']);
	$pass = strip_tags($pass);
	$pass = htmlspecialchars($pass);
	
	if(empty($email)){
		$error = true;
		$emailError = "Please enter your email address.";
	} else if ( !filter_var($email,FILTER_VALIDATE_EMAIL) ) {
		$error = true;
		$emailError = "Please enter valid email address.";
	}
	
	if(empty($pass)){
		$error = true;
		$passError = "Please enter your password.";
	}
	

	if (!$error) {
		
		$password = hash('sha256', $pass);
		
		$res=mysql_query("SELECT userId, userName, userPass FROM users WHERE userEmail='$email'");
		$row=mysql_fetch_array($res);
		$count = mysql_num_rows($res);
		
		if( $count == 1 && $row['userPass']==$password ) {
			$_SESSION['user'] = $row['userId'];
			header("Location: quiz/quiz.php");
		} else {
			$errMSG = "Incorrect Credentials, Try again...";
		}
		
	}
	
}
?>
<!DOCTYPE html>
<html>
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Registration</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/grayscale.min.css" rel="stylesheet">

  </head>
<body id="page-top">

	<div class="container">
		<div id="login-form">
			<form method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" autocomplete="off">
				
				<div class="col-md-12">
					<div class="form-group">
						<h2 class="">Sign In.</h2>
					</div>
					<div class="form-group">
						<hr />
					</div>			
					<?php
					if ( isset($errMSG) ) {
						?>
						<div class="form-group">
							<div class="alert alert-danger">
								<span class="glyphicon glyphicon-info-sign"></span> <?php echo $errMSG; ?>
							</div>
						</div>
						<?php
						}
					?>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
							<input type="email" name="email" class="form-control" placeholder="Your Email" value="<?php echo $email; ?>" maxlength="40" />
						</div>
						<span class="text-danger"><?php echo $emailError; ?></span>
					</div>
					
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
							<input type="password" name="pass" class="form-control" placeholder="Your Password" maxlength="15" />
						</div>
						<span class="text-danger"><?php echo $passError; ?></span>
					</div>
					
					<div class="form-group">
						<hr />
					</div>
					
					<div class="form-group">
						<button type="submit" class="btn btn-block btn-primary" name="btn-login">Sign In</button>
					</div>
					
					<div class="form-group">
						<hr />
					</div>
					
					<div class="form-group">
						<a href="register.php">Sign Up Here...</a>
					</div>
					
				</div>
				
			</form>
		</div>	

	</div>

    <!-- Footer -->
    <footer class="bg-black small text-center text-white-50">
      <div class="container">
        Copyright &copy; Your Website 2018
      </div>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/grayscale.min.js"></script>
</body>
</html>
<?php ob_end_flush(); ?>