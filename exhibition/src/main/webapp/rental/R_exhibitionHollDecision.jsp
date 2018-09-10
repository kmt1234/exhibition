<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
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
<form id="exhibitionHollDecisionForm" method="post" action="/exhibition/rental/reservationHoll.do" style="height: 600px;">
	<table style="border: 1px solid; width: 40%;">
		<tr>
			<td>
				<button style="width: 100%;">
					1층
				</button> 
			</td>
			<td>
				<button style="width: 100%;">
					2층
				</button> 
			</td>
			<td>
				<button style="width: 100%;">
					3층
				</button> 
			</td>
		</tr>
	</table>
	<br><br>
	<div style="width: 35%; float: right;">
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
		
		<input type="hidden" name="C_email" value="${homepageMember.getC_email()}">
		<input type="hidden" name="C_license" value="${homepageMember.getC_license()}">
		<input type="hidden" name="C_tel" value="${homepageMember.getC_tel()}">
		<input type="hidden" id="totalRent" name="totalRent" value="">
		<input type="hidden" id="booth" name="booth" value="">
		
		<h4>
		행사 이름 : 
		<input type="text" name="title">
		</h4>
		
		
		<input type="button" id="rentBtn" value="임대료 계산하기">
		<input type="button" id="reservationBtn" value="예약하기">
		<div id="rentDiv"></div>
	</div>
	<div id='calendar' style="width: 65%"></div>
	
</form>





<script src='../calendar2/lib/moment.min.js'></script>
<script src='../calendar2/lib/jquery.min.js'></script>
<script src='../calendar2/fullcalendar.min.js'></script>

<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="../semantic/semantic.min.js"></script> -->
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


	$(document).ready(function(){
		
		
		$('#rentBtn').click(function(){
			var stDate = new Date($('#startDate').val());
		    var endDate = new Date($('#endDate').val());
		 
		    var btMs = endDate.getTime() - stDate.getTime();
		    var btDay = btMs / (1000*60*60*24) + 1;
		    var totalRent = ${rate} * btDay+1;
		    var booth = '${booth}';
		    
		    $('#rentDiv').text(booth + '의 총 임대료 : ' + totalRent.toLocaleString() + '원');
		    $('#totalRent').val(totalRent);
			$('#booth').val(booth);
		});
		

		$('#reservationBtn').click(function(){
			$.ajax({
					type : 'POST',
					url : '/exhibition/rental/searchRentDay.do',
					data : {'booth': '${booth}',
							'startDate' : $('#startDate').val(),
							'endDate' : $('#startDate').val()},
					dataType: 'text',
					success : function(data){
						if(data==='not_exist') {
							$('#exhibitionHollDecisionForm').submit();
						} else if(data==='exist') {
							$('#rentDiv').text('예약불가능');
						} 
					}
				});
				
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