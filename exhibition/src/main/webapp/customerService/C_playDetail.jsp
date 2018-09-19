<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../semantic/semantic.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"><!--달력 ui-->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css"><!--시간 ui-->
<style>
.box-container{
	display: inline-block;
	padding-bottom: 40px;
	padding-left: 20px;
	padding-right: 20px;
	padding-top: 20px;
	font-weight:normal;
	font-size: 50px;
}
.h-light{
	color: #ec008c;

}

.eventUploadBtn{
	margin-right: 8%;
}

</style>

</head>
<body>
	<header>
		<jsp:include page="../main/I_header.jsp"></jsp:include>
	</header>
	<br>
	<br>
	<div class="ui five column grid container">
		<!-- 사이드바 메뉴 -->
		<div class="ui compact menu" style="width: 20%; height: 977px; ">
			<a class="item" href="P_allScheduleForm.jsp">전체일정</a> 
			<a class="item" href="P_performanceScheduleForm.jsp">공연일정</a> 
			<a class="item" href="P_exhibitionScheduleForm.jsp">전시회일정</a>
		</div>
		<!-- 메인 화면 -->
		<div class="ui compact menu" style="width: 80%; height: 900px;" >
			<!-- 타이틀 -->
			<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
				연극
				<span class="h-light">수정</span>
			</h2>
<form id="playboardModForm" method="POST"
	enctype="multipart/form-data">
	<input type="hidden" name="postSelect" value="2">
	<input type="hidden" name="seq" value="${eventboardDTO.seq}">
			<!-- 내용 입력 -->
<div style="width: 60%;align:left">
	<br>
	<div class="ui labeled input" style="width: 100%;height: 50px;">
		<div class="ui label">
			제목
		</div>
		<input type="text" name="imageName" id="imageName" value="${eventboardDTO.imageName}">
  	</div>
  	<br><br>
  	<div class="ui inverted input" style="width: 200px; height: 150px;">
  		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<img src="../storage/${eventboardDTO.image1}" name="imaView" id="imaView" width="200px" height="150px">
	 	</div>
	</div>
	<div class="ui inverted input" style="width: 100%;">
			<input type="file" name="img" id="img" style="width:100%;">
  	</div>
	<div id="imgDiv"></div>
	<br>
	
	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<input type="text" name="startDate" class="datepicker1">
			<div style="width: 5%;">&nbsp;</div>
			<input type="text" name="endDate" class="datepicker2">
		</div>
  	</div>
  	<br><br>
  	<div class="ui labeled input" style="width: 100%;height:50px;">
		<div class="ui label">
			링크
		</div>
		<input type="text" name="eventLink" id="eventLink" value="${eventboardDTO.eventLink}">
  	</div>
  	<br><br>
  	
  	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<input type="text" name="startTime" class="timepicker1">
			<div style="width: 5%;">&nbsp;</div>
			<input type="text" name="endTime" class="timepicker2">
		</div>
  	</div>
  	<br><br>
  
  	<div class="ui labeled input" style="width: 100%; height: 50px;">
		<div class="ui label">
			장소
		</div>
		<input type="text" name="eventPlace" value="${eventboardDTO.eventPlace}">
  	</div>
  	<br><br>
  	
  	<div class="ui labeled input" style="width: 100%; height: 50px;">
		<div class="ui label">
			가격
		</div>
		<input type="text" name="eventPrice" value="${eventboardDTO.eventPrice}">
  	</div>
  	<br><br>
  		
  	<div class="ui labeled input" style="width: 100%; height: 50px;">
		<div class="ui label">
			좌석	
		</div>
		<input type="text" name="eventSeats" value="${eventboardDTO.eventSeats}">
  	</div>
  	<br><br>
  	
  	<div class="ui labeled input" style="width: 100%; height: 50px;">
		<div class="ui label">
			관람등급
		</div>
		<input type="text" name="eventRate" value="${eventboardDTO.eventRate}">
  	</div>
  	
  	<br><br>
  	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" >
			<textarea rows="5" cols="78" name="eventContent" id="eventContent" style="resize: none;"><c:out value="${eventboardDTO.eventContent}"/></textarea>
		</div>
  	</div>
  	
    <div class="ui two buttons">
    	<div class="middle ui button" id="ModeButton" style="width: 15%;">수정</div>
    	<div style="width: 5%;">&nbsp;</div>
    	<button class="middle ui button" type="reset" id="writeReset" style="width: 15%;">다시작성</button>
    	<div style="width: 5%;">&nbsp;</div>
    	<div class="middle ui button" id="imageboardList" style="width: 15%;"
    	onclick="location.href='/exhibition/customerService/C_eventboardList_playForm.do'">목록</div>
	</div>
  
</div><!--수정영역 텍스트필드-->
</form>
		</div>
		
		<!-- footer -->
		<div class="ui compact menu" style="width: 100%; float: right; ">
			<jsp:include page="../main/I_footer.jsp" ></jsp:include>
		</div>
	</div>

</body>
<script src="http://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script><!-- 시간 -->
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script><!--달력-->
<script>
$(document).ready(function(){
	$('#ModeButton').click(function(){
		$('#playboardModForm').attr('action','/exhibition/customerService/C_playboardMod.do').submit();
	});
});
</script>
</html>