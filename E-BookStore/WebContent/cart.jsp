
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>E-Book Store</title>
<meta charset="UTF-8">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="resources/resources.jsp"></jsp:include>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="./css/custom_css/cart.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/custom_js/login.js"></script>
</head>

<!-- <body class="w3-light-grey w3-content" style="max-width: 1600px"> -->
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<!-- Sidebar/menu -->
	<!-- <nav class="w3-sidebar w3-collapse w3-white w3-animate-left"
		style="z-index: 3; width: 300px;" id="mySidebar">
		<br>
		<div class="w3-container">

			<h4>
				<b>Categories</b>
			</h4>
			<br>
			<p class="w3-text-grey">Books</p>
		</div>
		<div class="w3-bar-block">
			<a href="#portfolio" onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding w3-text-teal">Novels</a> <a
				href="#about" onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding">Encyclopedia</a> <a
				href="#contact" onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding">Comics</a> <a
				href="#contact" onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding">Engineering</a>

		</div>
	</nav> -->

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<!-- <div class="w3-main" style="margin-left: 300px"> -->

		<!-- Header -->

		<!-- <a href="#"><img src="/w3images/avatar_g2.jpg"
			style="width: 65px;"
			class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a> -->
		<span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
			onclick="w3_open()"><i class="fa fa-bars"></i></span>
		<div class="w3-container">
			

			
			<div class="container">
			<br />
			<h1>
				<b>Shopping Cart</b>
			</h1>
			<br>
			<p></p>
				<table id="cart" class="table table-hover table-condensed">
					<thead>
						<tr>
							<th style="width: 50%">Product</th>
							<th style="width: 10%">Price</th>
							<th style="width: 8%">Quantity</th>
							<th style="width: 22%" class="text-center">Subtotal</th>
							<th style="width: 10%">Action</th>
						</tr>
					</thead>
					
					<tbody>
					<c:forEach items="${cartlist}" var="cart">

						<tr>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs">
										<img src="http://localhost:8081/E-BookStore/images/${cart.fileName}" alt="..."
											style="width:100px;height:100px;" class="img-responsive" />
									</div>
									<div class="col-sm-1"></div>
									<div class="col-sm-9">
										<h4 class="nomargin">
											<c:out value="${cart.title}" />
										</h4>
										<p>
											<c:out value="${cart.author}" />
										</p>
									</div>
								</div>
							</td>
							<td data-th="Price"><c:out value="${cart.price}" /> Rs</td>
							<td data-th="Quantity">
							<input type="number"
								class="form-control text-center" id="input_${cart.cartId}"
								value="<c:out value="${cart.quantity}" />" onchange="updateCartQuantity('${cart.cartId}','${cart.bookId}','${cart.price}')"/>
								<input type="hidden" id="book_id_${cart.cartId}" value="${cart.bookId}">
							<input type="hidden" id="priceId_${cart.cartId}" value="${cart.price}">
								</td>
							<td data-th="Subtotal" class="text-center"><c:out
									value="${cart.totalPrice}" /> Rs</td>
							<td class="actions" data-th="">
								<!-- <button class="btn btn-info btn-sm">
									<i class="fa fa-refresh"></i>
								</button> -->
								<a href="http://localhost:8081/E-BookStore/CartServlet?id=${cart.cartId}&username=${pageContext.request.userPrincipal.name}&reqType=3" onclick="return confirm('Are you sure? Do you really want to remove...!!')" class="btn btn-danger btn-sm">
									<i class="fa fa-trash-alt"></i>
								</a>
							</td>
							
						</tr>
					</c:forEach>
					<c:set var="total" value="${0}" />
					<c:forEach var="cart" items="${cartlist}">
						<c:set var="total" value="${total + cart.totalPrice}" />
					</c:forEach>
				</tbody>
					<tfoot>
						<tr>
							<td><a href="http://localhost:8081/E-BookStore/index.jsp" class="btn btn-warning"><i
									class="fa fa-angle-left"></i> Continue Shopping</a></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center"><strong>Total
									<c:out value="${total}" /> Rs</strong></td>
							<td><a href="http://localhost:8081/E-BookStore/order.jsp" class="btn btn-success btn-block">Checkout
									<i class="fa fa-angle-right"></i>
							</a></td>
							<td><input type="hidden" id="userofcart" value="${pageContext.request.userPrincipal.name}"></td>
							
						</tr>
					</tfoot>
				</table>
			</div>

		</div>

	<!-- </div> -->

	<!-- <div class="container" style="margin-top: 2rem;">
		<div class="row" style=""> -->
			<jsp:include page="footer.jsp"></jsp:include>
		<!-- </div>
	</div> -->


	<script>
		// Script to open and close sidebar
		function w3_open() {
			document.getElementById("mySidebar").style.display = "block";
			document.getElementById("myOverlay").style.display = "block";
		}

		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
			document.getElementById("myOverlay").style.display = "none";
		}
		
		function updateCartQuantity(cartId, bookId, price){
			var ajaxUrl = 'http://localhost:8081/E-BookStore/CartServlet?quantity='+$("#input_"+cartId).val()+'&price='+price+'&username='+$("#userofcart").val()+'&bookId='+bookId+'&reqType=3';
			$.ajax({
				url : ajaxUrl,
				method : 'POST',
				success : function(data){
					location.reload();
					
				},error : function(){
				}
			});	
		}
		
		
	</script>
</body>

</html>
