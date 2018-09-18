$(document).ready(function(){
	
	$('#C_room1').click(function(){
		location.href="/exhibition/rental/R_concertHallDecision.do?hallName="+$('#C_room1').text();
	});
	$('#C_room2').click(function(){
		location.href="/exhibition/rental/R_concertHallDecision.do?hallName="+$('#C_room2').text();
	});
	$('#C_room3').click(function(){
		location.href="/exhibition/rental/R_concertHallDecision.do?hallName="+$('#C_room3').text();
	});
	$('#C_room4').click(function(){
		location.href="/exhibition/rental/R_concertHallDecision.do?hallName="+$('#C_room4').text();
	});
	
	
});