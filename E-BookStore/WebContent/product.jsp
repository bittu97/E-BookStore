<%@page import="com.ebook.servlet.UserServlet"%>
<%@page import="com.ebook.servlet.EditUsers"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<title>E-Book Store</title>
<meta charset="UTF-8">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="resources/resources.jsp"></jsp:include>
</head>

<body class="w3-light-grey w3-content" style="max-width: 1600px;">
	<jsp:include page="header.jsp"></jsp:include>


	<div class="row">
		<div class="col-md-5" style="margin: auto auto">
			<div class="card text-center" style="width: 18rem; margin: auto auto">
				<img class="card-img-top" src="http://localhost:8081/E-BookStore/images/${fileName}"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">
						<c:out value="${book.title}" />
					</h5>
					<p class="card-text">
						by
						<c:out value="${book.author}" />
					</p>
				</div>
			</div>
		</div>
		<div class="col-md-7" style="margin: auto auto;">
			<div class="row" style="position: relative">
				<h3>
					<c:out value="${book.title}" />
				</h3>
				<a href="http://localhost:8081/E-BookStore/index.jsp" style="position: absolute;right: 3rem;top: 5px;" class="btn btn-warning"><i
									class="fa fa-angle-left"></i>Back to Inventory</a>
			</div>
			<div class="row">
				<h5>
					by
					<c:out value="${book.author}" />
				</h5>
			</div>
			<hr />
			<div class="row">
				<h3>
					<c:out value="${book.price}" />
					Rs
				</h3>
			</div>
			<div class="row">
				<h4 style="color: green">
					<b>In Stock : <c:out value="${book.quantity}" /></b>
				</h4>
			</div>
			<hr />
			<div class="row">
				<h3>Additional Information</h3>
				<br />
			</div>
			<div class="row">
				<h5>
					Publisher :
					<c:out value="${book.publisher}" />
				</h5>
				<br />
			</div>
			<div class="row">
				<h5>
					Language :
					<c:out value="${book.language}" />
				</h5>
				<br />
			</div>
			<div class="row">
				<h5>
					No of pages :
					<c:out value="${book.pages}" />
				</h5>
				<br />
			</div>
			<div class="row">
				<h5>
					Description :
					<c:out value="${book.description}" />
				</h5>
			</div>

			<hr />
			<div class="row">
				<input type="hidden" id="userofcart" value="${pageContext.request.userPrincipal.name}">
				<input type="hidden" value="<c:out value="${book.quantity}" />" id ="book_quantity_id" />
				<input type='number' min="1" step="1"
					max="<c:out value="${book.quantity}" />" value="1" name='qty'
					id='qty' placeholder="Add Quantity" autofocus onchange="validateQuantity();" /> 
					 <input type="hidden" id="username" name="username"
					value="<c:out value="${pageContext.request.userPrincipal.name}" />" />
				<input type="hidden" id="bookId" name="bookId"
					value="<c:out value="${book.bookId}" />" /> <input type="hidden"
					id="price" name="price" value="<c:out value="${book.price}" />" />
			</div>
			<br />
			<div class="row">
				<%-- <a href="${pageContext.request.contextPath}/CartServlet?id=${book.bookId}" class="btn btn-success">Add to cart &nbsp;<i class="fas fa-shopping-cart"></i></a> &nbsp;
			<a href="#" class="btn btn-primary">Buy and Checkout</a> --%>

				<c:if test="${not empty pageContext.request.userPrincipal.name}">
					<button type="button" class="btn btn-success" id="add_to_cart">
						Add to cart &nbsp;<i class="fas fa-shopping-cart"></i>
					</button> &nbsp;
			<button type="button" class="btn btn-primary" id="buy_now">Buy
						Now</button>
				</c:if>

				<c:if test="${empty pageContext.request.userPrincipal.name}">
					<!-- <li class="nav-item">
					<a href="" data-toggle="modal"
					data-target="#login-modal_id" class="login_btn_cls"> 
					&nbsp;<i class="fa fa-user"></i>&nbsp;&nbsp;Login&nbsp;&nbsp;
					</a>
				</li> -->
					<button type="button" data-toggle="modal"
						data-target="#login-modal_id" class="btn btn-success">
						Add to cart &nbsp;<i class="fas fa-shopping-cart"></i>
					</button> &nbsp;
				<button type="button" data-toggle="modal"
						data-target="#login-modal_id" class="btn btn-primary">Buy
						Now</button>
				</c:if>

			</div>
			<div class="row">
				<span style="color: green" id="add"></span>
			</div>
		</div>
	</div>


	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript">
		// Script to open and close sidebar
		function w3_open() {
			document.getElementById("mySidebar").style.display = "block";
			document.getElementById("myOverlay").style.display = "block";
		}

		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
			document.getElementById("myOverlay").style.display = "none";
		}
		
		function validateQuantity(){
			if (parseInt($("#qty").val()) > parseInt($("#book_quantity_id").val())){
				alert("Quantity can not exceed more than " + $("#book_quantity_id").val());
				$("#qty").val($("#book_quantity_id").val());
			}
		}

		$("#add_to_cart")
				.click(
						function() {
							var ajaxUrl = 'http://localhost:8081/E-BookStore/CartServlet?quantity='
									+ $("#qty").val()
									+ '&username='
									+ $("#username").val()
									+ '&bookId='
									+ $("#bookId").val()
									+ '&price='
									+ $("#price").val() + '&reqType=1';
							//alert(ajaxUrl);
							$.ajax({
								url : ajaxUrl,
								method : 'POST',
								success : function() {

									$("#add").text(
											"Added to cart successfully...!!");

								},
								error : function() {

								}
							});

						});
		
		 $("#buy_now")
		.click(
				function() {
					var ajaxUrl = 'http://localhost:8081/E-BookStore/BuyServlet?quantity='
							+ $("#qty").val()
							+ '&username='
							+ $("#username").val()
							+ '&bookId='
							+ $("#bookId").val()
							+ '&price='
							+ $("#price").val();
					//alert(ajaxUrl);
					$.ajax({
						url : ajaxUrl,
						method : 'POST',
						success : function(data) {

						},
						error : function() {

						}
					});

				}); 
		
	</script>
</body>

</html>
