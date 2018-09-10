$(document).ready(function() {	
		
	/*---------회원가입---------*/
	var Mw_regName = /^[가-힣]+$/;	//한글만 가능 
	var Mw_regId = /^[a-z0-9_]{5,12}$/; //5~12자 영문소문자, 숫자, 특수문자 _ 사용가능
	var Mw_regPwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]|.*[0-9]).{6,24}$/;	//6-24자리 영문대소문자or숫자or특수기호
	var Mw_regPhone =  /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;	//휴대폰 번호 양식
	var Mw_regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; //이메일 양식
	
	
	//가입 버튼, 약관 숨기기
	$('#register').hide();
	$('#terms-content').hide();
	$('#writeForm-close').hide();
	
	//회원가입 팝업 닫기
	$('#writeForm-close').click(function(){
		$('.ui.modal1.modal').modal("hide");
		location.reload();
	});
	
	//이름 입력 시,
	$('#Mw_Name').blur(function(){
		if(!Mw_regName.test($('#Mw_Name').val())){
			$('#nameConfirm').text('이름은 한글만 가능합니다').css("font-size","11px").css("color","white");
			$('#Mw_Name').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('#nameConfirm').text('');
			$('#Mw_Name').css({'border':'1px solid green', 'background-color':'white'});
		}
			
	});
	
	//아이디 입력 시, 중복 자동 검사
	$('#Mw_Id').blur(function(){
		if(!Mw_regId.test($('#Mw_Id').val())){
			$('#idConfirm').text('아이디 5~12자(영문소문자+숫자)입니다').css("font-size","11px").css("color","white");
			$('#Mw_Id').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('#idConfirm').text('');
			$.ajax({
				type : 'POST',
				url : '/exhibition/member/checkId.do',
				data : {'M_Id':$('#Mw_Id').val()},
				dataType : 'text',
				success : function(data){
					if(data=='exist'){
						$('#idConfirm').text('아이디 중복입니다').css("font-size","11px").css("color","white");
						$('#Mw_Id').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
					}else if($('#Mw_Id').val()=='')
						$('#idConfirm').text('아이디 입력하세요').css("font-size","11px").css("color","white");
					else if(data=='not_exist')
						$('#Mw_Id').css({'border':'1px solid green', 'background-color':'white'});
				}//success
			});//ajax
		}//else
		
	});
	
	//비밀번호 입력 시,
	$('#Mw_Pwd').blur(function(){
		if(!Mw_regPwd.test($('#Mw_Pwd').val())){
			$('#pwdConfirm').text("비밀번호는 6-24자리 입니다").css("font-size","11px").css("color","white");
			$('#Mw_Pwd').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('#pwdConfirm').text('');
			$('#Mw_Pwd').css({'border':'1px solid green', 'background-color':'white'});
		}
	});
	
	//2차 비밀번호 입력 시,
	$('#Mw_Pwd2').blur(function(){
		if($('#Mw_Pwd').val()==''){
			$('#pwdConfirm2').text("비밀번호 입력하세요").css("font-size","11px").css("color","white");
			$('#Mw_Pwd2').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else if($('#Mw_Pwd').val()!= $('#Mw_Pwd2').val()){
			$('#pwdConfirm2').text("비밀번호가 일치하지 않습니다").css("font-size","11px").css("color","white");
			$('#Mw_Pwd2').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('#pwdConfirm2').text('');
			$('#Mw_Pwd2').css({'border':'1px solid green', 'background-color':'white'});
		}
	});
	
	//이메일 입력 시,
	$('#Mw_Email').blur(function(){
		if(!Mw_regEmail.test($('#Mw_Email').val())){
			$('#emailConfirm1').text("이메일 형식이 맞지 않습니다").css("font-size","11px").css("color","white");
			$('#Mw_Email').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('#emailConfirm1').text('');
			$('#Mw_Email').css({'border':'1px solid green', 'background-color':'white'});
		}
	});
	
	//핸드폰 번호 입력 시,
	$('#Mw_Phone').blur(function(){
		if(!Mw_regPhone.test($('#Mw_Phone').val())){
			$('#phoneConfirm1').text("휴대폰 형식이 맞지 않습니다").css("font-size","11px").css("color","white");
			$('#Mw_Phone').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('#phoneConfirm1').text('');
			$('#Mw_Phone').css({'border':'1px solid green', 'background-color':'white'});
		}
	});
	
	
	//회원가입 팝업 submit
	$('#register').click(function(){
						
		if(Mw_regName.test($('#Mw_Name').val()) && Mw_regId.test($('#Mw_Id').val()) && Mw_regPwd.test($('#Mw_Pwd').val())
												&& ($('#Mw_Pwd').val()== $('#Mw_Pwd2').val()) && Mw_regEmail.test($('#Mw_Email').val()) 
												&& Mw_regPhone.test($('#Mw_Phone').val()) && $('#idConfirm').text()!='아이디 중복입니다'){
			$('.registerConfirm').text('');
			$('#registerForm').submit();
		}else{
			$('.registerConfirm').text('양식이 맞지 않습니다').css("font-size","12px").css("color","white").css("margin-left","-37%");
		}
	
	});
	
	/*이용약관 보기*/
	$('#terms_M').click(function(){
		$('.termDiv').hide();
		$('#terms-content').show();
		
	});
	
	/*약관 닫기 클릭 시,*/
	$('#termsClose').click(function(){
		$('#terms-content').hide();
		$('.termDiv').remove();
		$('#register').show();
		$('#writeForm-close').show();
	});
	
});
