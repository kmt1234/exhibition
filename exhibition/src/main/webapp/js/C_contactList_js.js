$(document).ready(function(){
	var C_name = /^[가-힣]+$/;	//한글만 가능 
	var C_phone =  /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;	//휴대폰 번호 양식
	
	//주요시설 연락처 - 작성하기 폼
	$('#C_contactList_WriteBtn').click(function(){
		location.href="/exhibition/customerService/C_contactList_Write.do";
	});
	
	$('#C_contactList_checkWriteBtn').click(function(){
		$('#classifyDiv').empty();
		$('#facilityDiv').empty();
		$('#titleDiv').empty();
		$('#nameDiv').empty();
		$('#phoneDiv').empty();
		
		if($('#classify').val()=='')
			$('#classifyDiv').text("분류를 입력하세요").css('font-size','9pt').css('color','red')
		else if($('#facility').val()=='')
			$('#facilityDiv').text("기관&시설을 입력하세요").css('font-size','9pt').css('color','red')
		else if($('#title').val()=='')
			$('#titleDiv').text("명칭을 입력하세요").css('font-size','9pt').css('color','red')
		else if($('#name').val()=='')
			$('#nameDiv').text("담당자를 입력하세요").css('font-size','9pt').css('color','red')
		else if($('#phone').val()=='')
			$('#phoneDiv').text("연락처를 입력하세요").css('font-size','9pt').css('color','red')
		else 
			$('#C_contactList_checkWrite').submit();
	});
	
	
	$('.ui.compact.selection.dropdown').dropdown();	
});