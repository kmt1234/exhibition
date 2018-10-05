$(document).ready(function(){
	//회원정보 수정
	$('#company-info-modify').click(function(){
		location.href='/exhibition/login/mypage.do';
	});

	var Mm_regPwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]|.*[0-9]).{6,24}$/;	//6-24자리 영문대소문자or숫자or특수기호
	var Mm_regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; //이메일 양식
	var Mm_regPhone = /^(0(2|3[1-3]|4[1-4]|5[1-5]|6[1-4]))(\d{3,4})(\d{4})$/;
	
	
	var pwd = '';
	//1차 비밀번호 입력 시, 
	$('#C-modify-pwd').blur(function(){
		if(!Mm_regPwd.test($('#C-modify-pwd').val())){
			$('.C-modify-pwd-Span').text('비밀번호는 6-24자 영문 대소문자 입니다').css('color','red').css('font-size','10px');
			$('#C-modify-pwd').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
			pwd = 'fail';
		}else{
			$('.C-modify-pwd-Span').text('');
			$('#C-modify-pwd').css({'border':'1px solid green', 'background-color':'#e3fce6'});
			pwd = 'success';
		}
	});
	
	var repwd = '';
	//2차 비밀번호 입력 시,
	$('#C-modify-repwd').blur(function(){
		if(!Mm_regPwd.test($('#C-modify-repwd').val())){
			$('.C-modify-repwd-Span').text('비밀번호는 6-24자 영문 대소문자 입니다').css('color','red').css('font-size','10px');
			$('#C-modify-repwd').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
			repwd = 'fail';
		}else if($('#C-modify-repwd').val()!=$('#C-modify-pwd').val()){
			$('.C-modify-repwd-Span').text('비밀번호가 일치하지 않습니다').css('color','red').css('font-size','10px');
			$('#C-modify-repwd').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
			repwd = 'fail';
		}else{
			$('.C-modify-repwd-Span').text('');
			$('#C-modify-repwd').css({'border':'1px solid green', 'background-color':'#e3fce6'});
			repwd = 'success';
		}
	});
	
	//업태 유효성검사,
	$('#C-modify-condition').blur(function(){
		if(C-modify-condition.val()==""){
			$('.C-modify-condition-Span').text('업태를 종목을 작성해주세요').css('color','red').css('font-size','10px');
			$('#C-modify-condition').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('.C-modify-condition-Span').text('');
			$('#C-modify-condition').css({'border':'1px solid green', 'background-color':'#e3fce6'});
		}
	});
	
	//상세주소 유효성검사,
	$('#C-modify-address2').blur(function(){
		if($('#C-modify-address2').val()==""){
			$('.C-modify-address2-Span').text('상세주소를 작성해주세요').css('color','red').css('font-size','10px');
			$('#C-modify-address2').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('.C-modify-address2-Span').text('');
			$('#C-modify-address2').css({'border':'1px solid green', 'background-color':'#e3fce6'});
		}
	});
	
	var phone='success';
	//핸드폰 입력 시,
	$('#C-modify-phone').blur(function(){
		if(!Mm_regPhone.test($('#C-modify-phone').val())){
			$('.C-modify-phone-Span').text('전화 번호 양식이 맞지 않습니다').css('color','red').css('font-size','10px');
			$('#C-modify-phone').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
			phone = 'fail';
		}else{
			$('.C-modify-phone-Span').text('');
			$('#C-modify-phone').css({'border':'1px solid green', 'background-color':'#e3fce6'});
			phone = 'success';
		}
	});
	
	var email='success';
	//이메일 입력 시,
	$('#C-modify-email').blur(function(){
		if(!Mm_regEmail.test($('#C-modify-email').val())){
			$('.C-modify-email-Span').text('이메일 양식이 맞지 않습니다').css('color','red').css('font-size','10px');
			$('#C-modify-email').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
			email = 'fail';
		}else{
			$('.C-modify-email-Span').text('');
			$('#C-modify-email').css({'border':'1px solid green', 'background-color':'#e3fce6'});
			email = 'success';
		}
	});
	
	//사업자수정
	$('#C-modify-modify').click(function(){
		if($('#C-modify-pwd').val()=='' || $('#C-modify-repwd').val()==''){
			$('.C-modify-result-Span').text('비밀번호를 입력하세요').css('color','red').css('font-size','10px');
		}else if($('#C-modify-pwd').val() != $('#C-modify-repwd').val()){
			$('.C-modify-result-Span').text('비밀번호가 일치하지 않습니다').css('color','red').css('font-size','10px');
		}else if($('#C-modify-condition').val()==''){
			$('.C-modify-result-Span').text('업태 종목을 입력하세요').css('color','red').css('font-size','10px');	
		}else if($('#C-modify-address2').val()==''){
			$('.C-modify-result-Span').text('상세주소를 입력하세요').css('color','red').css('font-size','10px');	
		}else if($('#C-modify-phone').val()==''){
			$('.C-modify-result-Span').text('핸드폰 번호 입력하세요').css('color','red').css('font-size','10px');
		}else if($('#C-modify-email').val()==''){
			$('.C-modify-result-Span').text('이메일 입력하세요').css('color','red').css('font-size','10px');
		}else if(pwd=='success' && repwd=='success' && phone=='success' && email=='success'){			
			$.ajax({
				type : 'POST',
				url : '/exhibition/company/modifyCompany.do',
				data : {'C_license':$('#C-modify-license-hidden').val(), 'C_password':$('#C-modify-pwd').val(),
						'C_condition':$('#C-modify-condition').val(), 'C_postnumbox':$('#C-modify-postnumber').val(),
						'C_address1':$('#C-modify-address1').val(), 'C_address2':$('#C-modify-address2').val(),
						'C_tel':$('#C-modify-phone').val(),'C_email':$('#C-modify-email').val()},
				dataType : 'text',
				success : function(data){
					if(data=='modify'){
						alert('수정되었습니다 다시 로그인 해주세요');
						location.href='/exhibition/main/index.do';
					}else{
						alert('수정실패');
						location.href='/exhibition/main/index.do';
					}
				}//success
			});//ajax
		}//if
		
	});
	
	
	//취소 -> 메인으로
	$('#C-modify-cancel').click(function(){
		location.href="/exhibition/main/index.do";
	});
	
	//회원탈퇴버튼
	$('#company-out').click(function(){
		$('.ui.basic.modal').modal({
			closable : false,
            duration : 460,
		}).modal('show');
	});
	
	$('#del_OK').click(function(){
			$.ajax({
				type : 'POST',
				url : '/exhibition/company/deleteCompany.do',
				data : {'C_license':$('#C-modify-license-hidden').val(),'C_password':$('#del_pass').val()},
				dataType : 'text',
				success : function(data){
					if(data=='exist'){
						location.href='/exhibition/company/outComplete.do';
					}else if(data=='not_exist'){
						$('#del_check').text("비밀번호가 틀렸습니다.").css("font-size","12px").css("color","red").css("margin-left","24%").css("margin-top","2%");
						$('.ui.basic.modal').modal('show');
					}
				}//success
			});
	});
	
});