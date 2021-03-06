<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

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
	<header>
		<jsp:include page="../main/I_header.jsp"></jsp:include>
	</header>
	<br>
	<br>
	<div class="ui five column grid container">
		<!-- 사이드바 메뉴 -->
		<div class="ui compact menu" style="width: 20%; height: 960px; ">
			<a class="item" href="P_allScheduleForm.do">전체일정</a> 
			<a class="item" href="P_performanceScheduleForm.do">공연일정</a> 
			<a class="item" href="P_exhibitionScheduleForm.do">전시회일정</a>
		</div>
		<!-- 메인 화면 -->
		<div class="ui compact menu" style="width: 80%; height: 900px;" >
			<!-- 타이틀 -->
			<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
				전시회
				<span class="h-light">일정</span>
			</h2>
			<!-- 버튼 -->
			<div>
				<input type="button" value="달력으로 보기" 
				style="width:150; height:35; background-color:#ffffff;
				 border:1 solid #f702e7; float: left">
				
				<input type="button" value="리스트로 보기" 
				style="width:150; height:35; font-family:돋움; background-color:#ffffff;
				 border:1 solid #f702e7; float: left">
				 
				 <span style="float: right;">
				 <img src="../img/Ex.png" style="width:25; height: 25; " align='absmiddle'> 전시회
				 </span>
				 
				 <span style="float: right;">
				 <img src="../img/Ev.png" style="width:25; height: 25;" align='absmiddle'> 공연  &ensp;&ensp;
				 </span>
			</div>
			<br>
			<br>
			<jsp:include page="P_exhibitionCalendar.jsp" ></jsp:include>
		</div>
		<!-- footer -->
		<div class="ui compact menu" style="width: 100%; float: right; ">
			<jsp:include page="../main/I_footer.jsp" ></jsp:include>
		</div>
	</div>
</body>
</html>