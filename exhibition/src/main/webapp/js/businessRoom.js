$(document).ready(function(){
	$('#businessRoom2Div').hide();
	$('#businessRoom3Div').hide();
	$('#businessRoom4Div').hide();
	
	$('#businessRoom1').click(function(){
		$('#businessRoom1Div').show();
		$('#businessRoom2Div').hide();
		$('#businessRoom3Div').hide();
		$('#businessRoom4Div').hide();
	});
	$('#businessRoom2').click(function(){
		$('#businessRoom2Div').show();
		$('#businessRoom1Div').hide();
		$('#businessRoom3Div').hide();
		$('#businessRoom4Div').hide();
	});
	$('#businessRoom3').click(function(){
		$('#businessRoom3Div').show();
		$('#businessRoom1Div').hide();
		$('#businessRoom2Div').hide();
		$('#businessRoom4Div').hide();
	});
	$('#businessRoom4').click(function(){
		$('#businessRoom4Div').show();
		$('#businessRoom1Div').hide();
		$('#businessRoom2Div').hide();
		$('#businessRoom3Div').hide();
	});
	
	
	$('#Room1').click(function(){
		location.href="/exhibition/rental/R_businessRoomDecision.do?businessRoom="+$('#Room1').text();
	});
	$('#Room2').click(function(){
		location.href="/exhibition/rental/R_businessRoomDecision.do?businessRoom="+$('#Room2').text();
	});
	$('#Room3').click(function(){
		location.href="/exhibition/rental/R_businessRoomDecision.do?businessRoom="+$('#Room3').text();
	});
	$('#Room4').click(function(){
		location.href="/exhibition/rental/R_businessRoomDecision.do?businessRoom="+$('#Room4').text();
	});
	$('#Room5').click(function(){
		location.href="/exhibition/rental/R_businessRoomDecision.do?businessRoom="+$('#Room5').text();
	});
	$('#Room6').click(function(){
		location.href="/exhibition/rental/R_businessRoomDecision.do?businessRoom="+$('#Room6').text();
	});
	
	$('#modifyRoomRateBtn').click(function(){
		
		if($('#roomRate').val()=='') {
			alert('평당 가격을 입력하세요');
			return;
		} else {
			$('#modifyRateBusinessRoomForm').submit();
			alert('수정되었습니다.');
		}
	});
	
	
});