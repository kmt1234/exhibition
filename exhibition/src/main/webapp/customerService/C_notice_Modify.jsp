<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div class="ui compact menu" style="width: 930px; height:900px auto;  display: inline-block;" >
	<h2 class="box-container" style="float: center; width: 100%; height:126px; text-align: left;">
		공지<span class="h-light">사항</span>
		<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
						<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
						> 고객센터 > 공지사항 > 공지사항 수정
		</div>
		<div class="ui divider"></div> 
	</h2>
	<table style="width:880px; margin-left: 20px;" class="ui celled table">
		<tr>
			<td height="30" style="width:10%; background-color: #f7f6e6; text-align: center;">글제목</td>
			
			<td style="width:5px; text-align: left;">
				<div class="ui input">
					<input type="text" name="subject" id="subject" value="${customerServiceDTO.subject }">
					<div id="subjectDiv"></div>
				</div>	
			</td>
			
			<td  align="center" style="width:10%; background-color: #f7f6e6;text-align: center;">글번호</td>
			
			<td style="width:20%;text-align: center;">
				<div>
					${customerServiceDTO.seq }
					<input type="hidden" name="seq" id="seq" value="${customerServiceDTO.seq }">
					
				</div>
			</td>
		</tr>	
		
		<tr>
			<td width="70" align="center" height="200" style=" background-color: #f7f6e6;">내용</td>
			<td colspan="3">
				<div class="ui form" >
					<div align="center" class="field">
						<textArea name="content" id="content" style="width: 100%" >${customerServiceDTO.content }</textArea>
						<div id="contentDiv"></div>
					</div>
				</div>
			</td>
		</tr>
	</table>
	<div style="float: left; margin-left: 20px;">
		<input class="middle ui button" type="button" id="C_notice_checkModifyBtn" value="수정">
		<input class="middle ui button" type="reset" value="취소">
	</div>
	<div style="height: 80px;"></div>
</div>
<script src="../js/C_notice_js.js?ver=1"></script></body>
</html>