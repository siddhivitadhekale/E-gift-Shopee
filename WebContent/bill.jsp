<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@page import="com.smartshop.pojo.*" %>
 <%@page import="java.util.*" %>
<html>
<head>
<title>Shopping Hub</title>
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
<script>
<%-- $(document).ready(function() {
	String email= <%session.getAttribute("email");%>;
	alert(email);
}); --%>

function deleteRow(rowID)
{
	alert("rowID"+rowID);
	   if (confirm("Do you want to delete the product!") == true) {
		   $.ajax({
		  		method: 'POST',
		  		url: "ProductDetailsController", 
		  		data : {rowID:rowID, action : 'deleteProductFromCart'},
		  		success: function(data)
		  		{
		  			window.location.href = "cartList1.jsp";
		  			
		  		}
		      });
	   }
	   else
	  {
		    alert("you selected cancel");
	        return false;  
	  }
}


function friendRequest(productid)
{
	  document.getElementById("friendlist").innerHTML = '';
	
	  $("#request").modal("show");
	  var product_id=productid
	  //alert("productid"+product_id);
	  
	  $("#productid").val(product_id);
			var email=$("#emailid").val();
			 //alert("Email:: "+email);
					
			$.ajax({
		  		method: 'POST',
		  		url: "UserController", 
		  		data : {user_id:email, action : 'userList'},
		  		success: function(data)
		  		{
		  			//alert("okkkkkkkkkkk::"+data+"RowID::"+rowID);
		  			
		  			 $.each(data, function(i, item) {
		  				 
						  $('#friendlist').append(
					                '<tr>'
					                  +'<td id="toCheck" ><input type="checkbox" name="recommendcheck" value="'+item.to_friend+'"/></td>'
					                  +'<td id="to_friend">'+item.to_friend+'</td>' 
					                 
					                 +'</tr>'
					             );
					  });
		  		}
		      });
	
}






</script>

<script type="text/javascript">


function recommend()
{
	alert(123);
	
	 var fromuser=$("#from_user").val();
	alert("fromuser"+fromuser); 
	
	 var productid=$("#productid").val();
		alert("productid"+productid); 
	
	$("input:checkbox[name=recommendcheck]:checked").each(function(){
		var to_friend=$(this).val();
		//alert($(this).val());
		//alert("to_friend"+to_friend);
		
		
		$.ajax({
	  		method: 'POST',
	  		url: "UserController", 
	  		data : {fromuser:fromuser,productid:productid,to_friend:to_friend, action:"recommendToFriend"},
	  		success: function(data)
	  		{
	  			//alert("data"+data);
	  			window.location.href="cartList1.jsp";
	  			/* //alert("okkkkkkkkkkk::"+data+"RowID::"+rowID);
	  			
	  			 $.each(data, function(i, item) {
	  				 
					  $('#friendlist').append(
				                '<tr>'
				                  +'<td ><input type="checkbox"/></td>'
				                  +'<td >'+item.to_friend+'</td>' 
				                 
				             );
				  }); */
	  		}
	      }); 
		
	});
	
			
	 
}

</script>

<script type="text/javascript">


function checkout()
{
	
	
	alert(123);
	
	 var fromuser=$("#from_user").val();
	alert("fromuser"+fromuser); 
	
	
	
	$("input:checkbox[name=Checkproduct]:checked").each(function(){
		var productid=$(this).val();
		alert($(this).val());
		alert("productid"+productid);
		amount = parseInt( $("#totalprice"+productid).val())+parseInt(amount);
		alert("amount"+amount);
		
		productidArray=productid;
		
		
		
		$.ajax({
	  		method: 'POST',
	  		url: "UserController", 
	  		data : {productid:productid,fromuser:fromuser,amount:amount, action:"checkOut"},
	  		success: function(data)
	  		{
	  			//alert("data"+data);
	  			window.location.href="cartList1.jsp";
	  			/* //alert("okkkkkkkkkkk::"+data+"RowID::"+rowID);
	  			
	  			 $.each(data, function(i, item) {
	  				 
					  $('#friendlist').append(
				                '<tr>'
				                  +'<td ><input type="checkbox"/></td>'
				                  +'<td >'+item.to_friend+'</td>' 
				                 
				             );
				  }); */
	  		}
	      }); 
		
	});
	
			
	 
}

</script>



</head>
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
		<h3>Check Out</h3>
	</div>
