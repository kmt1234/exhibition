<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>
<head>
</head>
<body>
<div style="width: 100%; text-align: left;">
	<h2 class="box-container" style="float: center; width: 100%; height:126px; text-align: left;">
		<span>박람회 </span>
		<span class="h-light">수정</span>
		<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
			<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
			> 고객센터 > 게시판추가 > 목록 > 수정
		</div>
		<div class="ui divider"></div> 
	</h2>
	<form id="eventboardModForm" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="postSelect" value="1">
		<input type="hidden" name="seq" value="${eventboardDTO.seq}">
	<!-- 내용 입력 -->
	<div style="width: 520px; margin-left: 20px;" >
	    <!-- 제목 -->
		<div class="ui labeled input " style="margin-top: 20px;">
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>제목</span>
			</div>
			<div class="ui inverted input" style="width: 100%;">
				<div class="ui left icon input focus" style="width: 420px; height: 50px;">	
					<input type="text" name="imageName" id="imageName" value="${eventboardDTO.imageName}">
	  				<i class="user icon"></i>
	  			</div>
	  		</div>
	  	</div>
	  	<!-- 포스트 -->
	  	<div class="ui labeled input " style="margin-top: 20px;">
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>포스터</span>
			</div>
			<div class="ui inverted input" style="width: 100%; height: 50px;">
				<div class="ui left icon input focus" style="width: 420px; height: 50px;">
					<input type="file" name="img" id="img" style="width:100%;">
				</div>
		  	</div>
		</div>
		<div id="imgDiv"></div>
		<!-- 날짜 -->
		<div class="ui labeled input " style="margin-top: 20px;">
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>날짜선택</span>
			</div>
			<div class="ui inverted input" style="width: 100%;">
				<div class="ui left icon input focus" style="width: 100%; height: 50px;">
					<input type="text" name="startDate" class="datepicker1">
					<input type="hidden" id="startDate" value="${eventboardDTO.startDate}" style="width:195px;">
					<div style="width: 10px;"></div>
					<input type="text" name="endDate" class="datepicker2">
					<input type="hidden" id="endDate" value="${eventboardDTO.endDate}" style="width:195px;">
				</div>
		  	</div>
	  	</div>
	  	<!-- 홈페이지 -->
	    <div class="ui labeled input " style="margin-top: 20px;">
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>홈페이지</span>
			</div>
			<div class="ui inverted input" style="width: 100%;">
				<div class="ui left icon input  focus" style="width: 420px;  height: 50px;">
					<input type="text" name="eventLink" id="eventLink" value="${eventboardDTO.eventLink}">
	  				<i class="user icon"></i>
	  			</div>
	  		</div>
	  	</div>
	  	<!-- 시간 -->
	  	<div class="ui labeled input " style="margin-top: 20px;" >
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>시간선택</span>
			</div>
		  	<div class="ui inverted input" style="width: 100%;">
				<div class="ui left icon input focus" style="width: 100%; height: 50px;">
					<input type="text" name="startTime" class="timepicker1">
					<input type="hidden" id="timepicker1" value="${eventboardDTO.startTime}" style="width:195px;">
					<div style="width: 10px;"></div>
					<input type="text" name="endTime" class="timepicker2">
					<input type="hidden" id="timepicker2" value="${eventboardDTO.endTime}" style="width:195px;">
				</div>
		  	</div>
	    </div>
	    <!-- 행사장위치  -->
	  	<div class="ui labeled input " style="margin-top: 20px;">
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>행사위치</span>
			</div>
			<div class="ui inverted input" style="width: 100%;">
				<div class="ui left icon input focus" style="width: 420px;  height: 50px;">
					<input type="text" name="eventPlace" value="${eventboardDTO.eventPlace}">
	  				<i class="user icon"></i>
	  			</div>
	  		</div>
	  	</div>
	  	<!-- 티켓금액 -->
	  	<div class="ui labeled input " style="margin-top: 20px;">
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>티켓금액</span>
			</div>
			<div class="ui inverted input" style="width: 100%;">
				<div class="ui left icon input focus" style="width: 420px; height: 50px;">
					<input type="text" name="eventPrice" value="${eventboardDTO.eventPrice}">
	  				<i class="user icon"></i>
	  			</div>
	  		</div>
	  	</div>
	  	<!-- 관람인원  -->	
	  	<div class="ui labeled input " style="margin-top: 20px;">
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>관람인원</span>
			</div>	
			<div class="ui inverted input" style="width: 100%;">
				<div class="ui left icon input focus" style="width: 420px; height: 50px;">
					<input type="text" name="eventSeats" value="${eventboardDTO.eventSeats}">
	  				<i class="user icon"></i>
	  			</div>
	  		</div>
	  	</div>
		<!-- 관람등급 -->	  	
	    <div class="ui labeled input " style="margin-top: 20px;">
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>관람등급</span>
			</div>
			<div class="ui inverted input" style="width: 100%;">	
				<div class="ui left icon input focus" style="width: 420px; height: 50px;">
					<input type="text" name="eventRate" value="${eventboardDTO.eventRate}">
	  				<i class="user icon"></i>
	  			</div>
	  		</div>
	  	</div>
	 	<div class="ui labeled input " style="margin-top: 20px;">
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>박람회내용</span>
			</div>	
	 		 <div class="ui inverted input" style="width: 100%;">
				<div class="ui left icon input focus" style="width: 420px;" >
					<textarea rows="5" cols="78" name="eventContent" id="eventContent" style="resize: none;"><c:out value="${eventboardDTO.eventContent}"/></textarea>
				</div>
			</div>
	  	</div>
	  	
	    <div class="ui two buttons" style="margin-top: 20px;">
	    	<div class="middle ui button" id="ModeButton" style="width: 15%;">수정</div>
	    	<div style="width: 5%;">&nbsp;</div>
	    	<button class="middle ui button" type="reset" id="writeReset" style="width: 15%;">다시작성</button>
	    	<div style="width: 5%;">&nbsp;</div>
	    	<div class="middle ui button" id="imageboardList" style="width: 15%;"
	    	onclick="location.href='/exhibition/customerService/C_eventboardListForm.do'">목록</div>
		</div>
	</div><!--수정영역 텍스트필드-->
	</form>
