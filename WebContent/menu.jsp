<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.smartshop.pojo.ProductCategoryPojo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>


<div class="container">
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
					<li class="active menu__item menu__item--current"><a class="menu__link" href="ProductDetailsController">Home <span class="sr-only">(current)</span></a></li>
					
					
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
									<c:if test="${productCategory.key=='OTHERGIFTS'}">
									 <img src="images/1.jpg" alt=" "/>${productCategory.key}
									</c:if>
									</div>
									<div class="col-sm-3 multi-gd-img">
									
										<ul class="multi-column-dropdown">
										<c:forEach items="${productCategory.value}" var="category" varStatus="index">
										
											<li><b><a href="ProductDetailsController?action=searchByCategory&code=${category.code}">${category.description}</a></b></li>
										
											
										<%-- 	<a href="ProductDetailsController?action=searchByCategory&code=${category.code}"></a> --%>
											<c:forEach items="${subcategoryList}" var="subcategoryList" varStatus="index">
											<c:if test="${category.code==subcategoryList.key}">
											<c:forEach var="subcategory" items="${subcategoryList.value }">
											<li ><a style="margin-left:30px;" href="ProductDetailsController?action=searchBySubCategory&code=${subcategory.sub_category_code}"><i class="glyphicon glyphicon-arrow-right"></i> ${subcategory.sub_category_desc}</a></li>
											</c:forEach>
											</c:if>
											</c:forEach>
											</c:forEach>
										</ul>
										
									</div>
									
									<div class="clearfix"></div>
								</div>
							</ul>
					</li>
					
 			</c:forEach> 




					
					
					
					
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
          
            <%--  <li class=" menu__item"><a class="menu__link" href="UserController?action=userList&user_id=<%=session.getAttribute("email")%>">Friend Suggestions</a></li>
             
             <li class=" menu__item"><a class="menu__link" href="ProductDetailsController?action=recommendation&user_id=<%=session.getAttribute("email")%>">Recommendation</a></li> --%>
             <li class=" menu__item"><a class="menu__link" href="LogoutController">Logout</a></li>
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
						<p><a class="simpleCart_empty">Cart List</a></p>
						
			</div>	
		</div>
		</c:if>
		<div class="clearfix"></div>
	</div>