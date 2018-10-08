$(document).ready(function(){
	$('#concertHall2Div').hide();
	$('#concertHall3Div').hide();
	$('#concertHall4Div').hide();
	
	$('#concertHall1').click(function(){
		$('#concertHall1Div').show();
		$('#concertHall2Div').hide();
		$('#concertHall3Div').hide();
		$('#concertHall4Div').hide();
	});
	$('#concertHall2').click(function(){
		$('#concertHall2Div').show();
		$('#concertHall1Div').hide();
		$('#concertHall3Div').hide();
		$('#concertHall4Div').hide();
	});
	$('#concertHall3').click(function(){
		$('#concertHall3Div').show();
		$('#concertHall1Div').hide();
		$('#concertHall2Div').hide();
		$('#concertHall4Div').hide();
	});
	$('#concertHall4').click(function(){
		$('#concertHall4Div').show();
		$('#concertHall1Div').hide();
		$('#concertHall2Div').hide();
		$('#concertHall3Div').hide();
	});
	
	
	$('#C_room1').click(function(){
		location.href="/exhibition/rental/R_concertHallDecision.do?hallName="+$('#C_room1').text().replace(/ /gi, '');
	});
	$('#C_room2').click(function(){
		location.href="/exhibition/rental/R_concertHallDecision.do?hallName="+$('#C_room2').text().replace(/ /gi, '');
	});
	$('#C_room3').click(function(){
		location.href="/exhibition/rental/R_concertHallDecision.do?hallName="+$('#C_room3').text().replace(/ /gi, '');
	});
	$('#C_room4').click(function(){
		location.href="/exhibition/rental/R_concertHallDecision.do?hallName="+$('#C_room4').text().replace(/ /gi, '');
	});
	
	
	$('#modifyHallRateBtn').click(function(){
		if($('#hallRate').val()=='') {
			alert('평당 가격을 입력하세요');
			return;
		} else {
			alert('수정되었습니다.');
			$('#modifyRateConcertHallForm').submit();
		}
	});
	
});