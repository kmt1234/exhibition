<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="C_QnA_WriteForm" method="post" action="/exhibition/customerService/C_QnA_Write.do">
	<div>제목<input type="text" name="subject" id="subject"></div>
	<div id="subjectDiv"></div>
	<div class="content">
		<div>내용</div>
		<div><textArea name="content" id="content" cols="50" rows="10"></textArea></div>
		<div id="contentDiv"></div>
	</div>
</form>
<div>
	<input type="button" id="C_QnA_checkWrite" value="등록">
</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/customerService.js"></script>

</body>
</html>