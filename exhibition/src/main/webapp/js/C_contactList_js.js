$(document).ready(function(){
	var C_name = /^[가-힣]+$/;	//한글만 가능 
	var C_phone =  /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;	//휴대폰 번호 양식
	var Cw_regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; //이메일 양식
	var classify = "위치/교통";
	
	//주요시설 연락처 - 작성하기 폼
	$('#C_contactList_WriteBtn').click(function(){
		location.href="/exhibition/customerService/C_contactList_Write.do";
	});
	
	$('#C_contactList_checkWriteBtn').click(function(){
		$('#C_contactList_checkWrite').submit();
	});

	//주요시설 연락처 리스트 불러오기

	//주요시설 연락처 검색한 값 불러오기
	
	
	$('.ui.compact.selection.dropdown').dropdown();	
});