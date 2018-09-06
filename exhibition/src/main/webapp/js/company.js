$(document).ready(function(){
	
	/*---------법인회원가입---------*/
	var Cw_regPwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]|.*[0-9]).{6,24}$/;	//6-24자리 영문대소문자or숫자or특수기호
	var Cw_regReg = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|\*]+$/; //한글과 영문만 가능
	var Cw_regPhone =  /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;	//휴대폰 번호 양식
	var Cw_regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; //이메일 양식
	var reGex = /^([0-9]{10})$/; //숫자 10자리
	var rePex = /^([0-9]{12})$/; //숫자 12자리
	
	
	$('#companyWrite').hide();
	$('#Cterms').hide();
	$('#companyWriteForm-close').hide();
	//회원가입 취소 버튼
	$('#companyWriteForm-close').click(function(){
		$('.ui.modal2.modal').modal("hide");
		location.reload();
	});
	
	//사업자명
	$('#Cw_businessname').blur(function(){
		if($('#Cw_businessname').val()==''){
			$('#businessnameConfirm').text("사업자명을 입력하세요").css("font-size","11px").css("color","white");
			$('#Cw_businessname').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('#businessnameConfirm').text('');
			$('#Cw_businessname').css({'border':'1px solid green', 'background-color':'white'});
		}
	});
	
	//사업자등록번호
	$('#Cw_license').blur(function(){
		if($('#Cw_license').val()==''){
			$('#licenseConfirm').text("사업자등록번호를 입력하세요").css("font-size","11px").css("color","white");
			$('#Cw_license').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else if(!reGex.test($('#Cw_license').val())){
			$('#licenseConfirm').text("숫자 10자리만 입력가능합니다").css("font-size","11px").css("color","white");
			$('#Cw_license').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('#licenseConfirm').text('');
			$.ajax({
				type : 'POST',
				url : '/exhibition/company/checkNum.do',
				data : {'sNum':$('#Cw_license').val()},
				dataType : 'text',
				success : function(data){
					if(data=='exist'){
						$('#licenseConfirm').text('이미 등록되어있는 번호입니다').css("font-size","11px").css("color","white");
						$('#Cw_license').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
					}else if(data=='not_exist')
						$('#Cw_license').css({'border':'1px solid green', 'background-color':'white'});
				}//success
			});//ajax
		}
	});
	
	//비밀번호
	$('#Cw_password').blur(function(){
		if($('#Cw_password').val()==''){
			$('#passwordConfirm').text("비밀번호를 입력하세요").css("font-size","11px").css("color","white");
			$('#Cw_password').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else if(!Cw_regPwd.test($('#Cw_password').val())){
			$('#passwordConfirm').text("비밀번호는 6-24자리 입니다").css("font-size","11px").css("color","white");
			$('#Cw_password').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('#passwordConfirm').text('');
			$('#Cw_password').css({'border':'1px solid green', 'background-color':'white'});
		}
	});
	
	//재확인 비밀번호
	$('#Cw_repassword').blur(function(){
		if($('#Cw_repassword').val()!=$('#Cw_password').val()){
			$('#repasswordConfirm').text("비밀번호가 맞지 않습니다.").css("font-size","11px").css("color","white");
			$('#Cw_repassword').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('#repasswordConfirm').text('');
			$('#Cw_repassword').css({'border':'1px solid green', 'background-color':'white'});
		}
	});
	
	//법인번호
	$('#Cw_corporate').blur(function(){
		if($('#Cw_corporate').val()==''){
			$('#corporateConfirm').text("법인번호를 입력하세요").css("font-size","11px").css("color","white");
			$('#Cw_corporate').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else if(!rePex.test($('#Cw_corporate').val())){
			$('#corporateConfirm').text("숫자 12자리만 입력가능합니다").css("font-size","11px").css("color","white");
			$('#Cw_corporate').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('#corporateConfirm').text('');
			$('#Cw_corporate').css({'border':'1px solid green', 'background-color':'white'});
		}
	});
	
	//업태
	$('#Cw_condition').blur(function(){
		if($('#Cw_condition').val()==''){
			$('#conditionConfirm').text("업태를 입력하세요").css("font-size","11px").css("color","white");
			$('#Cw_condition').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('#conditionConfirm').text('');
			$('#Cw_condition').css({'border':'1px solid green', 'background-color':'white'});
		}
	});
	
	//우편번호
	$('#Cw_postnumber').blur(function(){
		if($('#Cw_address1').val()==''||$('#Cw_postnumber').val()==''){
			$('#address1Confirm').text("주소를 검색하세요").css("font-size","11px").css("color","white");
			$('#Cw_address1').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
			$('#Cw_postnumber').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('#address1Confirm').text('');
			$('#Cw_address1').css({'border':'1px solid green', 'background-color':'white'});
			$('#Cw_postnumber').css({'border':'1px solid green', 'background-color':'white'});
		}
	});
	
	//주소
	$('#Cw_address1').blur(function(){
		if($('#Cw_address1').val()==''||$('#Cw_postnumber').val()==''){
			$('#address1Confirm').text("주소를 검색하세요").css("font-size","11px").css("color","white");
			$('#Cw_address1').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
			$('#Cw_postnumber').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('#address1Confirm').text('');
			$('#Cw_address1').css({'border':'1px solid green', 'background-color':'white'});
			$('#Cw_postnumber').css({'border':'1px solid green', 'background-color':'white'});
		}
	});
	
	//상세주소
	$('#Cw_address2').blur(function(){
		if($('#Cw_address2').val()==''){
			$('#address2Confirm').text("나머지주소를 입력하세요").css("font-size","11px").css("color","white");
			$('#Cw_address2').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('#address2Confirm').text('');
			$('#Cw_address2').css({'border':'1px solid green', 'background-color':'white'});
		}
	});
	
	//대표자
	$('#Cw_representative').blur(function(){
		if($('#Cw_representative').val()==''){
			$('#representativeConfirm').text("대표자를 입력하세요").css("font-size","11px").css("color","white");
			$('#Cw_representative').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else if(!Cw_regReg.test($('#Cw_representative').val())){
			$('#representativeConfirm').text("한글과 영문만 가능합니다").css("font-size","11px").css("color","white");
			$('#Cw_representative').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else {
			$('#representativeConfirm').text('');
			$('#Cw_representative').css({'border':'1px solid green', 'background-color':'white'});
		}
	});
	
	//핸드폰
	$('#Cw_tel').blur(function(){
		if($('#Cw_tel').val()==''){
			$('#telConfirm').text("휴대폰을 입력하세요").css("font-size","11px").css("color","white");
			$('#Cw_tel').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else if(!Cw_regPhone.test($('#Cw_tel').val())){
			$('#telConfirm').text("휴대폰 양식에 맞지 않습니다. ex) 01XXXXXXXXX").css("font-size","11px").css("color","white");
			$('#Cw_tel').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else {
			$('#telConfirm').text('');
			$('#Cw_tel').css({'border':'1px solid green', 'background-color':'white'});
		}
	});
	
	//이메일
	$('#Cw_email').blur(function(){
		if($('#Cw_email').val()==''){
			$('#emailConfirm').text("이메일을 입력하세요").css("font-size","11px").css("color","white");
			$('#Cw_email').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else if(!Cw_regEmail.test($('#Cw_email').val())){
			$('#emailConfirm').text("이메일 양식에 맞지 않습니다. ex) XXX@XXX.XXX").css("font-size","11px").css("color","white");
			$('#Cw_email').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('#emailConfirm').text('');
			$('#Cw_email').css({'border':'1px solid green', 'background-color':'white'});
		}
	});
	
	//등록클릭시
	$('#companyWrite').click(function(){ 
		if($('#businessnameConfirm').text()=='' && $('#licenseConfirm').text()=='' && $('#passwordConfirm').text()=='' &&
				$('#repasswordConfirm').text()=='' && $('#corporateConfirm').text()=='' && $('#conditionConfirm').text()=='' &&
				$('#address1Confirm').text()=='' && $('#address2Confirm').text()=='' && $('#representativeConfirm').text()=='' &&
				$('#telConfirm').text()=='' && $('#emailConfirm').text()==''){
			alert('회원가입이 완료되었습니다.');
			$('#companyWriteForm').submit();
		}else{
			alert('양식을 다시 확인하세요');
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