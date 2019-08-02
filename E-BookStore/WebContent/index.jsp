<!DOCTYPE html>
<html>
<title>E-Book Store</title>
<meta charset="UTF-8">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="resources/resources.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/custom_js/login.js"></script>
</head>

<body class="w3-light-grey w3-content" style="max-width: 1600px">
	<jsp:include page="header.jsp"></jsp:include>

	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-collapse w3-white w3-animate-left"
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

		<!-- <a href="#"><img src="/w3images/avatar_g2.jpg"
			style="width: 65px;"
			class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a> -->
		<span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
			onclick="w3_open()"><i class="fa fa-bars"></i></span>
		<div class="w3-container">
			<h1>
				<b>Welcome To the E-BookStore</b>
			</h1>
			<br>
			<p>This website is made for the peoples who are looking books in
				various categories to read or to study. Customers can purchase books
				for rental purpose for a specific period of time and should return
				the book back to the owner under that period of time.</p>

		</div>

		<hr>


		<%@ page import="java.sql.*"%>
		<%@ page import="java.io.*"%>
		<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
		<%@page import="com.ebook.model.Book"%>


		<%
		
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook", "root", "welcome");
				Statement stmt = con.createStatement();
				Statement stmt1 = con.createStatement();
				ResultSet rs = stmt.executeQuery("select * from books");
				int var1=0,var2=0,a=0;
				while (rs.next()) { 
					
					int bookId=0; bookId=rs.getInt("bookId");
					if(var1%3==0){a=1;%>
		<div class="row" style="margin: 2rem">
			<% } %>
			
			

			<div class="card text-center" style="width: 18rem; margin: auto auto">
			<% ResultSet rs1 = stmt1.executeQuery("select fileName from upload where bookId = '"+bookId+"'");
			while (rs1.next()) { %>
				<img class="card-img-top" src= "http://localhost:8081/E-BookStore/images/<%=rs1.getString("fileName")%>"
					alt="Card image cap" /><% } %>
				
				<div class="card-body">
					<h5 class="card-title"><%=rs.getString("title") %></h5>
					<p class="card-text"><%=rs.getString("author") %></p>
					<a href="${pageContext.request.contextPath}/ProductServlet?id=<%=rs.getString("bookId")%>" class="btn btn-primary">View</a>
				</div>
			</div>


			<%
			
				var1++;var2++;a=1; 
				if(var2==3 && a==1){var2=0;a=0;
			
			%>
				</div>
			<% } 
					
				}
					
				con.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		
		%>
		
		 <%-- <jsp:include page="footer.jsp"></jsp:include>  --%>

	</div>
	
	 <div class="container" style="margin-top:2rem;">
		<div class="row" style="">
		 <jsp:include page="footer.jsp"></jsp:include> 
		 </div>
	</div>


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
