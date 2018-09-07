<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="C_notice_ViewForm" method="post" action="/exhibition/customerService/C_notice_View.do">
	<table style="width:100%;" >
		<tr>
			<td  align="center" height="30" style="width:10%; background-color: #f7f6e6; ">글번호</td>
			
			<td style="width:20%;">
				<div>
					${customerServiceDTO.seq }
				</div>
			</td>
			
			<td  align="center" style="width:10%; background-color: #f7f6e6;">글제목</td>
			
			<td style="width:20%;">
				<div>
					${customerServiceDTO.subject }
				</div>
			</td>
		</tr>	
		
		<tr>
			<td width="70" align="center" height="200" style=" background-color: #f7f6e6;">내용</td>
			<td>
				<div align="center">
					${customerServiceDTO.content }
				</div>
			</td>
		</tr>
		
	</table>
	
	
	<div>
		<div style=" padding-top: 50px;" align="center">
			<button id="C_notice_modifyBtn" value="글수정">글수정</button>
			<button type="button" id="C_notice_deleteBtn" value="글삭제">글삭제</button>
		</div>
	</div>
	
	
</form>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
$('#C_notice_modifyBtn').click(function(){
		location.href="/exhibition/customerService/C_notice_ModifyForm.do?seq=${customerServiceDTO.seq }";
});
$('#C_notice_deleteBtn').click(function(){
	location.href="/exhibition/customerService/C_notice_Delete.do?seq=${customerServiceDTO.seq }";
});
});
</script>
</body>
</html>