<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
img{
	width: 200px;
	height: 200px;
}

</style>

</head>
<body>
	<!-- 메인 화면 -->
	<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
		공연
		<span class="h-light">예약하기</span>
	</h2>
	
	
	<!--메뉴-->
	<div class="ui ordered steps">
	  
	  <div class="active step">
	    <div class="content">
	      <div class="title">예매하기</div>
	    </div>
	  </div>
	  
	  <div class="step">
	    <div class="content">
	      <div class="title">예매확인</div>
	    </div>
	  </div>
	  
	  <div class="step">
	    <div class="content">
	      <div class="title">결제하기</div>
	    </div>
	  </div>
	  
	</div><!--class="ui ordered steps"-->
	
	<div class="ui divider"></div>
	
<!--내용 : 예매하기-->
<div id="Book_play_div">
	<div>
		<h2>${eventboardDTO.imageName}</h2><input type="hidden" id="imageName" value="${eventboardDTO.imageName}">
		<h5>장소 : ${eventboardDTO.eventPlace}</h5>
		<h5>기간 : ${eventboardDTO.startDate} ~ ${eventboardDTO.endDate}</h5>
	</div>
	
	<div class="ui divider"></div>
	
	<!--날짜 비교(기본 : 오늘날짜)-->
	<jsp:useBean id="now" class="java.util.Date"/> 
	
	<div><img src="../storage/${eventboardDTO.image1}"></div>
	<div>가격 : ${eventboardDTO.eventPrice}</div><input type="hidden" id="hiddenTicketPrice" value="${eventboardDTO.eventPrice}">
	<div>좌석배정 방식: 선착순</div>
	<div>공연 날짜 :<input id="hiddenDate" type="hidden">
				<select id="selectEventDate">
				<option value="2000-01-01">날짜선택</option>
				
					<!--오늘날짜와 비교 후, 기간 지났으면 날짜 선택 비활성화  -->
					<c:forEach items="${listDate}" var="eventPeriod">
						<c:if test="${eventPeriod < now}">
						<option disabled="disabled" value="${eventPeriod}"><fmt:formatDate value="${eventPeriod}" pattern="yyyy년-MM월-dd일"/></option>
						</c:if>
					</c:forEach>
					
					<c:forEach items="${listDate}" var="eventPeriod">
						<c:if test="${eventPeriod > now}">
						<option value="${eventPeriod}"><fmt:formatDate value="${eventPeriod}" pattern="yyyy년-MM월-dd일"/></option>
						</c:if>
					</c:forEach>
					
				</select>
				
	</div>
	<div>공연 시간 : ${eventboardDTO.startTime} ~ ${eventboardDTO.endTime}</div>
	<div>매수 :<input id="hiddenTicketQty" type="hidden">
			<select id="selectPlayTicket">
				<option value="1">1매</option>
				<option value="2">2매</option>
				<option value="3">3매</option>
				<option value="4">4매</option>
				<option value="5">5매</option>
			</select>
			 / 잔여 매수 : ${eventboardDTO.eventSeats / listDate.size()}
	</div>
	
	<div><button id="BookEventBtn">예매하기</button></div>
</div>


<!--내용 : 예매확인-->
<div id="Confirm_play_div">
	<div>결재 금액 : <span id="totalPrice"></span></div>
</div>
	
</body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
$(document).ready(function(){
	//페이지 호출 시(기본),
//	$('#Confirm_play_div').hide();
	
	
	//예매하기 버튼 클릭 시,
	$('#BookEventBtn').click(function(){
		var conF = confirm("예매하시겠습니까?");
		if(conF){
			alert($('#selectEventDate :selected').text()); //선택된 일자 호출
			alert($('#selectPlayTicket :selected').text()); //선택한 티켓 수 호출
			
			$('#hiddenTicketQty').val($('#selectPlayTicket :selected').val()); //티켓 수 히든에 넣기
			$('#hiddenDate').val($('#selectEventDate :selected').text()); //공연일자 히든에 넣기 
			
			$('#totalPrice').text($('#hiddenTicketPrice').val() * $('#selectPlayTicket :selected').val());
			//	$('#Book_play_div').hide();
			//	$('#Confirm_play_div').show();
			
			//예매하기 컨트롤러
			$.ajax({
				type : 'POST',
				url : '/exhibition/performance/book_performance.do',
				data : {'imageName' : $('#imageName').val(), 'playDate' : $('#hiddenDate').val(), 'ticketQty' : $('#hiddenTicketQty').val()},
				dataType : 'text',
				success : function(data){
					if(data == 0) alert('예약실패. 관리자에게 문의바람');
					else alert('예약완료');
				}//success
				
			});//ajax
			
		}else{
			location.href="javascript:history.back()";	//뒤로가기 
		}
		
	});
});
</script>
</html>