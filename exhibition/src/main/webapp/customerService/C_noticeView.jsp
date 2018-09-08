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
	<table class="ui celled table">
	<!-- <table border="1" cellpadding="8" cellspacing="2"> -->
		<tr>
			<td  align="center" height="30" style="width:10%; background-color: #f7f6e6;text-align: center;">글번호</td>
			
			<td style="width:20%;text-align: center;" >
				<div id="seq">
					${customerServiceDTO.seq }
				</div>
			</td>
			
			<td  align="center" style="width:10%; background-color: #f7f6e6;text-align: center;">글제목</td>
			
			<td style="width:20%;text-align: center;">
				<div id="subject">
					${customerServiceDTO.subject }
					<div id="subjectDiv"></div>
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
	
	
	<div>
		<div style=" padding-top: 50px;" align="center">
			<button id="C_notice_modifyBtn" value="글수정">글수정</button>
			<button id="C_notice_deleteBtn" value="글삭제">글삭제</button>
			<button id="C_noticeListBtn" value="목록가기">목록가기</button>
		</div>
	</div>
	
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	
	$('#C_notice_modifyBtn').click(function(){
		location.href="/exhibition/customerService/C_notice_ModifyForm.do?seq=${customerServiceDTO.seq }";
	});
	
	$('#C_notice_deleteBtn').click(function(){
		location.href="/exhibition/customerService/C_notice_Delete.do?seq=${customerServiceDTO.seq }";
	});
	
	//공지사항 - 공지사항뷰에서 목록보기
	$('#C_noticeListBtn').click(function(){
		location.href="/exhibition/customerService/C_noticeForm.do";
	});

});
</script>
</body>
</html>