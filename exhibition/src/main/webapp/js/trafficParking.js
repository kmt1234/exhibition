$(document).ready(function(){
	$('#T_parkingFormMap').hide();
	$('#T_parkingB2Map').hide();
	$('#T_parkingPriceMap').hide();
	
	$('#parkingPriceBtn').click(function(){

		$('#T_parkingPriceMap').show();	
	});
	
	$('#parkingInform').click(function(){
		$('#T_parkingFormMap').hide();
		$('#T_parkingPriceMap').hide();
		$('#carMap').show();
	});
	
	$('#parkingB').click(function(){
		$('#carMap').hide();
		$('#T_parkingPriceMap').hide();
		$('#T_parkingFormMap').show();
		
	});
	
	$('#B1').click(function(){
		$('#T_parkingB2Map').hide();
		$('#T_parkingB1Map').show();
	});
	
	$('#B2').click(function(){
		$('#T_parkingB1Map').hide();
		$('#T_parkingB2Map').show();
	});
	
	
});
