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
<script src="js/steel.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- <style>
ul
{
list-style-type:none;
text-decoration:none;
}

.credit-card-box { margin:50px auto; width:500px;}

/* CSS for Credit Card Payment form */
.credit-card-box .panel-title {
    display: inline;
    font-weight: bold;
}
.credit-card-box .form-control.error {
    border-color: red;
    outline: 0;
    box-shadow: inset 0 1px 1px rgba(0,0,0,0.075),0 0 8px rgba(255,0,0,0.6);
}
.credit-card-box label.error {
  font-weight: bold;
  color: red;
  padding: 2px 8px;
  margin-top: 2px;
}
.credit-card-box .payment-errors {
  font-weight: bold;
  color: red;
  padding: 2px 8px;
  margin-top: 2px;
}
.credit-card-box label {
    display: block;
}
/* The old "center div vertically" hack */
.credit-card-box .display-table {
    display: table;
}
.credit-card-box .display-tr {
    display: table-row;
}
.credit-card-box .display-td {
    display: table-cell;
    vertical-align: middle;
    width: 100%;
}
/* Just looks nicer */
.credit-card-box .panel-heading img {
    min-width: 180px;
}
#textCanvas {
  display:none;
}

.wrap {
  padding:30px;
}

p {
  background-color:#ddd;
  padding:20px;
  border:1px solid #ccc;
}
</style> -->
<script src="javascripts/jquery.min.js"></script>
<script src="javascripts/cryptostego.min.js"></script>
<script>
function writeIMG(){
    function writefunc(){
    	//alert("message"+$("#msg").val());
        if(writeMsgToCanvas('canvas',$("#msg").val(),$("#pass").val(),3)!=null){ 
        var myCanvas = document.getElementById("canvas");  
        var image = myCanvas.toDataURL("image/jpeg",1.0);    
        var element = document.createElement('a');
        element.setAttribute('href', image);
        element.setAttribute('download', 'resultstegno.jpg');
        element.style.display = 'none';
        document.body.appendChild(element);
        element.click();
        document.body.removeChild(element);        
    }
    }
    loadIMGtoCanvas('file','canvas',writefunc,500);
}
function readIMG(){
    function readfunc(){
        var t=readMsgFromCanvas('canvas',$("#pass1").val(),3);
        //alert("tttttt"+t);
       $("#keyvalue12").val(t);
        if(t!=null){
            t=t.split('&').join('&amp;');
            t=t.split(' ').join('&nbsp;'); 
            t=t.split('<').join('&lt;');
            t=t.split('>').join('&gt;');
            t=t.replace(/(?:\r\n|\r|\n)/g, '<br />');
            $("#result").html(t);
        }else
        	{
        	$("#result").html('ERROR REAVEALING MESSAGE!');
        	}
        sendKey();
             
    }
    loadIMGtoCanvas('file1','canvas',readfunc);
   
}
</script>

<script>
function retriveKey()
{ 	
	var email =$("#email").val();

	//alert("email"+email);
	 // $("#myModal").modal("show");
	  
	  
	  $.ajax({
	  		method: 'POST',
	  		url: "UserController", 
	  		data : {email:email, action : 'searchUserTransction'},
	  		success: function(data)
	  		{
	  			//alert("data"+data)
	  			if(data)
	  				{
	  			 /* 	$("#keyvalue1").val(data); */
	  			 	
	  			 	
	  			  $("#myModal").modal("show");
	  				}
	  			else
	  				{
	  				alert("please fill details");
	  				}
	  			}
	      }); 
	  
	  
}

function sendKey()
{ 	
	var keyvalueget =$("#keyvalue12").val();
	var email1 =$("#email1").val();
	//alert("keyvalue"+keyvalueget);
	//alert("email1"+email1);
	 $("#myModal").modal("hide");
	  
	  
	   $.ajax({
	  		method: 'POST',
	  		url: "UserController", 
	  		data : {email1:email1,keyvalueget:keyvalueget, action : 'sendKey'},
	  		success: function(data)
	  		{
	  			//alert("data"+data)
	  			if(data)
	  				{
	  				
	  				
	  			  $("#myModal1").modal("show");
	  				}
	  			/* else
	  				{
	  				alert("please fill details");
	  				} */
	  			}
	      }); 
	   
	  
} 

