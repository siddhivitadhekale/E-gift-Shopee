<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.smartshop.pojo.ProductCategoryPojo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<html>
<head>
<title>EGift</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Smart Shop Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<!-- <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
pignose css
<link href="css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />


//pignose css
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
js
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script> -->
<!-- //js -->
<!-- cart -->
	<script src="js/simpleCart.min.js"></script>
<!-- cart -->
<!-- for bootstrap working -->
	<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
<script src="js/jquery.easing.min.js"></script>


<style>
.carousel .item{
    height: 280px; /* Prevent carousel from being distorted if for some reason image doesn't load */
}

</style>
</head>

<script>
$(document).ready(function(){

});
</script>

<body>
<!-- header -->
<!--div class="header">
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
<%-- <div class="header-bot">
 <jsp:include page="menu.jsp"/>
 </div> --%>

 <div class="header-bot">
 
  <jsp:include page="header.jsp"/>
	<!-- <div class="container">
		<div class="col-md-3 header-left">
			<h1><a href="index.jsp"><img src="images/laropa.jpg" class="img-responsive" style="width:80px;"></a></h1>
		</div>
		<div class="col-md-6 header-middle">
			<form>
				<div class="search">
					<input type="search" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}" required="">
				</div>
				<div class="section_room">
					<select id="country" onchange="change_country(this.value)" class="frm-field required">
						<option value="null">All categories</option>
						
						<option value="AX">Men's Wear</option>
						<option value="AX">Women's Wear</option>
						
					</select>
				</div>
				<div class="sear-sub">
					<input type="submit" value=" ">
				</div>
				<div class="clearfix"></div>
			</form>
		</div>
		<div class="col-md-3 header-right footer-bottom">
			<ul>
				<li><a href="#" class="use1" data-toggle="modal" data-target="#myModal4"><span>Login</span></a>
					
				</li>
				<li><a class="fb" href="#"></a></li>
				<li><a class="twi" href="#"></a></li>
				<li><a class="insta" href="#"></a></li>
				<li><a class="you" href="#"></a></li>
			</ul>
		</div>
		<div class="clearfix"></div>
	</div> -->
</div>  </br></br></br>
<!-- //header-bot -->
<!-- banner --> 
<div class="ban-top">

<jsp:include page="menu.jsp" />

<c:if test="${empty productCategoryList}">
<c:redirect url="ProductDetailsController"></c:redirect>
</c:if>

	<%-- <div class="container">
		<div class="top_nav_left">
			<nav class="navbar navbar-default">
			  <div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
				  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				  </button>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">
				  <ul class="nav navbar-nav menu__list">
					<li class="active menu__item menu__item--current"><a class="menu__link" href="index.jsp">Home <span class="sr-only">(current)</span></a></li>
					
					
					 <c:forEach items="${productCategoryList}" var="productCategory"> 
				    
								<li class="dropdown menu__item">
						<a href="#" class="dropdown-toggle menu__link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${productCategory.key} <span class="caret"></span></a>
							<ul class="dropdown-menu multi-column columns-3">
								<div class="row">
									<div class="col-sm-6 multi-gd-img1 multi-gd-text ">
									
									<c:if test="${productCategory.key=='MENSWEAR'}">
									 <img src="images/woo1.jpg" alt=" "/>${productCategory.key}
									</c:if>
									<c:if test="${productCategory.key=='WOMENSWEAR'}">
									 <img src="images/woo.jpg" alt=" "/>${productCategory.key}
									</c:if>
									
									
									
								
									
							
										<!-- <a href="mens.html"><img src="images/woo1.jpg" alt=" "/></a> -->
									</div>
									<div class="col-sm-3 multi-gd-img">
									
										<ul class="multi-column-dropdown">
										<c:forEach items="${productCategory.value}" var="category" varStatus="index">
											<li><a href="ProductDetailsController?action=searchByCategory&code=${category.code}">${category.description} </a></li>
											
											</c:forEach>
										</ul>
										
									</div>
									
									<div class="clearfix"></div>
								</div>
							</ul>
					</li>
					
 </c:forEach> 



