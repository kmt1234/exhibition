$(document).ready(function(){
	$('#busMap').hide();
	$('#carMap').hide();
	$('#metro3Div').hide();

	
	$('#T_map').click(function(){
		$('#T_mapList').show();
		
	});
	
	$('#subwayBtn').click(function(){
		$('#busMap').hide();
		$('#carMap').hide();
		$('#metro3Div').hide();
		$('#subwayMap').show();
	});
	
	$('#metro7Btn').click(function(){
		$('#busMap').hide();
		$('#carMap').hide();
		$('#metro3Div').hide();
		$('#metro7Div').show();
	});
	
	$('#metro3Btn').click(function(){
		$('#busMap').hide();
		$('#carMap').hide();
		$('#metro7Div').hide();
		$('#metro3Div').show();
	});
	
	$('#busBtn').click(function(){
		$('#subwayMap').hide();
		$('#carMap').hide();
		$('#megaboxStationDiv').hide();
		$('#southStationDiv').hide();
		$('#exitStationDiv').hide();
		$('#busMap').show();
		$('#eastStationDiv').show();
	});
	
	
	
	$('#parkingInform').click(function(){
		$('#T_parkingB1Map').hide();
		$('#carMap').show();
	});
	
	$('#eastStationBtn').click(function(){
		$('#subwayMap').hide();
		$('#carMap').hide();
		$('#megaboxStationDiv').hide();
		$('#southStationDiv').hide();
		$('#exitStationDiv').hide();
		$('#eastStationDiv').show();
	});
	$('#southStationBtn').click(function(){
		$('#subwayMap').hide();
		$('#carMap').hide();
		$('#eastStationDiv').hide();
		$('#megaboxStationDiv').hide();
		$('#exitStationDiv').hide();
		$('#southStationDiv').show();
	});
	$('#megaboxStationBtn').click(function(){
		$('#subwayMap').hide();
		$('#carMap').hide();
		$('#eastStationDiv').hide();
		$('#southStationDiv').hide();
		$('#exitStationDiv').hide();
		$('#megaboxStationDiv').show();
	});
	$('#exitStationBtn').click(function(){
		$('#subwayMap').hide();
		$('#carMap').hide();
		$('#eastStationDiv').hide();
		$('#megaboxStationDiv').hide();
		$('#southStationDiv').hide();
		$('#exitStationDiv').show();
	});
	//승용차
	$('#carBtn').click(function(){
		$('#busMap').hide();
		$('#subwayMap').hide();
		$('#jamwonDiv').hide();
		$('#sapyungDiv').hide();
		$('#seochoDiv').hide();
		$('#banpoStationDiv').hide();
		$('#carMap').show();
		$('#banpoDiv').show();
		
	});
	
	$('#banpoBtn').click(function(){
		$('#busMap').hide();
		$('#subwayMap').hide();
		$('#jamwonDiv').hide();
		$('#sapyungDiv').hide();
		$('#seochoDiv').hide();
		$('#banpoStationDiv').hide();
		$('#banpoDiv').show();
		
	});
	
	$('#jamwonBtn').click(function(){
		$('#busMap').hide();
		$('#subwayMap').hide();
		$('#sapyungDiv').hide();
		$('#seochoDiv').hide();
		$('#banpoStationDiv').hide();
		$('#banpoDiv').hide();
		$('#jamwonDiv').show();
		
	});
	
	$('#sapyungBtn').click(function(){
		$('#busMap').hide();
		$('#subwayMap').hide();
		$('#seochoDiv').hide();
		$('#banpoStationDiv').hide();
		$('#banpoDiv').hide();
		$('#jamwonDiv').hide();
		$('#sapyungDiv').show();
		
	});
	
	$('#seochoBtn').click(function(){
		$('#busMap').hide();
		$('#subwayMap').hide();
		$('#sapyungDiv').hide();
		$('#banpoStationDiv').hide();
		$('#banpoDiv').hide();
		$('#jamwonDiv').hide();
		$('#seochoDiv').show();
		
	});
	
	$('#banpoStationBtn').click(function(){
		$('#busMap').hide();
		$('#subwayMap').hide();
		$('#sapyungDiv').hide();
		$('#seochoDiv').hide();
		$('#banpoDiv').hide();
		$('#jamwonDiv').hide();
		$('#banpoStationDiv').show();
		
	});
	
	$('#T_hotel').click(function(){
		location.href='/exhibition/traffic/T_hotelList.do';
	});
	
});