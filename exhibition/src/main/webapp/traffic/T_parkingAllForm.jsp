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
<script src="../js/trafficParking.js"></script>
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
	
	.parkingBtn{
	width:70px; 
	height:25px;
	background-color:#ffffff;
	border:1 solid #f702e7;
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
		<br><br>
		<div style="font-size: 22px;">교통/숙박/관광</div><br>
		<div style="border-bottom: 1px solid black;"></div><br>
			<div id="T_inform">교통안내</div>
			<span style="font-size: 7px;">▶</span>
			<span><a href="T_allForm.do" id="T_Atag">오시는길</a></span><br>
			<span style="font-size: 7px;">▶</span>
			<span><a href="T_parkingAllForm.do" id="T_Atag">주차안내</a></span><br><br>
			<div id="T_hotel" style="cursor:pointer; font-size: 18px;">숙박안내</div><br>
			<div id="T_inform">관광안내</div><br>
		</div>
		<!-- 메인 화면 -->
		<div class="ui compact menu" style="width: 80%; height: 900px;" >
			<!-- 타이틀 -->
			<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
				주차
				<span class="h-light">안내</span>
			</h2>
			<div>
				<input type="button" value="주차안내" id="parkingInform" class="mapBtn">
				
				<input type="button" value="주차장 층별 정보" id="parkingB" class="mapBtn">
				
				<input type="button" value="주차요금" id="parkingPriceBtn" class="mapBtn">
				 
			</div><br>
			<div id="carMap">
			<jsp:include page="T_car.jsp" />
			</div>
			<div id="T_parkingFormMap">
			<jsp:include page="T_parkingForm.jsp"/>
			</div>
			<div id="T_parkingPriceMap">
			<jsp:include page="T_parkingPrice.jsp"/>
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