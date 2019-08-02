$(document).ready(function() {
	_clearMsg();

	$("#login_register_btn").click(function() {
		_clearMsg();
		$("#login_div").hide();
		$("#reg_div").show();
	});

	$("#register_login_btn").click(function() {
		_clearMsg();
		$("#login_div").show();
		$("#reg_div").hide();
	});
	
	
	$("#c_pass_id").change(function(){
		return isPassValid();
	});
	
	function isPassValid(){
		_clearMsg();
		if ($("#pass_id").val()==$("#c_pass_id").val()){
			
			/*$(document).on("click", "#register_btn_id", function() {
				 $.get("RegisterSuccess", function(responseText) {   
		             $("#succ_msg").text(responseText);         
		         });
		     });
			*/
			return true;
		}else{
			$("#error_msg").text("Password doesn't match!!!!");
			return false;
		}
	}
	
	 /*$(document).on("click", "#register_btn_id", function() {
		 $.get("RegisterSuccess", function(responseText) {   
             $("#succ_msg").text("User registerd successfully, Please proceed for login!!!");         
         });
     });*/
	
	
	
	function _clearMsg(){
		$("#error_msg").text("");
		$("#succ_msg").text(""); 
	}

});