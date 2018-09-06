<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div>
		이메일
		<input id="email" type="text" name="email"> 
		<input type="button" value="인증번호 전송" id="checkCustomerServiceEmailSend">
	</div>
	<div>
		인증번호
		<input type="text" name="checkEmail" id="checkEmail">
		<input type="button" value="인증 확인" id="checkCustomerServiceEmailConfirm">
		<input type="hidden" id="reC_EmailConfirm" value="">
		<div id="checkEmailDiv"></div>
	</div>
	<!-- 관리자모드가 아니면 없애야함 -->
	<div><input type="button" id="C_email_ListBtn" value="관리자 버튼"></div>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="../js/customerService.js?ver=1"></script>
</body>
</html>