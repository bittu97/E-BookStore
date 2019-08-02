<jsp:include page="resources/taglibs.jsp"></jsp:include>
<jsp:include page="resources/resources.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<div id="login-modal_id" class="modal fade" role="dialog" tabIndex="-1" style="position:absolute">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
			<div style="display: block; text-align: center;">
				<img src="images/logo1.jpg" style="height: 200px; width: 200px" />
			</div>
			
				<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
					<font color="red"> Your login attempt was not successful due
						to <br />
					<br /> <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />.
					</font>
					 <!-- <script type="text/javascript">
						
					 $(function () {
					        var isfirstload = $("#login_username").val();
					        //alert(isfirstload);
					        if (isfirstload != null) {
					            document.getElementById("login-modal_id").click();
					        }
					    })
						
					</script>  -->
				</c:if>
				
				<span style="color:red" id="error_msg"></span> 
				<span style="color:green" id="succ_msg"></span> 
				<div id="login_div">
					<form id="login-form" action="j_spring_security_check" method='POST'>
						<span id="text-login-msg">Type your username and password.</span>
						<input id="login_username" class="form-control" type="text" placeholder="Username" name="username" required autofocus/> 
						<input id="login_password" class="form-control" type="password" placeholder="Password" name="password" required />
						 <br />
						<button id="login" type="submit" class="btn btn-primary btn-lg btn-block">Login</button>
						<div>
							<button id="login_register_btn" type="button" class="btn btn-link reg_btn_cls">Register</button>
						</div>
						<span class="error">${error}</span>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
				</div>
				<div id="reg_div" style="display:none;">
					<form id="register-form" action="" method="POST">
						 <!-- <div class="row">  -->
							 <div class="col-md-12"> 
								<span id="text-register-msg"><b>Register an account.</b></span>
								<br> 
								<div class="row"><input id="first_name" class="form-control" type="text" placeholder="First Name" name="firstName" required autofocus/></div> 
								<div class="row"><input id="last_name" class="form-control" type="text" placeholder="Last Name" name="lastName" required /> </div>
								<div class="row"><input id="mobile_no" class="form-control" type="tel" placeholder="Contact no." name="mobileNumber" required /> </div>
								<div class="row"><input id="email_id" class="form-control" type="email" placeholder="E-Mail" name="emailId" required /> </div>
								<div class="row"><input id="username_id" class="form-control" type="text" placeholder="Username" name="username" required /></div>
								<div class="row"><input id="pass_id" class="form-control" type="password" placeholder="Password" required /></div>
								<div class="row"><input id="c_pass_id" class="form-control" type="password" placeholder="Confirm Password" name="password" required /></div>
							 </div>
							 <br /> 
						 <!-- </div> --> 
						<div>
							<button type="button" class="btn btn-primary btn-lg btn-block" id="register_btn_id">Register</button>
						</div>
						<div>
							<button id="register_login_btn" type="button"
								class="btn btn-link login_btn_cls">Login</button>
						</div>
					</form>
				</div>

			</div>
		</div>

	</div>
</div>
<script src="https://cdn.rawgit.com/PascaleBeier/bootstrap-validate/v2.2.0/dist/bootstrap-validate.js" ></script>
<script src="${pageContext.request.contextPath}/js/custom_js/login.js" type="text/javascript"></script>
<script type="text/javascript">
bootstrapValidate('#first_name', 'alpha:You can only input alphabetic characters');
bootstrapValidate('#first_name', 'max:80:Please dont enter more than 80 characters!');

bootstrapValidate('#last_name', 'alpha:You can only input alphabetic characters');
bootstrapValidate('#last_name', 'max:80:Please dont enter more than 80 characters!');

bootstrapValidate('#mobile_no', 'numeric:Please only enter numeric characters!');
//bootstrapValidate('#mobile_no', 'max:80:Please dont enter more than 10 characters!')

bootstrapValidate('#email_id', 'email:Enter a valid email address');

bootstrapValidate('#username_id', 'alphanum:Please only enter alphanumeric characters!');

bootstrapValidate('#c_pass_id', 'matches:#pass_id:Your passwords should match');

/* $("#login").click(function () {
    var isfirstload = $("#login_username").val();
    //alert(isfirstload);
    if (isfirstload != null) {
        document.getElementById("login-modal_id").click();
    }
}) */

$("#register_btn_id").click(function(){
	_clearMsg();
	var ajaxUrl = 'http://localhost:8081/E-BookStore/UserServlet?firstName='+$("#first_name").val()+'&lastName='+$("#last_name").val()+'&mobileNo=' +$("#mobile_no").val()+'&emailId='+$("#email_id").val()+'&userName='+$("#username_id").val()+'&password='+$("#pass_id").val()+'&reqType=1';
	$.ajax({
		url : ajaxUrl,
		method : 'POST',
		success : function(data){
			if (data != null && data != undefined){
				if (data.status=='success'){
					$("#succ_msg").text(data.message);
				}else if (data.status=='fail'){
					$("#error_msg").text(data.message);
				}else {
					$("#error_msg").text('System encountered some issue. Please try after some times!!!');
				}
			}else {
				$("#error_msg").text('System encountered some issue. Please try after some times!!!');
			}
			
		},error : function(){
			$("#error_msg").text('System encountered some issue. Please try after some times!!!');
		}
	});
	
});

function _clearMsg(){
	$("#error_msg").text("");
	$("#succ_msg").text(""); 
}

</script>