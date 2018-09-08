$(document).ready(function(){
	var C_name = /^[가-힣]+$/;	//한글만 가능 
	var C_tel =  /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;	//휴대폰 번호 양식
	
	//공지사항 - 작성하기
	$('#C_notice_checkWrite').click(function(){ // 공지사항 - 등록버튼 클릭시
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		
		if($('#subject').val()=='')
			$('#subjectDiv').text("제목을 입력하세요").css('font-size','9pt').css('color','red')
		else if($('#content').val()=='')
			$('#contentDiv').text("내용을 입력하세요").css('font-size','9pt').css('color','red')
		else
			$('#C_notice_WriteForm').submit();
	});
	
	//공지사항 수정
	$('#C_notice_checkModify').click(function(){
		
		/*$('#C_notice_ModifyForm').submit();*/
	});
	
	
	
	$('#C_checkInquire').click(function(){ // 고객의 소리 - 등록버튼 클릭시
		$('#nameDiv').empty();
		$('#telDiv').empty();
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
	
		if($('#name').val()=='')
			$('#nameDiv').text("이름을 입력하세요").css('font-size','9pt').css('color','red')
		else if(!C_name.test($('#name').val()))
			$('#nameDiv').text("이름은 한글만 가능합니다").css('font-size','9pt').css('color','red')
		
		else if($('#tel').val()=='')
			$('#telDiv').text("연락처를 입력하세요").css('font-size','9pt').css('color','red')
		else if(!C_tel.test($('#tel').val()))
			$('#telDiv').text("전화번호 형식이 맞지 않습니다").css('font-size','9pt').css('color','red')
		
		else if($('#subject').val()=='')
			$('#subjectDiv').text("제목을 입력하세요").css('font-size','9pt').css('color','red')
		else if($('#content').val()=='')
			$('#contentDiv').text("내용을 입력하세요").css('font-size','9pt').css('color','red')
		
		else
			$('#C_inquireForm').submit();
	});

	$('#checkCustomerServiceEmailSend').click(function() {	//이메일 인증 - 인증번호 전송 버튼 클릭시
		alert($('#email').val());
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
	});
	
	$('#checkCustomerServiceEmailConfirm').click(function() {		//인증 확인 버튼 클릭시
		var email = $('#email').val()
		
		if ($('#checkEmail').val()=='')
			$('#checkEmailDiv').text("인증번호를 입력하세요").css('font-size','9pt').css('color','red')
		else if ($('#reC_EmailConfirm').val()==($('#checkEmail').val())) 
			location.href = '/exhibition/customerService/C_inquireForm.do?email='+email;
		else 
			$('#checkEmailDiv').text('인증번호가 틀렸습니다').css('font-size','9pt').css('color','red')
	});
	//고객의 소리 - 관리자 버튼
	$('#C_email_ListBtn').click(function(){
		location.href="/exhibition/customerService/C_inquire_List.do";
	});
	
	//자주 묻는 질문 - 작성하기 폼
	$('#C_QnA_checkWrite').click(function(){
		$('#C_QnA_WriteForm').submit();
	});
	
	//주요시설 연락처 - 작성하기 폼
	$('#C_contactList_checkWrite').click(function(){
		$('#C_contactList_WriteForm').submit();
	});
	
	
	
});