function fetchDetails()
{ 	
	var keytext =$("#keytext").val();
	//var email1 =$("#email1").val();
	//alert("keytext"+keytext);
	
	
	  
	  
	    $.ajax({
	  		method: 'POST',
	  		url: "UserController", 
	  		data : {keytext:keytext, action : 'decryption'},
	  		success: function(data)
	  		{
	  			//alert("data"+data)
	  			if(data)
	  				{
	  				
	  				$("#cardno").val(data.card_number);
	  				$("#cardExpiry").val(data.expiry_date);
	  				$("#cvv").val(data.cvv);
	  				$("#name").val(data.card_name);
	  				//$("#myModal1").modal("hide");
	  				}
	  			
	  			}
	      });   
	   
	  
} 


</script>


<script>

$(document).ready(function(){
	
	$("#cardpayment").click(function(){
		
		
		$("#carddiv").show();
		$("#coddiv").hide();
		
	});
	
	
	$("#cod").click(function(){
		
		$("#coddiv").show();
		$("#carddiv").hide();
		
	})
	
	
	
})


</script>

</head>
<script type="text/javascript">

function quantityChange(){
	var quantity=$("#quantity").val();
    //alert("The text has been changed.");
    var newurl="ProductDetailsController?action=addToCart&id=${productDetailsPojo.product_id}&price=${productDetailsPojo.product_price}&quantity="+quantity;
    $("#hyperlink").attr("href",newurl);
}

</script>


<style>

ul li
{

list-style-type: none;
display: inline;
}

</style>
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
         
 
  <div class="row" style="margin:20px;">
  <!-- <div class="col-sm-offset-3 col-sm-3"><a  class="item_add single-item hvr-outline-out button2" data-toggle="modal" data-target="#myModal">Fetch Details</a></div>
   -->
  
  
  
  <div id="myModal" class="modal fade" role="dialog"  >
  <div class="modal-dialog" >

    <!-- Modal content-->
    <div class="modal-content" style="width:500px">
      
      <div class="modal-body">
      <img src="">
      <div class="wrap">
	
	
	<input type="hidden" id="message" placeholder="Enter your secret message" value="<%session.getAttribute("keyvalue") ;%>"></br>
	
	 <%-- <input type="file" id="imageLoader" name="imageLoader"/>
	<canvas id="imageCanvas"></canvas>
	<canvas id="textCanvas"></canvas>
	<hr>
	<h2>Decode an image</h2>
	<label>Upload an image:</label><br/>
	<input type="file" id="imageLoader2" name="imageLoader2"/>
	<canvas id="imageCanvas2"></canvas> --%> 
