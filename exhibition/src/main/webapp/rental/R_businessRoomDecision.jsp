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

td.empty {
    padding: 50px 0 !important;
    text-align: center;
    background-color: #fff !important;
}

</style>
</head>
<body>
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	${businessRoom} 
</h2>
	
	<div id='calendar' style="width: 63%"></div>
<br><br>

<h3>
	<span>비즈니스룸 이용 시간 선택</span>
</h3>
<div>
<form id="businessRoomForm">
	<table id="time_list" width="100%">
		<tr>
			<th style="width: 50px">
				<input type="checkbox" id="checkAll">
			</th>
			<th >이용시간</th>
			<th style="width: 150px">금액(원)</th>
			<th style="width: 150px">상태</th>
		</tr>
		<tr>
			<td class="empty" colspan="4"> 이용 일자를 선택하세요. </td>
		</tr>
	</table>
</form>
</div>	

<div class="ui mini modal rental">
  <div class="header">
  	<i class="huge home icon"></i>
  </div>
  <div class="content" style="width: 100%">
    <span>개인으로 로그인해주세요</span>
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
			events: dataset,
			dayClick: function(date) {
				var startDate=date.format("YYYY") + '-' + date.format("MM") + '-' + date.format("DD");
				alert(startDate);
				$.ajax({
					type : 'POST',
					url : '/exhibition/rental/searchBusinessRoom.do',
					data : {'roomName': '${businessRoom}',
							'startDate' : startDate},
					async: false,
					dataType: 'json',
					success : function(data) {
						$('#time_list tr:gt(0)').remove();
						
						
						$('<tr/>',{
				               align : 'center'
				            }).append($('<td/>').append($('<input/>',{
				               type : 'checkbox',
				               name: 'checkRow'
				            }))).append($('<td/>',{
				               text : '09 : 00 ~ 12 : 00'
				            })).append($('<td/>',{
				               text : '12,000'
				            })).append($('<td/>',{
				               id: 'first',
				               text : '예약가능'
				            })).appendTo('#time_list');
						
						$('<tr/>',{
				               align : 'center'
				            }).append($('<td/>').append($('<input/>',{
				               type : 'checkbox',
				               name: 'checkRow'
				            }))).append($('<td/>',{
				               text : '12 : 00 ~ 15 : 00'
				            })).append($('<td/>',{
				               text : '12,000'
				            })).append($('<td/>',{
				            	id: 'second',
				               text : '예약가능'
				            })).appendTo('#time_list');
						
						$('<tr/>',{
				               align : 'center'
				            }).append($('<td/>').append($('<input/>',{
				               type : 'checkbox',
					           name: 'checkRow'
				            }))).append($('<td/>',{
				               text : '15 : 00 ~ 18 : 00'
				            })).append($('<td/>',{
				               text : '12,000'
				            })).append($('<td/>',{
				            	id: 'third',
				               text : '예약가능'
				            })).appendTo('#time_list');
						
						$('<tr/>',{
				               align : 'center'
				            }).append($('<td/>').append($('<input/>',{
				               type : 'checkbox',
				               name: 'checkRow'
				            }))).append($('<td/>',{
				               text : '18 : 00 ~ 21 : 00'
				            })).append($('<td/>',{
				               text : '12,000'
				            })).append($('<td/>',{
				            	id: 'fourth',
				               text : '예약가능'
				            })).appendTo('#time_list');
						
						alert(JSON.stringify(data));
						
						$.each(data.list, function(index, item){
							
							if(item.first=='Y') {
								$('#first').text('예약불가능').css('color', 'red');
							}
							if(item.second=='Y') {
								$('#second').text('예약불가능').css('color', 'red');
							}
							if(item.third=='Y') {
								$('#third').text('예약불가능').css('color', 'red');
							}
							if(item.fourth=='Y') {
								$('#fourth').text('예약불가능').css('color', 'red');
							}
						});
						
					}
					
				});
				
			}
	        
	        
		});
		
		//checkBox 전체 선택, 해제
		$('#checkAll').on('click', function(){
			var cbox = $('[name="checkRow"]');
			for(var i = 0; i < cbox.length; i++) {
				cbox[i].checked = $('#checkAll').is(':checked') ;
			}
		});
		

	});
</script>
</body>
</html>