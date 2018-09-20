<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='../calendar2/fullcalendar.css' rel='stylesheet' />
<link href='../calendar2/fullcalendar.print.css' rel='stylesheet' media='print' />
<style type="text/css">
.fc-toolbar {
	height: 53px;
}
</style>
</head>
<body>
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	${hallName} 
</h2>
<form id="concertHallDecisionForm" method="post" action="/exhibition/rental/reservationConcertHall.do" style="height: 600px;">
	
	<div style="width: 35%; float: right;">
		
		<br><br>
		<div style="width: 100%; float: right;">
			<h4 style="text-align: left; padding-left: 35px ">홀 총 면적 : 100㎡</h4>
			<h4 style="text-align: left; padding-left: 35px ">홀 단위 면적 당 금액 : 1,000원</h4>
			<h4 style="text-align: left; padding-left: 35px ">1일 기준 이용 시간 : 08:00 ~ 20:00</h4>
			
			<h4>
				예약 시작일 :
				<span>
					<input type="date" name="startDate" id="startDate" value="${date}">
				</span>
			</h4>
			<h4>
				예약 종료일 :
				<span>
					<input type="date" name="endDate" id="endDate" value="${date}">
				</span>
			</h4>
			<c:if test="${code== '2'}">
			<input type="hidden" name="C_email" value="${C_email}">
			<input type="hidden" name="C_license" value="${C_license}">
			<input type="hidden" name="C_tel" value="${C_tel}">
			</c:if>
			<input type="hidden" id="totalRent" name="totalRent" value="">
			<input type="hidden" id="hallName" name="hallName" value="${hallName}">
			<h4>
				공연 이름 : 
				<input type="text" id="title" name="title">
			</h4>
			<input class="middle ui button" type="button" id="rentBtn" value="임대료 계산하기">
			<input class="middle ui button" type="button" id="reservationBtn" value="예약하기">
			<div id="rentDiv"></div>
			<div id="writeDiv"></div>
		</div>
	
	
	
	</div>
	
	<div id='calendar' style="width: 63%"></div>
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
		
		alert('${C_email}');
		$('#rentBtn').click(function(){
			if($('#startDate').val() < '${date}') {
				$('#writeDiv').text('현재일로부터 한달 이후 부터 예약가능합니다.');
				return;
			}
			
			if($('#startDate').val() > $('#endDate').val()) {
				$('#writeDiv').text('예약 종료일이 시작일보다 빠릅니다.');
				return;
			}
			
			var diff_days = diff_day($('#startDate').val(), $('#endDate').val());
			alert(diff_days);
			
			if(diff_days < 30) {
				$('#writeDiv').text('한달 이상 예약하셔야 합니다.');
				return;
			}
			
			var stDate = new Date($('#startDate').val());
		    var endDate = new Date($('#endDate').val());
		 
			alert('${price}');
		    
		    var totalRent = ${price} * diff_days;
		    var hallName = '${hallName}';
		    
		    $('#rentDiv').text(hallName + '의 총 임대료 : ' + totalRent.toLocaleString() + '원');
		    $('#totalRent').val(totalRent);
			$('#hallName').val(hallName);
			$('#writeDiv').text('');
		});
		
		$('#reservationBtn').click(function(){
			if($('#startDate').val() < '${date}') {
				$('#writeDiv').text('예약 시작일을 다시 설정해주세요.');
				return;
			}
			
			if($('#startDate').val() > $('#endDate').val()) {
				$('#writeDiv').text('예약 종료일이 시작일보다 빠릅니다.');
				return;
			}
			
			if(code=='2') {
				
				if($('#rentDiv').text()=='') {
					$('#writeDiv').text('임대료 계산부터 해주세요.');
					return;
				}
				
				if($('#title').val()=='') {
					$('#writeDiv').text('공연 이름을 입력해주세요.');
					return;
				}
				
				$.ajax({
					type : 'POST',
					url : '/exhibition/rental/searchConcertHallRentDay.do',
					data : {'hallName': '${hallName}',
							'startDate' : $('#startDate').val(),
							'endDate' : $('#startDate').val()},
					async: false,
					dataType: 'text',
					success : function(data){
						
						if(data==='not_exist') {
							$('#concertHallDecisionForm').submit();
						} else if(data==='exist') {
							$('#writeDiv').text('예약불가능');
						}  
						
					}
				});
				
			} else {
				$('#rentDiv').empty();
				$('.ui.mini.modal.rental').modal('show');
			}
			
		});
		
		var calDate = new Date();
		calDate.setMonth(calDate.getMonth()+1);
		
		
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
		
		function diff_day(value1, value2) {
			var arr1 = value1.split('-');
			var arr2 = value2.split('-');
			
			var dt1 = new Date(arr1[0], arr1[1], arr1[2]);
			var dt2 = new Date(arr2[0], arr2[1], arr2[2]);
			
			var diff = dt2 - dt1;
			var day = 1000 * 60 * 60 * 24;//밀리세컨 초 * 초 * 분 * 시간
			
			return parseInt(diff/day);
		}
		
		
		
		

	});
</script>
</body>
</html>