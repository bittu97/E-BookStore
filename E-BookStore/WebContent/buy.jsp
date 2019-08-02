<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>E-BookStore</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<script src="js/bootstrap.min.js"></script>
	<script src="https://kit.fontawesome.com/f6ef29cc51.js"></script>
	
	<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

#logo {
	float: left;
	height: 50px;
	width: 70px;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px
}


/* Set black background color, white text and some padding */
footer {
	position:fixed;
	background-color: #555;
	color: white;
	padding: 10px;
}



/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {

	.row.content {
		height: auto;
	}
}
</style>
	
</head>

<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-dark sticky-top">
		<a class="navbar-brand" href="#"><img src="images/logo1.jpg"
			style="height: 50px; width: 70px"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"
					style="color: white">Home <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#"
					style="color: white">Features</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					style="color: white">Pricing</a></li>
				<li class="nav-item"><a class="nav-link disabled" href="#"
					style="color: white">Disabled</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><i class="fas fa-user"></i></li>&nbsp;&nbsp;
				<li class="nav-item"><a href="adminlogin.jsp"><span
						class="glyphicon glyphicon-user"></span>Admin Login</a></li>&nbsp;&nbsp;
				<li><i class="fas fa-user"></i></li>&nbsp;&nbsp;
				<li class="nav-item"><a href="userlogin.jsp"><span
						class="glyphicon glyphicon-user"></span>User Login</a></li>&nbsp;&nbsp;
				<li><i class="fas fa-shopping-cart"></i></li>&nbsp;&nbsp;
				<li class="nav-item"><a href="#"><span
						class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
			</ul>
		</div>
	</nav>
	
	
		<div class="row">
					<div class="col-md-6" style="">
						<div class="card" style="width: 14rem;margin: 0 auto;float: none;margin-bottom: 10px;">
							<img class="card-img-top img-thumbnail"
								src="https://images.gr-assets.com/books/1455925344l/29227081.jpg"
								alt="Card image cap" style="height: 300px; width: 180;">
							<div class="card-body">
								<h5 class="card-title">Java A Beginner's Guide</h5>
								<p class="card-text">by James Patterson</p>
								
								<a href="#" class="btn btn-primary">Add to Cart</a>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card" style="width: 18rem;margin-top:8rem">
						  <div class="card-body">
						    <h5 class="card-title">Java A Beginner's Guide</h5>
						    <h6 class="card-subtitle mb-2 text-muted">by James Patterson</h6>
						     <br>
						    <p class="card-text">FREE Delivery on orders over Rs.49</p>
						    <br>
						    <p><b style="color:green;">IN STOCK</b></p>
						    <!-- Change the `data-field` of buttons and `name` of input field's for multiple plus minus buttons-->
								<div class="input-group plus-minus-input">
								  <div class="input-group-button">
								    
								  </div>
								  <input class="input-group-field" type="number" name="quantity" value="0">
								  <div class="input-group-button">
								    
								  </div>
								</div>


						    <a href="#" class="btn btn-primary" style="margin-top:1rem">Place Order</a>
						  </div>
						</div>
					</div>
		</div>
	
	<footer class="container-fluid text-center">
		<div class="container">
			<div class="footer-lower">
				<div class="media-container-row">
					<div class="col-md-12">
					<p class="mbr-text mbr-fonts-style display-7">© Copyright 2019
						</p>
						<hr>
					</div>
				</div>
			</div>
		</div>
	</footer>

</body>
</html>