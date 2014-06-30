function test_bets(){
	var bet = $('#bet_1').val();
	bet =+ $('#bet_2').val();
	bet =+ $('#bet_3').val();
	bet =+ $('#bet_4').val();
}
$(document).ready(function() {
	var speed = 1200;

	
	$('.back').hide();
	$('#statsback').hide();
	$('#newsback').hide();

	$('#round #winner-box').hide();
	$('#stats').hide();
	$('#bet').hide();

  $("#statsback").css("z-index",1)  
  $("#newback").css("z-index",-1)

  $("#stats").css("z-index",2)
  $("#bet *").css("z-index",2)

	$("#statsback").fadeTo(speed, 0.8);
	$("#newback").fadeTo(speed, 0.8);
	// $("#stats").
	setTimeout(function(){$('#stats').slideDown(speed)},speed);
	setTimeout(function(){$('#bet').slideDown(speed)},speed);




	$("body").keyup(function() {
		$("#payout1").text("0")
		$("#payout2").text("0")
		$("#payout3").text("0")
		$("#payout4").text("0")
		var bet = 0
		if (parseInt($('#bet_1').val()) % 1 === 0 ){
			bet += parseInt($('#bet_1').val());
			$("#payout1").html(String((randomNumbers[0]*parseInt($('#bet_1').val())+parseInt($('#bet_1').val()))));
		}
		if (parseInt($('#bet_2').val()) % 1 === 0 ){
			bet += parseInt($('#bet_2').val())
			$("#payout2").html(String((randomNumbers[1]*parseInt($('#bet_2').val())+parseInt($('#bet_2').val()))));
		}
		if (parseInt($('#bet_3').val()) % 1 === 0 ){
			bet += parseInt($('#bet_3').val())
			$("#payout3").html(String((randomNumbers[2]*parseInt($('#bet_3').val())+parseInt($('#bet_3').val()))));
		}
		if (parseInt($('#bet_4').val()) % 1 === 0 ){
			bet += parseInt($('#bet_4').val())
			$("#payout4").html(String((randomNumbers[3]*parseInt($('#bet_4').val())+parseInt($('#bet_4').val()))));
		}
		$('#balance').text(String(balance -bet))
		if(balance < bet){
			$('#bet_error').text("You cant bet that much :(")
				$('input[name="commit"]').attr("disabled", true);
			} else{
				$('#bet_error').text("")
				$('input[name="commit"]').attr("disabled", false);
			}
		});
});
