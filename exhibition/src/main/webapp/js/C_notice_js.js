$(document).ready(function(){
	var C_name = /^[가-힣]+$/;	//한글만 가능 
	var C_phone =  /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;	//휴대폰 번호 양식
	var Cw_regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; //이메일 양식
	
	$('#C_notice_WriteBtn').click(function(){ 
		location.href="/exhibition/customerService/C_notice_WriteBtn.do";
	});
	
	
	//공지사항 - 작성하기
	$('#C_notice_checkWriteBtn').click(function(){ // 공지사항 - 등록버튼 클릭시
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		
		if($('#subject').val()=='')
			$('#subjectDiv').text("제목을 입력하세요").css('font-size','9pt').css('color','red')
		else if($('#content').val()=='')
			$('#contentDiv').text("내용을 입력하세요").css('font-size','9pt').css('color','red')
		else
			$('#C_notice_Write').submit();
	});
	
	//공지사항 내용보기에서 글수정 버튼 눌렀을때 수정하는 폼
	$('#C_notice_modifyBtn').click(function(){
		location.href="/exhibition/customerService/C_notice_Modify.do?seq="+$('#putSeq').val();
	});
	//공지사항 수정한내용을 데이터 베이스에 저장
	$('#C_notice_checkModifyBtn').click(function(){
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		
		if($('#subject').val()=='')
			$('#subjectDiv').text("제목을 입력하세요").css('font-size','9pt').css('color','red')
		else if($('#content').val()=='')
			$('#contentDiv').text("내용을 입력하세요").css('font-size','9pt').css('color','red')
		else{
			$.ajax({
				type : 'POST',
				url : '/exhibition/customerService/C_notice_checkModify.do',
				data : {'seq' : $('#seq').val() , 'subject' : $('#subject').val() , 'content' : $('#content').val() },
				success : function(data){
					//alert(JSON.stringify(data));
					location.href="/exhibition/customerService/C_notice.do";
				}
			});
		}
	});
	
	$('#C_notice_deleteBtn').click(function(){
		location.href="/exhibition/customerService/C_notice_Delete.do?seq="+$('#putSeq').val();
	});
	
	//공지사항 리스트 불러오기
	$('#C_noticeListBtn').click(function(){
		location.href="/exhibition/customerService/C_notice.do";
	});

	
	
	$('.ui.compact.selection.dropdown').dropdown();
});