<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE">
<head>
</head>
<body>
<div class="ui compact menu" style="width: 930px; height:900px auto;  display: inline-block;" >
	<h2 class="box-container" style="float: center; width: 100%; height:126px; text-align: left;">
		공지
		<span class="h-light">사항</span>
		<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
			<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
			> 고객센터 > 공지사항 > 내용보기 
		</div>
		<div class="ui divider"></div> 
	</h2>
	<table class="ui celled table" style="margin-left: 20px; width: 880px">
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
				<div id="content" >
					<pre>${customerServiceDTO.content }</pre>
					<div id="contentDiv"></div>
				</div>
			</td>
		</tr>
	</table>
	<div>
		<div style="float:left; margin-left: 20px; height: 50px;" align="center" >
			<c:if test="${code=='3' }">
				<button class="middle ui button" id="C_notice_modifyBtn" >글수정</button>
				<button class="middle ui button" id="C_notice_deleteBtn" >글삭제</button>
			</c:if>
			<button class="middle ui button" id="C_notice_ListBtn" >목록</button>
			<input type="hidden" id="putSeq" value="${customerServiceDTO.seq}">
			<input type="hidden" id="pg" value="${pg}">
			<input type="hidden" id="keyword" value="${index_keyword}">
		</div>
	</div>
	<div style="height: 80px;"></div>
</div>

<script src="../js/C_notice_js.js?ver=1"></script></body>
</html>