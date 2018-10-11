<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here #f7f6e6</title>
</head>
<body>
<form id="C_inquire_writeReply" method="post" action="/exhibition/customerService/C_inquire_Reply.do">
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	고객의
	<span class="h-light">소리</span>
</h2>
<table class="ui celled table" style="margin-left: 20px; max-width: 880px;">
		<tr height= "80px">
			<td width="150px" style=" height:100px; text-align:center; background-color: #f7f6e6; text-align: center;" >제목</td>
			<td width="400px" style=" center;" >
				<pre style="white-space:pre-wrap; max-width:520px; max-height: 50px; overflow: auto;">${customerServiceDTO.subject }</pre> 
			</td>
			
			<td width="150px" style=" text-align:center; background-color: #f7f6e6">글번호</td>
			<td width="180px" style=" text-align:center"><span>${customerServiceDTO.seq }</span></td>
		</tr>
		<tr height= "80px">
			<td style=" height:100px;  text-align:center; background-color: #f7f6e6">작성자</td>
			<td style=" text-align:center;">
				${customerServiceDTO.name }
			</td>
			<td style="text-align:center; background-color: #f7f6e6">이메일</td>
			<td style="text-align:center"><span>${customerServiceDTO.email }</span></td>
		</tr>
		<tr style="height:400px;" >
			<td style=" text-align:center; background-color: #f7f6e6">내용</td>
			<td colspan="3" >
				<pre style=" white-space:pre-wrap; max-width:800px; height:400px; overflow: auto;">${customerServiceDTO.content }</pre>
			</td>
		</tr>
	</table>
	<input type="hidden" name="seq" id="seq" value="${customerServiceDTO.seq }">
	<input type="hidden" name="email" id="email" value="${customerServiceDTO.email }">
	<c:if test="${customerServiceDTO.reply<'1' || customerServiceDTO.lev=='0'}">
		<c:if test="${customerServiceDTO.name !='관리자'}">
			<input type="button" id="C_inquire_replyBtn" class="middle ui button" value="문의 답하기">
		</c:if>
	</c:if>
	<input type="button" class="middle ui button" id="C_inquire_ListBtn" value="목록">
	<input type="hidden" name="pg" id="pg" value="${pg}">
	<input type="hidden" id="keyword" value="${keyword}">
	<input type="hidden" name="name" value="${customerServiceDTO.name}">
	<input type="hidden" name="pseq" id="pseq" value="${customerServiceDTO.seq }">
	<div style="height: 80px;"></div>
</form>
<script src="../js/C_inquire_js.js?ver=1"></script>
</body>
</html>