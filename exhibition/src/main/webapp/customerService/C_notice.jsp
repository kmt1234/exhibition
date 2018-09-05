<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="height: 350px; border: 1px solid;">
	<header>
		<jsp:include page="../main/I_header.jsp"></jsp:include>
	</header>
</div>
<div style="margin: 0px 800px 0px 800px;">분류
		<select name="classify" id="classify">
			<option value="전체">전체
			<option value="공모전공고">공모전공고
			<option value="등록공고">등록공고
			<option value="공지">공지
		</select>
	</div>
<div class="notice top">
	<span id="" style="padding:20px">번호</span>
	<span id="" style="padding:300px">제목</span>
	<span id="" style="padding:20px">첨부파일</span>
	<span id="" style="padding:20px">등록일</span>
</div>
<div>
	
</div>
<div>
	<input type="text" width="100">
	<input type="button" value="검색" id="C_noticeSearch">
</div>
</body>
</html>