<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<form>
<table class="ui celled table">
	<tr>
		<td  align="center" height="30" style="background-color: #f7f6e6;text-align: center;">
			글번호
		</td>
		<td>
			<input id="email" type="text" name="email"> 
		</td>
		<td>
			<input type="button" value="인증번호 전송" id="checkCustomerServiceEmailSend"
				style="width:100%; height:100%; background-color:#ffffff; float: left;">
		</td>
		<!-- 반 -->
		<td  align="center" height="30" style="background-color: #f7f6e6;text-align: center;">
			인증번호
		</td>
		<td>
			<input type="text" name="checkEmail" id="checkEmail">
		</td>
		<td>
			<input type="button" value="인증 확인" id="checkCustomerServiceEmailConfirm"
				style="width:100%; height:100%; background-color:#ffffff; float: left;">
			<input type="hidden" id="reC_EmailConfirm" value="">
			<div id="checkEmailDiv"></div>
		</td>
		
	</tr>
	
</table>
<!-- 관리자모드가 아니면 없애야함 -->
	<div style="width: 20%;float: left;">
		<input type="button" value="관리자 버튼" id="C_email_ListBtn"
		 style="width:100%; height:100%; background-color:#ffffff; float: left;">
	</div>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="../js/customerService.js?ver=1"></script>
</form>	
</body>
</html>