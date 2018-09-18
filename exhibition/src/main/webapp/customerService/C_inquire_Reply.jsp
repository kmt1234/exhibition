<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<form name="C_inquire_Reply" id="C_inquire_Reply" method="post" action="/exhibition/customerService/C_inquire_checkReply.do">
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	고객의
	<span class="h-light">소리</span>
	답변
</h2>
<table style="width:100%;" class="ui celled table">
<tr>
		<td style="width:8%; height:40px; background-color: #f7f6e6; font-size: 15px;text-align: center;" >제 목</td>
		
		<td style="width:20%;">
			<div>
				<input type="text" name="subject" id="subject" style="float: left; width:100%; height:40px;">
				<div id="subjectDiv"></div>
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
<div>
	<input type="button" id="C_checkReplyBtn" class="middle ui button" value="문의 답하기">
	<input type="button" class="middle ui button" id="C_inquire_ListBtn" value="목록">
	<input type="hidden" name="pg" id="pg" value="${pg}">
	<input type="hidden" name="pseq" id="pseq" value="${pseq}">
	<input type="hidden" name="email" id="email" value="${customerServiceDTO.email}">
</div>
</form>
<script src="../js/C_inquire_js.js?ver=1"></script>
<script>
$(document).ready(function(){
	$('#C_inquire_ListBtn').on('click', function(){
		location.href="/exhibition/customerService/C_inquire_List.do?pg="+$('#pg').val();
	});
	
	$('#C_checkReplyBtn').click(function(){
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		if($('#subject').val()=='')
			$('#subjectDiv').text("제목을 입력하세요").css('font-size','9pt').css('color','red')
		else if($('#content').val()=='')
			$('#contentDiv').text("내용을 입력하세요").css('font-size','9pt').css('color','red')
		else
			$('#C_inquire_Reply').submit();
	});
});
</script>
</body>
</html>
