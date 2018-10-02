<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='../calendar2/fullcalendar.css' rel='stylesheet' />
<link href='../calendar2/fullcalendar.print.css' rel='stylesheet' media='print' />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"><!--달력 ui-->
<style type="text/css">
.fc-toolbar {/*달력위치  */
	height: 53px;
}
</style>
</head>
<body>
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	${booth} 
</h2>
<form id="exhibitionHollDecisionForm" method="post" action="/exhibition/rental/reservationHoll.do" style="height: 600px;">
	<div style="width: 35%; float: right;">
		<br><br>
		<div style="width: 100%; float: right;">
			<h4 style="text-align: left; padding-left: 35px ">부스 총 면적 : 100㎡</h4>
			<h4 style="text-align: left; padding-left: 35px ">부스 단위 면적 당 금액 : <fmt:formatNumber value="${rate}" pattern="#,###"/>원</h4>
			<h4 style="text-align: left; padding-left: 35px ">1일 기준 이용 시간 : 08:00 ~ 20:00</h4>
			
			<h4>
				예약 시작일 :
				<span>
					<input type="text" name="startDate" class="datepicker3" id="startDate" value="${date}">
				</span>
			</h4>
			<h4>
				예약 종료일 :
				<span>
					<input type="text" name="endDate" class="datepicker4" id="endDate" value="${date}">
				</span>
			</h4>
		    <c:if test="${code== '2'}">
			<input type="hidden" name="C_email" value='${C_email}'>
			<input type="hidden" name="C_license" value="${C_license}">
			<input type="hidden" name="C_tel" value="${C_tel}">
			</c:if>
			<input type="hidden" id="totalRent" name="totalRent" value="">
			<input type="hidden" id="booth" name="booth" value="${booth}">
			<h4>
				행사 이름 : 
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

<div class="ui mini modal successBooth"> <!-- 예약성공 모달 -->
  <div class="header">
  	<i class="huge home icon"></i>
  </div>
  <div class="content" style="width: 100%">
    <span>예약성공</span>
  </div>
  <div class="actions">
    <div class="ui approve button successBooth">확인</div>
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
			
			var diff_days = diff_day($('#startDate').val(), $('#endDate').val());
			if(diff_days < 30) {
				$('#writeDiv').text('한달 이상 예약하셔야 합니다.');
				return;
			}
			
			var stDate = new Date($('#startDate').val());
		    var endDate = new Date($('#endDate').val());
		 
		    var btMs = endDate.getTime() - stDate.getTime();
		    var btDay = btMs / (1000*60*60*24) + 1;
		    var totalRent = ${rate} * (btDay) * ${width};
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
					$('#rentDiv').text('');
					return;
				}
				
				$.ajax({
					type : 'POST',
					url : '/exhibition/rental/searchRentDay.do',
					data : {'booth': '${booth}',
							'startDate' : $('#startDate').val(),
							'endDate' : $('#startDate').val()},
					async: false,
					dataType: 'text',
					success : function(data){
						
						if(data==='not_exist') {
							$('.ui.mini.modal.successBooth').modal({
								closable : false,
					            duration : 460,
							}).modal('show');
							
							$('.ui.approve.button.successBooth').on('click', function(){
								$('#exhibitionHollDecisionForm').submit();
							});
							
						} else if(data==='exist') {
							$('#writeDiv').text('예약불가능');
							$('#rentDiv').text('');
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
			events: dataset,
			eventClick: function(event) {
			}
	        
		});

		//날짜
		$(".datepicker3, .datepicker4").datepicker({
			dateFormat : "yy/mm/dd",
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		    showMonthAfterYear: true,
		    minDate : 1,
		    yearSuffix: '년'
		});
		
		
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