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
				메인이미지
				<span class="h-light">수정</span>
			</h2>
<form id="imageboardModForm" method="POST"
	enctype="multipart/form-data">
	<input type="hidden" name="postSelect" id="postSelect" value="0">
	<input type="hidden" name="seq" value="${imageboardDTO.seq}">
			<!-- 내용 입력 -->
 <div style="width: 60%;align:left">
	<br>
	<div class="ui labeled input" style="width: 100%;height: 50px;">
		<div class="ui label">
			제목
		</div>
		<input type="text" name="imageName" id="imageName" value="${imageboardDTO.imageName}">
  	</div>
  	<br><br>
  	<div class="ui inverted input" style="width: 200px; height: 150px;">
  		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<img src="../storage/${imageboardDTO.image1}" name="imaView" id="imaView" width="200px" height="150px">
	 	</div>
	</div>
	<div class="ui inverted input" style="width: 100%;">
			<input type="file" name="img" id="img" style="width:100%;">
  	</div>
	<div id="imgDiv"></div>
	<br>
	
	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<input type="text" name="startDate1" class="datepicker1">
			<input type="hidden" id="startDate1" value="${imageboardDTO.startDate1}">
			<div style="width: 5%;">&nbsp;</div>
			<input type="text" name="endDate2" class="datepicker2">
			<input type="hidden" id="endDate2" value="${imageboardDTO.endDate2}">
		</div>
  	</div>
  	<br><br>
  	<div class="ui labeled input" style="width: 100%;height:50px;">
		<div class="ui label">
			링크
		</div>
		<input type="text" name="eventLink" id="eventLink" value="${imageboardDTO.eventLink}">
  	</div>
  	<br><br>
  	
    <div class="ui two buttons">
    	<div class="middle ui button" id="ModeButton" style="width: 15%;">수정</div>
    	<div style="width: 5%;">&nbsp;</div>
    	<button class="middle ui button" type="reset" id="writeReset" style="width: 15%;">다시작성</button>
    	<div style="width: 5%;">&nbsp;</div>
    	<div class="middle ui button" id="imageboardList" style="width: 15%;"
    	onclick="location.href='/exhibition/customerService/C_mainImageboardListForm.do'">목록</div>
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
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script><!--달력-->
<script>
$(document).ready(function(){
	var startDate1 = $('#startDate1').val().substring(0,4)+"/"+$('#startDate1').val().substring(5,7)+"/"+$('#startDate1').val().substring(8,10);
	var endDate2 = $('#endDate2').val().substring(0,4)+"/"+$('#endDate2').val().substring(5,7)+"/"+$('#endDate2').val().substring(8,10);
	
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
	$('.datepicker1').datepicker('setDate', startDate1);
	$('.datepicker2').datepicker('setDate', endDate2);
	
	$('#ModeButton').click(function(){
		$('#imageboardModForm').attr('action','/exhibition/customerService/C_imageboardMod.do').submit();
	});
});
</script>
</html>