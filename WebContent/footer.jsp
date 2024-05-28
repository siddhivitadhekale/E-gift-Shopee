<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.smartshop.pojo.ProductCategoryPojo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="coupons">
	<div class="container">
		<div class="coupons-grids text-center">
			<div class="col-md-3 coupons-gd">
				<h3>Buy your product in a simple way</h3>
			</div>
			<div class="col-md-3 coupons-gd">
				<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
				<h4>LOGIN TO YOUR ACCOUNT</h4>
				
			</div>
			<div class="col-md-3 coupons-gd">
				<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
				<h4>SELECT YOUR ITEM</h4>
				
			</div>
			<div class="col-md-3 coupons-gd">
				<span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span>
				<h4>MAKE PAYMENT</h4>
				
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
</div>
<!-- footer -->
<div class="footer">
	<div class="container">
		<div class="col-md-3 footer-left">
			<h2><a href="index.jsp"><img src="images/laropa.jpg" alt=" "class="img-responsive" style="width:80px;"/></a></h2>
			<p>Established in 2011, La Ropa sells bargain-priced women's clothing. If you're looking for a few outfits for work or school or you're 
			in need of a dress for a special occasion, this is the store for you. Whether you're looking for a new jacket, shawl,  accessories 
			or you just want to window-shop until something catches your eye, you're bound to find a deal here. 
</p>
		</div>
		<div class="col-md-9 footer-right">
			<!-- <div class="col-sm-6 newsleft">
				<h3>SIGN UP FOR NEWSLETTER !</h3>
			</div>
			<div class="col-sm-6 newsright">
				<form>
					<input type="text" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required="">
					<input type="submit" value="Submit">
				</form>
			</div> -->
			<div class="clearfix"></div>
			<div class="sign-grds">
				<div class="col-md-4 sign-gd">
					<!-- <h4>Information</h4>
					<ul>
						<li><a href="#">Home</a></li>
						<li><a href="#">Men's Wear</a></li>
						<li><a href="#">Women's Wear</a></li>
					
						<li><a href="#">Contact</a></li>
					</ul> -->
				</div>
				
				<div class="col-md-4 sign-gd-two">
					<h4>Store Information</h4>
					<ul>
						<li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>Address : <span></span></li>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>Email : </li>
						<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>Phone :</li>
					</ul>
				</div>
				<!-- <div class="col-md-4 sign-gd flickr-post">
					<h4>Flickr Posts</h4>
					<ul>
						<li><a href="single.html"><img src="images/d1.jpg" alt=" " class="img-responsive" /></a></li>
						<li><a href="single.html"><img src="images/d2.jpg" alt=" " class="img-responsive" /></a></li>
						<li><a href="single.html"><img src="images/d3.jpg" alt=" " class="img-responsive" /></a></li>
						<li><a href="single.html"><img src="images/d4.jpg" alt=" " class="img-responsive" /></a></li>
						<li><a href="single.html"><img src="images/d1.jpg" alt=" " class="img-responsive" /></a></li>
						<li><a href="single.html"><img src="images/d2.jpg" alt=" " class="img-responsive" /></a></li>
						<li><a href="single.html"><img src="images/d3.jpg" alt=" " class="img-responsive" /></a></li>
						<li><a href="single.html"><img src="images/d2.jpg" alt=" " class="img-responsive" /></a></li>
						<li><a href="single.html"><img src="images/d4.jpg" alt=" " class="img-responsive" /></a></li>
					</ul>
				</div> -->
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="clearfix"></div>
		
	</div>
</div>
</body>
</html>