/**
 *	rental 관련 javascript
 * 
 */
$(document).ready(function(){
	$('#exhibition2F').hide();
	
	$('#1F').click(function(){
		$('#exhibition1F').show();
		$('#exhibition2F').hide();
		$('#exhibition3F').hide();
	});
	
	$('#2F').click(function(){
		$('#exhibition1F').hide();
		$('#exhibition2F').show();
		$('#exhibition3F').hide();
	});
	
	$('#3F').click(function(){
		location.href="/exhibition/rental/R_businessRoom.do"
	});
	
	
		/*$('#area1').draggable();
		$('#area2').draggable();
		$('#area3').draggable();
		$('#area4').draggable();
		$('#area5').draggable();
		$('#area6').draggable();
		$('#area7').draggable();
		$('#area8').draggable();
		$('#area9').draggable();
		$('#area10').draggable();
		$('#area11').draggable();
		$('#area12').draggable();
		$('#area13').draggable();
		$('#area14').draggable();
		$('#area15').draggable();*/
	
	
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
		
	
});