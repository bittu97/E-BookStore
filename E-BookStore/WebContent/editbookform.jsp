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
<!-- <link rel="stylesheet" href="css/custom_css/index.css"> -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>


<body class="w3-light-grey w3-content" style="max-width: 1600px">
	<jsp:include page="header.jsp"></jsp:include>

	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-collapse w3-white w3-animate-left"
		style="z-index: 3; width: 300px;" id="mySidebar">
		<br>
		<div class="w3-container">
			
			<h4>
				<b>E-BookStore</b>
			</h4>
			<br>
			<p class="w3-text-grey">Book</p>
		</div>
		<div class="w3-bar-block">
			<a href="${pageContext.request.contextPath}/BookServlet?reqType=3" onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding w3-text-teal">View Books</a> <a
				href="${pageContext.request.contextPath}/books?reqType=4" onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding">Add New Books</a> 

		</div>
		<div class="w3-container">

			<br>
			<p class="w3-text-grey">Category</p>
		</div>
		<div class="w3-bar-block">
			<a href="${pageContext.request.contextPath}/CategoryServlet?reqType=3" onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding w3-text-teal">View Category</a> <a
				href="addcategory.jsp" onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding">Add New Category</a> 

		</div>
		<div class="w3-container">

			<br>
			<p class="w3-text-grey">Users</p>
		</div>
		<div class="w3-bar-block">
			<a href="${pageContext.request.contextPath}/UserServlet?reqType=2" onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding w3-text-teal">View Users</a>
		</div>
		
		<!--   <div class="w3-panel w3-large">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
  </div> -->
	</nav>

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 300px">

		<!-- Header -->

		<a href="#"><img src="/w3images/avatar_g2.jpg"
			style="width: 65px;"
			class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
		<span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
			onclick="w3_open()"><i class="fa fa-bars"></i></span>
		<br />
		<div class="w3-container" style="display: block; text-align: center;">
			<h5>
				<b>EDIT USER DETAILS</b>
			</h5>
			<p>Edit the details of the user below</p>

		</div>

	<div  style="display: block; text-align: center;">
		
		<form role="form" action="http://localhost:8081/E-BookStore/BookServlet" method='POST' style="width: 550px;height: 450px; margin: auto; position: relative;padding-bottom: 2rem;">

						<!-- <select class="form-control" id="productSelect" autofocus><option>Please
								Select a Category</option>
							<option>Novel</option>
							<option>Encyclopedia</option>
							<option>Comic</option>
							<option>Engineering</option>
						</select> -->
					<input type="hidden" name="reqType" value="2" />
					<input type="hidden" name="bookId" value="<c:out value="${book.bookId}" />" />
						<div class="form-group">
							<label for="productname" class="loginFormElement">Title</label> <input
								id="first_name" class="form-control" name="title" placeholder="Title" type="text" value="<c:out value="${book.title}" />" autofocus>
						</div>

						<div class="form-group">
							<label class="loginFormElement">Author</label> <input
								id="last_name" class="form-control" name="author" placeholder="Author" type="text" value="<c:out value="${book.author}" />">
						</div>
						
						<div class="form-group">
							<label class="loginFormElement">Publisher</label> <input
								id="email_id" class="form-control" name="publisher" placeholder="Publisher" type="text" value="<c:out value="${book.publisher}" />">
						</div>
						
						<div class="form-group">
							<label class="loginFormElement">Description</label> <input
								id="username_id" class="form-control" name="description" placeholder="Description" type="text" value="<c:out value="${book.description}" />">
						</div>
						
						<div class="form-group">
							<label class="loginFormElement">Language</label> <input
								id="pass_id" class="form-control" name="language" placeholder="Language" type="text" value="<c:out value="${book.language}" />">
						</div>
						
						<div class="form-group">
							<label class="loginFormElement">Addition</label> <input
								id="mobile_no" class="form-control" name="addition" placeholder="Addition" type="text" value="<c:out value="${book.addition}" />">
						</div>
						
						<div class="form-group">
							<label class="loginFormElement">Status</label> <input
								id="status" class="form-control" name="status" placeholder="Status" type="text" value="<c:out value="${user.status}" />">
						</div>
						
						<div class="form-group">
							<label class="loginFormElement">Pages</label> <input
								id="enabled" class="form-control" name="pages" placeholder="Pages" type="number" value="<c:out value="${book.pages}" />">
						</div>
						
						<div class="form-group">
							<label class="loginFormElement">ISBN</label> <input
								id="status" class="form-control" name="isbn" placeholder="ISBN" type="text" value="<c:out value="${book.isbn}" />">
						</div>
						
						<div class="form-group">
							<label class="loginFormElement">Price</label> <input
								id="enabled" class="form-control" name="price" placeholder="Price" type="number" value="<c:out value="${book.price}" />">
						</div>
						
						<div class="form-group">
							<label class="loginFormElement">Quantity</label> <input
								id="enabled" class="form-control" name="quantity" placeholder="Quantity" type="number" value="<c:out value="${book.quantity}" />">
						</div>
				
						
						<div>
							<button type="submit" id="update_btn_id"
								class="btn btn-success loginFormElement">Update</button>
							<input type="reset" class="btn btn-danger">
						</div>

					</form>
		</div>
	<div style="padding-top:34rem;"><jsp:include page="footer.jsp"></jsp:include></div>
</div>

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

/* $("#update_btn_id").click(function(){
	var ajaxUrl = 'http://localhost:8081/E-BookStore/EditUsers?firstName='+$("#first_name").val()+'&lastName='+$("#last_name").val()+'&mobileNo=' +$("#mobile_no").val()+'&emailId='+$("#email_id").val()+'&userName='+$("#username_id").val()+'&password='+$("#pass_id").val()+'&status='+$("#status")+'&enabled='+$("#enabled");
	$.ajax({
		url : ajaxUrl,
		method : 'POST',
		success : function(data){
			console.log("Data"+data);
			
		},error : function(){
			console.log("error");
		}
	});
	
}); */

</script> 
</body>
</html>
