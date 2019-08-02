<%@page import="com.ebook.servlet.UserServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<title>E-Book Store</title>
<meta charset="UTF-8">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/custom_css/index.css">
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
			<a href="${pageContext.request.contextPath}/BookServlet?reqType=3"
				onclick="w3_close()"
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
				class="w3-bar-item w3-button w3-padding w3-text-teal">View
				Category</a> <a href="addcategory.jsp" onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding">Add New Category</a>

		</div>
		<div class="w3-container">

			<br>
			<p class="w3-text-grey">Users</p>
		</div>
		<div class="w3-bar-block">
			<a href="${pageContext.request.contextPath}/UserServlet?reqType=2"
				onclick="w3_close()"
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
		<div class="w3-container">
			<br/>
			<div class="container" align="center">
				<div class="content">
					<div class="row">
						<div class="col-md-12">
							<h1>
								<b>CATEGORY INFORMATION</b>
							</h1>
							<br>
							<p>Below table contains the information of category</p>

							<div class="row">
								<div class="col-md-12" style="text-align:center">
									<table class="table table-responsive custab" style="display:inline">
										<thead>
											<tr>
												<th>Category Name</th>
												<th>Status</th>
												<th>Description</th>
												<th class="text-center">Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${categorylist}" var="category">
												<tr>
													<td><c:out value="${category.categoryName}" /></td>
													<td><c:out value="${category.status}" /></td>
													<td><c:out value="${category.description}" /></td>
													<td class="text-center"><a class='btn btn-info btn-xs'
														href="http://localhost:8081/E-BookStore/CategoryServlet?id=${category.categoryId}&reqType=2"><span class="glyphicon glyphicon-edit"></span>
															Edit</a> <a  href="http://localhost:8081/E-BookStore/CategoryServlet?id=${category.categoryId}&reqType=1" onclick="return confirm('Are you sure? Do you really want to remove the book...!!')" class="btn btn-danger btn-xs del"><span
															class="glyphicon glyphicon-remove"></span> Del</a></td>
												</tr>
											</c:forEach>
										</tbody>


										<%-- <tr>
							<td><%=userlist.get(i).getUsername() %></td>
							<td><%=userlist.get(i).getPassword() %></td>
							<td><%=userlist.get(i).getEnabled() %></td>
							<td class="text-center"><a class='btn btn-info btn-xs'
								href="#"><span class="glyphicon glyphicon-edit"></span> Edit</a>
								<a href="#" class="btn btn-danger btn-xs"><span
									class="glyphicon glyphicon-remove"></span> Del</a></td>
						</tr>
						<%}%> --%>

									</table>
								</div>
							</div>

						</div>
					</div>

				</div>
			</div>

		</div>

		<%-- <jsp:include page="footer.jsp"></jsp:include> --%>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	

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
	</script>
</body>
</html>
