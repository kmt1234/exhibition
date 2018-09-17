<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	공지
	<span class="h-light">사항</span>
</h2>
<form id="C_notice_Write" method="post" action="/exhibition/customerService/C_notice_Write.do">
<table style="width:100%;" class="ui celled table">
	<tr>
		<td style="width:8%; height:40px; background-color: #f7f6e6; font-size: 15px;text-align: center;" >제 목</td>
		
		<td style="width:20%;">
			<div>
				<input type="text" name="subject" id="subject" style="float: left; width:100%; height:40px;">
				<div id="subjectDiv"></div>
			</div>
		</td>
	</tr>	
	<input type="hidden" name="pg" value="${pg}">
	<tr>
		<td  align="center" style="width:8%; background-color: #f7f6e6; font-size: 15px;text-align: center;">내 용</td>
		
		<td style="width:20%; height: 15%">
			<div>
				<div><textArea name="content" id="content" style="float: left; width:100%; height: 300px;"></textArea></div>
				<div id="contentDiv"></div>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="padding-top: 30px"> 		
			<input type="button" id="C_notice_checkWriteBtn" class="middle ui button" value="등록">
			<input type="reset"  class="middle ui button" value="다시작성">
			<input type="button" id="C_notice_WriteBack" class="middle ui button" value="목록">
		</td>
	</tr>
</table>
</form>

<script>
$(document).ready(function(){
	$('#C_notice_WriteBack').on('click', function(){
		alert('dsfdsf');
		location.href="/exhibition/customerService/C_notice.do?pg=${pg}";
	});
});
</script>
<script src="../js/C_notice_js.js?ver=1"></script>
</body>
</html>