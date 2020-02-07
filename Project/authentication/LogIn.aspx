<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="Project.WebForm1" %>

<!DOCTYPE html>
<head>
<html lang="en">
<title>OCD FPT UNIVERSITY</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="../Styles/login/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Styles/login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Styles/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Styles/login/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Styles/login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../Styles/login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Styles/login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Styles/login/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../Styles/login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Styles/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="../Styles/login/css/main.css">
<!--===============================================================================================-->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>
<body>

<!-- Header -->
<header class="w3-display-container w3-content w3-center" style="max-width:1500px">
  <img class="w3-image" src="../Styles/login/images/2.jpg" alt="Me" width="1500" height="600">
  <div class="w3-padding-large w3-border w3-wide w3-center" style="position:absolute; top:30%; left:50%; transform: translate(-50%,-50%); color:black">
    <h1 class="w3-hide-medium w3-hide-small w3-xxxlarge" >DORMITORY</h1>
    <h5 class="w3-hide-large" style="white-space:nowrap">FPT TEAM</h5>
    <h3 class="w3-hide-medium w3-hide-small">FPT UNIVERSITY</h3>
  </div>
  
  <!-- Navbar (placed at the bottom of the header image) -->
  <div class="w3-bar w3-light-grey w3-round w3-display-bottommiddle w3-hide-small" style="bottom:-16px">
    <a href="#" class="w3-bar-item w3-button">Home</a>
    <a href="#contact" class="w3-bar-item w3-button">Log in</a>
    <a href="#portfolio" class="w3-bar-item w3-button">Abount</a>

  </div>
</header>

<!-- Navbar on small screens -->
<div class="w3-center w3-light-grey w3-padding-16 w3-hide-large w3-hide-medium">
<div class="w3-bar w3-light-grey">
  <a href="#" class="w3-bar-item w3-button">Home</a>
  <a href="#contact" class="w3-bar-item w3-button">Login</a>
  <a href="#portfolio" class="w3-bar-item w3-button">About</a>
  
</div>
</div>
<!-- Page content -->

  <!-- Contact -->
  <div class="w3-light-grey w3-padding-large w3-padding-32 w3-margin-top" id="contact">
    <div class="limiter">
		<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form runat="server" class="login100-form validate-form" >
					<span class="login100-form-title p-b-49">
						Login
					</span>
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is required">
						<span class="label-input100">Username</span>
                        <asp:TextBox ID="username" CssClass="input100" runat="server"></asp:TextBox>
						<%--<input class="input100" type="text" name="username" placeholder="Type your username">--%>
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">Password</span>
                        <asp:TextBox CssClass="input100"  ID="password" TextMode="Password"  runat="server"></asp:TextBox>
						<%--<input class="input100" type="password" name="pass" placeholder="Type your password">--%>
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					
					<div class="text-right p-t-8 p-b-31">
						
					</div>
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div> 
                            <asp:Button  OnClick="LogIn_Click" ID="LogIn" runat="server" Text="Log in" CssClass="login100-form-btn"/>

						</div>
					</div>	
				</form>
			</div>
		</div>
	</div>
    </div>
    <div class="w3-content w3-padding-large w3-margin-top" id="portfolio">

  <!-- Images (Portfolio) -->
  <img src="../Styles/login/images/fpt3.jpg" alt="FPT dormitory 1" class="w3-image" width="1000" height="500">
  <img src="../Styles/login/images/fpt10.jpg" alt="FPT dormitory 1" class="w3-image w3-margin-top" width="1000" height="500">
  
<!-- End page content -->
</div>
<!--===============================================================================================-->
	<script src="../Styles/login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../Styles/login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="../Styles/login/vendor/bootstrap/js/popper.js"></script>
	<script src="../Styles/login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../Styles/login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="../Styles/login/vendor/daterangepicker/moment.min.js"></script>
	<script src="../Styles/login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="../Styles/login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="../Styles/login/js/main.js"></script>
</body>

