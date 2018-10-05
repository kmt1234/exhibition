<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#subjectA:link {
	color: black;
	text-decoration: none;
}

#subjectA:visited {
	color: black;
	text-decoration: none;
}

#subjectA:hover {
	color: green;
	text-decoration: underline;
	font-weight: bold;
	cursor: pointer;
}

#subjectA:active {
	color: black;
	text-decoration: none;
}

#currentPaging {
	color: red;
	text-decoration: underline;
	cursor: pointer;
}

#paging {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>

</head>
<body>

	<!-- 타이틀 -->
	<div class="ui compact menu" style="width: 930px; height:900px auto;  display: inline-block;" >
		<h2 class="box-container"
			style="float: center; width: 100%; height:126px;  text-align: left;">
			공지 <span class="h-light">사항</span>
			<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
					<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
					> 고객센터 > 공지사항 
			</div>
			<div class="ui divider"></div> 
		</h2>
		<div style="width: 100%;" align="center">
			<table style="width: 880px; height: 40px;" align="center" border="1"
				bordercolor="#ec008c" cellpadding="2" frame="hsides" rules="rows"
				id="C_notice_List" class="ui striped table">
				<tr>
					<th
						style="width: 100px; height: 7%; padding-top: 10px; text-align: center;">번호</th>
					<th
						style="width: 500px; height: 7%; padding-top: 10px; text-align: center;">제목</th>
					<th
						style="width: 100px; height: 7%; padding-top: 10px; text-align: center;">등록일</th>
				</tr>
			</table>
			<br>
			<div id="C_notice_PagingDiv" class="ui center pagination menu"></div>
			<br><br> 
			<input type="hidden" id="subject" value="subject">
			<div class="ui input" style="width: 30%;">
				<input type="text" name="keyword" id="keyword" placeholder="검색어 입력" value="${keyword}">
			</div>
			<input type="button" class="middle ui button" value="검색" id="C_notice_SearchBtn">
			<c:if test="${code=='3' }">
				<input type="button" class="middle ui button" id="C_notice_WriteBtn" value="관리자 작성">
			</c:if>
		</div>
		<input type="hidden" name="pg" id="pg" value="${pg}"> <br>
		<div style="height: 40px;"></div>
	</div>
<script src="../js/C_notice_js.js?ver=1"></script>
</body>
</html>