<c:if test="${empty productCategoryList}">
<c:redirect url="ProductDetailsController"></c:redirect>
</c:if>
					
					
					
					
					<!--<li class=" menu__item"><a class="menu__link" href="electronics.html">Electronics</a></li>
					<li class=" menu__item"><a class="menu__link" href="codes.html">Short Codes</a></li>-->
					<!-- <li class=" menu__item"><a class="menu__link" href="contact.html">contact</a></li> -->
					
					<%
                String username= (String) session.getAttribute("email");                     
                if (username == null) {
            %>
					
					<li class=" menu__item"><a class="menu__link" href="ProductDetailsController?action=login">Login</a></li>
					<li class=" menu__item"><a class="menu__link" href="ProductDetailsController?action=registration">Registration</a></li>
					
					 <% } else {
         %>
            <li class=" menu__item"><a class="menu__link" href="LogoutController">Logout</a></li>
             <li class=" menu__item"><a class="menu__link" href="UserController?action=userList&user_id=<%=session.getAttribute("email")%>">Friend Suggestions</a></li>
             <li class=" menu__item"><a class="menu__link" href="ProductDetailsController?action=recommendation&user_id=<%=session.getAttribute("email")%>">Recommendation</a></li>
        <% }%>
				  </ul>
				</div>
			  </div>
			</nav>	
		</div>
		<c:if test="${not empty email }">
		<div class="top_nav_right">
			<div class="cart box_1">
						<a href="ProductDetailsController?action=cartList&user_id=<%=session.getAttribute("email")%>">
							<h3> <div class="total">
								<i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i>
								<!-- <span class="simpleCart_total"></span> (<span id="simpleCart_quantity" class="simpleCart_quantity"></span> items)</div> -->
								(<%=session.getAttribute("cartlistsize") %> items)</div>	
							</h3>
						</a>
						<p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>
						
			</div>	
		</div>
		</c:if>
		<div class="clearfix"></div>
	</div> --%>
</div> 
<!-- //banner-top -->
<!-- banner -->

<div id="myCarousel" class="carousel slide" data-ride="carousel" style="height:200px">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="images/28.jpg" alt="">
    </div>

    <div class="item" style="width:100%">
      <img src="images/40.png" alt="">
    </div>

    <div class="item">
      <img src="images/43.jpg" alt="">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<br><br>

<!-- //banner -->
<!-- content -->

<!-- <div class="new_arrivals">
	<div class="container">
		<h3><span>new </span>arrivals</h3>
		<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium</p>
		<div class="new_grids">
			<div class="col-md-4 new-gd-left">
				<img src="images/wed1.jpg" alt=" " />
				<div class="wed-brand simpleCart_shelfItem">
					<h4>Wedding Collections</h4>
					<h5>Flat 50% Discount</h5>
					<p><i>$250</i> <span class="item_price">$500</span><a class="item_add hvr-outline-out button2" href="#">add to cart </a></p>
				</div>
			</div>
			<div class="col-md-4 new-gd-middle">
				<div class="new-levis">
					<div class="mid-img">
						<img src="images/levis1.png" alt=" " />
					</div>
					<div class="mid-text">
						<h4>up to 40% <span>off</span></h4>
						<a class="hvr-outline-out button2" href="product.html">Shop now </a>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="new-levis">
					<div class="mid-text">
						<h4>up to 50% <span>off</span></h4>
						<a class="hvr-outline-out button2" href="product.html">Shop now </a>
					</div>
					<div class="mid-img">
						<img src="images/dig.jpg" alt=" " />
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="col-md-4 new-gd-left">
				<img src="images/wed2.jpg" alt=" " />
				<div class="wed-brandtwo simpleCart_shelfItem">
					<h4>Spring / Summer</h4>
					<p>Shop Men</p>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div> -->
<!-- //content -->

<!-- content-bottom -->


<!-- //content-bottom -->
<!-- product-nav -->

