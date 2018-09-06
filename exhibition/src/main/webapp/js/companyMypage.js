$(document).ready(function(){
	
	$('#Ticket-List-Div').hide();
	$('#Ticket-History-Div').hide();
		
	//회원정보 수정
	$('#member-info-modify').click(function(){
		$('#member-info-modify').addClass('active');
		$('#member-ticket-list').removeClass('active');
		$('#member-ticket-history').removeClass('active');
		
		$('#modify-Div').show();
		$('#Ticket-List-Div').hide();
		$('#Ticket-History-Div').hide();
		
	});
	
	
	var Mm_regPwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]|.*[0-9]).{6,24}$/;	//6-24자리 영문대소문자or숫자or특수기호
	var Mm_regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; //이메일 양식
	var Mm_regPhone =  /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
	
	
	var pwd = '';
	//1차 비밀번호 입력 시, 
	$('#C-modify-pwd').blur(function(){
		if(!Mm_regPwd.test($('#C-modify-pwd').val())){
			$('.C-modify-pwd-Span').text('비밀번호는 6-24자 영문 대소문자 입니다').css('color','white').css('font-size','10px');
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
			$('.C-modify-repwd-Span').text('비밀번호는 6-24자 영문 대소문자 입니다').css('color','white').css('font-size','10px');
			$('#C-modify-repwd').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
			repwd = 'fail';
		}else if($('#C-modify-repwd').val()!=$('#C-modify-pwd').val()){
			$('.C-modify-repwd-Span').text('비밀번호가 일치하지 않습니다').css('color','white').css('font-size','10px');
			$('#C-modify-repwd').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
			repwd = 'fail';
		}else{
			$('.C-modify-repwd-Span').text('');
			$('#C-modify-repwd').css({'border':'1px solid green', 'background-color':'#e3fce6'});
			repwd = 'success';
		}
	});
	
	var phone='success';
	//핸드폰 입력 시,
	$('#C-modify-phone').blur(function(){
		if(!Mm_regPhone.test($('#C-modify-phone').val())){
			$('.C-modify-phone-Span').text('핸드폰 번호 양식이 맞지 않습니다').css('color','white').css('font-size','10px');
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
			$('.C-modify-email-Span').text('이메일 양식이 맞지 않습니다').css('color','white').css('font-size','10px');
			$('#C-modify-email').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
			email = 'fail';
		}else{
			$('.C-modify-email-Span').text('');
			$('#C-modify-email').css({'border':'1px solid green', 'background-color':'#e3fce6'});
			email = 'success';
		}
	});
	
	
	//취소 -> 메인으로
	$('#C-modify-cancel').click(function(){
		location.href="/exhibition/main/index.do";
	});
	
	
	//예매리스트
	$('#member-ticket-list').click(function(){
		$('#member-info-modify').removeClass('active');
		$('#member-ticket-list').addClass('active');
		$('#member-ticket-history').removeClass('active');
		
		$('#modify-Div').hide();
		$('#Ticket-List-Div').show();
		$('#Ticket-History-Div').hide();
	});
	
	//예매내역
	$('#member-ticket-history').click(function(){
		$('#member-info-modify').removeClass('active');
		$('#member-ticket-list').removeClass('active');
		$('#member-ticket-history').addClass('active');
		
		$('#modify-Div').hide();
		$('#Ticket-List-Div').hide();
		$('#Ticket-History-Div').show();
	});
	
});