</div>
</body>
<script>
$(document).ready(function(){
	var startDate = $('#startDate').val().substring(0,4)+"/"+$('#startDate').val().substring(5,7)+"/"+$('#startDate').val().substring(8,10);
	var endDate = $('#endDate').val().substring(0,4)+"/"+$('#endDate').val().substring(5,7)+"/"+$('#endDate').val().substring(8,10);
	var startTime = $('#timepicker1').val().substring(0,2);
	var endTime = $('#timepicker2').val().substring(0,2);
	//시간
	$('.timepicker1').timepicker({
		timeFormat : 'H:mm',
	    interval: 60,
	    minTime: '08',
	    maxTime: '10:00pm',
	    defaultTime: startTime,
	   	startTime: '08:00am',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: false	
	});
	$('.timepicker2').timepicker({
		timeFormat : 'H:mm',
	    interval: 60,
	    minTime: '08',
	    maxTime: '10:00pm',
	    defaultTime: endTime,
	   	startTime: '08:00am',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: false	
	});
	//날짜
	$(".datepicker1, .datepicker2").datepicker({
		dateFormat : "yy/mm/dd",
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년'
	});
	
	//시작일과 마지막날짜 설정
	$('.datepicker1').datepicker('setDate', startDate);
	$('.datepicker2').datepicker('setDate', endDate);
	
	$('#ModeButton').click(function(){
		$('#eventboardModForm').attr('action','/exhibition/customerService/C_eventboardMod.do').submit();
	});
});
</script>
</html>