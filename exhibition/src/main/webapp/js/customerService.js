$(document).ready(function(){
	$('#C_checkInquire').click(function(){ // 고객의 소리 - 등록버튼 클릭시
		$('#C_InquireForm').submit();
	});

	/*$('#C_noticeSearch').click(function(){ // 공지사항 검색버튼 클릭시
		
		$('').submit();	//아직 안함
	});*/

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
		if($('#reC_EmailConfirm').val()==($('#checkEmail').val())) {
			location.href = '/exhibition/customerService/C_Inquire.do?email='+email;
			
		} else {
			$('#checkMailDiv').text('인증번호가 틀렸습니다.');
		}
	});
});