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
				<span class="h-light">리스트</span>
			</h2>
			<br>
			<br>
			
			<!--상세보기  -->
			<div align="left">
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
						<td align="center"><img src="../storage/${hotelboardDTO.image1}" width="200" height="150"></td>
						<td align="center"><span id="selectImageName">${hotelboardDTO.imageName}</span></td>
						<td align="center"><span id="selectEventLink">${hotelboardDTO.eventLink}</span></td>
						<td align="center"><span id="selectEventPlace">${hotelboardDTO.eventPlace}</span></td>
					</tr>
					<tr id="inputHotel">
						<td><div id="selectHotel"></div></td>
						<td><input type="text" id="inputTextHotel"></td>
					</tr>
					<tr>
						<td><input type="button" id="inputHotelBtn" value="수정버튼"></td>
					</tr>
				</table>
			</div>
			
			
			
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
	
	$('#inputHotelBtn').click(function(){
		if($('#selectHotel').text()=='호텔명'){
			$('#selectImageName').text($('#inputTextHotel').val());
		}else if($('#selectHotel').text()=='호텔링크'){
			$('#selectEventLink').text($('#inputTextHotel').val());
		}else if($('#selectHotel').text()=='전화번호'){
			$('#selectEventPlace').text($('#inputTextHotel').val());
		}
		$('#inputHotel').hide();
	});
	
	$('#selectImageName').click(function(){
		$('#inputHotel').show();
		$('#selectHotel').text('호텔명');
		$('#inputTextHotel').val($('#selectImageName').text());
	});
	$('#selectEventLink').click(function(){
		$('#inputHotel').show();
		$('#selectHotel').text('호텔링크');
		$('#inputTextHotel').val($('#selectEventLink').text());
	});
	$('#selectEventPlace').click(function(){
		$('#inputHotel').show();
		$('#selectHotel').text('전화번호');
		$('#inputTextHotel').val($('#selectEventPlace').text());
	});
});
</script>
</html>