<jsp:include page="resources/taglibs.jsp"></jsp:include>
<jsp:include page="resources/resources.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="login.jsp"></jsp:include>
<nav class="navbar navbar-expand-lg navbar-light bg-dark sticky-top">
	<a class="navbar-brand" href="index.jsp">
		<img src="images/logo1.jpg" style="height: 50px; width: 70px">
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNav" aria-controls="navbarNav"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav mr-auto">
			<c:if test="${empty pageContext.request.userPrincipal.name}">
				<li class="nav-item active"><a class="nav-link"
					href="javascript:void(0);" style="color: white">Home</a></li>
			</c:if>
			<c:if test="${not empty pageContext.request.userPrincipal.name}">
				<li class="nav-item"><a class="nav-link" style="color: white">
						Welcome ${pageContext.request.userPrincipal.name}&nbsp;&nbsp; </a></li>
						
					<c:if test = "${pageContext.request.userPrincipal.name == 'admin'}">      
   						 <li class="nav-item"><a href="http://localhost:8081/E-BookStore/BookServlet?reqType=3" class="nav-link" style="color: white">
						Informations </a></li>
					</c:if>
			</c:if>
		</ul>
		<ul class="nav navbar-nav navbar-right color-white">
			<c:if test="${not empty pageContext.request.userPrincipal.name}">
				<%-- <li class="nav-item"><a style="color: white">
					 Welcome
						${pageContext.request.userPrincipal.name}&nbsp;&nbsp; </a>
				</li> --%>
				
				<input type="hidden" id="cartuser" value="${pageContext.request.userPrincipal.name}">
				<li class="nav-item"><a 
					href="${pageContext.request.contextPath}/CartServlet?reqType=1&username=${pageContext.request.userPrincipal.name}">
						<i class="fas fa-shopping-cart"></i>&nbsp;&nbsp;Cart(<span id="count"></span>)&nbsp;&nbsp;
				</a>
				  
				
				<%--  <input type="hidden" id="username" name="username"
					value="<c:out value="${pageContext.request.userPrincipal.name}" />" /> --%>
				</li>
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/LogoutServlet"> &nbsp;&nbsp;Logout
				</a></li>
			</c:if>
			
			<c:if test="${empty pageContext.request.userPrincipal.name}">
				<!-- <li class="nav-item"><a href="javascript:void(0);"> <i
						class="fas fa-shopping-cart"></i>&nbsp;&nbsp;Cart&nbsp;&nbsp;
				</a></li> -->
				<li class="nav-item">
					<a href="" data-toggle="modal"
					data-target="#login-modal_id" class="login_btn_cls"> 
					&nbsp;<i class="fa fa-user"></i>&nbsp;&nbsp;Login&nbsp;&nbsp;
					</a>
				</li>
			</c:if>
			
		</ul>
	</div>
</nav>
<script>

$( document ).ready(function() {
	
		var ajaxUrl = 'http://localhost:8081/E-BookStore/CartServlet?reqType=2&username='+$("#cartuser").val();
		//alert(ajaxUrl);
		$.ajax({
			url : ajaxUrl,
			method : 'POST',
			success : function(data) {

				$("#count").text(data.cartItems);
				

			},
			error : function() {

			}
		

	});
});

</script>