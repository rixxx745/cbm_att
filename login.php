<!DOCTYPE html>
<html lang="en">
<?php 
session_start();
include('./db_connect.php');
ob_start();
if(!isset($_SESSION['system'])){
	$system = $conn->query("SELECT * FROM system_settings limit 1")->fetch_array();
	foreach($system as $k => $v){
		$_SESSION['system'][$k] = $v;
	}
}
ob_end_flush();
?>
<head>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="icon" href="images/cbm.png">
	<title><?php echo $_SESSION['system']['name'] ?></title>
 	

<?php include('./header.php'); ?>
<?php 
if(isset($_SESSION['login_id']))
header("location:index.php?page=home");

?>

</head>
<style>
	body{
		width: 100%;
	    height: calc(100%);
	    position: fixed;
	    top:0;
	    left: 0;
		background-image: url('images/sbg.png');
		background-repeat: no-repeat;
		background-size: cover; /*1550px 753px; */
		background-position: center;
		background-attachment: fixed;
	    /*background: #007bff;*/
	}
	main#main{
		width:100%;
		height: calc(100%);
		display: flex;
	}
	h3{
		padding-top: 15px;
		padding-bottom: 15px;
		margin-top: 5%;
		margin-left: 28%;
		margin-right: 28%;
		text-align: center;
		background-color: white;
	}

</style>

<body>

<div class="container" id="container">
<div class="form-container sign-up-container">

<form action="">
	<h1>Create Account</h1>
</form>
</div>
<div class="form-container sign-in-container">
	<form id="login-form">
		<h1 style="font-family:courier">LOGIN</h1><br><br>
		<input type="username" name="username" placeholder="Email">
		<input type="password" name="password" placeholder="Password"><br>
		<button style="font-family:verdana">Login</button>
		<div class="social-container">
			<a href="#" class="social"><i class="fa fa-facebook"></i></a>
			<a href="#" class="social"><i class="fa fa-google"></i></a>
			<a href="#" class="social"><i class="fa fa-linkedin"></i></a>
		</div>
	</form>
</div>
<div class="overlay-container">
	<div class="overlay">
		<div class="overlay-panel overlay-right">
			<h1 style="font-family:courier">Hola!</h1>
			<p>Enter your details and start your journey with us.</p>
		</div>
	</div>
</div>
</div>
  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>


</body>
<script>
	$('#login-form').submit(function(e){
		e.preventDefault()
		$('#login-form button[type="button"]').attr('disabled',true).html('Logging in...');
		if($(this).find('.alert-danger').length > 0 )
			$(this).find('.alert-danger').remove();
		$.ajax({
			url:'ajax.php?action=login',
			method:'POST',
			data:$(this).serialize(),
			error:err=>{
				console.log(err)
		$('#login-form button[type="button"]').removeAttr('disabled').html('Login');

			},
			success:function(resp){
				if(resp == 1){
					location.href ='index.php?page=home';
				}else{
					$('#login-form').prepend('<div class="alert alert-danger">Email or password is incorrect.</div>')
					$('#login-form button[type="button"]').removeAttr('disabled').html('Login');
				}
			}
		})
	})
</script>	
</html>
