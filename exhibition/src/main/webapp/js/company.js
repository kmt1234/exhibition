$(document).ready(function(){
	
	/*---------법인회원가입---------*/
	
	//회원가입 버튼 숨기기
	$('#companyWrite').hide();
	$('#Cterms').hide();
	$('#companyWriteForm-close').hide();
	//회원가입 취소 버튼
	$('#companyWriteForm-close').click(function(){
		$('.ui.modal2.modal').modal("hide");
		location.reload();
	});
	
	
	$('#addrB').click(function(){ //주소검색아이콘 클릭
		$('#Cw_address1').val($('#addrText').val());
	});
	
	
	$('#companyWrite').click(function(){ //등록클릭시
		
		var Cw_regPwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]|.*[0-9]).{6,24}$/;	//6-24자리 영문대소문자or숫자or특수기호
		var Cw_regPhone =  /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
		var Cw_regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		
		$('#businessnameConfirm').empty();
		$('#licenseConfirm').empty();
		$('#passwordConfirm').empty();
		$('#repasswordConfirm').empty();
		$('#corporateConfirm').empty();
		$('#conditionConfirm').empty();
		$('#address2Confirm').empty();
		$('#representativeConfirm').empty();
		$('#telConfirm').empty();
		$('#emailConfirm').empty();
		
		$('#Cw_businessname').css('background-color','white');
		$('#Cw_license').css('background-color','white');
		$('#Cw_password').css('background-color','white');
		$('#Cw_repassword').css('background-color','white');
		$('#Cw_corporate').css('background-color','white');
		$('#Cw_condition').css('background-color','white');
		$('#Cw_address1').css('background-color','white');
		$('#Cw_address2').css('background-color','white');
		$('#Cw_representative').css('background-color','white');
		$('#Cw_tel').css('background-color','white');
		$('#Cw_email').css('background-color','white');
		
		var Cw_businessname = $('#Cw_businessname');
		var Cw_license = $('#Cw_license');
		var Cw_password = $('#Cw_password');
		var Cw_repassword = $('#Cw_repassword');
		var Cw_corporate = $('#Cw_corporate');
		var Cw_condition = $('#Cw_condition');
		var Cw_address1 = $('#Cw_address1');
		var Cw_address2 = $('#Cw_address2');
		var Cw_representative = $('#Cw_representative');
		var Cw_tel = $('#Cw_tel');
		var Cw_email = $('#Cw_email');
			
		if(Cw_businessname.val()==''){
			$('#businessnameConfirm').text('사업자명을 입력하세요').css("font-size","11px").css("color","white");
			$('#Cw_businessname').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else if(Cw_license.val()==''){
			$('#licenseConfirm').text('사업자등록번호를 입력하세요').css("font-size","11px").css("color","white");
			$('#Cw_license').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else if(!Cw_regPwd.test(Cw_password.val())){
			$('#passwordConfirm').text("비밀번호는 6-24자리+숫자 또는 특수기호 혼용입니다").css("font-size","11px").css("color","white");
			$('#Cw_password').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else if(Cw_password.val()!= $('#Cw_repassword').val()){
			$('#repasswordConfirm').text("비밀번호가 일치하지 않습니다").css("font-size","11px").css("color","white");
			$('#Cw_repassword').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else if(Cw_corporate.val()==''){
			$('#corporateConfirm').text('법인번호를 입력하세요').css("font-size","11px").css("color","white");
			$('#Cw_corporate').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else if(Cw_condition.val()==''){
			$('#conditionConfirm').text('업태를 입력하세요').css("font-size","11px").css("color","white");
			$('#Cw_condition').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else if(Cw_address1.val()==''){
			$('#address2Confirm').text("주소를 입력하세요").css("font-size","11px").css("color","white");
			$('#Cw_address1').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else if(Cw_address2.val()==''){
			$('#address2Confirm').text("상세주소를 입력하세요").css("font-size","11px").css("color","white");
			$('#Cw_address2').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else if(Cw_representative.val()==''){
			$('#representativeConfirm').text("대표자를 입력하세요").css("font-size","11px").css("color","white");
			$('#Cw_representative').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else if(!Cw_regPhone.test(Cw_tel.val())){
			$('#telConfirm').text("핸드폰 형식이 맞지 않습니다").css("font-size","11px").css("color","white");
			$('#Cw_tel').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else if(!Cw_regEmail.test(Cw_email.val())){
			$('#emailConfirm').text("이메일 형식이 맞지 않습니다").css("font-size","11px").css("color","white");
			$('#Cw_email').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('#Cw_businessname').empty();
			$('#Cw_license').empty();
			$('#Cw_password').empty();
			$('#Cw_repassword').empty();
			$('#Cw_corporate').empty();
			$('#Cw_condition').empty();
			$('#addrText').empty();
			$('#Cw_address1').empty();
			$('#Cw_address2').empty();
			$('#Cw_representative').empty();
			$('#Cw_tel').empty();
			$('#Cw_email').empty();
			$('#companyWriteForm').submit();
		}
	});
	
	//닫기클릭시
	$('#companyWriteForm-close').click(function(){
		$('#companyWriteFormPopup').hide(); 
		$('.ui.modal2.modal').modal("hide");
	});
	
	/*이용약관 보기*/
	$('#terms_C').click(function(){
		$('#CtermDiv').hide();
		$('#terms_C').hide();
		$('#Cterms').show();
	});
	
	/*약관 닫기 클릭 시,*/
	$('#CtermsForm-close').click(function(){
		$('#CtermsFormPopup').hide();
		$('#terms_C').hide();
		$('#Cterms').remove();
		$('#companyWriteForm-close').show();
		$('#companyWrite').show();
	});

});