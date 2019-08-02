
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
				class="w3-bar-item w3-button w3-padding w3-text-teal">View Books</a> 
				<a href="${pageContext.request.contextPath}/books?reqType=4" onclick="w3_close()"
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
				<b>ADD PRODUCT</b>
			</h5>
			<p>Below table contains the information of products</p>

		</div>

	<div  style="display: block; text-align: center;">
		
		<form role="form" action="http://localhost:8081/E-BookStore/BookServlet?reqType=1" method="POST" style="width: 550px;height: 450px; margin: auto; position: relative;padding-bottom: 2rem;">

						<!-- <input type="hidden" name="reqType" value="1" /> -->
					<%-- <input type="hidden" name="categoryId" value="<c:out value="${category.categoryId}" />" /> --%>
						
						<select class="form-control" name="categoryId" id="productSelect" autofocus>
							<option value="">Please Select a Category</option>
							<c:forEach items="${categories}" var="category">
								<option value="${category.categoryId}">${category.categoryName}</option>
							</c:forEach>
							
						</select>

						<div class="form-group">
							<label for="productname" class="loginFormElement"></label> <input
								class="form-control" id="title" name="title" placeholder="Book Title" type="text">
						</div>

						<div class="form-group">
							<label class="loginFormElement"></label> <input
								class="form-control" id="author" name="author" placeholder="Author Name" type="text">
						</div>
						
						<div class="form-group">
							<label class="loginFormElement"></label> <input
								class="form-control" id="publisher" name="publisher" placeholder="Publisher" type="text">
						</div>
						
						<div class="form-group">
							<label class="loginFormElement"></label> <input
								class="form-control" id="language" name="language" placeholder="Language" type="text">
						</div>
						
						<div class="form-group">
							<label class="loginFormElement"></label> <input
								class="form-control" id="isbn" name="isbn" placeholder="ISBN" type="text">
						</div>
						
						<div class="form-group">
							<label class="loginFormElement"></label> <input
								class="form-control" id="addition" name="addition" placeholder="Addition" type="text">
						</div>
						
						<div class="form-group">
							<label class="loginFormElement"></label> <input
								class="form-control" id="pages" name="pages" placeholder="Number of Pages" type="number">
						</div>

						<!-- <div class="form-group">
							<label class="control-label">Product Image</label> <input
								class="filestyle" data-icon="false" type="file">
						</div> -->
						
						<div class="form-group">
							<label class="loginFormElement"></label> <input
								class="form-control" id="price" name="price" placeholder="Price" type="number" step=".01">
						</div>

						<div class="form-group">
							<label class="loginformelement"></label> <input
								class="form-control input-lg" id="quantity" name="quantity" placeholder="Quantity"
								type="number">
							<div class="container"></div>

							<!-- <button type="submit" id="loginSubmit" class="btn btn-success loginFormElement">Add Product</button> -->

						</div>
						<div class="form-group">
							<label class="loginformelement"></label>
							<textarea class="form-control" id="description" name="description" placeholder="Description" rows="3"></textarea>
						</div>
						<div>
							<button type="submit" id="addbook_btn_id"
								class="btn btn-success loginFormElement">Add Book</button>
							<input type="reset" class="btn btn-danger">
						</div>

					</form>
					
			<!-- <form action="uploadServlet" method="post" enctype="multipart/form-data">
				<input type="file" name="file" /> <input type="submit"
					value="upload" />
			</form> -->
			
		</div>
	<div style="padding-top: 27rem;"><jsp:include page="footer.jsp"></jsp:include></div>
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
	
	/* $("#addbook_btn_id").click(function(){
		var ajaxUrl = 'http://localhost:8081/E-BookStore/BookServlet?title='+$("#title").val()+'&categoryId='+$("#productSelect").val()+'&author='+$("#author").val()+'&publisher=' +$("#publisher").val()+'&description='+$("#description").val()+'&language='+$("#language").val()+'&addition='+$("#addition").val()+'&pages='+$("#pages").val()+'&isbn='+$("#isbn").val()+'&price='+$("#price").val()+'&quantity='+$("#quantity").val()+'&reqType=1';
		$.ajax({
			url : ajaxUrl,
			method : 'POST',
			success : function(data){
				
				
			},error : function(){
			}
		});
		
	}); */
	
</script> 
</body>
</html>
