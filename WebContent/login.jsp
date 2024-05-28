

<!DOCTYPE html>
<html>
<head>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>LaRopa</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="LAROPA Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<!-- <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
js
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
//js
cart
	<script src="js/simpleCart.min.js"></script> -->
<!-- cart -->
<!-- for bootstrap working -->
	<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
<script src="js/jquery.easing.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script language='javascript' type='text/javascript'>
    function check(input) {
        if (input.value != document.getElementById('password').value) {
            input.setCustomValidity('Password Must be Matching.');
        } else {
            // input is valid -- reset the error message
            input.setCustomValidity('');
        }
    }
</script>

<script>

$(document).ready(function(){
	
$("#reset").click(function(){
	

	alert("hello");
	
	$("#uname").val("");
	$("#em").val("");
	$("#mb").val("");
	$("#ps").val("");
	$("#cf").val("");
});

});

</script>
</head>
<body>

<!-- header -->
<!-- <div class="header">
	<div class="container">
		<ul>
			<li><span class="glyphicon glyphicon-time" aria-hidden="true"></span>Free and Fast Delivery</li>
			<li><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>Free shipping On all orders</li>
			<li><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><a href="mailto:info@example.com">info@example.com</a></li>
		</ul>
	</div>
</div>-->
<!-- //header -->
<!-- header-bot -->
<div class="header-bot">
 
  <jsp:include page="header.jsp"/>
  </div>
  <div class="ban-top">
<jsp:include page="menu.jsp"/>
</div>
<!-- //banner-top -->
<!-- banner -->
<div class="page-head">
	<div class="container">
		<h3>Registration</h3>
	</div>
</div>
	<!--<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
						</div>-->
						<div class="container" >
						<ul class="nav nav-tabs">
						<li ><a data-toggle="tab" href="#signup">sign up</a></li>
    <li class="active"><a data-toggle="tab" href="#signin">sign in </a></li>
						</ul>
						<div class="tab-content">
    <div id="signup" class="tab-pane fade in ">
						
					<!--	<div class="modal-body modal-spa">
							<div class="login-grids">
								<div class="login">-->
									<div class="login-bottom">
										<h3>Sign up for free</h3>
										<form action="UserController" method="post" id="myform">
											<div class="sign-up">
												<h4>Name :</h4>
												<input type="text" style="color:black "  id="uname" name="username" value="Type here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Type here';}" required="required" pattern="[A-Za-z\s]+" title="Enter only Character">	
											</div>
											<div class="sign-up">
												<h4>Mobile no. :</h4>
												<input type="text"  style="color:black " id="mb" name="mobile" value="Type here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Type here';}" required="required" pattern="^\d{10}$" title="Enter 10 digit Mobile Number">	
											</div>
											<div class="sign-up">
												<h4>Valid Email/Username :</h4>
												<input type="text"  style="color:black " id="em" name="email" value="Type here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Type here';}" required="required" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" title="Enter Valid Email">	
											</div>
											
											<span style="font-size:14px; color:red">Password must Contain atleast 1 capital letter, 1 speacial characterer and 1 number</span>
											
											<div class="sign-up">
												<h4>Valid Password :</h4>
												<input type="password" style="color:black " id="ps"name="password" value="Password" id="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="required"   >
												</div>
											<div class="sign-up">
												<h4>Re-type Password :</h4>
												<input type="password" style="color:black " id="cf" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="required" oninput="check(this)">
												
											</div>
											
											
											<!-- <div class="sign-up">
												<h4>Valid Password :</h4>
												<input type="password" style="color:black " name="password" value="Password" id="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="required" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}"   required="required" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
												
											</div>
											<div class="sign-up">
												<h4>Re-type Password :</h4>
												<input type="password" style="color:black " value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="required" oninput="check(this)">
												
											</div> -->
											<div class="sign-up">
												<input type="submit" value="REGISTER" name="action" >
											</div><br>
											
											<div class="sign-up">
												<input type="submit" value="RESET" id="reset" onclick="reset()">
											</div>
											
										</form>
									</div>
									
													
									
									</div>
									
									
									<div id="signin" class="tab-pane fade in active">
									<div class="login-right">
										<h3>Sign in with your account</h3>
										<form action="UserController" method="post">
										
										 <label>
        <%
	String loginmsg=(String)request.getAttribute("error");
	if(loginmsg!=null)
	out.println("<font color=red size=4px>"+loginmsg+"</font>");		
	
	
	%></label>
											<div class="sign-in">
												<h4>Email/Username :</h4>
												<input type="text" style="color:black " name="email" value="Type here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Type here';}" required="">	
											</div>
											<div class="sign-in">
												<h4>Password :</h4>
												<input type="password" style="color:black " name="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="">
												
											</div>
											<!-- <div class="single-bottom">
												<input type="checkbox"  id="brand" value="">
												<label for="brand"><span></span>Remember Me.</label>
											</div> -->
											<div class="sign-in">
												<input type="submit" value="SIGNIN" name="action" >
											</div>
											   
											
											
										</form>
									</div>
									</div>
									<div class="clearfix"></div>
								</div>
								<p>By logging in you agree to our <a href="#">Terms and Conditions</a> and <a href="#">Privacy Policy</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="footer.jsp"/>
			
	
			
		
		</body>
		</html>
			
			