$(document).ready(function(){
	$('#T_parkingFormMap').hide();
	$('#parkingDiv').hide();
	$('#T_parkingB1Map').hide();
	$('#T_parkingB2Map').hide();
	$('#T_parkingPriceMap').hide();
	$('#jamwonDiv').hide();
	$('#sapyungDiv').hide();
	$('#seochoDiv').hide();
	$('#banpoStationDiv').hide();
	
	//주차안내클릭
	$('#parkingInform').click(function(){
		$('#T_parkingPriceMap').hide();
		$('#T_parkingB2Map').hide();
		$('#parkingDiv').hide();
		$('#T_parkingB1Map').hide();
		$('#jamwonDiv').hide();
		$('#sapyungDiv').hide();
		$('#seochoDiv').hide();
		$('#banpoStationDiv').hide();
		$('#carMap').show();
		$('#banpoDiv').show();
	});
	
	
	//주차 층별 정보
	$('#parkingB').click(function(){
		$('#carMap').hide();
		$('#T_parkingPriceMap').hide();
		$('#T_parkingB2Map').hide();
		$('#parkingDiv').show();
		$('#T_parkingB1Map').show();
	});
	
	//지하1층 클릭
	$('#B1').click(function(){
		$('#carMap').hide();
		$('#T_parkingPriceMap').hide();
		$('#T_parkingB2Map').hide();
		$('#parkingDiv').show();
		$('#T_parkingB1Map').show();
	});
	
	//지하2층 클릭
	$('#B2').click(function(){
		$('#carMap').hide();
		$('#T_parkingPriceMap').hide();
		$('#T_parkingB1Map').hide();
		$('#parkingDiv').show();
		$('#T_parkingB2Map').show();
	});
	
	//요금 정보
	$('#parkingPriceBtn').click(function(){
		$('#carMap').hide();
		$('#T_parkingB1Map').hide();
		$('#parkingDiv').hide();
		$('#T_parkingB2Map').hide();
		$('#T_parkingPriceMap').show();
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
	

	
	
});
