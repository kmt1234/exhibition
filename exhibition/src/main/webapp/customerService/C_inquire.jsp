<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<form name="C_Inquire" id="C_InquireForm" method="post" action="/exhibition/customerService/C_checkInquire.do">
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	문의
	<span class="h-light">하기</span>
</h2>
<div>
	<div>분류
		<select name="classify" id="classify">
			<option value="전시회 일정 문의">전시회 일정 문의
			<option value="전시회 임대 문의">전시회 임대 문의
			<option value="전시회 참가 문의">전시회 참가 문의
		</select>
	</div>
	<div>고객명<input type="text" name="name"></div>
	<div id="nameDiv"></div>
	<div>연락처<input type="text" name="phone"></div>
	<div id="phoneDiv"></div>
	<div>제목<input type="text" name="subject"></div>
	<div id="subjectDiv"></div>
	<div class="content">
		<div>내용</div>
		<div><textArea name="content" cols="50" rows="10"></textArea></div>
		<div id="contentDiv"></div>
	</div>
</div>

<div>
	<span id="C_checkInquireBtn">등록</span>
</div>
<input type="hidden" name="email" value="${email}">
</form>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="../js/customerService.js?ver=1"></script>
</body>
</html>