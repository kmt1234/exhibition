<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	주요시설
	<span class="h-light">연락처 작성</span>
</h2>
	분류<input type="text" name="classify">
	기관/시설<input type="text" name="facility">
	명칭<input type="text" name="title">
	연락처<input type="text" name="phone">
	담당자<input type="text" name="name">
<div>
	<input type="button" id="C_contactList_checkWriteBtn" value="등록">
</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/customerService.js"></script>
</body>
</html>