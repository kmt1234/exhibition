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
	<div>${customerServiceDTO.seq }</div>
	<div>${customerServiceDTO.subject }</div>
	<div><pre>${customerServiceDTO.content }</pre></div>
	
	<%-- <c:if test="${memId==boardDTO.id }"> --%><!-- 본인이 쓴 글이 맞는지 확인 -->
		<input type="button" id="C_notice_modifyBtn" value="글수정">
		<input type="button" id="C_notice_deleteBtn" value="글삭제">
	<%-- </c:if> --%>
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