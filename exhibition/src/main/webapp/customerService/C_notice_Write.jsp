<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="C_notice_WriteForm" method="post" action="/exhibition/customerService/C_notice_Write.do">
<table style="width:100%;" >
		<tr>
			<td  align="center" height="30" style="width:10%; background-color: #f7f6e6; ">제목</td>
			
			<td style="width:20%;">
				<div>
					<input type="text" name="subject" id="subject" style="float: left;">
					<div id="subjectDiv"></div>
				</div>
			</td>
		</tr>	
		<tr>
			<td  align="center" style="width:10%; background-color: #f7f6e6;">내용</td>
			
			<td style="width:20%;">
				<div>
					<div><textArea name="content" id="content" cols="50" rows="10" style="float: left;"></textArea></div>
					<div id="contentDiv"></div>
				</div>
			</td>
		</tr>
	</table>
</form>
<div>
	<input type="button" id="C_notice_checkWrite" value="등록">
</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/customerService.js"></script>

</body>
</html>