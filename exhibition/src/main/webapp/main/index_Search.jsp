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

.contentC {
	display : block;
	width : 200px; 
	overflow: hidden;  
	white-space: nowrap;  
	text-overflow  : ellipsis;
}

</style>

</head>
<body>

	<!-- 타이틀 -->
	<div class="ui compact menu" style="width: 930px; height:900px auto;  display: inline-block;" >
		<h2 class="box-container"
			style="float: center; width: 100%; height:126px;  text-align: left;">
			통합 <span class="h-light">검색</span>
			<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
					<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
					> 통합 검색
			</div>
			<div class="ui divider"></div> 
		</h2>
		<div><span align="left">공지 사항</span></div>
		<div style="width: 100%;" align="center"><a align="right">더보기</a>
			<table style="width: 880px; height: 40px;" align="center" border="1"
				bordercolor="#ec008c" cellpadding="2" frame="hsides" rules="rows"
				id="index_NoticeSearch" class="ui striped table">
			</table>
			<br>
			<!-- <div id="index_PagingDiv" class="ui center pagination menu"></div> -->
			<br><br> 
		</div>
		<div style="width: 100%;" align="center">자주 묻는 질문
			<table style="width: 880px; height: 40px;" align="center" border="1"
				bordercolor="#ec008c" cellpadding="2" frame="hsides" rules="rows"
				id="index_QnASearch" class="ui striped table">
			</table>
			<br>
			<!-- <div id="index_PagingDiv" class="ui center pagination menu"></div> -->
			<br><br> 
		</div>
		<div style="width: 100%;" align="center">주요 시설 연락처
			<table style="width: 880px; height: 40px;" align="center" border="1"
				bordercolor="#ec008c" cellpadding="2" frame="hsides" rules="rows"
				id="index_contactListSearch" class="ui striped table">
			</table>
			<br>
			<!-- <div id="index_PagingDiv" class="ui center pagination menu"></div> -->
			<br><br>
		</div>
		<div style="width: 100%;" align="center">
			<table style="width: 880px; height: 40px;" align="center" border="1"
				bordercolor="#ec008c" cellpadding="2" frame="hsides" rules="rows"
				id="index_Search" class="ui striped table">
			</table>
			<br>
			<!-- <div id="index_PagingDiv" class="ui center pagination menu"></div> -->
			<br><br> 
		</div>
		<input type="hidden" name="index_keyword" id="index_keyword" value="index_keyword">
		<input type="hidden" name="pg" id="pg" value="1"> <br>
		<div style="height: 40px;"></div>
	</div>
<script src="../semantic/semantic.min.js"></script>
</body>
</html>