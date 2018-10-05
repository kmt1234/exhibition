<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<style type="text/css">
#subjectA:hover{
	cursor: pointer;
	font-weight: bold;
	
}
#subjectA{
	width: 215px;
   overflow: hidden;
   white-space: nowrap;
   text-overflow: ellipsis;
}
.calSubject {
	width: 215px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
</style>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
</head>
<body>
<header>
	<div class="main_header">
		<jsp:include page="I_header.jsp"/>
	</div>
</header>
<!--메인화면  -->
<section>
	<div class="ui container main_section">
		<jsp:include page="${display}"/>
	</div>
<!--메인화면 아래 부분(일정)  -->
	<div class="ui container main_section1">
		<!-- 공연포스터 슬라이드?? -->
		<div class="main_section2" >
			<jsp:include page="../main/slide.jsp" />
		</div>
		<!-- 달력&일정 -->
		<div class="main_section2" style="width:540px;  " ><!--index.js참조-->
			<!-- 달력  -->
			<div class="main_section3" id="mainCal" style="margin-top: 15px;" ></div>
			<!-- today -->
			<dl class="todays main_section3" id="todays">
				<dt style="margin-left: 20px; font-size: 13pt">Today's <a href="/exhibition/performance/P_allSchedule.do" style="padding-left: 100px;" class="more" title="Today's 더보기">more+</a></dt>
				<dd id="today_list" >
					<ul class="total_list" id="total_list" style="list-style:none;">
					</ul>
				</dd>
			</dl>
		</div>
		<!-- 공지사항  -->
		<div class="main_section2">
			<div style="height : 50px; padding:10px;  font-size: 13pt;" >공지사항</div>
			<div id="C_notice_MainList" style="height : 220px;  "></div><!--index.js참조-->
		</div>
	</div>
</section>
<footer>
	<div class="ui container main_footer" >
		<jsp:include page="../main/I_footer.jsp"/>
	</div>
</footer>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script><!-- 달력  -->
</body>
</html>
