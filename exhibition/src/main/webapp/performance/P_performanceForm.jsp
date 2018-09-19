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
</style>
</head>
<body>
	<div style="float: left; margin-left: 375px">
	<header>
		<jsp:include page="../main/I_header.jsp"></jsp:include>
	</header>
	</div>
	<br>
	<br>
	<div style="float: left; margin-left: 375px; margin-top: 15px">
		<!-- 사이드바 메뉴 -->
		<div class="ui compact menu" style="width: 230px;  display: inline-block; float: inherit;">
			<a class="item" href="P_allSchedule.do">전체일정</a> 
			<a class="item" href="P_performanceSchedule.do">공연일정</a> 
			<a class="item" href="P_exhibitionSchedule.do">박람회일정</a>
		</div>
		<!-- 메인 화면 -->
		<div class="ui compact menu" style="width: 920px;  display: inline-block; float: inherit;" >
			<jsp:include page="${display}" ></jsp:include>
		</div>
		<!-- footer -->
		<div class="ui compact menu" style="width: 1170px; float: right; ">
			<jsp:include page="../main/I_footer.jsp" ></jsp:include>
		</div>
	</div>
</body>
</html>