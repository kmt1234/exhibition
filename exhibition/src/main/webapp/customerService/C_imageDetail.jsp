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
		<span>메인화면</span>
		<span class="h-light">수정</span>
		<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
			<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
			> 고객센터 > 게시판추가 > 목록 > 수정
		</div>
		<div class="ui divider"></div> 
	</h2>
	<form id="imageboardModForm" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="postSelect" id="postSelect" value="0">
		<input type="hidden" name="seq" value="${imageboardDTO.seq}">
		<!-- 내용 입력 -->
		<div style="width: 520px; margin-left: 20px;" >
			<!-- 제목 -->
			<div class="ui labeled input " >
				<div class="ui label " style="width: 100px; text-align: center;">
					<span>제목</span>
				</div>
				<div class="ui inverted input" style="width: 100%;">
					<div class="ui left icon input focus" style="width: 420px; height: 50px;">
						<input type="text" name="imageName" id="imageName" value="${imageboardDTO.imageName}">
						<i class="user icon"></i>
					</div>
				</div>
			</div>
			<!-- 업로드 -->
		  	<div class="ui labeled input " style="margin-top: 20px;" >
				<div class="ui label " style="width: 100px; text-align: center;">
					<span>파일선택</span>
				</div>
				<div class="ui inverted input" style="width: 420px; height: 50px;">
					<div class="ui left icon input  focus" style="width: 100%; height: 50px;">	
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
			<div class="ui inverted input" >
					<div class="ui left icon input focus" style="width:100%; height: 50px;">
						<input type="text" name="startDate1" class="datepicker1">
						<input type="hidden" id="startDate1" value="${imageboardDTO.startDate1}" style="width:195px;">
						<div style="width: 10px;">&nbsp;</div>
						<input type="text" name="endDate2" class="datepicker2">
						<input type="hidden" id="endDate2" value="${imageboardDTO.endDate2}" style="width:195px;">
					</div>
				</div>
		  	</div>
		  	<div class="ui labeled input " style="margin-top: 20px;" >
				<div class="ui label " style="width: 100px; text-align: center;">
					<span>홈페이지</span>
				</div>
				<div class="ui inverted input" style="width: 100%;">
					<div class="ui left icon input  focus" style="width: 420px;  height: 50px;">
						<input type="text" name="eventLink" id="eventLink" value="${imageboardDTO.eventLink}">
						<i class="user icon"></i>
					</div>
				</div>
		  	</div>
		  	
		    <div class="ui two buttons" style="margin-top: 20px;">
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
	
</body>
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
	
	//수정 버튼
	$('#ModeButton').click(function(){
		
		$('#imageboardModForm').attr('action','/exhibition/customerService/C_imageboardMod.do').submit();
	});
});
</script>
</html>