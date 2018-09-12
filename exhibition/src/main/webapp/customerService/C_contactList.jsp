<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
</style>
</head>
<body>
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	주요시설
	<span class="h-light">연락처</span>
</h2>
<div style="width: 100%;" align="center">
	<table style="width: 100%; height: 40px; " align="center" border="1" bordercolor="#ec008c" cellpadding="4" frame="hsides" rules="rows"
		id="C_contactList_List" class="ui striped table" >
			<tr>
				<th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">분류</th>
				<th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">기관 & 시설</th>
				<th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">명칭</th>
				<th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">담당자</th>
				<th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">연락처</th>
			</tr>
	</table>
	<br><br>
	<div id="C_contactList_PagingDiv"></div>
	<input type="hidden" name="pg" id="pg" value="1">
	<select class="ui compact selection dropdown" id="searchOption">
			<option value="facility">기관&시설</option>
			<option value="name">담당자</option>
	</select>

	<div class="ui input" style="width: 40%;">
		<input type="text" name="keyword" id="keyword" value="${keyword }">
	</div>
		<input type="button" class="middle ui button"  value="검색" id="C_contactList_Search">
		<input type="button" class="middle ui button" id="C_contactList_WriteBtn" value="관리자 작성" >
</div>
<script src="../semantic/semantic.min.js"></script>
<script src="../js/C_contactList_js.js?ver=1"></script>

</body>
</html>