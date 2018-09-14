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
<form id="C_inquire_writeReply" method="post" action="/exhibition/customerService/C_inquire_Reply.do">
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	고객의
	<span class="h-light">소리</span>
</h2>
<table class="ui celled table">
		<tr>
			<td  align="center" height="30" style="width:10%; background-color: #f7f6e6;text-align: center;">글번호</td>
			
			<td style="width:20%;text-align: center;" >
				<div id="seq">
					${customerServiceDTO.seq }
				</div>
			</td>
			<td  align="center" style="width:10%; background-color: #f7f6e6;text-align: center;">작성자</td>
			
			<td style="width:20%;text-align: center;">
				<div id="name">
					${customerServiceDTO.name }
				</div>
			</td>
		</tr>
		<tr>
			<td  align="center" height="30" style="width:10%; background-color: #f7f6e6;text-align: center;">글제목</td>
			
			<td style="width:20%;text-align: center;" >
				<div id="subject">
					${customerServiceDTO.subject }
				</div>
			</td>
			<td  align="center" style="width:10%; background-color: #f7f6e6;text-align: center;">이메일</td>
			
			<td style="width:20%;text-align: center;">
				<div id="email">
					${customerServiceDTO.email }
				</div>
			</td>
		</tr>		
		
		<tr>
			<td width="70" align="center" height="200" style=" background-color: #f7f6e6;text-align: center;">내용</td>
			<td colspan="3">
				<div align="center" id="content" >
					${customerServiceDTO.content }
					<div id="contentDiv"></div>
				</div>
			</td>
		</tr>
	</table>
	<input type="hidden" name="seq" id="seq" value="${customerServiceDTO.seq }">
	<input type="hidden"  id="name" value="${customerServiceDTO.name }">
	<input type="hidden" name="email" id="email" value="${customerServiceDTO.email }">
	<input type="hidden" id="subject" value="${customerServiceDTO.subject }">
	<input type="hidden" id="content" value="${customerServiceDTO.content }">
	<input type="button" id="C_inquire_replyBtn" class="middle ui button" value="문의 답하기">
</form>
<script src="../js/C_inquire_js.js?ver=1"></script>

</body>
</html>