<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	자주묻는
	<span class="h-light">질문</span>
</h2>
<div >
	<input type="button" value="위치/교통" id="C_QnA_location" class="ui secondary basic button"
	style="width:13%; height:35; background-color:#ffffff;
	 border:1 solid #f702e7;" class="QnA">
	
	<input type="button" value="주차" id="C_QnA_parking" class="ui secondary basic button"
	style="width:13%; height:35; font-family:돋움; background-color:#ffffff;
	 border:1 solid #f702e7; " class="QnA">
	 
	 <input type="button" value="전시&공연" id="C_QnA_exhibition" class="ui secondary basic button"
	style="width:13%; height:35; font-family:돋움; background-color:#ffffff;
	 border:1 solid #f702e7; " class="QnA">
	 
	 <input type="button" value="임대" id="C_QnA_rent" class="ui secondary basic button"
	style="width:13%; height:35; font-family:돋움; background-color:#ffffff;
	 border:1 solid #f702e7; " class="QnA">
	 
	 <input type="button" value="시설" id="C_QnA_facility" class="ui secondary basic button"
	style="width:13%; height:35; font-family:돋움; background-color:#ffffff;
	 border:1 solid #f702e7; " class="QnA">
	 
	 <input type="button" value="기타" id="C_QnA_etc" class="ui secondary basic button"
	style="width:13%; height:35; font-family:돋움; background-color:#ffffff;
	 border:1 solid #f702e7; " class="QnA">
</div>
<div style="padding-top: 15px;">
	<table style="width: 100%; height: 40px; " border="1" bordercolor="#ec008c" cellpadding="2" frame="hsides" rules="rows">
		<tr>
			<th style=" height: 7%; " id="subjectA">제목</th>
		</tr>
	</table>
</div>
<table id="C_QnA_List" class="ui styled fluid accordion"></table>
<div align="left">
	<input class="middle ui button" type="button" value="작성" id="C_QnA_writeBtn">
</div>
<script src="../semantic/semantic.min.js"></script>
<script src="../js/C_QnA_js.js?ver=1"></script>

</body>
</html>