</div>
<!-- //banner -->
<!-- check out -->
<div class="checkout">
	<div class="container">
	<div id="request" class="modal fade" role="dialog" >
  <div class="modal-dialog" >

    <!-- Modal content-->
    <div class="modal-content" style="">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
       <span class="text-center" style="font-size:18px">recommanded to friends </span>
      </div>
      <div class="modal-body text-center">
	   <input type="hidden" id="productid" name="productid">
	   <input type="hidden" id="from_user" name="from_user" value="<%=session.getAttribute("email")%>">
	<table class="table-bordered" style="width:90%">
	
	 <tbody id="friendlist">
	
		 </table><br><button class="btn btn-sm btn-primary" onclick="recommend();">submit</button>
		   </div>
	
	   </div>
	    </div>
		 </div>
		 
		 
		<h3>INVOICE</h3>
		<form action="UserController" method="post">
		 <input type="hidden" id="from_user" name="from_user" value="<%=session.getAttribute("email")%>">
		<div class="table-responsive checkout-right animated wow slideInUp" data-wow-delay=".5s">
			<table class="timetable_sub">
				
				
				<%int count=1; %>
				<%-- <c:forEach items="${transctionProductList}" var="cartList"> --%>
				
				<%-- <%
				
				List<ProductCartPojo> list = (List<ProductCartPojo>)session.getAttribute("transctionProductList");
				System.out.print("jsjds"+list.size());
				Iterator itr = list.iterator();
				System.out.print("jdhsjd"+itr.hasNext());
				while(itr.hasNext())
				{
					
					ProductCartPojo p = (ProductCartPojo)itr.next();
					 System.out.print("jjdhdsds"+p.getId());
					%>
					
					<tr class="rem1" id="RowId${cartList.product_id}">
					<td><%=count %></td>
					 <td><%=p.getPrice() %></td>
					<input type="hidden" id="totalprice${cartList.product_id}" value="${cartList.total_price}"/>
			
							
					<td class="invert"><a href="" data-toggle="modal" data-target="#request" onclick="friendRequest(${cartList.product_id});">request</a></td> 
					<td  style="display: none;"><input type="hidden" value="${email}" id="emailid"></td>	
					</tr>
					
				
					
				<% }
				
				%>
				
				 --%>
				<%-- <td id="toCheckProduct"><input type="checkbox" name="Checkproduct" value="${cartList.product_id}"/></td> --%>
				
						<%-- <td class="invert-closeb">
						<span class="glyphicon glyphicon-trash" onclick="deleteRow(${cartList.id});"></span>
							<!-- <div class="rem">
								<div class="close1"> </div>
							</div> -->
							<span onclick="deleteRow(${cartList.id});"></span>
							<!-- <script>$(document).ready(function(c) {
								$('.close1').on('click', function(c){
									$('.rem1').fadeOut('slow', function(c){
										$('.rem1').remove();
									});
									});	  
								});
						   </script> -->
						</td> --%>
					
						
						
						<%-- <td class="invert" id="price${cartList.product_id}">${cartList.total_price}</td>
						 --%>
				
				<%-- 	</c:forEach> --%>
					
		
					
					<tr style="background:#FDA30E;font-size:17px;"><td colspan="2" style="text-align:center;color:white">TOTAL AMOUNT:  <%=session.getAttribute("totalprice") %></td>
								<script>
									$('.value-plus').on('click', function(){
										var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)+1;
										divUpd.text(newVal);
									});

									$('.value-minus').on('click', function(){
										var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)-1;
										if(newVal>=1) divUpd.text(newVal);
									});
									</script>
								
			</table>
		</div>
		
		<div class="row"><br>
		<!-- 		<button type="submit" class=" col-md-offset-10 col-md-1 btn btn-success" style="text-align:right" value="checkOut" name="action">Checkout</button> -->
		</div>
		</form>
		<!-- <div class="checkout-left">	
				
				<div class="checkout-right-basket animated wow slideInRight" data-wow-delay=".5s">
					
				</div>
				<div class="checkout-left-basket animated wow slideInLeft" data-wow-delay=".5s">
					<h4>Shopping basket</h4>
					<ul>
						<li>Hand Bag <i>-</i> <span>$45.99</span></li>
						<li>Watches <i>-</i> <span>$45.99</span></li>
						<li>Sandals <i>-</i> <span>$45.99</span></li>
						<li>Wedges <i>-</i> <span>$45.99</span></li>
						<li>Total <i>-</i> <span>$183.96</span></li>
					</ul>
				</div>
			 <div class="clearfix"> </div>
			</div> -->
	</div>
</div>	
<!-- //check out -->
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
