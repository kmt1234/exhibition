<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전시회</title>

<style>

img{
	width: 367px;
	height: 425px;
	border-radius: 10px;
}

td{
	text-align: left;
   	padding-left: 6%;
    padding-top: 2px;
}

.bookWrapper{
	float: left;
}

.ui.divider{
	margin: 5rem 0 0 0;
}

.playContentHeader{
	float: left;
}

.playContent{
	display: grid;
}

.bookPlayTitle{
   	margin-right: 30%;
    margin-top: 2%;
    margin-bottom: 2%;
    font-size: 3rem;
    width: 710px;
}

.bookPlayTitleDiv {
    margin-top: 25px;
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
	margin-left: 30px;
}

</style>

</head>
<body>
	<body>
	<!-- 메인 화면 -->
	<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
		전시회
		<span class="h-light">예약하기</span>
	</h2>
	
	<!--메뉴-->
	<div class="bookWrapper">
		<div class="ui steps">
		  
		  <div class="active step">
		    <div class="content">
		      <div class="title">예매하기</div>
		    </div>
		  </div>
		  	  	  
		</div><!--class="ui ordered steps"-->
		
	</div><!--class="bookWrapper"-->
	
<div class="ui divider"></div>	

<!--내용 : 예매하기-->
<div id="Book_play_div">

	<div class="playContentHeader">
		<div><img src="../storage/${eventboardDTO.image1}"></div>
		
	</div>
	
	<!--날짜 비교(기본 : 오늘날짜)-->
	<jsp:useBean id="now" class="java.util.Date"/> 
	
	<div class="bookPlayTitleDiv"><span class="bookPlayTitle">${eventboardDTO.imageName}</span></div><input type="hidden" id="imageName" value="${eventboardDTO.imageName}"><!--연극 제목  -->
	
	<div class="playContent">
		<table style="height: 170%;" class="playContentTable">
			<tr>
				<td>장소</td><td> : </td> <td>${eventboardDTO.eventPlace}</td>
			</tr>
			<tr>
				<td>기간</td><td> : </td> <td>${eventboardDTO.startDate} ~ ${eventboardDTO.endDate}</td>
			</tr>
			<tr>
				<td>가격</td><td> : </td> <td><fmt:formatNumber type="number" value="${eventboardDTO.eventPrice}" pattern="#,###" />원</td>
			</tr>
			<tr>
				<td>전시회 날짜</td><td> : </td> 
				<td>
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
				</td>
			</tr>
			<tr>
				<td>공연 시간</td><td> : </td> <td>${eventboardDTO.startTime} ~ ${eventboardDTO.endTime}</td>
			</tr>
			<tr>
				<td>매수</td><td> : </td>
				<td>
					<select id="selectPlayTicket">
						<option value="1">1매</option>
						<option value="2">2매</option>
						<option value="3">3매</option>
						<option value="4">4매</option>
						<option value="5">5매</option>
					</select>
				</td>
			</tr>
			<fmt:parseNumber var="remain" value="${eventboardDTO.eventSeats}" integerOnly="true" />
			<tr>
				<td>잔여 매수</td><td> : </td> <td><span id="remainSeats">${eventboardDTO.eventSeats}</span></td><!--잔여매수-->
			</tr>
			<tr>
				<td colspan="3" align="center"><button class="ui pink button" id="book_next_Btn">다음단계로 진행</button></td>
			</tr>
		</table>			
		
	</div><!--class="playContent"  -->
	
	<input type="hidden" id="hiddenTicketPrice" value="${eventboardDTO.eventPrice}"><!--티켓가격-->
	<input id="hiddenDate" type="hidden"><!--공연일자(하루)-->	
	<input id="hiddenTicketQty" type="hidden"><!--티켓 수량 -->
	<input type="hidden" value="${eventboardDTO.eventSeats}" id="hiddenTotalSeats"><!--전체 좌석 수 -->
	<input id="hiddenId" type="hidden" value="${id}"><!--로그인 된 아이디-->
			
</div><!-- id="Book_play_div"-->
	
	
	
	<!--예약확인 및 결제하기 (모달-개인)-->
	<div class="ui modal bookNextStep"><i class="close icon"></i>
	  <div class="header" id="bookConfirmHeader">예매확인 및 결제하기</div>
	  
	  <div class="book_play_confirm">
	  	
	  	<div>
	      <img src="../storage/${eventboardDTO.image1}" id="modalImage1">
	    </div>
	    
	    <div class="playTableWrapper">
	    
	    	<table>
	    		<tr>
	    			<td>전시회명</td><td> : </td> <td>${eventboardDTO.imageName}</td>
	    		</tr>
	    		<tr>
	    			<td>예매 티켓</td><td> : </td> <td><span id="BookConfirmedTicketQty"></span>매</td>
	    		</tr>
	    		<tr>
	    			<td>예매자ID</td><td> : </td> <td>${id}</td>
	    		</tr>
	    		<tr>
	    			<td>장소</td><td> : </td> <td>${eventboardDTO.eventPlace}</td>
	    		</tr>
	    		<tr>
	    			<td>시간</td><td> : </td> <td>${eventboardDTO.startTime} ~ ${eventboardDTO.endTime}</td>
	    		</tr>
	    		<tr>
	    			<td>결재 금액</td><td> : </td> <td><span id="totalPrice"></span>원</td>
	    		</tr>
	    	</table><br><br>
		  	
		  	<div id="bookInfo">입장 시, 신분증 제출 및 예매자 아이디를 말씀해주시면 됩니다.</div>	
	    </div>
	    
	  </div><!--class="book_play_confirm"-->
	  
	  <div class="actions">
	    <div class="ui black deny button" id="BookEventCancelBtn">취소</div>
	    
	    <div class="ui positive right labeled icon button" id="BookEventBtn">예매확인/결제<i class="checkmark icon"></i></div>
	  </div><!--class="actions"  -->
	  
	</div><!--class="ui modal bookNextStep"-->
	
	
	
	
	
	
	
</body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="../semantic/semantic.min.js"></script>
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