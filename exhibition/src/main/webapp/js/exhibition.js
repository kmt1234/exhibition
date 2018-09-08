/**
 *	rental 관련 javascript
 * 
 */

$(document).ready(function(){
	var code = $('#code').val();
	if(code=='2') {
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
	} else  {
		$('.booth').click(function(){
			$('.ui.mini.modal').modal('show');
		});
	}

	
	
	
});