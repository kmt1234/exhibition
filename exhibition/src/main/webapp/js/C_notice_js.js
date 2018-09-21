$(document).ready(function(){
	
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
	
	//공지사항 작성중 돌아가기(뒤로)
	$('#C_notice_WriteBack').click(function(){
		location.href="/exhibition/customerService/C_notice.do?pg=${pg}";
	});

	
	
	$('.ui.compact.selection.dropdown').dropdown();
});