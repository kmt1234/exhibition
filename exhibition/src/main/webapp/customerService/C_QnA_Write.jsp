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
<table style="width:100%;" >
	<tr>
		<td  align="center" style="width:8%; height:40px; background-color: #f7f6e6; font-size: 15px" >제 목</td>
		
		<td style="width:20%;">
			<div>
				<input type="text" name="subject" id="subject" style="float: left; width:98%; height:40px;">
				<div id="subjectDiv"></div>
			</div>
		</td>
	</tr>	
	<tr>
		<td  align="center" style="width:8%; background-color: #f7f6e6; font-size: 15px;">내 용</td>
		
		<td style="width:20%; height: 15%">
			<div>
				<div><textArea name="content" id="content" style="float: left; width:98%; height: 300px;"></textArea></div>
				<div id="contentDiv"></div>
			</div>
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center" style="padding-top: 30px"> 		
			<input type="button" id="C_QnA_checkWrite"  value="등록">
			<input type="reset" value="다시작성">
		</td>
	</tr>
		
</table>
	
</form>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/customerService.js"></script>

</body>
</html>