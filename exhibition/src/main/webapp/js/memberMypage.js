$(document).ready(function(){
	
	$('.tr').remove();	//예매리스트 내용 초기화
	
	//비지니스 룸 내역
	$('#member-business-List').click(function(){
		location.href="/exhibition/login/memberBusinessRoomList.do";
	});
	
	//회원의 예매 리스트를 가져오는 ajax 
	$.ajax({
		type : 'GET',
		url : '/exhibition/login/getMemberTicketList.do?pg='+$('#pg').val()+'',
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index, item){
				$('<tr/>',{
					class : 'tr'
				}).append($('<td/>',{
					text : item.imageName,
					class : 'imageName',
					value : item.imageName
				})).append($('<td/>',{
					text : item.playDate,
					value : item.playDate
				})).append($('<td/>',{
					id : 'ticketQtyTd',
					text : item.ticketQty,
					value : item.ticketQty
				})).append($('<td/>',{
					id : 'cancelMsg',
					text : '환불 가능'
				})).appendTo($('#ticketList'));
			});//each
			
			$('#paging').html(data.memberTicketListPaging.pagingHTML);
			
			//예매 취소 하기
			$('#ticketList').on('click','.imageName',function(){
								
				$('#memberId').val($(this).prev().text());
				$('#imageName').val($(this).text());
				$('#playDate').val($(this).next().text());
				$('#ticketQty').val($(this).next().next().text());
				$('#eventDetailInfo').submit();
				
			});
		}//success
	});//ajax
	
	//회원정보 수정 메뉴
	$('#member-info-modify').click(function(){
		location.href="/exhibition/login/mypage.do";
		
	});
	
	// 예매리스트 탭 
	$('#member-ticket-list').click(function(){
		location.href="/exhibition/login/mypage.do";
	});
	
	//예매내역 탭
	$('#member-ticket-history').click(function(){
		$('tr:gt(0)').remove();	//예매리스트 내용 초기화
		$('#ticketList').removeClass('imageName');
		
		//과거 예매 내역 불러오는 ajax
		$.ajax({
			type : 'GET',
			url : '/exhibition/login/getTicketHistory.do?pg='+$('#pg').val()+'',
			dataType : 'json',
			success : function(data){
				$.each(data.list, function(index, item){
					$('<tr/>',{
						class : 'tr'
					}).append($('<td/>',{
						text : item.imageName,
						class : 'imageName1',
						value : item.imageName
					})).append($('<td/>',{
						text : item.playDate,
						value : item.playDate
					})).append($('<td/>',{
						id : 'ticketQtyTd',
						text : item.ticketQty,
						value : item.ticketQty
					})).append($('<td/>',{
						id : 'cancelMsg',
						class : 'cancelMsg',
						text : '환불 불가'
					})).appendTo($('#ticketList'));
					$('.imageName1').css({'cursor': 'pointer', 'color' : 'red'});
					$('.cancelMsg').css({color : 'red'});
					
				});//each
				$('#paging').html(data.TicketHistoryListPaging.pagingHTML);
				
				$('#ticketList').on('click','.imageName1',function(){
					 $.alertable.alert('당일 취소 불가능합니다(지난 이벤트 포함)', {
					      show: function() {
					        $(this.overlay).velocity('transition.fadeIn', 300);        
					        $(this.modal).velocity('transition.shrinkIn', 300);
					      },
					      hide: function() {
					        $(this.overlay).velocity('transition.fadeOut', 300);
					        $(this.modal).velocity('transition.shrinkOut', 300);
					      } 
					    });
				});

			}//success
		});//ajax
		
		
		
		//location.href="/exhibition/login/ticketHistory.do";
	});
	
	
	var Mm_regPwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]|.*[0-9]).{6,24}$/;	//6-24자리 영문대소문자or숫자or특수기호
	var Mm_regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; //이메일 양식
	var Mm_regPhone =  /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
	
	
	var pwd1 = '';
	//1차 비밀번호 입력 시, 
	$('#M-modify-pwd').blur(function(){
		if(!Mm_regPwd.test($('#M-modify-pwd').val())){
			$('.M-modify-pwd-Span').text('비밀번호는 6-24자 영문 대소문자 입니다').css('color','red').css('font-size','10px');
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
			$('.M-modify-pwd2-Span').text('비밀번호는 6-24자 영문 대소문자 입니다').css('color','red').css('font-size','10px');
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
			$('.M-modify-phone-Span').text('핸드폰 번호 양식이 맞지 않습니다').css('color','red').css('font-size','10px');
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
			$('.M-modify-email-Span').text('이메일 양식이 맞지 않습니다').css('color','red').css('font-size','10px');
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
			$('.M-modify-result-Span').text('비밀번호를 입력하세요').css('color','red').css('font-size','10px');
		}else if($('#M-modify-pwd').val() != $('#M-modify-pwd2').val()){
			$('.M-modify-result-Span').text('비밀번호가 일치하지 않습니다').css('color','red').css('font-size','10px');
		}else if($('#M-modify-phone').val()==''){
			$('.M-modify-result-Span').text('핸드폰 번호 입력하세요').css('color','red').css('font-size','10px');
		}else if($('#M-modify-email').val()==''){
			$('.M-modify-result-Span').text('이메일 입력하세요').css('color','red').css('font-size','10px');
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
	$('#member-out').click(function(){
		$('.ui.basic.modal').modal({
			closable : false,
            duration : 460,
		}).modal('show');
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
	
	
});