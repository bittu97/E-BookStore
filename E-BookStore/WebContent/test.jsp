<html>
	<head>
		
	</head>
	<body>
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
	</body>
</html>