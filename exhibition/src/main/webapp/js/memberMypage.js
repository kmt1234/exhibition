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
	
	
	var pwd1 = '';
	//1차 비밀번호 입력 시, 
	$('#M-modify-pwd').blur(function(){
		if(!Mm_regPwd.test($('#M-modify-pwd').val())){
			$('.M-modify-pwd-Span').text('비밀번호는 6-24자 영문 대소문자 입니다').css('color','white').css('font-size','10px');
			$('#M-modify-pwd').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
			pwd1 = 'fail';
		}else{
			$('.M-modify-pwd-Span').text('');
			$('#M-modify-pwd').css({'border':'1px solid green', 'background-color':'#e3fce6'});
			pwd1 = 'success';
		}
	});
	
	var pwd2 = '';
	//2차 비밀번호 입력 시,
	$('#M-modify-pwd2').blur(function(){
		if(!Mm_regPwd.test($('#M-modify-pwd2').val())){
			$('.M-modify-pwd2-Span').text('비밀번호는 6-24자 영문 대소문자 입니다').css('color','white').css('font-size','10px');
			$('#M-modify-pwd2').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
			pwd2 = 'fail';
		}else if($('#M-modify-pwd2').val()!=$('#M-modify-pwd').val()){
			$('.M-modify-pwd2-Span').text('비밀번호가 일치하지 않습니다').css('color','white').css('font-size','10px');
			$('#M-modify-pwd2').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
			pwd2 = 'fail';
		}else{
			$('.M-modify-pwd2-Span').text('');
			$('#M-modify-pwd2').css({'border':'1px solid green', 'background-color':'#e3fce6'});
			pwd2 = 'success';
		}
	});
	
	var phone='success';
	//핸드폰 입력 시,
	$('#M-modify-phone').blur(function(){
		if(!Mm_regPhone.test($('#M-modify-phone').val())){
			$('.M-modify-phone-Span').text('핸드폰 번호 양식이 맞지 않습니다').css('color','white').css('font-size','10px');
			$('#M-modify-phone').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
			phone = 'fail';
		}else{
			$('.M-modify-phone-Span').text('');
			$('#M-modify-phone').css({'border':'1px solid green', 'background-color':'#e3fce6'});
			phone = 'success';
		}
	});
	
	var email='success';
	//이메일 입력 시,
	$('#M-modify-email').blur(function(){
		if(!Mm_regEmail.test($('#M-modify-email').val())){
			$('.M-modify-email-Span').text('이메일 양식이 맞지 않습니다').css('color','white').css('font-size','10px');
			$('#M-modify-email').css({'border':'1px solid red', 'background-color':'#f4d2d2'});
			email = 'fail';
		}else{
			$('.M-modify-email-Span').text('');
			$('#M-modify-email').css({'border':'1px solid green', 'background-color':'#e3fce6'});
			email = 'success';
		}
	});
	
	
	//수정
	$('#M-modify-modify').click(function(){
		if($('#M-modify-pwd').val()=='' || $('#M-modify-pwd2').val()==''){
			$('.M-modify-result-Span').text('비밀번호를 입력하세요').css('color','white').css('font-size','10px');
		}else if($('#M-modify-pwd').val() != $('#M-modify-pwd2').val()){
			$('.M-modify-result-Span').text('비밀번호가 일치하지 않습니다').css('color','white').css('font-size','10px');
		}else if($('#M-modify-phone').val()==''){
			$('.M-modify-result-Span').text('핸드폰 번호 입력하세요').css('color','white').css('font-size','10px');
		}else if($('#M-modify-email').val()==''){
			$('.M-modify-result-Span').text('이메일 입력하세요').css('color','white').css('font-size','10px');
		}else if(pwd1=='success' && pwd2=='success' && phone=='success' && email=='success'){			
			$.ajax({
				type : 'POST',
				url : '/exhibition/member/memberModify.do',
				data : {'M_Id':$('#M-modify-id-hidden').val(), 'M_Pwd':$('#M-modify-pwd').val(), 'M_Phone':$('#M-modify-phone').val(),'M_Email':$('#M-modify-email').val()},
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
	$('#M-modify-cancel').click(function(){
		location.href="/exhibition/main/index.do";
	});
	
	
	//회원탈퇴버튼
	$('.ui.modal3').hide();
	$('#member-out').click(function(){
		$('#M-modify-modify').hide();
		$('.ui.modal3').show();
	});
	$('#out-no').click(function(){//아니오 클릭시
		$('.ui.modal3').hide();
		$('#M-modify-modify').show();
	});
	$('#out-yes').click(function(){//네 클릭시
		$('.ui.basic.modal').modal('show');
	});
	
	$('#del_OK').click(function(){
		$.ajax({
				type : 'POST',
				url : '/exhibition/member/deleteMember.do',
				data : {'M_Id':$('#M-modify-id-hidden').val(),'M_Pwd':$('#del_pass').val()},
				dataType : 'text',
				success : function(data){
					if(data=='exist'){
						location.href='/exhibition/member/outComplete.do';
					}else if(data=='not_exist'){
						$('#del_check').text("비밀번호가 틀렸습니다.").css("font-size","12px").css("color","red").css("margin-left","24%").css("margin-top","2%");
						$('.ui.basic.modal').modal('show');
					}
				}//success
		});
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