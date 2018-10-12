<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='../calendar2/fullcalendar.css' rel='stylesheet' />
<link href='../calendar2/fullcalendar.print.css' rel='stylesheet' media='print'/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"><!--달력 ui-->
<style type="text/css">
.fc-toolbar {/*달력위치  */
	height: 53px;
}
</style>
</head>
<body>
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	${hallName} 
</h2>
<form id="concertHallDecisionForm" method="post" action="/exhibition/rental/reservationConcertHall.do" style="height: 600px;">
	<!-- 달력 -->
	<div id='calendar' style="width: 520px; display: inline-block; float: left; margin-left: 20px;"></div>
	<!-- 문구 -->
	<div style="width: 350px; float: left; display: inline-block;">
		<br><br>
		<div style="width: 100%; margin-top: 30px;">
			<h4 style="text-align: left; padding-left: 35px ">홀 총 면적 : 100㎡</h4>
			<h4 style="text-align: left; padding-left: 35px ">홀 단위 면적 당 금액 : <fmt:formatNumber value="${rate}" pattern="#,###"/>원</h4>
			<h4 style="text-align: left; padding-left: 35px ">1일 기준 이용 시간 : 08:00 ~ 20:00</h4>
			<h4 style="text-align: left; padding-left: 35px ">
				예약 시작일 :
				<span>
					<input type="text" name="startDate" class="datepicker5" id="startDate" value="${date}">
				</span>
			</h4>
			<h4 style="text-align: left; padding-left: 35px ">
				예약 종료일 :
				<span>
					<input type="text" name="endDate" class="datepicker6" id="endDate" value="${date}">
				</span>
			</h4>
			<c:if test="${code== '2'}">
			<input type="hidden" name="C_email" value="${C_email}">
			<input type="hidden" name="C_license" value="${C_license}">
			<input type="hidden" name="C_tel" value="${C_tel}">
			</c:if>
			<input type="hidden" id="totalRent" name="totalRent" value="">
			<input type="hidden" id="hallName" name="hallName" value="${hallName}">
			<h4 style="text-align: left; padding-left: 35px ">
				공연 이름 : 
				<input type="text" style="width: 185px;" id="title" name="title">
			</h4>
			<div style="text-align: left; padding-left: 35px ">
				<input class="middle ui button" type="button" id="rentBtn" value="임대료 계산하기">
				<input class="middle ui button" type="button" style="width: 110px;" id="reservationBtn" value="예약하기">
			</div>
			<div id="rentDiv"></div>
			<div id="writeConDiv"></div>
		</div>
	
	
	
	</div>
	
	
</form>
<br><br>

<div class="ui mini modal rental">
  <div class="header">
  	<i class="huge home icon"></i>
  </div>
  <div class="content" style="width: 100%">
    <span>사업자로 로그인해주세요</span>
  </div>
  <div class="actions">
    <div class="ui approve button">확인</div>
  </div>
</div>

<div class="ui mini modal successConcert"> <!-- 예약성공 모달 -->
  <div class="header">
  	<i class="huge home icon"></i>
  </div>
  <div class="content" style="width: 100%">
    <span>예약성공</span>
  </div>
  <div class="actions">
    <div class="ui approve button successConcert">확인</div>
  </div>
</div>

<input type="hidden" id="code" value="${code}">

