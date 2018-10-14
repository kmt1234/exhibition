<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.ui.inverted.divider {
    margin: 5px 0;
}
#textf {
   width: 40%;
   float: left;
}

#currentPaging{
   color: red;
   text-decoration: underline;
   cursor: pointer;
}

#paging{
   color: black;
   text-decoration: none;
   cursor: pointer;
}
.imageName{
   cursor: pointer;
   color: green;
}

#cancelMsg{
   color: green;
   text-align: center;
}

.ui.table td {
    text-align: center;
}
#uiCard{
   display: inline-block;
}

#uiStatistics{
   display: inherit;
}

#contentId {
    display: contents;
}

span.header {
    text-align: center;
}   

.meta {
    text-align: center;
}

.description {
    text-align: center;
}

div#uiStatistics {
    text-align: center;
}

</style>
<div class="ui compact menu" style="width: 930px; height:900px auto;  display: inline-block;" >
   <h2 class="box-container" style="float: center; width: 100%; height:126px; text-align: left;">
      <span>마이</span>
      <span class="h-light">페이지</span>
      <div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
      <img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
      > 고객센터 > 마이페이지(개인) 
   </div>
   <div class="ui divider"></div> 
   </h2>
   <div style="width: 100%;">
      <!-- 맨위 메뉴 텝 -->
      <div style="margin-left: 20px; width:880px; float: left; text-align: left;">
           <a class="middle ui button" class="item" id="member-ticket-list">예매리스트</a>
           <a class="middle ui button" class="item" id="member-ticket-history">예매 내역</a>
           <a class="middle ui button" class="item" id="member-business-List">비지니스 룸 내역</a>
      </div>
      <!-- 메인메뉴 -->
      <div class="" id="modify-Div" style="margin-left: 20px; float: left;" >
         <div>
            <div style="width: 100%">
                 <div class="content" >
                   <div class="description" style=" text-align: left; ">
                   <br>
                      <div >
                         <h2 class="header" id="M-modify-id" style="float: left; " >ID : ${DTO.getM_Id()}</h2>
                         <input type="hidden" id="M-modify-id-hidden" value="${DTO.getM_Id()}">
                      </div>
                      <!-- 이름  -->
                        <div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
                        <div class="ui labeled input " >
                           <div class="ui label " style="width: 100px; text-align: center;">
                              <span>이 름</span>
                           </div>
                           <div class="ui inverted input " style="width: 300px;">
                              <div class="ui left icon input focus"  style="width: 300px; height: 50px;">
                                 <input type="text" id="text" readonly="readonly" value="${DTO.getM_Name()}">
                                 <i class="user icon"></i>
                              </div>
                             </div>
                          </div>
                          <br><br>
                          <!--비밀번호  -->
                        <div class="ui labeled input">
                           <div class="ui label " style="width: 100px; text-align: center;">
                              <span>비밀번호</span> 
                           </div>
                           <div class="ui inverted input" style="width: 100%;">
                              <div class="ui left icon input focus" style="width: 300px; height: 50px;">
                              <br>
                                 <input type="password" id="M-modify-pwd"  placeholder="새 비밀번호">
                                 <i class="lock icon"></i>
                              </div>
                             </div><!--class="ui inverted input"-->
                          </div>
                          <br><span class="M-modify-pwd-Span"></span><br>
                         <!-- 비밀번호재확인  -->
                         <div class="ui labeled input">
                           <div class="ui label " style="width: 100px; text-align: center;">
                              <span>재확인</span> 
                           </div>                                
                             <div class="ui inverted input" style="width: 100%;">
                              <div class="ui left icon input  focus" style="width: 300px; height: 50px;">
                                 <input type="password" id="M-modify-pwd2"  placeholder="새 비밀번호 확인">
                                 <i class="lock icon"></i>
                              </div>
                             </div><!--class="ui inverted input"-->
                          </div>
                          <br><span class="M-modify-pwd2-Span"></span><br>
                        <!-- 연락처 -->
                        <div class="ui labeled input">
                           <div class="ui label " style="width: 100px; text-align: center;">
                              <span>핸드폰</span> 
                           </div>      
                           <div class="ui inverted input" style="width: 100%;">
                              <div class="ui left icon input  focus" style="width: 300px; height: 50px;">
                                 <input type="text" id="M-modify-phone" value="${DTO.getM_Phone()}" >
                                 <i class="mobile alternate icon"></i>
                              </div>
                             </div><!--class="ui inverted input"-->
                          </div>
                          <br><span class="M-modify-phone-Span"></span><br>
                        <!-- 이메일 -->
                        <div class="ui labeled input">
                           <div class="ui label " style="width: 100px; text-align: center;">
                              <span>이메일</span> 
                           </div>      
                           <div class="ui inverted input" style="width: 100%;">
                              <div class="ui left icon input focus" style="width: 300px; height: 50px;">
                                 <input type="text" id="M-modify-email" value="${DTO.getM_Email()}" >
                                 <i class="envelope outline icon"></i>
                              </div>
                             </div><!--class="ui inverted input"-->
                        </div>
                          <br><span class="M-modify-email-Span"></span><br>
                        <!-- 아래 버튼 -->
                        <div class="ui two buttons">
                            <div class="middle ui button" id="M-modify-modify" style="width: 30%;">수정</div>
                            <div style="width: 5%;">&nbsp;</div>
                            <button class="middle ui button" id="member-out" style="width: 30%;">회원탈퇴</button>
                            <div style="width: 5%;">&nbsp;</div>
                             <div class="middle ui button" id="M-modify-cancel" style="width: 30%;">취소</div>
                         </div>
                         <br><span class="M-modify-result-Span"></span>
                        <div style="margin-top: 40px;"></div>   
                        
                           <!-- 숨어있다 -->
                           <div class="ui modal3">
                                <div class="content">
                                  <p>탈퇴하시겠습니까?</p>
                                </div>
                                <div class="actions">
                                  <div class="ui negative button" id="out-no">
                                    <i class="remove icon"></i>
                                       아니오
                                  </div>
                                  <div class="ui positive right labeled icon button" id="out-yes">
                                    <i class="checkmark icon"></i>
                                       네
                                  </div>
                                </div>
                           </div><!-- 숨어있다 -->
                           <jsp:include page="memberOut.jsp"/>
                      </div><!--수정영역 텍스트필드-->
                    </div><!--class="description"  -->
               </div><!--class="content"  -->
            </div><!--class="ui card"-->
         </div><!--align="center"  -->
      </div><!--id="modify-Div"  -->
   <div id="memberTicketInformation" style="display: inline-block; border: 1px solid; margin-top:80px; width: 465px; height: 385px; overflow: scroll;">
      
      
      <!--내용--><input type="hidden" id="pg" value="${pg}"><!--현재 페이지-->   
      <div class="ui segment" id="Ticket-List-Div" style="display: inline-block;">         
          <table class="ui striped table" class="ticketListTable">
              <thead>
                 <tr align="center">
                    <th>공연 및 전시회</th>
                    <th>행사 날짜</th>
                  <th>예매 티켓 수량</th>
                  <th>환불 여부</th>
                 </tr></thead>
              <tbody id="ticketList" align="center"></tbody>    
           </table>
         
         <!--클릭 시, hidden에 해당 데이터 저장  -->
         <form name="eventDetailInfo" id="eventDetailInfo" method="post" action="/exhibition/login/eventDetail.do">
            <input type="hidden" name="memberId" id="memberId">
            <input type="hidden" name="imageName" id="imageName">
            <input type="hidden" name="playDate" id="playDate">
            <input type="hidden" name="ticketQty" id="ticketQty">
         </form>
         
         
         <div id="paging"></div>
         
      </div><!--id="Ticket-List-Div"-->
   
   
   </div><!--id="memberTicketInformation"-->
</div>
</div><!-- 전체 -->
<script>
$(document).ready(function(){
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
   
   
   // 예매리스트 탭 
   $('#member-ticket-list').click(function(){
      location.href="/exhibition/login/mypage.do";
   });
   
   //비지니스 룸 내역
   $('#member-business-List').click(function(){
      location.href="http://localhost:8080/exhibition/login/memberBusinessRoomList.do";
   });
   
   //예매내역 탭
   $('#member-ticket-history').click(function(){
      $('tr:gt(0)').remove();   //예매리스트 내용 초기화
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
   });
});
</script>
<script>
/*페이징 */
function TicketHistoryListPaging(pg){
   $('.tr').remove();   //예매리스트 내용 초기화
   
   //과거 예매 내역 불러오는 ajax
   $.ajax({
      type : 'GET',
      url : '/exhibition/login/getTicketHistory.do?pg='+pg+'',
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
      }//success
   });//ajax
   //location.href="/exhibition/login/mypage.do?pg="+pg;
}
</script>
<script>
$(document).ready(function(){
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
</script>
