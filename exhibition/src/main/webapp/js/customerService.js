$(document).ready(function(){
	var C_name = /^[가-힣]+$/;	//한글만 가능 
	var C_phone =  /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;	//휴대폰 번호 양식
	
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
		$('#C_notice_checkModify').submit();
	});
	
	$('#C_notice_deleteBtn').click(function(){
		location.href="/exhibition/customerService/C_notice_Delete.do?seq="+$('#putSeq').val();
	});
	//공지사항 - 공지사항뷰에서 목록보기
	$('#C_noticeListBtn').click(function(){
		location.href="/exhibition/customerService/C_notice.do";
	});

	//고객의 소리 - 이메일 인증 - 인증번호 전송 버튼 클릭시
	$('#C_emailSendBtn').click(function() {
		if($('#email').val()==''){
			$('#emailDiv').text("이메일을 입력하세요").css('font-size','9pt').css('color','red')
		} else {
			$.ajax({
			type : 'POST',
			url : '/exhibition/customerService/sendEmail.do',
			data : {'email':$('#email').val()},
			dataType: 'text',
			success : function(data){
				alert(data);
				$('#reC_EmailConfirm').val(data);
				alert('메일을 보냈습니다.')
			}
		});
		}
	});
	
	//인증 확인 버튼 클릭시
	$('#C_emailConfirmBtn').click(function() {		//인증 확인 버튼 클릭시
		var email = $('#email').val()
		if ($('#checkEmail').val()=='')
			$('#checkEmailDiv').text("인증번호를 입력하세요").css('font-size','9pt').css('color','red')
			else if ($('#reC_EmailConfirm').val()!=($('#checkEmail').val())) 
				$('#checkEmailDiv').text('인증번호가 틀렸습니다').css('font-size','9pt').css('color','red')
				else 
					location.href = '/exhibition/customerService/C_inquire.do?email='+email;
	});
	
	// 고객의 소리 - 문의하기 -  등록버튼 클릭시
	$('#C_checkInquireBtn').click(function(){
		$('#nameDiv').empty();
		$('#phoneDiv').empty();
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		if($('#name').val()=='')
			$('#nameDiv').text("이름을 입력하세요").css('font-size','9pt').css('color','red')
		else if(!C_name.test($('#name').val()))
			$('#nameDiv').text("이름은 한글만 가능합니다").css('font-size','9pt').css('color','red')
		else if($('#phone').val()=='')
			$('#phoneDiv').text("연락처를 입력하세요").css('font-size','9pt').css('color','red')
		else if(!C_phone.test($('#phone').val()))
			$('#phoneDiv').text("전화번호 형식이 맞지 않습니다").css('font-size','9pt').css('color','red')
		else if($('#subject').val()=='')
			$('#subjectDiv').text("제목을 입력하세요").css('font-size','9pt').css('color','red')
		else if($('#content').val()=='')
			$('#contentDiv').text("내용을 입력하세요").css('font-size','9pt').css('color','red')
		else
			$('#C_Inquire').submit();
	});

	//고객의 소리 - 관리자 버튼
	$('#C_email_ListBtn').click(function(){
		location.href="/exhibition/customerService/C_inquire_List.do";
	});
	
	//고객의 소리  - 답변하기 폼
	$('#C_inquire_replyBtn').click(function(){
		$('#C_inquire_writeReply').submit();
	});
	
	$('#C_checkReplyBtn').click(function(){
		if($('#subject').val()=='')
			$('#subjectDiv').text("제목을 입력하세요").css('font-size','9pt').css('color','red')
		else if($('#content').val()=='')
			$('#contentDiv').text("내용을 입력하세요").css('font-size','9pt').css('color','red')
		else
			$('#C_inquire_checkReply').submit();
	});
	
	//자주 묻는 질문 - 작성하기 폼
	$('#C_QnA_writeBtn').click(function(){
		location.href="/exhibition/customerService/C_QnA_Write.do";
	});
	
	
	//자주 묻는 질문 작성하기 등록버튼
	$('#C_QnA_checkWriteBtn').click(function(){
		var classify = $('#classify option:selected').val();
		alert(classify);
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		if($('#subject').val()=='')
			$('#subjectDiv').text("제목을 입력하세요").css('font-size','9pt').css('color','red')
		else if($('#content').val()=='')
			$('#contentDiv').text("내용을 입력하세요").css('font-size','9pt').css('color','red')
		else{
			$('#C_qty').val(classify);
			$('#C_QnA_checkWrite').submit();
		}	
	});
	
	//주요시설 연락처 - 작성하기 폼
	$('#C_contactList_WriteBtn').click(function(){
		location.href="/exhibition/customerService/C_contactList_Write.do";
	});
	
	$('#C_contactList_checkWriteBtn').click(function(){
		$('#C_contactList_checkWrite').submit();
	});
	
	
	
	
	
});