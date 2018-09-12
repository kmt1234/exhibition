<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="../semantic/semantic.min.css">
</head>
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
#currentHotelPaging{
	color: red;
	text-decoration: underline;
	cursor: pointer;
}

#hotelpaging{
	color: black;
	text-decoration: none;
	cursor: pointer;
}
#hotelPaging3{
	align:center;
}
#image_DIV{
	height:450px;
	float:center;
}
</style>
<body>
	<header>
		<jsp:include page="../main/I_header.jsp"></jsp:include>
	</header><br><br>
	
	<div class="ui five column grid container">
		<!-- 사이드바 메뉴 -->
		<div class="ui compact menu" style="width: 20%; height: 977px; ">
			<a class="item" href="T_allForm.do" id="T_map">교통안내</a> 
			<ul class="ui list" id="T_mapList" style="text-align: center; width: 120px">
			  <li><a href="T_allForm.do">오시는 길</a></li>
			  <li><a href="T_parkingAllForm.do">주차 안내</a></li>
			</ul>
			<a class="item" href="P_performanceScheduleForm.do">숙박안내</a> 
			<a class="item" href="P_exhibitionScheduleForm.do">관광안내</a>

		</div>
		<!-- 메인 화면 -->
		<div class="ui compact menu" style="width: 80%; height: 900px;" >
		<!-- 타이틀 -->
		<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
			숙박
			<span class="h-light">안내</span>
		</h2>
		<div id="image_DIV">
			<c:forEach items="${list }" var="list">
			<div style="float:left; width: 24%;">
				<img src="../storage/${list.image1}" width="200" height="150"><br>
				${list.imageName}<br>
				TEL) ${list.eventPlace}
				<i class="home icon" style="cursor: pointer;" onclick="window.open('${list.eventLink }')"></i>
				<br><br>
			</div>
			</c:forEach>	
		</div>
		<div id="hotelPaging3">${imageboardPaging.pagingHTML }</div>
	</div>
		
	</div>
	
	<!-- footer -->
	<div class="ui compact menu" style="width: 100%; float: right; ">
		<jsp:include page="../main/I_footer.jsp" ></jsp:include>
	</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="../semantic/semantic.min.js"></script>
<script src="../js/traffic.js"></script>
<script type="text/javascript">
function hotelboardPaging(pg){
	location.href="/exhibition/traffic/T_hotelList.do?pg="+pg
}
</script>
</body>
</html>