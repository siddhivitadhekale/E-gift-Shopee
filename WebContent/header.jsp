<!DOCTYPE html>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<html>
 
<head>
<link href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" rel="Stylesheet"></link>
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js" ></script>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->


  <script src="js/bootstrap-3.1.1.min.js"></script>
  
  <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- pignose css -->
<link href="css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />


<!-- //pignose css -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->


<script type="text/javascript">

	jQuery(document).on("focus keyup","#searchproduct",function(event){
		//alert("1111");
		$(this).autocomplete({
			source : function(request, response) {	
			var searchString = request.term ;
			//alert("symptom1"+searchString);
			$.ajax({
				 type:"POST",
		  		 url : "ProductDetailsController",
		  		 data : {searchString:searchString, action:"productList"},
				success : function(data)
				{
					//alert(data);
					response($.map(data, function(value, key)  {
						//alert(value.product_name);
						
						return {		
						  label :value.product_cat+" "+ value.product_name,
						  value1:value.product_name,
						  value:value.product_id
						/* $("#symptom1").val(value.symptoms_name); */

						}
						}));

				}
				});
			
			
			
			
			
				},
				dataType : 'jsonp',
				jsonp : 'json.wrf',
				/* cache: false */
				
				 select:function (event, ui) {
			            var v = ui.item.value1;
			           // alert(" v"+ v);
			            var v1=ui.item.value;
			         
			            $('#product').val(v1);
			            // update what is displayed in the textbox
			            this.value = v; 
			            return false;
			        }
									
				
				
				});		
			
		
		
	
	  	
    }); 
    
</script>
</head>






<div class="container">
<div class="header-bot">
	<div class="container">
		<div class="col-md-3 header-left">
			<h1><a href="index.jsp"><span style="width:80px;">EGift </span></a></h1>
		</div>
	<!-- 	<div class="col-md-6 header-middle">
		<form action="ProductDetailsController" method="GET">
		<form action="ProductDetailsController?action=productDetail" method="post">
			<input class="text" type="hidden" id="product" name="id">
				<div class="search"> 
					<input class="" type="search" id="searchproduct"   placeholder="Search">
				 </div> 
				<div class="section_room">
					<select id="country" onchange="change_country(this.value)" class="frm-field required">
					<option value="null">All categories</option>
					<option value="MENSWEAR">MENSWEAR</option>
					<option value="WOMENSWEAR">WOMENSWEAR</option>
					
				</select> 
					
				</div>
				<div class="sear-sub">
					<input type="submit"  name="action" value="productDescription">
					<button type="submit" class="btn btn-primary" name="action" value="productDescription"><i class="glyphicon glyphicon-search "></i></button>
				</div>
				<div class="clearfix"></div>
			</form>
		</div>
	
		<div class="clearfix"></div> -->
		<div class="col-md-6">
		<form action="ProductDetailsController" method="GET">
		<input class="text" type="hidden" id="product" name="id">
		<div class="input-group" style="height:50px;">
		
    <input type="text" class="form-control" placeholder="Search" style="height:50px;" id="searchproduct"   placeholder="Search">
    <div class="input-group-btn" style="height:50px;">
   
      <button class="btn " type="submit" style="background-color:#fda30e;height:50px;width:50px;" name="action" value="productDescription">
    
      
        <i class="glyphicon glyphicon-search" ></i>
      </button>
    </div>
  
  </div>
		</form>
		</div>
		
	</div>
</div>

				</div>
			</div>
</div>
</div>
