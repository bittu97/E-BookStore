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

/* Set gray background color and 100% height */
 .sidenav {
 	position:fixed;
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
	z-index:-1;
} 


/* Set black background color, white text and some padding */
footer {
	position:absolute;
	background-color: #555;
	color: white;
	padding: 10px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>
</head>

<body>

	<!-- <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <img src="./images/logo1.jpg" id="logo" />  
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="adminlogin.jsp"><span class="glyphicon glyphicon-user"></span>Admin Login</a></li>
        <li><a href="userlogin.jsp"><span class="glyphicon glyphicon-user"></span>User Login</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
      </ul>
    </div>
  </div>
</nav> -->

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

	<div class="container-fluid text-center">
		<div class="row content" style="max-heigth:100px;overflow-y:scroll;">
			<div class="col-sm-2 sidenav">
				<h3>Categories</h3>
				<hr>
				<p>
					<a href="#">Novel</a>
				</p>
				<p>
					<a href="#">Encyclopedia</a>
				</p>
				<p>
					<a href="#">Comics</a>
				</p>
				<p>
					<a href="#">Engineering</a>
				</p>
			</div>

			<div class="col-sm-10 text-left" style="margin-left:14rem">
				<div class="row">
					<div class="col-md-12">
						<h1>Welcome To the E-BookStore</h1>
						<p>This website is made for the peoples who are looking books
							in various categories to read or to study. Customers can purchase
							books for rental purpose for a specific period of time and should
							return the book back to the owner under that period of time.</p>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-md-12">
						<h3>Available Books</h3>
					</div>
				</div>
				
				<br>
				
				<div class="row">
					<div class="col-md-12">
						<h4>Novels</h4>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-3">
						<div class="card" style="width: 14rem;">
							<img class="card-img-top img-thumbnail"
								src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRixMDzjULav2Ae9cGWz1CufictXkRzmfyuocIh66VPc37QiswAbw"
								alt="Card image cap" style="height: 300px; width: 180">
							<div class="card-body">
								<h5 class="card-title">Crucible A Thriller</h5>
								<p class="card-text">by James Rollins</p>
								<a href="#" class="btn btn-primary">Buy</a>
								<a href="#" class="btn btn-primary">Add to Cart</a>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card" style="width: 14rem;">
							<img class="card-img-top img-thumbnail"
								src="https://media.npr.org/assets/bakertaylor/covers/t/the-hunger-games/9780439023481_custom-bcd24563df66b0cf3b975147e537786a53857a4b-s400-c85.jpg"
								alt="Card image cap" style="height: 300px; width: 180">
							<div class="card-body">
								<h5 class="card-title">The Hunger Games</h5>
								<p class="card-text">by Suzanne Collins</p>
								<a href="#" class="btn btn-primary">Buy</a>
								<a href="#" class="btn btn-primary">Add to Cart</a>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card" style="width: 14rem;">
							<img class="card-img-top img-thumbnail"
								src="https://media.npr.org/assets/bakertaylor/covers/t/the-fault-in-our-stars/9780142424179_custom-18ef29c3e3f8fa2344b3029b3272ab512651e213-s400-c85.jpg"
								alt="Card image cap" style="height: 300px; width: 180">
							<div class="card-body">
								<h5 class="card-title">The Fault in Our Stars</h5>
								<p class="card-text">by John Green</p>
								<a href="#" class="btn btn-primary">Buy</a>
								<a href="#" class="btn btn-primary">Add to Cart</a>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card" style="width: 14rem;">
							<img class="card-img-top img-thumbnail"
								src="https://images.blog.whsmith.co.uk/ya-picks-2016-results_lionwitchwardrobe.jpg"
								alt="Card image cap" style="height: 300px; width: 180">
							<div class="card-body">
								<h5 class="card-title">The Lion The Witch and The Wardrobe</h5>
								<p class="card-text">by CS Lewis</p>
								<a href="#" class="btn btn-primary">Buy</a>
								<a href="#" class="btn btn-primary">Add to Cart</a>
							</div>
						</div>
					</div>
				</div>
				
				<br>
				<hr>
				<br>

				<div class="row">
					<div class="col-md-12">
						<h4>Encyclopedia</h4>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-3">
						<div class="card" style="width: 14rem;">
							<img class="card-img-top img-thumbnail"
								src="https://images-na.ssl-images-amazon.com/images/I/51IH5pmy-1L._SX332_BO1,204,203,200_.jpg"
								alt="Card image cap" style="height: 300px; width: 180">
							<div class="card-body">
								<h5 class="card-title">The Popular Encyclopedia of Church History</h5>
								<p class="card-text">by ED Hindson & Dan Mitchell</p>
								<a href="#" class="btn btn-primary">Buy</a>
								<a href="#" class="btn btn-primary">Add to Cart</a>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card" style="width: 14rem;">
							<img class="card-img-top img-thumbnail"
								src="https://images-na.ssl-images-amazon.com/images/I/51BRT6xaxJL._SX321_BO1,204,203,200_.jpg"
								alt="Card image cap" style="height: 300px; width: 180">
							<div class="card-body">
								<h5 class="card-title">The Popular Encyclopedia of Apologetics</h5>
								<p class="card-text">by ED Hindson & Ergun Cancer</p>
								<a href="#" class="btn btn-primary">Buy</a>
								<a href="#" class="btn btn-primary">Add to Cart</a>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card" style="width: 14rem;">
							<img class="card-img-top img-thumbnail"
								src="https://prodimage.images-bn.com/pimages/9780806123356_p0_v4_s550x406.jpg"
								alt="Card image cap" style="height: 300px; width: 180">
							<div class="card-body">
								<h5 class="card-title">Encyclopedia of Western Gunfighters</h5>
								<p class="card-text">by Bill O'Neal</p>
								<a href="#" class="btn btn-primary">Buy</a>
								<a href="#" class="btn btn-primary">Add to Cart</a>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card" style="width: 14rem;">
							<img class="card-img-top img-thumbnail"
								src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5HNs2XwosV3BLnMGYr5LObkignjllTD8mMM_l36LMSIUcwTQr-w"
								alt="Card image cap" style="height: 300px; width: 180">
							<div class="card-body">
								<h5 class="card-title">The Consine Animal Encyclopedia</h5>
								<p class="card-text">unknown</p>
								<a href="#" class="btn btn-primary">Buy</a>
								<a href="#" class="btn btn-primary">Add to Cart</a>
							</div>
						</div>
					</div>
				</div>
				
				<br>
				<hr>
				<br>
				
				<div class="row">
					<div class="col-md-12">
						<h4>Comics</h4>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-3">
						<div class="card" style="width: 14rem;">
							<img class="card-img-top img-thumbnail"
								src="https://cdn.pastemagazine.com/www/system/images/photo_albums/bestcomiccoversof2018/large/amazing-spider-man--2-cover-art-by-ryan-ottley.png?1384968217"
								alt="Card image cap" style="height: 300px; width: 180">
							<div class="card-body">
								<h5 class="card-title">The Amazing Spiderman</h5>
								<p class="card-text">by Stan Lee</p>
								<a href="#" class="btn btn-primary">Buy</a>
								<a href="#" class="btn btn-primary">Add to Cart</a>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card" style="width: 14rem;">
							<img class="card-img-top img-thumbnail"
								src="https://images-na.ssl-images-amazon.com/images/S/cmx-images-prod/Item/371734/371734._SX1280_QL80_TTD_.jpg"
								alt="Card image cap" style="height: 300px; width: 180">
							<div class="card-body">
								<h5 class="card-title">The Flash</h5>
								<p class="card-text">by Stan Lee</p>
								<a href="#" class="btn btn-primary">Buy</a>
								<a href="#" class="btn btn-primary">Add to Cart</a>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card" style="width: 14rem;">
							<img class="card-img-top img-thumbnail"
								src="https://imgc.allpostersimages.com/img/print/posters/marvel-comics-retro-the-incredible-hulk-comic-book-cover-no-104-with-the-rhino_a-G-13758047-13198931.jpg?w=632&h=948"
								alt="Card image cap" style="height: 300px; width: 180">
							<div class="card-body">
								<h5 class="card-title">The Incredible Hulk</h5>
								<p class="card-text">by Stan Lee</p>
								<a href="#" class="btn btn-primary">Buy</a>
								<a href="#" class="btn btn-primary">Add to Cart</a>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card" style="width: 14rem;">
							<img class="card-img-top img-thumbnail"
								src="https://images-na.ssl-images-amazon.com/images/S/cmx-images-prod/Item/261211/DIG062904_1._SX360_QL80_TTD_.jpg"
								alt="Card image cap" style="height: 300px; width: 180">
							<div class="card-body">
								<h5 class="card-title">Batman</h5>
								<p class="card-text">by Frank Miller</p>
								<a href="#" class="btn btn-primary">Buy</a>
								<a href="#" class="btn btn-primary">Add to Cart</a>
							</div>
						</div>
					</div>
				</div>
				
				<br>
				<hr>
				<br>
				
				<div class="row">
					<div class="col-md-12">
						<h4>Engineering</h4>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-3">
						<div class="card" style="width: 14rem;">
							<img class="card-img-top img-thumbnail"
								src="https://images.gr-assets.com/books/1455925344l/29227081.jpg"
								alt="Card image cap" style="height: 300px; width: 180">
							<div class="card-body">
								<h5 class="card-title">Java A Beginner's Guide</h5>
								<p class="card-text">by James Patterson</p>
								<a href="#" class="btn btn-primary">Buy</a>
								<a href="#" class="btn btn-primary">Add to Cart</a>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card" style="width: 14rem;">
							<img class="card-img-top img-thumbnail"
								src="https://images-na.ssl-images-amazon.com/images/I/51khzq8EVJL.jpg"
								alt="Card image cap" style="height: 300px; width: 180">
							<div class="card-body">
								<h5 class="card-title">Let Us C</h5>
								<p class="card-text">by Yashavant Kanetkar</p>
								<a href="#" class="btn btn-primary">Buy</a>
								<a href="#" class="btn btn-primary">Add to Cart</a>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card" style="width: 14rem;">
							<img class="card-img-top img-thumbnail"
								src="https://images-na.ssl-images-amazon.com/images/I/51pLCzIQaSL._SX331_BO1,204,203,200_.jpg"
								alt="Card image cap" style="height: 300px; width: 180">
							<div class="card-body">
								<h5 class="card-title">Robotics</h5>
								<p class="card-text">by Peter Mckinnon</p>
								<a href="#" class="btn btn-primary">Buy</a>
								<a href="#" class="btn btn-primary">Add to Cart</a>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card" style="width: 14rem;">
							<img class="card-img-top img-thumbnail"
								src="https://sebastianraschka.com/images/books/ann-and-deeplearning-cover.jpg"
								alt="Card image cap" style="height: 300px; width: 180">
							<div class="card-body">
								<h5 class="card-title">Introduction to Artificial Neural Networks and Deep Learning</h5>
								<p class="card-text">by Sebastian Raschka</p>
								<a href="#" class="btn btn-primary">Buy</a>
								<a href="#" class="btn btn-primary">Add to Cart</a>
							</div>
						</div>
					</div>
				</div>

			</div>

			<!-- <div class="col-sm-2 sidenav">
				<div class="well">
					<p>ADS</p>
				</div>
				<div class="well">
					<p>ADS</p>
				</div>
				<div class="well">
					<p>ADS</p>
				</div>
				<div class="well">
					<p>ADS</p>
				</div>
			</div> -->
		</div>
	</div>

	<footer class="container-fluid text-center">
		<div class="container">
			<!-- <div class="media-container-row">
				<div class="col-md-3">
					<div class="media-wrap">
						<a href=""> <img src="images/logo1.jpg" alt="Mobirise"
							media-simple="true" style="height: 120px; width: 120px">
						</a>
					</div>
				</div>
				<div class="col-md-9">
					<p class="mbr-text align-right links mbr-fonts-style display-7">
						<a href="#" class="text-black">HOME</a> &nbsp;&nbsp;&nbsp;&nbsp; <a
							href="#" class="text-black">ABOUT</a> &nbsp;&nbsp;&nbsp;&nbsp; <a
							href="#" class="text-black">CONTACT</a>
					</p>
				</div>
			</div> -->
			<div class="footer-lower">
				<div class="media-container-row">
					<div class="col-md-12">
					<p class="mbr-text mbr-fonts-style display-7">© Copyright 2019
						</p>
						<hr>
					</div>
				</div>
				<!-- <div class="media-container-row mbr-white">
					<div class="col-md-6 copyright">
						<p class="mbr-text mbr-fonts-style display-7">© Copyright 2019
						</p>
					</div>
				</div> -->
			</div>
		</div>
	</footer>
</body>

</html>