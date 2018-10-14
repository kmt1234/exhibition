<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'/>
<link href='../calendar2/fullcalendar.css' rel='stylesheet' />
<link href='../calendar2/fullcalendar.print.css' rel='stylesheet' media='print' />

<script src='../calendar2/lib/moment.min.js'></script>
<script src='../calendar2/lib/jquery.min.js'></script>
<script src='../calendar2/fullcalendar.min.js'></script>

<script type="text/javascript">
var date = new Date(); 
var year = date.getFullYear(); 
var month = new String(date.getMonth()+1); 
var day = new String(date.getDate()); 
// 한자리수일 경우 0을 채워준다. 
if(month.length == 1){ 
  month = "0" + month; 
} 
if(day.length == 1){ 
  day = "0" + day; 
}
var dataSet = [
	<c:forEach var="listView" items="${listView}" varStatus="status">
		<c:if test="${listView.postSelect == '1'}">
		<c:if test="${listView.startDate != ''}">
		    <c:forEach begin="0" end="${listView.daysSize-1}" step="1" varStatus="dayStatus">
		    	{"title" : '<c:out value="${listView.imageName}"/>',
		    	"start" : '<c:out value="${listView.days[dayStatus.index]}"/>',
		    	"imageurl" : "../img/Ex.png",
		    	"url" : "/exhibition/performance/exhibitionBook.do?seq=${listView.seq}",
		    	"color" : "#ffffff",
		    	"textColor" : "#000000"
		    	} <c:if test="${!dayStatus.last}">,</c:if>
		    </c:forEach>
		    <c:if test="${!status.last}">,</c:if>
		 </c:if> 
		 </c:if> 
		</c:forEach>
	];
	


	$(document).ready(function() {
	    	 /*  $.ajax({
	        	  type : 'GET',
	        	  url : '/exhibition/performance/getPerformance.do',
	        	  dataType : 'text',
	        	  success : function(data){
	
	        	  }
	        	  
	        	});  */

	    	  
		$('#calendar').fullCalendar({
			defaultDate: date,
			editable: false,
			
			eventLimit: false, // allow "more" link when too many events
			eventRender:function(event, eventElement) {
                if(event.imageurl) {
                    eventElement.find("span.fc-title").prepend("<img src='" + event.imageurl +	"'width='30px' height='30px' align='absmiddle' > &ensp;");
                }
            },
			events: dataSet
		});
		
	 });
</script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
	font-size: 14px;
}
#calendar {
	max-width: 880px;
	margin: 0 auto;
}
#houseImg{
	margin:-3px;
	cursor: pointer;
}
</style>
</head>

<body>	
<!-- 메인 화면 -->
	<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
		박람회
		<span class="h-light">일정</span>
		<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
		<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
		> 일정 > 박람회일정
	</div>
	<div class="ui divider"></div> 
	</h2>
	
	<!-- 버튼 -->
	<div>
		<table style="margin-left:20px; width: 40%;">
			<tr>
				<td>
					<button class="middle ui button" style="width: 100%;" id="P_exhibitionCalendarBtn">
						달력으로 보기
					</button> 
				</td>
				<td>
					<button class="middle ui button" style="width: 100%;" id="list_exhibition">
						리스트로 보기
					</button> 
				</td>
			</tr>
		</table>
		 <span style="float: right; margin-right:30px; ">
		 <img src="../img/Ex.png" style="width:25px; height: 25px; " align='absmiddle'> 박람회
		 </span>
		 
		 <span style="float: right; margin-right:30px; ">
		 	<img src="../img/Ev.png" style="width:25px; height: 25px;" align='absmiddle'> 공연  &ensp;&ensp;
		 </span>
	</div>
		<br><br><br><br>
	<div  id='calendar'></div>
</body>
</html>