</div>
      Select an image: <input type="file" id="file1" accept="image/*" /> 
      <img src=""/>
      <input type="hidden" style="color:black "   id="email1" value="${email}" required="required" readonly="readonly">
      <input type="hidden" style="color:black "   id="keyvalue12"  required="required" readonly="readonly" >
      	<!-- <input type="submit" value="Get Key"    onclick="sendKey();"> -->
       <a  class="item_add single-item hvr-outline-out button2 text-center" style="margin:30px;text-align:center" onclick='readIMG()'>Get Key</a> 
         
      </div>
     
  </div>
  </div>
  </div>
 <!--  <div id="myModal1" class="modal fade" role="dialog">
  <div class="modal-dialog" style="width:500px;">

    Modal content
    <div class="modal-content">
      
      <div class="modal-body">
      <label>Enter Key</label>
      <input type="text" id="keytext" class="form-control">
       <a  class="item_add single-item hvr-outline-out button2 " style="margin:30px;" data-toggle="modal" data-target="#myModal1" onclick="fetchDetails();">submit</a>
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
     
  </div>
  </div> -->
  </div>
  <div id="signup" class="tab-pane fade in ">
						
					<!--	<div class="modal-body modal-spa">
							<div class="login-grids">
								<div class="login">-->
								
								<ul>
								<li><input type="submit" class="btn btn-primary" value="Cash on Delivery!!!" id="cod"></li>
								<li><input type="submit" class="btn btn-primary" value="Card Payment!!!" id="cardpayment"></li>
								<li></li>
								</ul>
								
								 
									<div class="login-bottom" style="display:none" id="carddiv">
										<h3>Payment Details</h3>
										<form action="UserController" method="post" onsubmit="return scan();">
											<div class="sign-up">
											<input type="hidden" style="color:black "   id="email" value="${email}" required="required" readonly="readonly">
												<h4>Total Amount to be paid:</h4>
												<input type="text" style="color:black "  name="totalprice" value="${totalprice}" required="required" readonly="readonly">	
											</div>
											<!-- <div class="sign-up">
												<input type="submit" value="FETCH DETAILS"    onclick="retriveKey();">
											</div> -->
											<div class="sign-up">
												<h4>CARD NO.:</h4>
												<input type="text"  style="color:black " name="cardno" id="cardno" value="" placeholder="Valid Card Number"  required="required" pattern="^\d{16}$" title="Enter 16 digit Mobile Number">	
											</div>
											<div class="sign-up">
												<h4>EXPIRATION DATE:</h4>
												<input type="text"  style="color:black " name="cardExpiry" id="cardExpiry" value="" placeholder="MM /YY" required="required">	
											</div>
											
											
											<div class="sign-up">
												<h4>CVV:</h4>
												<input type="text" style="color:black " name="cvv" value="" id="cvv" placeholder="CVV" required="required" pattern="^\d{3}$" title="Enter 3 digit Mobile Number">
												
											</div>
											<div class="sign-up">
												<h4>CARD HOLDER NAME:</h4>
												<input type="text" style="color:black " name="name" id="name" required="required">
												
											</div >
											
											<%-- <div class="sign-up">
											  <h5>HIDE ENCRYPTION KEY INTO AN IMAGE</h5>
                                                     <h4>SELECT : <input type="file" id="file" accept="image/*" /> <br /><br />

											<br /><input type="hidden" value ="<%=session.getAttribute("saltStr")%>" id="msg" style="width:100%;height:80px;" ></textarea> <br /><br />
                                            <!-- <button onclick='writeIMG()'>Hide My message to this Image</button>  --> 
											
											
											</div>
											 --%>
											
											<div class="sign-up">
												<input type="submit" value="PAY" name="action" >
											</div>
											
										</form>
									</div>
									<div class="login-bottom" style="display:none" id="coddiv">
									
									<h2>Cash On Delivery</h2>
									<form action="UserController" method="post">
									<div class="sign-up">
												<h4>Total Amount to be paid:</h4>
												<input type="text" style="color:black "  name="totalprice" value="${totalprice}" required="required" readonly="readonly">	
											</div>
											
										<div class="sign-up">
												<h4>Enter Delivery Address</h4>
												<input type="text" style="color:black "  name="address"  required="required" >	
											</div>	
											
											<div class="sign-up">
												<input type="submit" value="Add" name="action" >
											</div>
											</form>
											
									</div>
											</div>
												
									
									</div>           
<!-- CREDIT CARD FORM ENDS HERE -->


</div>            



</div>
</div>

	<!-- If you're using Stripe for payments -->
