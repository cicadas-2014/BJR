var speed = 800
function showLoginBox(){
	$("#login_box").slideDown(speed);
	setTimeout(function(){$("#signup").slideDown(speed);},speed);
	setTimeout(function(){$("#signin").slideDown(speed);},speed);
  $("back").fadeTo(speed,0.7);
};
$(document).ready(function() {
	if($('.error').text()!="Invalid login"){
		$("#login_box").hide();
		$("#signup").hide();
		$("#signin").hide();
		showLoginBox();
	}
});
