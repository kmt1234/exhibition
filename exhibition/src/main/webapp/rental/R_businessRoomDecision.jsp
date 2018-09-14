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
	${businessRoom} 
</h2>
<form id="" method="post" action="" style="height: 600px;">
	
	<div style="width: 35%; float: right;">
		
		<br><br>
		<div style="width: 100%; float: right;">
			<h4 style="text-align: left; padding-left: 35px ">룸 총 면적 : 100㎡</h4>
			<h4 style="text-align: left; padding-left: 35px ">룸 단위 면적 당 금액 : 1,000원</h4>
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
			<input type="hidden" name="C_email" value="">
			<input type="hidden" name="C_license" value="">
			<input type="hidden" name="C_tel" value="">
			<input type="hidden" id="totalRent" name="totalRent" value="">
			<input type="hidden" id="businessRoom" name="businessRoom" value="${businessRoom}">
			<h4>
				?? : 
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
				$('#writeDiv').text('예약 시작일을 다시 설정해주세요.');
				return;
			}
			
			if($('#startDate').val() > $('#endDate').val()) {
				$('#writeDiv').text('예약 종료일이 시작일보다 빠릅니다.');
				return;
			}
			
			var stDate = new Date($('#startDate').val());
		    var endDate = new Date($('#endDate').val());
		 
		    var btMs = endDate.getTime() - stDate.getTime();
		    var btDay = btMs / (1000*60*60*24) + 1;
		    var totalRent = ${rate} * btDay + 1;
		    var booth = '${booth}';
		    
		    $('#rentDiv').text(booth + '의 총 임대료 : ' + totalRent.toLocaleString() + '원');
		    $('#totalRent').val(totalRent);
			$('#booth').val(booth);
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
					$('#writeDiv').text('행사 이름을 입력해주세요.');
					return;
				}
				
				$.ajax({
					type : 'POST',
					url : '/exhibition/rental/searchRentDay.do',
					async: false,
					data : {'booth': '${booth}',
							'startDate' : $('#startDate').val(),
							'endDate' : $('#startDate').val()},
					async: false,
					dataType: 'text',
					success : function(data){
						
						if(data==='not_exist') {
							$('#exhibitionHollDecisionForm').submit();
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
		
		$('#calendar').fullCalendar({
			header: {
	            left: 'prev,next today',
	            center: 'title',
	            right: 'month,basicWeek,basicDay'
	        },
	        defaultDate: new Date(),
	        navLinks: true, 
	        editable: false,
	        eventLimit: true,
			events: dataset
		});

	});
</script>
</body>
</html>