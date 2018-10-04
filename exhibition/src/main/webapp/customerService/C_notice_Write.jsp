<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.noresize {
  resize: none; /* 사용자 임의 변경 불가 */
}
</style>
</head>
<body>
<div class="ui compact menu" style="width: 930px; height:900px auto;  display: inline-block;" >
	<h2 class="box-container" style="float: center; width: 100%; height:126px; text-align: left;">
			공지<span class="h-light">사항</span>
		<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
			<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
			> 고객센터 > 공지사항 > 공지사항 작성 
		</div>
		<div class="ui divider"></div> 
	</h2>
	<table style="width:880px; margin-left: 20px;" class="ui celled table">
		<tr>
			<td style="width:8%; height:40px; background-color: #f7f6e6; font-size: 15px;text-align: center;" >제 목</td>
			
			<td style="width:20%;">
				<div>
					<input type="text" name="subject" id="subject" style="float: left; width:100%; height:40px;">
					<div id="subjectDiv"></div>
					<input type="hidden" name="pg" value="${pg}">
				</div>
			</td>
		</tr>	
		<tr>
			<td  align="center" style="width:8%; background-color: #f7f6e6; font-size: 15px;text-align: center;">내 용</td>
			
			<td style="width:20%; height: 15%">
				<div>
					<div><textArea name="content" id="content" class=noresize style="float: left; width:100%; height: 300px;"></textArea></div>
					<div id="contentDiv"></div>
				</div>
			</td>
		</tr>
	</table>
	<div style="float: left; margin-left: 20px;">
		<input type="button" id="C_notice_checkWriteBtn" class="middle ui button" value="등록">
		<input type="reset"  class="middle ui button" value="다시작성">
		<button class="middle ui button" id="C_notice_WriteBack" >목록</button>
		<input type="hidden" name="pg" id="pg" value="${pg}">
	</div>
<div style="height: 80px;"></div>
</div>

<script src="../js/C_notice_js.js?ver=1"></script>
</body>
</html>