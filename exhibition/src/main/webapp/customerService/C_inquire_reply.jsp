<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<form name="C_inquire_replyForm" id="C_inquire_replyForm" method="post" action="/exhibition/customerService/C_Inquire.do">
<h1>문의하기</h1>
<div>
	<div>제목<input type="text" name="subject" id="subject"></div>
	<div id="subjectDiv"></div>
	<div class="content">
		<div>내용</div>
		<div><textArea name="content" id="content" cols="50" rows="10"></textArea></div>
		<div id="contentDiv"></div>
	</div>
</div>
<div>
	<span id="C_checkInquire">등록</span>
</div>
</form>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="../js/customerService.js?ver=1"></script>
</body>
</html>