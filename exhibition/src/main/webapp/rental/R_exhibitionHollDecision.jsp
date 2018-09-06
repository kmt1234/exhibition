<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='../calendar2/fullcalendar.css' rel='stylesheet' />
<link href='../calendar2/fullcalendar.print.css' rel='stylesheet' media='print' />
</head>
<body>
<form id="exhibitionHollDecisionForm" method="post" action="/exhibition/rental/reservationHoll.do">
예약 시작일 : <span><input type="date" name="startDate" id="startDate" value="${date}"></span>&ensp;&ensp;&ensp;

예약 종료일 : <span><input type="date" name="endDate" id="endDate" value="${date}"></span><br><br><br>
<input type="hidden" name="C_email" value="${homepageMember.getC_email()}">
<input type="hidden" name="C_license" value="${homepageMember.getC_license()}">
<input type="hidden" name="C_tel" value="${homepageMember.getC_tel()}">
<input type="hidden" id="totalRent" name="totalRent" value="">
<input type="hidden" id="booth" name="booth" value="">
행사 이름 : <input type="text" name="title"><br><br>
<input type="button" id="rentBtn" value="임대료 계산하기">
<input type="button" id="reservationBtn" value="예약하기">
<div id="rentDiv"></div>
</form>
<br><br>

<div id='calendar' style='width: 90%; height: 500px;'></div>


<script src='../calendar2/lib/moment.min.js'></script>
<script src='../calendar2/lib/jquery.min.js'></script>
<script src='../calendar2/fullcalendar.min.js'></script>

<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="../semantic/semantic.min.js"></script> -->
<script>
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

	$(document).ready(function(){
		
		
		$('#rentBtn').click(function(){
			alert('hi');
			var stDate = new Date($('#startDate').val());
		    var endDate = new Date($('#endDate').val());
		 
		    var btMs = endDate.getTime() - stDate.getTime();
		    var btDay = btMs / (1000*60*60*24) + 1;
		    var totalRent = ${rate} * btDay+1;
		    alert(totalRent);
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
						alert(data);
						if(data==='not_exist') {
							$('#exhibitionHollDecisionForm').submit();
						} else if(data==='exist') {
							$('#rentDiv').text('예약불가능');
						} 
					}
				});
				
			});
		
		
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
		        	  type : 'POST',
		        	  url : '/exhibition/rental/getCalendar.do',
		        	  data : {'booth' : '${booth}'},
		        	  dataType : 'json',
		        	  success : function(data){
		        		 //alert(JSON.stringify(data.list));
		        		  var events = [];
		        		  
		        		  $.each(data.list,function(index,item){
		        			  
	        				 for(var i =item.days ; i<=item.endDay; i++){
	        				 var start1 = item.years+"-"+item.months+"-"+i;
	        				  events.push({
	        					  
	        							title : item.title, 
	        				  			imageurl : "../img/logo.jpg",
	        					  		start : start1,
	        				   			color : "#c13a70"
	        				
	        			  		    });
	        				  
	        				  }
		        			 
		       		  	  });
		        		  callback(events);
		        	  }
		        	  
		        	}); 
		      }
			
		});

	});
</script>

<!-- <script>

	$(document).ready(function(){
	});
</script> -->



</body>
</html>