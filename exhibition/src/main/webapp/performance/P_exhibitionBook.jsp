<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/P_allScheduleList.css" ><!-- 리스트보기 -->
<style>
.playContentHeader{
	float: left;
}
.book_play_confirm {
    display: flex;
}
.playTableWrapper{
	margin-left: 33px;
}
#modalImage1{
	margin-left: 20px;
}
#bookInfo{
	margin-left: 10px;
	font-size: 12pt;
}
</style>
</head>
<body>
<h2 class="box-container"  style="float: left; width:100%; text-align: left;">
	<span>박람회 </span>
	<span class="h-light">예약하기</span>
	<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
		<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
		> 일정 > 목록 > 예약하기 
	</div>
	<div class="ui divider"></div> 
</h2>
<!--내용 : 예매하기-->
<div style="width: 880px; display: inline-block; text-align: left;">
	<div class="playContentHeader" style="border: 1px solid; ">
		<div><img style="width: 350px;height: 400px; border-radius: 10px;" src="../storage/${eventboardDTO.image1}"></div>
	</div>
	<!--날짜 비교(기본 : 오늘날짜)-->
	<jsp:useBean id="now" class="java.util.Date"/> 
	<div style="width:500px; margin-top:20px; height:auto; display: inline-block;">
		<div class="bookPlayTitleDiv" style="margin-left:20px; height:50px; font-size: 20pt; ">${eventboardDTO.imageName}</div>
		<!--연극 제목  -->
			<div class="from">
				<div class="content">장소</div> 
			</div>
			<div class="from1" style="width: 375px;">
				<div class="content1" >${eventboardDTO.eventPlace}</div>
			</div>
			<div class="from">
				<div class="content">기간</div> 
			</div>
			<div class="from1" style="width: 375px;">
				<div class="content1" >${eventboardDTO.startDate} ~ ${eventboardDTO.endDate}</div>
			</div>
			<div class="from">
				<div class="content">가격</div>
			</div>
			<div class="from1" style="width: 375px;">
				<div class="content1" ><fmt:formatNumber type="number" value="${eventboardDTO.eventPrice}" pattern="#,###" />원</div>
			</div>
			<div class="from">
				<div class="content">박람회 날짜</div>
			</div>
			<div class="from1" style="width: 375px;">
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
			<div class="from">
				<div class="content">관람 시간</div> 
			</div>
			<div class="from1" style="width: 375px;">
				<div class="content1">${eventboardDTO.startTime} ~ ${eventboardDTO.endTime}</div>
			</div>
			<div class="from">
				<div class="content">매수</div>
			</div>
			<div class="from1" style="width: 375px;">
				<div class="content1">
					<select id="selectPlayTicket">
						<option value="1">1매</option>
						<option value="2">2매</option>
						<option value="3">3매</option>
						<option value="4">4매</option>
						<option value="5">5매</option>
					</select>
				</div>
			</div>
			<fmt:parseNumber var="remain" value="${eventboardDTO.eventSeats}" integerOnly="true" />
			<div class="from">
				<div class="content">잔여 매수</div>
			</div>
			<div class="from1" style="width: 375px;">
				<div class="content1"><span id="remainSeats">${eventboardDTO.eventSeats}</span></div><!--잔여매수-->
			</div>
			<div style="margin-left: 20px;">
				<button class="ui pink button" id="book_next_Btn">다음단계로 진행</button></td>
			</div>
		</div>		
		<div style="display: inline-block; float:left; width: 880px; height:20px; "></div>		
	</div><!--class="playContent"  -->
	<input type="hidden" id="imageName" value="${eventboardDTO.imageName}">
	<input type="hidden" id="hiddenTicketPrice" value="${eventboardDTO.eventPrice}"><!--티켓가격-->
	<input id="hiddenDate" type="hidden"><!--공연일자(하루)-->	
	<input id="hiddenTicketQty" type="hidden"><!--티켓 수량 -->
	<input type="hidden" value="${eventboardDTO.eventSeats}" id="hiddenTotalSeats"><!--전체 좌석 수 -->
	<input id="hiddenId" type="hidden" value="${id}"><!--로그인 된 아이디-->
	<!--예약확인 및 결제하기 (모달-개인)-->
	<div class="ui modal bookNextStep"><i class="close icon"></i>
	  <div class="header" id="bookConfirmHeader">예매확인 및 결제하기</div>
	  <div class="book_play_confirm">
	  	<div>
	      <img style="width: 350px;height: 400px; border-radius: 10px;" src="../storage/${eventboardDTO.image1}" id="modalImage1">
	    </div>
	    <div>
	   		<div class="bookPlayTitleDiv" style="margin-left:20px; height:50px; font-size: 20pt; margin-top: 20px;">${eventboardDTO.imageName}</div>
	    		<div class="from">
	    			<div class="content">예매 티켓</div> 
	    		</div>
	    		<div class="from1" style="width: 375px;">
	    			<div class="content1"><span id="BookConfirmedTicketQty"></span>매</div>
	    		</div>
	    		<div class="from">
	    			<div class="content">예매자ID</div>
	    		</div>
	    		<div class="from1" style="width: 375px;">
	    		 	<div class="content1">${id}</div>
	    		</div>
	    		<div class="from">
	    			<div class="content">장소</div>
	    		</div>
	    		<div class="from1" style="width: 375px;">
	    			<div class="content1">${eventboardDTO.eventPlace}</div>
	    		</div>
	    		<div class="from">
	    			<div class="content">시간</div>
	    		</div>
	    		<div class="from1" style="width: 375px;">
	    			<div class="content1">${eventboardDTO.startTime} ~ ${eventboardDTO.endTime}</div>
	    		</div>
	    		<div class="from">
	    			<div class="content">결재 금액</div>
	    		</div>
	    		<div class="from1" style="width: 375px;">
	    			<div class="content1"><span id="totalPrice"></span>원</div>
	    		</div>
	    		<div class="from1" style="width: 375px;">
		  			<div class="content1" id="bookInfo">입장 시, 신분증 제출 및 예매자 아이디를 말씀해주시면 됩니다.</div>	
	   			</div>
	    	</div>
	  </div><!--class="book_play_confirm"-->
	  <div class="actions">
	    <div class="ui black deny button" id="BookEventCancelBtn">취소</div>
	    <div class="ui positive right labeled icon button" id="BookEventBtn">예매확인/결제<i class="checkmark icon"></i></div>
	  </div><!--class="actions"  -->
	</div><!--class="ui modal bookNextStep"-->
