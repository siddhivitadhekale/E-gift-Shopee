<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
js
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script> -->
<!-- //js -->
<!-- single -->
<script src="js/imagezoom.js"></script>
<script src="js/jquery.flexslider.js"></script>
<!-- single -->
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
ul
{
list-style-type:none;
text-decoration:none;
}
</style>

</head>
<script type="text/javascript">

function quantityChange(){
	var quantity=$("#quantity").val();
    //alert("The text has been changed.");
    var newurl="ProductDetailsController?action=addToCart&id=${productDetailsPojo.product_id}&price=${productDetailsPojo.product_price}&quantity="+quantity;
    $("#hyperlink").attr("href",newurl);
}

</script>



<body>
<!-- header -->
<div class="header">
	<div class="container">
		<ul>
			
		</ul>
	</div>
</div>
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
		<h3>Single</h3>
	</div>
</div>
<!-- //banner -->
<!-- single -->
<div class="single">
	<div class="container">
		<div class="col-md-6 single-right-left animated wow slideInUp animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: slideInUp;">
			<div class="grid images_3_of_2">
				<div class="flexslider">
					<!-- FlexSlider -->
						<script>
						// Can also be used with $(document).ready()
							/* $(window).load(function() {
								$('.flexslider').flexslider({
								animation: "slide",
								controlNav: "thumbnails"
								});
							}); */
						</script>
					<!-- //FlexSlider-->
					<ul class="slides">
						<li data-thumb="images/d2.jpg">
							<div class="thumb-image"> <img src="${productDetailsPojo.product_path}" data-imagezoom="false" class="img-responsive" style="width:200px">  </div>
						</li>
						
					</ul>
					<div class="clearfix"></div>
				</div>	
			</div>
		</div>
		<div class="col-md-6 single-right-left simpleCart_shelfItem animated wow slideInRight animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: slideInRight;">
					<h3>${productDetailsPojo.product_des}</h3>
					<p><span class="item_price">${productDetailsPojo.product_price}</span> <del></del></p>
					<div class="rating1">
						<span class="starRating">
							<input id="rating5" type="radio" name="rating" value="5">
							<label for="rating5">5</label>
							<input id="rating4" type="radio" name="rating" value="4">
							<label for="rating4">4</label>
							<input id="rating3" type="radio" name="rating" value="3" checked="">
							<label for="rating3">3</label>
							<input id="rating2" type="radio" name="rating" value="2">
							<label for="rating2">2</label>
							<input id="rating1" type="radio" name="rating" value="1">
							<label for="rating1">1</label>
						</span>
					</div>
					
					<div class="color-quality">
						<div class="color-quality-right">
							<h5>Quantity :</h5>
							<!-- onchange="change_country(this.value)" -->
							<select id="quantity" name="quantity" onchange="quantityChange();"  class="frm-field required sect">
							<option value="">select</option>
								<option value="1">1 Qty</option>
								<option value="2">2 Qty</option> 
								<option value="3">3 Qty</option>					
								<option value="4">4 Qty</option>		
								<option value="5">5 Qty</option>									
							</select>
						</div>
					</div>
					<div class="occasional">
						<h5>Properties :</h5>
						<div class="colr ert">
							<label>Size:<i></i>${productDetailsPojo.product_size}</label>
						</div>
						<div class="colr ert">
							<label>Fabrics:<i></i>${productDetailsPojo.product_fabrics}</label>
						</div>
						<div class="colr ert">
							<label>Material:<i></i>${productDetailsPojo.product_material}</label>
						</div>
						<div class="colr ert">
							<label>Color:<i></i>${productDetailsPojo.product_color}</label>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="occasion-cart">
					
					<c:if test="${not empty email }">
						<a id="hyperlink" href="" class="item_add hvr-outline-out button2">Add to cart</a>
					</c:if>
					<c:if test="${empty email }">
					
					<a  href="" onclick="alert('Please Do Login');return false;" class="item_add hvr-outline-out button2">Add to cart</a>
					</c:if>
					</div>
					
		</div>
		
		
		
		
		
		<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
				<ul class="resp-tabs-list">
				
					<li class="resp-tab-item resp-tab-active" aria-controls="tab_item-0" role="tab"><span>Product By Apriori</span></li> 
					
       
					<!-- <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>Special Offers</span></li> 
					<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>Collections</span></li>  -->
					<!-- <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Latest Designs</span></li>  -->
					
				
				</ul>				  	 
				<div class="resp-tabs-container">
					<h2 class="resp-accordion resp-tab-active" role="tab" aria-controls="tab_item-0"><span class="resp-arrow"></span>Product By Apriori</h2>
					
					<div class="tab-1 resp-tab-content resp-tab-content-active" aria-labelledby="tab_item-0" style="display:block">
						
						<c:forEach items="${productDetailsPojoList1}" var="productViewList">
						
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
		
		
		
				<div class="clearfix"> </div>

				<div class="bootstrap-tab animated wow slideInUp animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: slideInUp;">
					<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
						
						<div id="myTabContent" class="tab-content">
							
							<div role="tabpanel" class="tab-pane fade bootstrap-tab-text" id="profile" aria-labelledby="profile-tab">
								<div class="bootstrap-tab-text-grids">
									<div class="bootstrap-tab-text-grid">
										<div class="bootstrap-tab-text-grid-left">
											<img src="images/men3.jpg" alt=" " class="img-responsive">
										</div>
										<div class="bootstrap-tab-text-grid-right">
											<ul>
												<li><a href="#">Admin</a></li>
												<li><a href="#"><span class="glyphicon glyphicon-share" aria-hidden="true"></span>Reply</a></li>
											</ul>
											<p>Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis 
												suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem 
												vel eum iure reprehenderit.</p>
										</div>
										<div class="clearfix"> </div>
									</div>
									
									<div class="add-review">
										<h4>add a review</h4>
										<form>
											<input type="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
											<input type="email" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required="">
											
											<textarea type="text" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message...';}" required="">Message...</textarea>
											<input type="submit" value="SEND">
										</form>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade bootstrap-tab-text" id="dropdown1" aria-labelledby="dropdown1-tab">
								<p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork. Williamsburg banh mi whatever gluten-free, carles pitchfork biodiesel fixie etsy retro mlkshk vice blog. Scenester cred you probably haven't heard of them, vinyl craft beer blog stumptown. Pitchfork sustainable tofu synth chambray yr.</p>
							</div>
							<div role="tabpanel" class="tab-pane fade bootstrap-tab-text" id="dropdown2" aria-labelledby="dropdown2-tab">
								<p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater. Lomo wolf viral, mustache readymade thundercats keffiyeh craft beer marfa ethical. Wolf salvia freegan, sartorial keffiyeh echo park vegan.</p>
							</div>
						</div>
					</div>
				</div>
	</div>
</div>
<!-- //single -->
<!-- //product-nav -->
<jsp:include page="footer.jsp"/>
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