<div class="product-easy">
	<div class="container">
		
		<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
		<script type="text/javascript">
							$(document).ready(function () {
								$('#horizontalTab').easyResponsiveTabs({
									type: 'default', //Types: default, vertical, accordion           
									width: 'auto', //auto or any width like 600px
									fit: true   // 100% fit in a container
								});
							});
							
		</script>
		<div class="sap_tabs">
			<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
				<ul class="resp-tabs-list">
				
					<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Latest Designs</span></li> 
					
       
					<!-- <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>Special Offers</span></li> 
					<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>Collections</span></li>  -->
					<!-- <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Latest Designs</span></li>  -->
					<%-- <li class="resp-tab-item" aria-controls="tab_item-3" role="tab"><a href="ProductDetailsController?action=lastViewByUser&user_id=<%=session.getAttribute("email")%>"><span>Last Views</span></a></li> --%>
				
				</ul>				  	 
				<div class="resp-tabs-container">
					<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
						
						<c:forEach items="${productDetailsPojoList}" var="productDetailsPojo">
						
						<div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="${productDetailsPojo.product_path}" width="200px" height="300px"  alt="" class="pro-image-front">
									<img src="${productDetailsPojo.product_path}" width="200px" height="300px" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="ProductDetailsController?action=productDescription&id=${productDetailsPojo.product_id}" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>
										
								</div>
								<div class="item-info-product ">
								<c:set var = "string2" value = "${fn:substring(productDetailsPojo.product_name, 0, 15)}" />
								<h4 title="${productDetailsPojo.product_name}"><a>${string2}...</a></h4>
									<div class="info-product-price">
										<span class="item_price">${productDetailsPojo.product_price}</span>
										<del></del>
									</div>
									<c:if test="${not empty email }">
									
									<a href="ProductDetailsController?action=addToCart&id=${productDetailsPojo.product_id}&price=${productDetailsPojo.product_price}&quantity=1" class="item_add single-item hvr-outline-out button2">Add to cart</a>									
								</c:if>
								<c:if test="${empty email }">
									
									<a href="#" onclick="alert('Please Do Login');return false;" class="item_add single-item hvr-outline-out button2">Add to cart</a>									
								</c:if>
								</div>
							</div>
						</div>
						</c:forEach>
						
						
						<div class="clearfix"></div>
					</div>
					
					<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-3">
						
						<c:forEach items="${productViewList}" var="productViewList">
						
						<div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="${productViewList.product_path}" width="200px" height="300px"  alt="" class="pro-image-front">
									<img src="${productViewList.product_path}" width="200px" height="300px" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="ProductDetailsController?action=productDescription&id=${productViewList.product_id}" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>
										
								</div>
								<div class="item-info-product ">
									<c:set var = "string2" value = "${fn:substring(productDetailsPojo.product_name, 0, 15)}" />
								<h4 title="${productDetailsPojo.product_name}"><a>${string2}...</a></h4>
									<div class="info-product-price">
										<span class="item_price">${productViewList.product_price}</span>
										<del></del>
									</div>
									<c:if test="${not empty email }">
									
									<a href="ProductDetailsController?action=addToCart&id=${productDetailsPojo.product_id}&price=${productDetailsPojo.product_price}&quantity=1" class="item_add single-item hvr-outline-out button2">Add to cart</a>									
								</c:if>
								<c:if test="${empty email }">
									
									<a href="#" onclick="alert('Please Do Login');return false;" class="item_add single-item hvr-outline-out button2">Add to cart</a>									
								</c:if>								
								</div>
							</div>
						</div>
						</c:forEach>
						
						
						<div class="clearfix"></div>
					</div>
					
					
					
					
					
					
				</div>	
			</div>
		</div>
		

		
		
		
		
		
		
		
		
		
		<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
				<ul class="resp-tabs-list">
				
					<li class="resp-tab-item resp-tab-active" aria-controls="tab_item-0" role="tab"><span>Recently Viewed Items</span></li> 
					
       
					<!-- <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>Special Offers</span></li> 
					<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>Collections</span></li>  -->
					<!-- <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Latest Designs</span></li>  -->
					
				
				</ul>				  	 
				<div class="resp-tabs-container">
					<h2 class="resp-accordion resp-tab-active" role="tab" aria-controls="tab_item-0"><span class="resp-arrow"></span>Latest Designs</h2>
					
					<div class="tab-1 resp-tab-content resp-tab-content-active" aria-labelledby="tab_item-0" style="display:block">
						
						<c:forEach items="${productList}" var="productViewList">
						
						<div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="${productViewList.product_path}" width="200px" height="300px"  alt="" class="pro-image-front">
									<img src="${productViewList.product_path}" width="200px" height="300px" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="ProductDetailsController?action=productDescription&id=${productViewList.product_id}" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>
										
								</div>
								<div class="item-info-product ">
									<c:set var = "string2" value = "${fn:substring(productViewList.product_name, 0, 15)}" />
								<h4 title="${productViewList.product_name}"><a>${string2}...</a></h4>
									<div class="info-product-price">
										<span class="item_price">${productViewList.product_price}</span>
										<del></del>
									</div>
									<c:if test="${not empty email }">
									
									<a href="ProductDetailsController?action=addToCart&id=${productDetailsPojo.product_id}&price=${productDetailsPojo.product_price}&quantity=1" class="item_add single-item hvr-outline-out button2">Add to cart</a>									
								</c:if>
								<c:if test="${empty email }">
									
									<a href="#" onclick="alert('Please Do Login');return false;" class="item_add single-item hvr-outline-out button2">Add to cart</a>									
								</c:if>								
								</div>
							</div>
						</div>
						</c:forEach>
						
									
						
						
						<div class="clearfix"></div>
					</div>
					
					<h2 class="resp-accordion" role="tab" aria-controls="tab_item-1"><span class="resp-arrow"></span></h2><div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
						
						
						
						
						<div class="clearfix"></div>
					</div>
					
					
					
					
					
					
				</div>	
			</div>
		
		
			<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
				<ul class="resp-tabs-list">
				
					<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Apriori</span></li> 
					
       
					<!-- <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>Special Offers</span></li> 
					<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>Collections</span></li>  -->
					<!-- <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Latest Designs</span></li>  -->
					<%-- <li class="resp-tab-item" aria-controls="tab_item-3" role="tab"><a href="ProductDetailsController?action=lastViewByUser&user_id=<%=session.getAttribute("email")%>"><span>Last Views</span></a></li> --%>
				
				</ul>				  	 
				<div class="resp-tabs-container">
					<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
						
						<c:forEach items="${productDetailsPojoList1}" var="productDetailsPojo">
						
						<div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="${productDetailsPojo.product_path}" width="200px" height="300px"  alt="" class="pro-image-front">
									<img src="${productDetailsPojo.product_path}" width="200px" height="300px" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="ProductDetailsController?action=productDescription&id=${productDetailsPojo.product_id}" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>
										
								</div>
								<div class="item-info-product ">
								<c:set var = "string2" value = "${fn:substring(productDetailsPojo.product_name, 0, 15)}" />
								<h4 title="${productDetailsPojo.product_name}"><a>${string2}...</a></h4>
									<div class="info-product-price">
										<span class="item_price">${productDetailsPojo.product_price}</span>
										<del></del>
									</div>
									<c:if test="${not empty email }">
									
									<a href="ProductDetailsController?action=addToCart&id=${productDetailsPojo.product_id}&price=${productDetailsPojo.product_price}&quantity=1" class="item_add single-item hvr-outline-out button2">Add to cart</a>									
								</c:if>
								<c:if test="${empty email }">
									
									<a href="#" onclick="alert('Please Do Login');return false;" class="item_add single-item hvr-outline-out button2">Add to cart</a>									
								</c:if>
								</div>
							</div>
						</div>
						</c:forEach>
						
						
						<div class="clearfix"></div>
					</div>
					
					<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-3">
						
						<c:forEach items="${productViewList}" var="productViewList">
						
						<div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="${productViewList.product_path}" width="200px" height="300px"  alt="" class="pro-image-front">
									<img src="${productViewList.product_path}" width="200px" height="300px" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="ProductDetailsController?action=productDescription&id=${productViewList.product_id}" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>
										
								</div>
								<div class="item-info-product ">
									<c:set var = "string2" value = "${fn:substring(productDetailsPojo.product_name, 0, 15)}" />
								<h4 title="${productDetailsPojo.product_name}"><a>${string2}...</a></h4>
									<div class="info-product-price">
										<span class="item_price">${productViewList.product_price}</span>
										<del></del>
									</div>
									<c:if test="${not empty email }">
									
									<a href="ProductDetailsController?action=addToCart&id=${productDetailsPojo.product_id}&price=${productDetailsPojo.product_price}&quantity=1" class="item_add single-item hvr-outline-out button2">Add to cart</a>									
								</c:if>
								<c:if test="${empty email }">
									
									<a href="#" onclick="alert('Please Do Login');return false;" class="item_add single-item hvr-outline-out button2">Add to cart</a>									
								</c:if>								
								</div>
							</div>
						</div>
						</c:forEach>
						
						
						<div class="clearfix"></div>
					</div>
					
					
					
					
					
					
				</div>	
			</div>
		
		
		
			<c:if test="${not empty email }">
		
		<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
				<ul class="resp-tabs-list">
				
					<li class="resp-tab-item resp-tab-active" aria-controls="tab_item-0" role="tab"><span>Recommended Items</span></li> 
					
       
					<!-- <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>Special Offers</span></li> 
					<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>Collections</span></li>  -->
					<!-- <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Latest Designs</span></li>  -->
					
				
				</ul>				  	 
				<div class="resp-tabs-container">
					<h2 class="resp-accordion resp-tab-active" role="tab" aria-controls="tab_item-0"><span class="resp-arrow"></span>Latest Designs</h2>
					
					<div class="tab-1 resp-tab-content resp-tab-content-active" aria-labelledby="tab_item-0" style="display:block">
						
						<c:forEach items="${list}" var="list">
						
						<div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="${list.product_path}" width="200px" height="300px"  alt="" class="pro-image-front">
									<img src="${list.product_path}" width="200px" height="300px" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="ProductDetailsController?action=productDescription&id=${list.product_id}" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>
										
								</div>
								<div class="item-info-product ">
									<c:set var = "string2" value = "${fn:substring(list.product_name, 0, 15)}" />
								<h4 title="${list.product_name}"><a>${string2}...</a></h4>
									<div class="info-product-price">
										<span class="item_price">${list.product_price}</span>
										<del></del>
									</div>
									<c:if test="${not empty email }">
									
									<a href="ProductDetailsController?action=addToCart&id=${productDetailsPojo.product_id}&price=${productDetailsPojo.product_price}&quantity=1" class="item_add single-item hvr-outline-out button2">Add to cart</a>									
								</c:if>
								<c:if test="${empty email }">
									
									<a href="#" onclick="alert('Please Do Login');return false;" class="item_add single-item hvr-outline-out button2">Add to cart</a>									
								</c:if>								
								</div>
							</div>
						</div>
						</c:forEach>
						
									
						
						
						<div class="clearfix"></div>
					</div>
					
					<h2 class="resp-accordion" role="tab" aria-controls="tab_item-1"><span class="resp-arrow"></span></h2><div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
						
						
						
						
						<div class="clearfix"></div>
					</div>
					
					
					
					
					
					
				</div>	
			</div>
		
		
			</c:if>			
		
		
		
		
		
		
		
	</div>
