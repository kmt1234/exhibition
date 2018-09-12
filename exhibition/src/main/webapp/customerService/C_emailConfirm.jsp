<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			글번호
		</td>
		<td>
			<input id="email" type="text" name="email"> 
			<div id="emailDiv"></div>
		</td>
		<td>
			<input type="button" value="인증번호 전송" id="C_emailSendBtn"
				style="width:100%; height:100%; background-color:#ffffff; float: left;">
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
			<input type="button" value="인증 확인" id="C_emailConfirmBtn"
				style="width:100%; height:100%; background-color:#ffffff; float: left;">
			<input type="hidden" id="reC_EmailConfirm" value="">
		</td>
		
	</tr>
	
</table>
<!-- 관리자모드가 아니면 없애야함 -->
	<div align="left">
		<input class="middle ui button" type="button" id="C_email_ListBtn" value="관리자 버튼" style="">
	</div>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="../js/C_inquire_js.js?ver=1"></script>
	
</body>
</html>