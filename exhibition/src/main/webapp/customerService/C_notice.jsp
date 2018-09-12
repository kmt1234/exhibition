<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#subjectA:link{color:black; text-decoration: none;}
#subjectA:visited{color:black; text-decoration: none;}
#subjectA:hover{color:green; text-decoration: underline; font-weight: bold; cursor: pointer;}
#subjectA:active{color:black; text-decoration: none;}
</style>

</head>
<body>

<!-- 타이틀 -->
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	공지
	<span class="h-light">사항</span>
</h2>

<div style="width: 100%;" align="center">
	<table style="width: 100%; height: 40px; " align="center" border="1" bordercolor="#ec008c" cellpadding="2" frame="hsides" rules="rows"
	id="C_notice_List" class="ui striped table" >
		<tr>
			<th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">번호</th>
			<th style="width: 45%; height: 7%; padding-top: 10px; text-align: center;">제목</th>
			<th style="width: 35%; height: 7%; padding-top: 10px; text-align: center;">등록일</th>
		</tr>
	</table>
	<br><br>
	<div id="C_contactList_PagingDiv"></div>
	<input type="hidden" name="pg" id="pg" value="1">
	<select class="ui compact selection dropdown" id="searchOption">
			<option value="subejct">제목</option>
			<option value="content">내용</option>
	</select>

	<div class="ui input" style="width: 40%;">
		<input type="text" name="keyword" id="keyword" value="${keyword }">
	</div>
		<input type="button" class="middle ui button"  value="검색" id="C_notice_Search">
		<input type="button" class="middle ui button" id="C_notice_WriteBtn" value="관리자 작성" >
</div>
<script src="../semantic/semantic.min.js"></script>
<script src="../js/C_notice_js.js?ver=1"></script>
</body>
</html>