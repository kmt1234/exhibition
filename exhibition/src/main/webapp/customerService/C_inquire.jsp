<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<form name="C_inquire" id="C_inquire" method="post" action="/exhibition/customerService/C_checkInquire.do">
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	문의
	<span class="h-light">하기</span>
</h2>

<table style="width:100%;" class="ui celled table">
<tr>
	<td style="width:8%; height:40px; background-color: #f7f6e6; font-size: 15px;text-align: center;" >분 류</td>
	
	<td style="width:20%;">
		<select name="classify" id="classify" class="classify">
			<option value="전시회 일정 문의">전시회 일정 문의
			<option value="전시회 임대 문의">전시회 임대 문의
			<option value="전시회 참가 문의">전시회 참가 문의
		</select>
	</td>
</tr>
<tr>
	<td style="width:8%; height:40px; background-color: #f7f6e6; font-size: 15px;text-align: center;" >작 성 자</td>
	
	<td style="width:20%;">
		<div>
			<input type="text" name="name" id="name" style="float: left; width:100%; height:40px;">
			<div id="nameDiv"></div>
		</div>
	</td>
</tr>	
<tr>
	<td style="width:8%; height:40px; background-color: #f7f6e6; font-size: 15px;text-align: center;" >연 락 처</td>
	
	<td style="width:20%;">
		<div>
			<input type="text" name="phone" id="phone" style="float: left; width:100%; height:40px;">
			<div id="phoneDiv"></div>
		</div>
	</td>
</tr>	
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
			<div><textArea name="content" id="content" style="float: left; width:100%; height: 300px;"></textArea></div>
			<div id="contentDiv"></div>
		</div>
	</td>
</tr>
</table>
<div>
	<input type="button" id="C_checkInquireBtn" class="middle ui button" value="등록">
</div>
<input type="hidden" name="email" value="${email}">
</form>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="../js/C_inquire_js.js?ver=1"></script>
</body>
</html>