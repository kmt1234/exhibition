<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div style="height: 350px; border: 1px solid;">
	<header>
		<jsp:include page="../main/I_header.jsp"></jsp:include>
	</header>
</div>
<form name="C_Inquire" id="C_InquireForm" method="post" action="/exhibition/customerService/C_checkInquire.do">
<h1>문의하기</h1>
<div>
	<div>분류
		<select name="classify" id="classify">
			<option value="전시회 일정 문의">전시회 일정 문의
			<option value="전시회 임대 문의">전시회 임대 문의
			<option value="전시회 참가 문의">전시회 참가 문의
		</select>
	</div>
	<div>고객명<input type="text" name="name"></div>
	<div>연락처<input type="text" name="tel"></div>
	<div>제목<input type="text" name="subject"></div>
	<div class="content">
		<div>내용</div>
		<div><textArea name="content" cols="50" rows="10"></textArea></div>
	</div>
</div>

<div>
	<span id="C_checkInquire">등록</span>
</div>
<input type="hidden" name="email" value="${email}">
</form>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="../js/customerService.js?ver=1"></script>
</body>
</html>