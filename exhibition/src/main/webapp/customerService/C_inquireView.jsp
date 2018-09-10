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
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	고객의
	<span class="h-light">소리</span>
</h2>
<form id="C_inquire_ViewForm" method="post" action="/exhibition/customerService/C_inquire_View.do">
	<div>${customerServiceDTO.seq }</div>
	<div>${customerServiceDTO.name }</div>
	<div>${customerServiceDTO.email }</div>
	<div>${customerServiceDTO.subject }</div>
	<div><pre>${customerServiceDTO.content }</pre></div>
	
	<%-- <c:if test="${memId==boardDTO.id }"> --%><!-- 본인이 쓴 글이 맞는지 확인 -->
		<input type="button" id="C_inquire_replyBtn" value="문의 답하기">
	<%-- </c:if> --%>
</form>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	$('#C_inquire_replyBtn').click(function(){
		location.href="/exhibition/customerService/C_inquire_replyForm.do?email=${customerServiceDTO.email }";
	});
});
</script>
</body>
</html>