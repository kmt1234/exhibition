<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<h1>공지사항</h1>
</head>
<body>
<form name="boardWriteForm" id="boardWriteForm" method="post" 
action="/exhibition/board/boardWriteForm.do">

<div class="notice">
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>첨부</td>
		<td>파일</td>
		<td>등록일</td>
	</tr>
</div>

<div>
	<select name="searchSelect" style="width:120px">
		<option value="제목">제목
		<option value="내용">내용
	</select>
	<input type="text" name="search">
	<input type="submit" value="검색">
</div>
</form>
</body>
</html>

