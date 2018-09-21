<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호텔 리스트</title>

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

#currentHotelPaging{
	color: red;
	text-decoration: underline;
	cursor: pointer;
}

#hotelpaging{
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.eventUploadBtn{
	margin-right: 8%;
}
.selectAtag:active{ cursor:pointer;color:red; }
.selectAtag:hover { cursor:pointer;color: red; }

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
				호텔
				<span class="h-light">수정</span>
			</h2>
			<br>
			<br>
<form name="hotelboardModForm" id="hotelboardModForm" method="POST"
	enctype="multipart/form-data">
			<!--상세보기  -->
			<div align="left">
			<input type="hidden" name="seq" id="seq_H" value="${hotelboardDTO.seq}">
			<input type="hidden" name="image1" id="image1_H" value="${hotelboardDTO.image1}">
			<input type="hidden" name="imageName" id="imageName_H" value="${hotelboardDTO.imageName}">
			<input type="hidden" name="eventLink" id="eventLink_H" value="${hotelboardDTO.eventLink}">
			<input type="hidden" name="eventPlace" id="eventPlace_H" value="${hotelboardDTO.eventPlace}">
				<table border="1" cellpadding="10">
					<tr>
						<th width="100">번호</th>
						<th width="150">이미지</th>
						<th width="100">호텔명</th>
						<th width="150">호텔링크</th>
						<th width="150">전화번호</th>
					</tr>
					<tr>
						<td align="center">${hotelboardDTO.seq}</td>
						<td align="center"><span><img src="../storage/${hotelboardDTO.image1}" name="selectimage" id="selectImageFile" width="200" height="150"></span></td>
						<td align="center"><a class="selectAtag" id="selectImageName">${hotelboardDTO.imageName}</a></td>
						<td align="center"><a class="selectAtag" id="selectEventLink">${hotelboardDTO.eventLink}</a><div id="hotelDiv"></div></td>
						<td align="center"><a class="selectAtag" id="selectEventPlace">${hotelboardDTO.eventPlace}</a><div id="telDiv"></div></td>
					</tr>
					<tr id="imageHotel">
						<td align="center">이미지</td>
						<td colspan="4"><input type="file" name="img" id="img" style="width:100%;height:100%"></td>
					</tr>
					<tr id="inputHotel">
						<td align="center"><div id="selectHotel"></div></td>
						<td colspan="3"><input type="text" id="inputTextHotel" style="width:99%;"></td>
						<td align="center"><input type="button" id="inputHotelBtn" style="width:100%;height:100%" value="확인"></td>
					</tr>
					<tr id="completeTR">
						<td colspan="5" align="center"><input type="button" id="completeHotelBtn" value="수정완료"></td>
					</tr>
				</table>
			</div>
</form>
		</div>
		
		<!-- footer -->
		<div class="ui compact menu" style="width: 100%; float: right; ">
			<jsp:include page="../main/I_footer.jsp" ></jsp:include>
		</div>
	</div>

</body>
<script>
$(document).ready(function(){
	$('#inputHotel').hide();
	$('#imageHotel').hide();
	
	//확인 클릭시 텍스트 박스내용으로 변경
	$('#inputHotelBtn').click(function(){
		if($('#selectHotel').text()=='호텔명'){
			$('#selectImageName').text($('#inputTextHotel').val());
			$('#imageName_H').val($('#inputTextHotel').val());
		}else if($('#selectHotel').text()=='호텔링크'){
			$('#selectEventLink').text($('#inputTextHotel').val());
			$('#eventLink_H').val($('#inputTextHotel').val());
		}else if($('#selectHotel').text()=='전화번호'){
			$('#selectEventPlace').text($('#inputTextHotel').val());
			$('#eventPlace_H').val($('#inputTextHotel').val());
		}
		$('#inputHotel').hide();
		$('#completeTR').show();
	});
	
	//수정할 내용들의 제목 가져가기
	$('#selectImageName').click(function(){
		$('#inputHotel').show();
		$('#completeTR').hide();
		$('#selectHotel').text('호텔명');
		$('#inputTextHotel').val($('#selectImageName').text());
	});
	$('#selectEventLink').click(function(){
		$('#inputHotel').show();
		$('#completeTR').hide();
		$('#selectHotel').text('호텔링크');
		$('#inputTextHotel').val($('#selectEventLink').text());
	});
	$('#selectEventPlace').click(function(){
		$('#inputHotel').show();
		$('#completeTR').hide();
		$('#selectHotel').text('전화번호');
		$('#inputTextHotel').val($('#selectEventPlace').text());
	});
	$('#selectImageFile').click(function(){
		$('#inputHotel').hide();
		$('#completeTR').show();
		$('#imageHotel').show();
	});
	
	//수정완료 클릭시
	$('#completeHotelBtn').click(function(){
		var reg = /^https?\:\/\/.+/;
		var tel = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})|(02|0[3-9]+[0-9])(\d{3,4})(\d{4})$/;
		if($('#selectEventPlace').text()=='')
			$('#telDiv').text('전화번호를 입력하세요').css('color','red').css('font-size','9pt').css('font-weight','bold');
		else if(!tel.test($('#selectEventPlace').text())){
			$('#telDiv').text('전화번호 양식에 맞지 않습니다').css('color','red').css('font-size','9pt').css('font-weight','bold');
		}else if($('#selectEventLink').text()=='')
			$('#hotelDiv').text('호텔 링크를 입력하세요').css('color','red').css('font-size','9pt').css('font-weight','bold');
		else if(!reg.test($('#selectEventLink').text())){
			$('#hotelDiv').text('호텔 링크 앞에는 http://가 입력되어야 합니다').css('color','red').css('font-size','9pt').css('font-weight','bold');
		}else 
			$('#hotelboardModForm').attr('action','/exhibition/customerService/C_hotelboardMod.do').submit();
	});
	
	
});
</script>
</html>