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
<!-- <script src='../calendar2/lib/jquery.min.js'></script> -->
<script src='../calendar2/fullcalendar.min.js'></script>

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

//alert(JASON.stringify('${listView}'));

var dataSet = [
	<c:forEach var="listView" items="${listView}" varStatus="status">
		<c:if test="${listView.code == '2'}">
		<c:if test="${listView.startDate != ''}">
		    <c:forEach begin="0" end="${listView.daysSize-1}" step="1" varStatus="dayStatus">
		    	{"title" : '<c:out value="${listView.title}"/>',
		    	"start" : '<c:out value="${listView.days[dayStatus.index]}"/>',
		    	"url" : "/exhibition/main/index.do",
		    	"imageurl" : "../img/Ex.png",
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
	    	  $.ajax({
	        	  type : 'GET',
	        	  url : '/exhibition/performance/getPerformance.do',
	        	  dataType : 'text',
	        	  success : function(data){
	
	        	  }
	        	  
	        	}); 

	    	  
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
		max-width: 800px;
		max-height: 600px;
		margin: 0 auto;
	}
</style>
</head>

<body>
<%-- <div style="height: 350px; border: 1px solid;">
	<header>
		<jsp:include page="../main/I_header.jsp"></jsp:include>
	</header>
</div>  --%>
<div style="height: 800px; border: 1px solid ;">
<section>
<br>
<br>
		<div  id='calendar'></div>
	
</section>
</div>
<%-- <footer>
	<jsp:include page="../main/I_footer.jsp"></jsp:include>
</footer> --%>
</body>
</html>