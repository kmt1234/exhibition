$(document).ready(function(){
	
	/*----------개인회원 로그인---------*/
	$('#Mlogin').click(function(){
		var regId = /^[a-z0-9_]{5,12}$/; //5~12자 영문소문자, 숫자, 특수문자 _ 사용가능
		var regPwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]|.*[0-9]).{6,24}$/;	//6-24자리 영문대소문자or숫자or특수기호
		var regPhone =  /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	
		//유효성 칸 초기화 
		$('#id-Confirm').empty();
		$('#pwd-Confirm').empty();
		$('#login-Confirm').empty();
		
		var id = $('#M_Id');
		var pwd = $('#M_Pwd');
		
		if(!regId.test(id.val())){
			$('#id-Confirm').text("아이디는 5~12자 영문소문자, 숫자, 특수문자 입니다").css("font-size","12px").css("color","white");
			$('#M_Id').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else if(!regPwd.test(pwd.val())){
			$('#pwd-Confirm').text("비밀번호는 6-24자리+숫자 또는 특수기호 혼용입니다").css("font-size","12px").css("color","white");
			$('#M_Pwd').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else
			$.ajax({
				type : 'POST',
				url : '/exhibition/login/login.do',
				data : {'M_Id':id.val(), 'M_Pwd':pwd.val()},
				dataType : 'text',
				success : function(data){
					if(data=='exist')
						location.href='/exhibition/main/index.do';
					else if(data=='not_exist')
						$('#login-Confirm').text("아이디 및 비밀번호를 확인하세요").css("font-size","12px").css("color","white");
				}//success
			});//ajax
		
	});
	
	/*-----개인회원 아이디 및 비밀번호 찾기-----*/
	$('.M-find-id-pwd').click(function(){
		$('.ui.modal-Find-Member.modal').modal('show');
	});
	
	/*----------법인회원 로그인---------*/
	$('#Clogin').click(function(){
		var reGex = /^([0-9]{10})$/; //숫자 10자리
		var C_regPwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]|.*[0-9]).{6,24}$/;	//6-24자리 영문대소문자or숫자or특수기호
		
		var gex = $('#C_license');
		var pwd = $('#C_Pwd');
		
		$('#C_license-Confirm').empty();
		$('#C_pwd-Confirm').empty();
		$('#C_login-Confirm').empty();

		if(!reGex.test(gex.val())){
			$('#C_license-Confirm').text("사업자번호는 10자리입니다").css("font-size","12px").css("color","white");
			$('#C_license').css({'border':'1px solid red','background-color':'#f4d2d2'});
		}else if(!C_regPwd.test(pwd.val())){
			$('#C_pwd-Confirm').text("비밀번호는 6-24자리+숫자 또는 특수기호 혼용입니다").css("font-size","12px").css("color","white");
			$('#C_license').css({'border-color':'transparent','background-color':'white'});
			$('#C_Pwd').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else {
			$.ajax({
				type : 'POST',
				url : '/exhibition/login/Clogin.do',
				data : {'C_license': $('#C_license').val(), 'C_password':$('#C_Pwd').val()},
				dataType : 'text',
				success : function(data){
					if(data=='exist')
						location.href='/exhibition/main/index.do';
					else if(data=='not_exist'){
						$('#C_login-Confirm').text("사업자등록번호 및 비밀번호를 확인하세요").css("font-size","12px").css("color","red");
					}
				}//success
			});//ajax
		}
	});
	
		

	
	/*-----법인회원 아이디 및 비밀번호 찾기-----*/
	$('.C-find-id-pwd').click(function(){
		$('.ui.modal-Find-Company.modal').modal('show');
	});
	
	/*-----로그아웃(공통)------*/
	$('#logout').click(function(){
		location.href="/exhibition/login/logout.do";
	});
	
	/*-----마이페이지(공통)-----*/
	$('#mypage').click(function(){
		location.href='/exhibition/login/mypage.do';
	});
	
	
	
	/*----개인회원 아이디 찾기------*/
	var findId_regName = /^[가-힣]+$/;	//한글만 가능 
	var findId_regPhone =  /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;	//휴대폰 번호 양식
	var findId_regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; //이메일 양식
	
	$('.find-M-Name-Div').hide();	//이름 유효성 안내글 숨김
	$('.find-M-Phone-Div').hide();	//연락처 유효성 안내글 숨김
	$('.find-M-Email-Div').hide();	//이메일 유효성 안내글 숨김
	;
	
	$('#verify-Number-Send').hide();	//이메일 인증번호 전송 버튼 숨김
	$('#confirm-M-verifyNum-Btn').hide(); //인증번호 확인 버튼 숨김 
	$('#find-M-Id').click(function(){
		$('#find-M-Id').addClass(' active');
		$('#find-M-Id').css('color','black');
		$('#find-M-Pwd').removeClass(' active');
		$('#find-M-Pwd').css('color','white');
		$('#find-M-Id-Div').show();
		$('#find-M-Pwd-Div').hide();
		$('#find-M-Id-Btn').show();
		$('#find-M-login-Btn').hide();
		$('#confirm-M-verifyNum-Btn').hide();
	});
	
	/*----개인회원 비밀번호 찾기-----*/
	$('#find-M-Pwd-Div').hide();
	$('#find-M-login-Btn').hide();
	$('#find-M-Pwd').click(function(){
		$('#find-M-Id').removeClass(' active');
		$('#find-M-Id').css('color','white');
		$('#find-M-Pwd').addClass(' active');
		$('#find-M-Pwd').css('color','black');
		$('#find-M-Pwd-Div').show();
		$('#find-M-Id-Div').hide();
		$('#find-M-Id-Btn').hide();
		$('#find-M-login-Btn').show();
		$('#verify-Number-Send').show();
		$('#confirm-M-verifyNum-Btn').show(); 
	});
	
	//이름 입력 시,
	$('#find-M-Name').blur(function(){
		if(!findId_regName.test($('#find-M-Name').val())){
			$('.find-M-Name-Div').text('이름은 한글만 가능합니다');
			$('.find-M-Name-Div').show();
			$('#find-M-Name').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('.find-M-Name-Div').text('');
			$('.find-M-Name-Div').hide();
			$('#find-M-Name').css({'border':'1px solid green', 'background-color':'#e3fce6'});
		}
	});
	//연락처 입력 시,
	$('#find-M-Phone').blur(function(){
		if(!findId_regPhone.test($('#find-M-Phone').val())){
			$('.find-M-Phone-Div').text('핸드폰 번호는 - 없이 입력하세요');
			$('.find-M-Phone-Div').show();
			$('#find-M-Phone').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('.find-M-Phone-Div').text('');
			$('.find-M-Phone-Div').hide();
			$('#find-M-Phone').css({'border':'1px solid green', 'background-color':'#e3fce6'});
		}
	});
	//이메일 입력 시,
	$('#find-M-Email').blur(function(){
		if(!findId_regEmail.test($('#find-M-Email').val())){
			$('.find-M-Email-Div').text('이메일 양식 지켜주세요');
			$('.find-M-Email-Div').show();
			$('#find-M-Email').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('.find-M-Email-Div').text('');
			$('.find-M-Email-Div').hide();
			$('#find-M-Email').css({'border':'1px solid green', 'background-color':'#e3fce6'});
		}
	});
	//아이디 찾기 버튼 클릭 시,
	$('#find-M-Id-Btn').click(function(){
		var result = null;
		
		if(findId_regPhone.test($('#find-M-Phone').val()) &&
		   findId_regPhone.test($('#find-M-Phone').val()) &&
		   findId_regEmail.test($('#find-M-Email').val())){
			
			$.ajax({
				type : 'POST',
				url : '/exhibition/member/findMemberId.do',
				data : {'M_Name': $('#find-M-Name').val(), 'M_Phone':$('#find-M-Phone').val(), 'M_Email':$('#find-M-Email').val()},
				dataType : 'text',
				success : function(data){
					if(data == 'not_exist'){
						result = "가입된 정보가 없습니다";
						$('#find-M-Result').text(result).css('color','red');
					} 
					else{
						result = data;
						$('#find-M-Result').css('color','black');
						$('#find-M-Result').html('회원님의 아이디는 '+'<span class="searchResultId">'+result+'</span>'+' 입니다');
						$('.searchResultId').css('color','red');
					}//else
				}//success	
			});//ajax
			
		}else{
			$('#find-M-Result').text('작성양식을 올바르게 입력하세요').css('color','red');
		}
	});
	
	/*-----개인회원 비밀번호 찾기 버튼-----*/
	var findPwd_regId = /^[a-z0-9_]{5,12}$/; //5~12자 영문소문자, 숫자, 특수문자 _ 사용가능
	var findPwd_regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	
	//아이디 입력 시,
	var confirmId = '';
	$('#verify-M-Id').blur(function(){
		if(!findPwd_regId.test($('#verify-M-Id').val())){
			$('.verify-M-Id-Div').text('아이디는 5~12자 영문소문자 입니다');
			$('.verify-M-Id-Div').show();
			$('#verify-M-Id').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('.verify-M-Id-Div').text('');
			$('.verify-M-Id-Div').hide();
			$('#verify-M-Id').css({'border':'1px solid green', 'background-color':'#e3fce6'});
			$.ajax({
				type : 'POST',
				url : '/exhibition/member/checkId.do',
				data : {'M_Id':$('#verify-M-Id').val()},
				dataType : 'text',
				success : function(data){
					if(data=='exist'){
						$('#find-M-Result').text('아이디 확인!').css('color','blue');
						$('#verify-M-Id').css({'border':'1px solid green', 'background-color':'#e3fce6'});
						confirmId = 'exist';
					}else if(data=='not_exist'){
						$('#find-M-Result').text('가입된 아이디 없습니다!').css('color','red');
						$('#verify-M-Id').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
						confirmId = 'not_exist';
					}
				}//success
			});//ajax
		}
	});
	
	//이메일 입력 시,
	var confirmEmail = '';
	$('#verify-Email').blur(function(){
		if(!findPwd_regEmail.test($('#verify-Email').val())){
			$('.verify-Email-Div').text('이메일 형식이 올바르지 않습니다');
			$('.verify-Email-Div').show();
			$('#verify-Email').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('.verify-Email-Div').text('');
			$('.verify-Email-Div').hide();
			$('#verify-Email').css({'border':'1px solid green', 'background-color':'#e3fce6'});
			$.ajax({
				type : 'POST',
				url : '/exhibition/member/checkEmail.do',
				data : {'M_Email':$('#verify-Email').val()},
				dataType : 'text',
				success : function(data){
					if(data=='exist'){
						$('#find-M-Result').text('이메일 확인!').css('color','blue');
						$('#verify-Email').css({'border':'1px solid green', 'background-color':'#e3fce6'});
						confirmEmail = 'exist';
					}else if(data=='not_exist'){
						$('#find-M-Result').text('가입된 이메일이 아닙니다').css('color','red');
						$('#verify-Email').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
						confirmEmail = 'not_exist';
					}
				}//success
			});//ajax
		}
	});
	
	/*-----인증번호 발송-----*/
	var verifyNum='';
	$('#verify-Number-Send').click(function(){
		if($('#verify-Email').val()==''){
			$('#find-M-Result').text('이메일을 입력하세요').css('color','red');
		}else if($('#verify-M-Id').val()==''){
			$('#find-M-Result').text('아이디를 입력하세요').css('color','red');
		}else if(confirmEmail == 'not_exist' || confirmId == 'not_exist'){
			$('#find-M-Result').text('아이디 또는 이메일 확인바랍니다').css('color','red');
		}else{
			$('#find-M-Result').text('이메일을 발송했습니다').css('color','blue');
			$.ajax({
				type : 'POST',
				url : '/exhibition/customerService/sendEmail.do',
				data : {'email': $('#verify-Email').val()},
				dataType : 'text',
				success : function(data){
					verifyNum = data;
					$('.verify-Number-hidden').val(verifyNum);
				}//success
			});//ajax
			
		}//else
	});
	
	//인증번호 확인 
	var temPwd = '';
	$('#confirm-M-verifyNum-Btn').click(function(){
		if(verifyNum != $('#verify-Number').val()){
			$('#find-M-Result').text('인증번호가 일치하지 않습니다. 다시 발송요청 하세요').css('color','red');
		}else if(verifyNum==''){
			$('#find-M-Result').text('메일 인증은 필수입니다').css('color','red');
		}else if(findPwd_regEmail.test($('#verify-Email').val()) && findPwd_regId.test($('#verify-M-Id').val())){
			$('#find-M-Result').text('임시 비밀번호를 발송하였습니다').css('color','red');
			$.ajax({
				type : 'POST',
				url : '/exhibition/login/sendEmail.do',
				data : {'email' : $('#verify-Email').val()},
				dataType : 'text',
				success : function(data){
					temPwd = data;
				}//success
			});//ajax
		}//else if
	});
	
	//비밀번호 찾은 후 로그인 버튼 
	$('#find-M-login-Btn').click(function(){
		if(verifyNum != $('#verify-Number').val()){
			$('#find-M-Result').text('인증번호가 일치하지 않습니다').css('color','red');
		}else if(verifyNum==''){
			$('#find-M-Result').text('메일 인증 먼저 받으세요').css('color','red');
		}else{
			$.ajax({
				 type: "POST",
		           url: "/exhibition/login/changeTemPwd.do",
		           data: {'temPwd': temPwd, 'M_Id' : $('#verify-M-Id').val()},
		           dataType : 'text',
		           success: function(data){
		        	   $('#find-M-Result').text('임시 비밀번호로 로그인 하세요').css('color','blue');
			        	 location.href='/exhibition/main/index.do';
		           }//success
			 });//ajax
		}//else	
	});
	
	
	/*-----------법인회원 비밀번호 찾기-----------*/
	var C_regNum = /^([0-9]{10})$/; //사업자번호 10자리
	var C_regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; //이메일 양식
	
	//아이디 입력 시,
	var confirmNum = '';
	$('#verify-C-Id').blur(function(){
		if(!C_regNum.test($('#verify-C-Id').val())){
			$('.verify-C-Id-Div').text('사업자번호 10자리를 입력하세요');
			$('.verify-C-Id-Div').show();
			$('#verify-C-Id').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('.verify-C-Id-Div').text('');
			$('.verify-C-Id-Div').hide();
			$('#verify-C-Id').css({'border':'1px solid green', 'background-color':'#e3fce6'});
			$.ajax({
				type : 'POST',
				url : '/exhibition/company/checkNum.do',
				data : {'sNum':$('#verify-C-Id').val()},
				dataType : 'text',
				success : function(data){
					if(data=='exist'){
						$('#find-C-Result').text('사업자등록번호 확인!').css('color','blue');
						$('#verify-C-Id').css({'border':'1px solid green', 'background-color':'#e3fce6'});
						confirmNum = 'exist';
					}else if(data=='not_exist'){
						$('#find-C-Result').text('가입된 사업자번호가 없습니다!').css('color','red');
						$('#verify-C-Id').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
						confirmNum = 'not_exist';
					}
				}//success
			});//ajax
		}
	});
	
	//이메일 입력 시,
	var confirmEmail2 = '';
	$('#verify-C-Email').blur(function(){
		if(!findPwd_regEmail.test($('#verify-C-Email').val())){
			$('.verify-C-Email-Div').text('이메일 형식이 올바르지 않습니다');
			$('.verify-C-Email-Div').show();
			$('#verify-C-Email').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
		}else{
			$('.verify-C-Email-Div').text('');
			$('.verify-C-Email-Div').hide();
			$('#verify-C-Email').css({'border':'1px solid green', 'background-color':'#e3fce6'});
			$.ajax({
				type : 'POST',
				url : '/exhibition/company/checkEmail.do',
				data : {'email':$('#verify-C-Email').val(),'sNum':$('#verify-C-Id').val()},
				dataType : 'text',
				success : function(data){
					if(data=='exist'){
						$('#find-C-Result').text('이메일 확인!').css('color','blue');
						$('#verify-C-Email').css({'border':'1px solid green', 'background-color':'#e3fce6'});
						confirmEmail = 'exist';
					}else if(data=='not_exist'){
						$('#find-C-Result').text('가입된 이메일이 아닙니다').css('color','red');
						$('#verify-C-Email').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
						confirmEmail2 = 'not_exist';
					}
				}//success
			});//ajax
		}
	});
	
	/*-----인증번호 발송-----*/
	var verifyNum2='';
	$('#verify-Number2-Send').click(function(){
		if($('#verify-C-Email').val()==''){
			$('#find-C-Result').text('이메일을 입력하세요').css('color','red');
		}else if($('#verify-C-Id').val()==''){
			$('#find-C-Result').text('사업자등록번호를 입력하세요').css('color','red');
		}else if(confirmEmail2 == 'not_exist' || confirmNum == 'not_exist'){
			$('#find-C-Result').text('사업자등록번호 또는 이메일 확인바랍니다').css('color','red');
		}else{
			$('#find-C-Result').text('이메일을 발송했습니다').css('color','blue');
			$.ajax({
				type : 'POST',
				url : '/exhibition/customerService/sendEmail.do',
				data : {'email': $('#verify-C-Email').val()},
				dataType : 'text',
				success : function(data){
					verifyNum2 = data;
					$('.verify-Number2-hidden').val(verifyNum2);
				}//success
			});//ajax
			
		}//else
	});
	
	//인증번호 확인 
	var temPwd2 = '';
	$('#confirm-C-verifyNum-Btn').click(function(){
		if(verifyNum2 != $('#verify-Number2').val()){
			$('#find-C-Result').text('인증번호가 일치하지 않습니다. 다시 발송요청 하세요').css('color','red');
		}else if(verifyNum2==''){
			$('#find-C-Result').text('메일 인증은 필수입니다').css('color','red');
		}else if(C_regNum.test($('#verify-C-Id').val()) && C_regEmail.test($('#verify-C-Email').val())){
			$('#find-C-Result').text('임시 비밀번호를 발송하였습니다').css('color','red');
			$.ajax({
				type : 'POST',
				url : '/exhibition/login/sendEmail.do',
				data : {'email' : $('#verify-C-Email').val()},
				dataType : 'text',
				success : function(data){
					temPwd2 = data;
				}//success
			});//ajax
		}//else if
	});
	
	//비밀번호 찾은 후 확인 버튼 
	$('#find-C-login-Btn').click(function(){
		if(verifyNum2 != $('#verify-Number2').val()){
			$('#find-C-Result').text('인증번호가 일치하지 않습니다').css('color','red');
		}else if(verifyNum2==''){
			$('#find-C-Result').text('메일 인증 먼저 받으세요').css('color','red');
		}else{
			$.ajax({
				 type: "POST",
		           url: "/exhibition/login/changeCpwd.do",
		           data: {'temPwd2': temPwd2, 'C_license' : $('#verify-C-Id').val()},
		           dataType : 'text',
		           success: function(data){
		        	   alert('임시비밀번호로 변경되었습니다.');
		        	   location.href='/exhibition/main/index.do';
		           }//success
			 });//ajax
		}//else	
	});
	
	
	
});