</body>
<script>
$(document).ready(function(){
	//페이지 호출 시(기본),
	$('#BookEventBtn').show();	//매진 시, 버튼 숨기고 아닐 시, 보이기
	
	//로그인 아닐 시, 예매버튼 없애버림
	if($('#hiddenId').val()==''){
		$('#BookEventBtn').hide(); //예매버튼 숨김
		$('#bookConfirmHeader').text('로그인 후 예매가능합니다');
	}
	
	if($('#selectEventDate :selected').val()=='2000-01-01'){
		$('#BookEventBtn').hide();
	}
	
	//잔여좌석 보다 구매티켓이 높을 경우 구매 못하게 막음
	$('#selectPlayTicket').change(function(){
		$.ajax({
			type : 'POST',
			url : '/exhibition/performance/book_exhibition_checkBuy.do',
			data : {'wantTicket':$('#selectPlayTicket :selected').val(),'imageName' : $('#imageName').val(), 'playDate' : $('#selectEventDate :selected').text()},
			dataType : 'text',
			success : function(data){
				if(data=='ok'){
					alert('ok');
					$('#BookEventBtn').show();
				}else if(data=='no'){
					alert('예매 가능한 티켓이 부족합니다. 다른 날짜를 선택해주세요');
					$('#BookEventBtn').hide();
				}
			}//success
		});//ajax
	});
	
	//날짜 변경 시, 히든 태그에 날짜 값 넣기
	$("#selectEventDate").change(function() {
		$('#BookEventBtn').show();
		$('#hiddenDate').val($('#selectEventDate :selected').text());
		
		if($('#selectEventDate :selected').val()=='2000-01-01'){
			$('#BookEventBtn').hide();
		}
		
		//로그인 아닐 시, 예매버튼 없애버림
		if($('#hiddenId').val()==''){
			$('#BookEventBtn').hide(); //예매버튼 숨김
			$('#bookConfirmHeader').text('로그인 후 예매가능합니다');
		}
		
		//티켓 잔여 확인
		$.ajax({
			type : 'POST',
			url : '/exhibition/performance/book_exhibition_remainSeats.do',
			data : {'totalSeats' : $('#hiddenTotalSeats').val(), 'imageName' : $('#imageName').val(), 'playDate' : $('#selectEventDate :selected').text()},
			async: true,
			dataType : 'text',
			success : function(data){
				//alert(JSON.stringify(data)); 잔여좌석 확인
				
				if(data=='choseDate'){
					$('#remainSeats').text('날짜입력하세요');
				}else if(data=='remainSeats'){
					$('#remainSeats').text(data);
				}else if(data=='noSeats'){
					$('#BookEventBtn').hide();
					$('#remainSeats').text('매진');
				}else{
					$('#remainSeats').text(data);	
				}
			
			}//success
		});//ajax
		
	});//날짜 변경
	
	//예매하기 버튼 클릭 시,
	$('#BookEventBtn').click(function(){
		var conF = confirm("예매하시겠습니까?");
		
		if(conF){
			$('#hiddenTicketQty').val($('#selectPlayTicket :selected').val()); //티켓 수 히든에 넣기
			$('#hiddenDate').val($('#selectEventDate :selected').text()); //공연일자 히든에 넣기 
			
			//예매 가능한 날짜 있을 때만 결재 금액 나오게 하기
			if($('#hiddenId').val()==''){
				alert('회원가입 후 예매 가능합니다');
			
			}else if($('#selectEventDate :selected').val()!='0'){
				$('#totalPrice').text($('#hiddenTicketPrice').val() * $('#selectPlayTicket :selected').val());
				//	$('#Book_play_div').hide();
				//	$('#Confirm_play_div').show();
			}
			
			//예매 가능한 날짜 없을 시, 예매 컨트롤러 못감
			if($('#selectEventDate :selected').val()=='0'){
				alert("예매 가능한 날짜 없음");
			}else{
				//예매하기 컨트롤러
				$.ajax({
					type : 'POST',
					url : '/exhibition/performance/book_exhibition.do',
					data : {'imageName' : $('#imageName').val(), 'playDate' : $('#hiddenDate').val(), 'ticketQty' : $('#hiddenTicketQty').val()},
					async: true,
					dataType : 'text',
					success : function(data){
						if(data == 0) alert('예약실패. 관리자에게 문의바람');
						else{
							alert('예약완료');
							location.href="/exhibition/performance/P_exhibitionList.do";
						} 
					}//success
					
				});//ajax
			}	
			
		}else{
			location.href="javascript:history.back()";	//뒤로가기 
		}
		
	});//예매하기 버튼 클릭 
	//다음단계
	$('#book_next_Btn').click(function(){
		//모달 호출
		$('.ui.modal.bookNextStep').modal({
			closable : false,
            duration : 460,
		}).modal('show');
		
		//예매티켓 확인
		$('#BookConfirmedTicketQty').text($('#selectPlayTicket :selected').val());
		
		//결제금액 확인(3자리수)
		var totPrice = $('#hiddenTicketPrice').val() * $('#selectPlayTicket :selected').val();	
		$('#totalPrice').text(totPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	});
});
</script>
</html>