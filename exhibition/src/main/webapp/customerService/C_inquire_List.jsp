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
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	문의
	<span class="h-light">하기</span>
</h2>

<div style="width: 100%;" align="center">
	<table style="width: 100%; height: 40px; " align="center" border="1" bordercolor="#ec008c" cellpadding="4" frame="hsides" rules="rows"
	id="C_inquire_List" class="ui striped table" >
		<tr>
			<th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">번호</th>
			<th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">제목</th>
			<th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">작성자</th>
			<th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">이메일</th>
			<th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">등록일</th>
		</tr>
	</table>
	<br><br>
	<div id="C_inquire_PagingDiv"></div>
	<div style="width: 100%;">
		<select name="searchOption" id="searchOption" style="width:150px;" class="ui compact selection dropdown">
			<option value="subject" selected>제목</option>
			<option value="id">아이디</option>
		</select>
		
	<div class="ui input" style="width: 50%;">
		<input type="text" >
	</div>
		 <input type="button" class="middle ui button"  value="검색" id="C_inquireSearch">
	</div>
</div>
<script src="../semantic/semantic.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/C_inquire_js.js?ver=1"></script>

</body>
</html>