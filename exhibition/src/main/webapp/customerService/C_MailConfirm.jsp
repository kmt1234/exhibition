<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<div style="height: 350px; border: 1px solid;">
	<header>
		<jsp:include page="../main/I_header.jsp"></jsp:include>
	</header>
</div>
<body>
<h1>이메일 인증</h1>
	<div>
		<input id="email" type="text" name="email"> 
		<input type="button" value="인증번호 전송" id="checkCustomerServiceEmailSend">
	</div>
	<div>
		<input type="text" name="checkMail" id="checkEmail">
		<input type="button" value="인증 확인" id="checkCustomerServiceEmailConfirm">
		<input type="hidden" id="reC_EmailConfirm" value="">
		<div id="checkEmailDiv"></div>
	</div>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="../js/customerService.js?ver=1"></script>
</body>
</html>