<script src='../calendar2/lib/moment.min.js'></script>
<script src='../calendar2/lib/jquery.min.js'></script>
<script src='../calendar2/fullcalendar.min.js'></script>
<script src="../semantic/semantic.min.js"></script>
<script>
	var dataset = [
		<c:forEach var="listView" items="${listView}" varStatus="status">
		<c:if test="${listView.startDate != ''}">
		    <c:forEach begin="0" end="${listView.daysSize-2}" step="1" varStatus="dayStatus">
		    	{"title" : '<c:out value="${listView.title}"/>',
		    	"start" : '<c:out value="${listView.days[dayStatus.index]}"/>' 	
		    	} <c:if test="${!dayStatus.last}">,</c:if>
		    </c:forEach>
		    <c:if test="${!status.last}">,</c:if>
		 </c:if> 
		</c:forEach>
	]; 
	
	
	var code = $('#code').val();
	
	$(document).ready(function(){
		$('#rentBtn').click(function(){
			if($('#startDate').val() < '${date}') {
				$('#writeConDiv').text('현재일로부터 한달 이후 부터 예약가능합니다.');
				return;
			}
			
			if($('#startDate').val() > $('#endDate').val()) {
				$('#writeConDiv').text('예약 종료일이 시작일보다 빠릅니다.');
				return;
			}
			
			var diff_days = diff_day($('#startDate').val(), $('#endDate').val());
			if(diff_days < 30) {
				$('#writeConDiv').text('한달 이상 예약하셔야 합니다.');
				return;
			}
			
			var stDate = new Date($('#startDate').val());
		    var endDate = new Date($('#endDate').val());
		    var totalRent = ${rate} * diff_days * ${width};
		    var hallName = '${hallName}';
		    
		    $('#rentDiv').text(hallName + '의 총 임대료 : ' + totalRent.toLocaleString() + '원');
		    $('#totalRent').val(totalRent);
			$('#hallName').val(hallName);
			$('#writeConDiv').text('');
		});
		
		$('#reservationBtn').click(function(){
			if($('#startDate').val() < '${date}') {
				$('#writeConDiv').text('예약 시작일을 다시 설정해주세요.');
				return;
			}
			
			if($('#startDate').val() > $('#endDate').val()) {
				$('#writeConDiv').text('예약 종료일이 시작일보다 빠릅니다.');
				return;
			}
			
			if(code=='2') {
				
				if($('#rentDiv').text()=='') {
					$('#writeConDiv').text('임대료 계산부터 해주세요.');
					return;
				}
				
				if($('#title').val()=='') {
					$('#writeConDiv').text('공연 이름을 입력해주세요.');
					return;
				}
				
				$.ajax({
					type : 'POST',
					url : '/exhibition/rental/searchConcertHallRentDay.do',
					data : {'hallName': '${hallName}',
							'startDate' : $('#startDate').val(),
							'endDate' : $('#endDate').val()},
					async: false,
					dataType: 'text',
					success : function(data){
						
						if(data==='not_exist') {
							$('.ui.mini.modal.successConcert').modal({
								closable : false,
					            duration : 460,
							}).modal('show');
							
							$('.ui.approve.button.successConcert').on('click', function(){
								$('#concertHallDecisionForm').submit();
							});
						} else if(data==='exist') {
							$('#writeConDiv').text('예약불가능');
							$('#rentDiv').text('');
						}  
						
					}
				});
				
			} else {
				$('#rentDiv').empty();
				$('.ui.mini.modal.rental').modal('show');
			}
			
		});
		
		var calDate = new Date();
		
		
		$('#calendar').fullCalendar({
			header: {
	            left: 'prev,next today',
	            center: 'title',
	            right: 'month,basicWeek,basicDay'
	        },
	        defaultDate: calDate,
	        navLinks: true, 
	        editable: false,
	        eventLimit: true,
			events: dataset,
			eventClick: function(event) {
			}
	        
		});
		
		
		
		
		//날짜
		$(".datepicker5, .datepicker6").datepicker({
			dateFormat : "yy/mm/dd",
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		    showMonthAfterYear: true,
		    minDate : 0,
		    yearSuffix: '년'
		});
		
		//시작일과 마지막날짜 설정
		$('.datepicker5').datepicker('setDate', $('#startDate').val());
		$('.datepicker6').datepicker('setDate', $('#endDate').val());
		
		
		function diff_day(value1, value2) {
			var arr1 = value1.split('/');
			var arr2 = value2.split('/');
			
			var dt1 = new Date(arr1[0], arr1[1], arr1[2]);
			var dt2 = new Date(arr2[0], arr2[1], arr2[2]);
			
			var diff = dt2 - dt1;
			var day = 1000 * 60 * 60 * 24;//밀리세컨 초 * 초 * 분 * 시간
			
			return parseInt(diff/day);
		}

	});
</script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script><!--달력-->
</body>
</html>