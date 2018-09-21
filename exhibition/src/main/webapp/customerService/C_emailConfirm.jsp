<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	이메일
	<span class="h-light">인증</span>
</h2>
<table class="ui celled table">
	<tr>
		<td  align="center" height="30" style="background-color: #f7f6e6;text-align: center;">
			이메일
		</td>
		<td>
			<input id="email" type="text" name="email"> 
			<div id="emailDiv"></div>
		</td>
		<td>
			<input type="button" value="인증번호 전송" id="C_emailSendBtn" class="middle ui button"
				style="width:100%; height:100%;  float: left;">
		</td>
		<!-- 반 -->
		<td  align="center" height="30" style="background-color: #f7f6e6;text-align: center;">
			인증번호
		</td>
		<td>
			<input type="text" name="checkEmail" id="checkEmail">
			<div id="checkEmailDiv"></div>
		</td>
		<td>
			<input type="button" value="인증 확인" id="C_emailConfirmBtn" class="middle ui button"
				style="width:100%; height:100%;  float: left;">
			<input type="hidden" id="reC_EmailConfirm" value="">
		</td>
	</tr>
</table>
<c:if test="${code=='3' }">
<div align="left">
	<input class="ui button" type="button" id="C_email_ListBtn" value="관리자 버튼">
</div>
</c:if>
<script src="../js/C_inquire_js.js?ver=1"></script>
</body>
</html>