<script type="text/javascript" src="https://js.stripe.com/v2/"></script>
	
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
				<script>var $form = $('#payment-form');
				$form.on('submit', payWithStripe);

				/* If you're using Stripe for payments */
				function payWithStripe(e) {
				    e.preventDefault();

				    /* Visual feedback */
				    $form.find('[type=submit]').html('Validating <i class="fa fa-spinner fa-pulse"></i>');

				    var PublishableKey = 'pk_test_b1qXXwATmiaA1VDJ1mOVVO1p'; // Replace with your API publishable key
				    Stripe.setPublishableKey(PublishableKey);
				    
				    /* Create token */
				    var expiry = $form.find('[name=cardExpiry]').payment('cardExpiryVal');
				    var ccData = {
				        number: $form.find('[name=cardNumber]').val().replace(/\s/g,''),
				        cvc: $form.find('[name=cardCVC]').val(),
				        exp_month: expiry.month, 
				        exp_year: expiry.year
				    };
				    
				    Stripe.card.createToken(ccData, function stripeResponseHandler(status, response) {
				        if (response.error) {
				            /* Visual feedback */
				            $form.find('[type=submit]').html('Try again');
				            /* Show Stripe errors on the form */
				            $form.find('.payment-errors').text(response.error.message);
				            $form.find('.payment-errors').closest('.row').show();
				        } else {
				            /* Visual feedback */
				            $form.find('[type=submit]').html('Processing <i class="fa fa-spinner fa-pulse"></i>');
				            /* Hide Stripe errors on the form */
				            $form.find('.payment-errors').closest('.row').hide();
				            $form.find('.payment-errors').text("");
				            // response contains id and card, which contains additional card details            
				            console.log(response.id);
				            console.log(response.card);
				            var token = response.id;
				            // AJAX - you would send 'token' to your server here.
				            $.post('/account/stripe_card_token', {
				                    token: token
				                })
				                // Assign handlers immediately after making the request,
				                .done(function(data, textStatus, jqXHR) {
				                    $form.find('[type=submit]').html('Payment successful <i class="fa fa-check"></i>').prop('disabled', true);
				                })
				                .fail(function(jqXHR, textStatus, errorThrown) {
				                    $form.find('[type=submit]').html('There was a problem').removeClass('success').addClass('error');
				                    /* Show Stripe errors on the form */
				                    $form.find('.payment-errors').text('Try refreshing the page and trying again.');
				                    $form.find('.payment-errors').closest('.row').show();
				                });
				        }
				    });
				}
				/* Fancy restrictive input formatting via jQuery.payment library*/
				$('input[name=cardNumber]').payment('formatCardNumber');
				$('input[name=cardCVC]').payment('formatCardCVC');
				$('input[name=cardExpiry').payment('formatCardExpiry');

				/* Form validation using Stripe client-side validation helpers */
				jQuery.validator.addMethod("cardNumber", function(value, element) {
				    return this.optional(element) || Stripe.card.validateCardNumber(value);
				}, "Please specify a valid credit card number.");

				jQuery.validator.addMethod("cardExpiry", function(value, element) {    
				    /* Parsing month/year uses jQuery.payment library */
				    value = $.payment.cardExpiryVal(value);
				    return this.optional(element) || Stripe.card.validateExpiry(value.month, value.year);
				}, "Invalid expiration date.");

				jQuery.validator.addMethod("cardCVC", function(value, element) {
				    return this.optional(element) || Stripe.card.validateCVC(value);
				}, "Invalid CVC.");

				validator = $form.validate({
				    rules: {
				        cardNumber: {
				            required: true,
				            cardNumber: true            
				        },
				        cardExpiry: {
				            required: true,
				            cardExpiry: true
				        },
				        cardCVC: {
				            required: true,
				            cardCVC: true
				        }
				    },
				    highlight: function(element) {
				        $(element).closest('.form-control').removeClass('success').addClass('error');
				    },
				    unhighlight: function(element) {
				        $(element).closest('.form-control').removeClass('error').addClass('success');
				    },
				    errorPlacement: function(error, element) {
				        $(element).closest('.form-group').append(error);
				    }
				});

				paymentFormReady = function() {
				    if ($form.find('[name=cardNumber]').hasClass("success") &&
				        $form.find('[name=cardExpiry]').hasClass("success") &&
				        $form.find('[name=cardCVC]').val().length > 1) {
				        return true;
				    } else {
				        return false;
				    }
				}

				$form.find('[type=submit]').prop('disabled', true);
				var readyInterval = setInterval(function() {
				    if (paymentFormReady()) {
				        $form.find('[type=submit]').prop('disabled', false);
				        clearInterval(readyInterval);
				    }
				}, 250);


				/*
				https://goo.gl/PLbrBK
				*/</script>
			</div>
<!-- //login -->
</body>
</html>
