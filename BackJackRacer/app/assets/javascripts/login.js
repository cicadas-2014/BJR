var speed = 800
function showLoginBox(){
	$("#login_box").slideDown(speed);
	setTimeout(function(){$("#signup").slideDown(speed);},speed);
	setTimeout(function(){$("#signin").slideDown(speed);},speed);
  // $("body").fadeTo(speed,0.7);
};
function hideLoginBox(){
	$("#login_box").slideUp(speed);
	$("#back").fadeTo(speed,1);
};
function hideRegister(){
	$("#signup_form").slideUp(speed);
	$("#back").fadeTo(speed,1);
};
$(document).ready(function() {
	// $('#login_box').hide()
	console.log('ready')
	console.log($('.error').text())
	if($('.error').text()!="Invalid login"){
		$("#login_box").hide();
		$("#signup").hide();
		$("#signin").hide();
		showLoginBox();
	}
});
