<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.box-container{
	display: inline-block;
	padding-bottom: 40px;
	padding-left: 20px;
	padding-right: 20px;
	padding-top: 20px;
	font-weight:normal;
	font-size: 50px;
}
.h-light{
	color: #ec008c;
}
#slidbar{
position:absolute;
top : 0px; 
left: 0px;
}
#houseImg{
	margin:-3px;
}
</style>
</head>
<body>
	<header>
	<div style="margin-top: 20px; min-width:1170px; position: relative;   ">
		<jsp:include page="../main/I_header.jsp"></jsp:include>
	</div>
	</header>
	<div style="margin-top: 5px; min-width:1170px; position: relative;   " class="ui container" >
		<!-- 사이드바 메뉴 -->
		<div style="width:230px; height:900px auto; display: inline-block;">
			<div class="ui compact menu" id="slidbar" style="display: inline-block;">
			<a class="item" style="border: none; width: 227px;" >통합 검색</a> 
		</div>
		</div>
		<!-- 메인 화면 -->
		<div class="ui compact menu" style="width: 930px; min-height:900px auto;  display: inline-block;" >
			<jsp:include page="${display}"></jsp:include>
		</div>
	</div>
		<!-- footer -->
	<div class="ui container" style="margin-top: 20px; min-width:1170px; position: relative; ">
		<jsp:include page="../main/I_footer.jsp" ></jsp:include>
	</div>
	<input type="hidden" name="index_keyword" id="index_keyword" value="${index_keyword}">
<script src="../js/slidbar.js"></script>
</body>
</html>