/**
 *	rental 관련 javascript
 * 
 */
$(document).ready(function(){
	$('#exhibition2F').hide();
	
	$('#hall2Div').hide();
	$('#hall3Div').hide();
	$('#hall4Div').hide();
	$('#hall5Div').hide();
	$('#hall6Div').hide();
	$('#hall7Div').hide();
	$('#hall8Div').hide();
	$('#hall5').hide();
	$('#hall6').hide();
	$('#hall7').hide();
	$('#hall8').hide();
	
	$('#hall1').click(function(){
		$('#hall1Div').show();
		$('#hall2Div').hide();
		$('#hall3Div').hide();
		$('#hall4Div').hide();
	});
	$('#hall2').click(function(){
		$('#hall2Div').show();
		$('#hall1Div').hide();
		$('#hall3Div').hide();
		$('#hall4Div').hide();
	});
	$('#hall3').click(function(){
		$('#hall3Div').show();
		$('#hall1Div').hide();
		$('#hall2Div').hide();
		$('#hall4Div').hide();
	});
	$('#hall4').click(function(){
		$('#hall4Div').show();
		$('#hall1Div').hide();
		$('#hall2Div').hide();
		$('#hall3Div').hide();
	});
	$('#hall5').click(function(){
		$('#hall5Div').show();
		$('#hall6Div').hide();
		$('#hall7Div').hide();
		$('#hall8Div').hide();
	});
	$('#hall6').click(function(){
		$('#hall6Div').show();
		$('#hall5Div').hide();
		$('#hall7Div').hide();
		$('#hall8Div').hide();
	});
	$('#hall7').click(function(){
		$('#hall7Div').show();
		$('#hall5Div').hide();
		$('#hall6Div').hide();
		$('#hall8Div').hide();
	});
	$('#hall8').click(function(){
		$('#hall8Div').show();
		$('#hall5Div').hide();
		$('#hall6Div').hide();
		$('#hall7Div').hide();
	})
	
	
	$('#1F').click(function(){
		$('#exhibition1F').show();
		$('#exhibition2F').hide();
		$('#exhibition3F').hide();
		
		$('#hall1Div').show();
		$('#hall2Div').hide();
		$('#hall3Div').hide();
		$('#hall4Div').hide();
		$('#hall5Div').hide();
		$('#hall6Div').hide();
		$('#hall7Div').hide();
		$('#hall8Div').hide();
		$('#hall1').show();
		$('#hall2').show();
		$('#hall3').show();
		$('#hall4').show();
		$('#hall5').hide();
		$('#hall6').hide();
		$('#hall7').hide();
		$('#hall8').hide();
		
	});
	
	$('#2F').click(function(){
		$('#exhibition1F').hide();
		$('#exhibition2F').show();
		$('#exhibition3F').hide();
		
		$('#hall1Div').hide();
		$('#hall2Div').hide();
		$('#hall3Div').hide();
		$('#hall4Div').hide();
		$('#hall5Div').show();
		$('#hall6Div').hide();
		$('#hall7Div').hide();
		$('#hall8Div').hide();
		$('#hall1').hide();
		$('#hall2').hide();
		$('#hall3').hide();
		$('#hall4').hide();
		$('#hall5').show();
		$('#hall6').show();
		$('#hall7').show();
		$('#hall8').show();
		
	});
	
	$('#3F').click(function(){
		location.href="/exhibition/rental/R_businessRoom.do"
	});
//박람회~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//1층버튼
	$('#area1').click(function(){
		location.href="/exhibition/rental/R_exhibitionHollDecision.do?booth="+$('#Booth1').text();
	});
	$('#area2').click(function(){
		location.href="/exhibition/rental/R_exhibitionHollDecision.do?booth="+$('#Booth2').text();
	});
	$('#area3').click(function(){
		location.href="/exhibition/rental/R_exhibitionHollDecision.do?booth="+$('#Booth3').text();
	});
	$('#area4').click(function(){
		location.href="/exhibition/rental/R_exhibitionHollDecision.do?booth="+$('#Booth4').text();
	});
	$('#area5').click(function(){
		location.href="/exhibition/rental/R_exhibitionHollDecision.do?booth="+$('#Booth5').text();
	});
	$('#area6').click(function(){
		location.href="/exhibition/rental/R_exhibitionHollDecision.do?booth="+$('#Booth6').text();
	});
//2층버튼
	$('#area7').click(function(){
		location.href="/exhibition/rental/R_exhibitionHollDecision.do?booth="+$('#Booth7').text();
	});
	$('#area8').click(function(){
		location.href="/exhibition/rental/R_exhibitionHollDecision.do?booth="+$('#Booth8').text();
	});
	$('#area9').click(function(){
		location.href="/exhibition/rental/R_exhibitionHollDecision.do?booth="+$('#Booth9').text();
	});
	$('#area10').click(function(){
		location.href="/exhibition/rental/R_exhibitionHollDecision.do?booth="+$('#Booth10').text();
	});
	$('#area11').click(function(){
		location.href="/exhibition/rental/R_exhibitionHollDecision.do?booth="+$('#Booth11').text();
	});
	$('#area12').click(function(){
		location.href="/exhibition/rental/R_exhibitionHollDecision.do?booth="+$('#Booth12').text();
	});
	$('#area13').click(function(){
		location.href="/exhibition/rental/R_exhibitionHollDecision.do?booth="+$('#Booth13').text();
	});
	$('#area14').click(function(){
		location.href="/exhibition/rental/R_exhibitionHollDecision.do?booth="+$('#Booth14').text();
	});
	$('#area15').click(function(){
		location.href="/exhibition/rental/R_exhibitionHollDecision.do?booth="+$('#Booth15').text();
	});
//비지니스룸~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
//3층
	$('#room1').click(function(){
		location.href="/exhibition/rental/R_exhibitionHollDecision.do?room="+$('#Room1').text();
	});
	$('#room2').click(function(){
		location.href="/exhibition/rental/R_exhibitionHollDecision.do?room="+$('#Room2').text();
	});
	$('#room3').click(function(){
		location.href="/exhibition/rental/R_exhibitionHollDecision.do?room="+$('#Room3').text();
	});
	$('#room4').click(function(){
		location.href="/exhibition/rental/R_exhibitionHollDecision.do?room="+$('#Room4').text();
	});
	$('#room5').click(function(){
		location.href="/exhibition/rental/R_exhibitionHollDecision.do?room="+$('#Room5').text();
	});
//공연 홀~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
//지하1층	
	$('#C_room1').click(function(){
		location.href="/exhibition/rental/R_exhibitionHollDecision.do?room="+$('#C_room1').text();
	});
	$('#C_room2').click(function(){
		location.href="/exhibition/rental/R_exhibitionHollDecision.do?room="+$('#C_room2').text();
	});
	$('#C_room3').click(function(){
		location.href="/exhibition/rental/R_exhibitionHollDecision.do?room="+$('#C_room3').text();
	});
	$('#C_room4').click(function(){
		location.href="/exhibition/rental/R_exhibitionHollDecision.do?room="+$('#C_room4').text();
	});
	
	
	$('#modifyRateBtn').click(function(){
		if($('#boothRate').val()=='') {
			alert('평당 가격을 입력하세요');
			return;
		} else {
			$('#modifyRateExhibitionForm').submit();
		}
		
		
		
	});
	
});