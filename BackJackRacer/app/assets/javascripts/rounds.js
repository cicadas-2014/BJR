function test_bets(){
	var bet = $('#bet_1').val();
	bet =+ $('#bet_2').val();
	bet =+ $('#bet_3').val();
	bet =+ $('#bet_4').val();
	console.log(bet);
}
$(document).ready(function() {
	$("body").keyup(function(){
		var bet = 0
		if (parseInt($('#bet_1').val()) % 1 === 0 ){
			bet += parseInt($('#bet_1').val())
		}
		if (parseInt($('#bet_2').val()) % 1 === 0 ){
			bet += parseInt($('#bet_2').val())
		}
		if (parseInt($('#bet_3').val()) % 1 === 0 ){
			bet += parseInt($('#bet_3').val())
		}
		if (parseInt($('#bet_4').val()) % 1 === 0 ){
			bet += parseInt($('#bet_4').val())
		}
		if(parseInt($('#balance').text()) < bet){
		$('#bet_error').text("You cant bet that much :(")
			$('input[name="commit"]').attr("disabled", true);
		} else{
			$('#bet_error').text("")
			$('input[name="commit"]').attr("disabled", false);
		}
	});
});
