<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE">
<head>
</head>
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	공지
	<span class="h-light">사항</span>
</h2>
<body>
	<table class="ui celled table">
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
			<button id="C_notice_modifyBtn" >글수정</button>
			<button id="C_notice_deleteBtn" >글삭제</button>
			<button id="C_noticeListBtn" >목록가기</button>
			<input type="hidden" id="putSeq" value="${customerServiceDTO.seq}">
		</div>
	</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/customerService.js?ver=1"></script>
</body>
</html>