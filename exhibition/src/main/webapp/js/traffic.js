$(document).ready(function(){
	$('#busMap').hide();
	$('#carMap').hide();

	
	$('#subwayBtn').click(function(){
		$('#busMap').hide();
		$('#carMap').hide();
		$('#subwayMap').show();
	});
	
	$('#busBtn').click(function(){
		$('#subwayMap').hide();
		$('#carMap').hide();
		$('#busMap').show();
	});
	
	$('#carBtn').click(function(){
		$('#busMap').hide();
		$('#subwayMap').hide();
		$('#carMap').show();
	});
	
	$('#parkingInform').click(function(){
		$('#T_parkingB1Map').hide();
		$('#carMap').show();
	});
	
	
});