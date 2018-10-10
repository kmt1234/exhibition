<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
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
		<c:if test="${code != 3 }">
			<div style="margin-left: 20px; width:880px; float: left; text-align: left;">
			  	<a class="middle ui button" class="item" id="member-ticket-list">예매리스트</a>
			  	<a class="middle ui button" class="item" id="member-ticket-history">예매 내역</a>
			  	<a class="middle ui button" class="item" id="member-business-List">비지니스 룸 내역</a>
			</div>
		</c:if>
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
							    	<c:if test="${code != 3 }">
							    		<button class="middle ui button" id="member-out" style="width: 30%;">회원탈퇴</button>
							    	</c:if>
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
	<c:if test="${code != 3 }">	
	<div id="memberTicketInformation" style="display: inline-block; border: 1px solid; margin-top:80px; width: 465px; height: 385px; overflow: scroll;">
		
		
		<!--내용--><input type="hidden" id="pg" value="${pg}"><!--현재 페이지-->	
		<div class="ui segment" id="Ticket-List-Div" style="display: inline-block;">
			
			<!-- <table class="ui selectable inverted table" >
				<thead>
					<tr>
						<th>회원 아이디</th>
						<th>공연 및 전시회</th>
						<th>예매 일자</th>
						<th>예매 티켓 수량</th>
						<th>환불 여부</th>
					</tr>
				</thead>
			</table> -->
			
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
	</c:if>
</div>
</div><!-- 전체 -->

<!--예매 취소하기 위해 필요한 값들-->	
<input type="hidden" id="hiddenImageName" value="${imageName }">
<input type="hidden" id="hiddenPlayDate" value="${playDate }">
<input type="hidden" id="hiddenTicketQty" value="${ticketQty }">
<input type="hidden" id="code" value="${code }">

<script>
/*페이징 */
function MemberTicketListPaging(pg){
	$('.tr').remove();	//예매리스트 내용 초기화
	console.log(pg);
	//$('#pg').val() = pg;
	//회원의 예매 리스트를 가져오는 ajax 
	$.ajax({
		type : 'GET',
		url : '/exhibition/login/getMemberTicketList.do?pg='+pg+'',
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
		}//success
	});//ajax
}
/*페이징 */
function TicketHistoryListPaging(pg){
	$('.tr').remove();	//예매리스트 내용 초기화
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
<script src="../js/memberMypage.js?ver=1"></script>