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
		<h2>${eventboardDTO.imageName}</h2>
		<h5>장소 : ${eventboardDTO.eventPlace}</h5>
		<h5>기간 : ${eventboardDTO.startDate} ~ ${eventboardDTO.endDate}</h5>
	</div>
	
	<div class="ui divider"></div>
	
	<div><img src="../storage/${eventboardDTO.image1}"></div>
	<div>가격 : ${eventboardDTO.eventPrice}</div>
	<div>좌석배정 방식: 선착순</div>
	<div>공연 날짜 :
				<select id="selectEventDate">
					<c:forEach items="${listDate}" var="eventPeriod">
					<option value="${eventPeriod}"><fmt:formatDate value="${eventPeriod}" pattern="yyyy년-MM월-dd일"/></option>
					</c:forEach>
				</select>
	</div>
	<div>공연 시간 : ${eventboardDTO.startTime} ~ ${eventboardDTO.endTime}</div>
	<div>매수 :
			<select id="selectPlayTicket">
				<option value="1">1매</option>
				<option value="2">2매</option>
				<option value="3">3매</option>
				<option value="4">4매</option>
				<option value="5">5매</option>
			</select>
			 / 잔여 매수 : ${eventboardDTO.eventSeats}
	</div>
	
	<div><button id="BookEventBtn">예매하기</button></div>
</div>


<!--내용 : 예매확인-->
<div id="Confirm_play_div">
	예매확인하자
</div>
	
</body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
$(document).ready(function(){
	//페이지 호출 시(기본),
	$('#Confirm_play_div').hide();
	
	
	//예매하기 버튼 클릭 시,
	$('#BookEventBtn').click(function(){
		var conF = confirm("예매하시겠습니까?");
		if(conF){
			alert($('#selectEventDate :selected').text()); //선택된 일자 호출
			alert($('#selectPlayTicket :selected').text()); //선택한 티켓 수 호출
			//	$('#Book_play_div').hide();
			//	$('#Confirm_play_div').show();
		}else{
			location.href="javascript:history.back()";	//뒤로가기 
		}
		
	});
});
</script>
</html>