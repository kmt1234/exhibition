<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'/>
<link href='../calendar2/fullcalendar.css' rel='stylesheet' />
<link href='../calendar2/fullcalendar.print.css' rel='stylesheet' media='print' />

<script src='../calendar2/lib/moment.min.js'></script>
<!-- <script src='../calendar2/lib/jquery.min.js'></script> -->
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


	$(document).ready(function() {
		var code="";
		$('#calendar').fullCalendar({
			defaultDate: date,
			editable: false,
			
			eventLimit: false, // allow "more" link when too many events
			eventRender:function(event, eventElement) {
                if(event.imageurl) {
                    eventElement.find("span.fc-title").prepend("<img src='" + event.imageurl +	"'width='30px' height='30px'>");
                }
            },
			events: function(start,end,timezone,callback){
		    	  $.ajax({
		        	  type : 'GET',
		        	  url : '/exhibition/performance/getPerformance.do',
		        	  dataType : 'json',
		        	  success : function(data){
		        		 //alert(JSON.stringify(data.list));
		        		  var events = [];
		        		  
		        		  $.each(data.list,function(index,item){
		        			  code = item.code;     
		        			 
		        			  if(code==1){
		        				 for(var i =item.days ; i<=item.endDay; i++){
		        				 var start1 = item.years+"-"+item.months+"-"+i;
		        				  events.push({title : "박람회", 
		        				  			imageurl : "../img/logo.jpg",
		        					  		start : start1,
		        				   			url : "/exhibition/main/index.do",
		        				   			color : "#c13a70"
		        				
		        			  		    });
		        				  
		        				  }
		        			  }else if(code==2){
		        				  for(var i =item.days ; i<=item.endDay; i++){
				        				 var start1 = item.years+"-"+item.months+"-"+i;
		        				  events.push({title : "연극",
		        					  	imageurl : "../img/happycrong.jpg",
	        				  			start :start1,
	
	        				   			url : "/exhibition/member/writeForm.do",
	        			  		    });
		        				  }//for문
		        			  }//if문
		       		  	  });
		        		  callback(events);
		        	  }
		        	  
		        	}); 
		      }
			
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