</div>
<!-- //product-nav -->
 <jsp:include page="footer.jsp"/>
<!-- <div class="coupons">
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
footer
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
			<div class="col-sm-6 newsleft">
				<h3>SIGN UP FOR NEWSLETTER !</h3>
			</div>
			<div class="col-sm-6 newsright">
				<form>
					<input type="text" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required="">
					<input type="submit" value="Submit">
				</form>
			</div>
			<div class="clearfix"></div>
			<div class="sign-grds">
				<div class="col-md-4 sign-gd">
					<h4>Information</h4>
					<ul>
						<li><a href="index.jsp">Home</a></li>
						<li><a href="mens.html">Men's Wear</a></li>
						<li><a href="womens.html">Women's Wear</a></li>
					
						<li><a href="contact.html">Contact</a></li>
					</ul>
				</div>
				
				<div class="col-md-4 sign-gd-two">
					<h4>Store Information</h4>
					<ul>
						<li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>Address : <span></span></li>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>Email : </li>
						<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>Phone :</li>
					</ul>
				</div>
				<div class="col-md-4 sign-gd flickr-post">
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
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="clearfix"></div>
		
	</div>
</div> -->
<!-- //footer -->
<!-- login -->
			<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
						</div>
						<div class="modal-body modal-spa">
							<div class="login-grids">
								<div class="login">
									<div class="login-bottom">
										<h3>Sign up for free</h3>
										<form>
											<div class="sign-up">
												<h4>Email :</h4>
												<input type="text" value="Type here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Type here';}" required="">	
											</div>
											<div class="sign-up">
												<h4>Password :</h4>
												<input type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="">
												
											</div>
											<div class="sign-up">
												<h4>Re-type Password :</h4>
												<input type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="">
												
											</div>
											<div class="sign-up">
												<input type="submit" value="REGISTER NOW" >
											</div>
											
										</form>
									</div>
									<div class="login-right">
										<h3>Sign in with your account</h3>
										<form>
											<div class="sign-in">
												<h4>Email :</h4>
												<input type="text" value="Type here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Type here';}" required="">	
											</div>
											<div class="sign-in">
												<h4>Password :</h4>
												<input type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="">
												<a href="#">Forgot password?</a>
											</div>
											<div class="single-bottom">
												<input type="checkbox"  id="brand" value="">
												<label for="brand"><span></span>Remember Me.</label>
											</div>
											<div class="sign-in">
												<input type="submit" value="SIGNIN" >
											</div>
										</form>
									</div>
									<div class="clearfix"></div>
								</div>
								<p>By logging in you agree to our <a href="#">Terms and Conditions</a> and <a href="#">Privacy Policy</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
<!-- //login -->
</body>
</html>
