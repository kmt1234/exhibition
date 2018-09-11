$(document).ready(function(){
	$('#busMap').hide();
	$('#carMap').hide();
	
	$('#T_map').click(function(){
		$('#T_mapList').show();
		
	});
	
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
	
	$('#T_hotel').click(function(){
		location.href='/exhibition/traffic/T_hotelList.do';
	});
	
});