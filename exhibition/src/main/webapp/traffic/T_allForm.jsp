<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="../semantic/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="../semantic/semantic.min.js"></script>
<script src="../js/traffic.js"></script>

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
	.mapBtn{
		width:150px; 
		height:35px; 
		background-color:#ffffff;
		border:1 solid #f702e7; 
		float: left
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
		<div class="ui compact menu" style="width: 20%; height: 900px; ">
			<a class="item" href="T_carForm.jsp">자동차이용</a> 
			<a class="item" href="T_busForm.jsp">버스이용</a> 
			<a class="item" href="T_subwayForm.jsp">지하철이용</a>
		</div>
		<!-- 메인 화면 -->
		<div class="ui compact menu" style="width: 80%; height: 900px;" >
			<!-- 타이틀 -->
			<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
				오시는
				<span class="h-light">길</span>
			</h2>
			<div>
				<input type="button" value="자히철  이용고객" id="subwayBtn" class="mapBtn">
				
				<input type="button" value="버스  이용고객" id="busBtn" class="mapBtn">
				 
				 <input type="button" value="승용차 이용고객" id="carBtn" class="mapBtn">
				 
				 
			</div><br>
			<div id="subwayMap">
			<jsp:include page="T_subway.jsp" />
			</div>
			<div id="busMap">
			<jsp:include page="T_bus.jsp" />
			</div>
			<div id="carMap">
			<jsp:include page="T_car.jsp" />
			</div>
		</div>
		<br>
		</div>	
		<!-- footer -->
		<div class="ui compact menu" style="width: 100%; float: right; ">
			<jsp:include page="../main/I_footer.jsp" ></jsp:include>
		</div>
		

</body>
</html>