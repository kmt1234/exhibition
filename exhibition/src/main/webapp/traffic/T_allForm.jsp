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
	
	#T_map {
    	padding-bottom: 0px;
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
<<<<<<< HEAD
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
=======
		<div class="ui compact menu" style="width: 20%; height: 977px; ">
			<a class="item" href="T_allForm.do" id="T_map">교통안내</a> 
			<ul class="ui list" id="T_mapList" style="text-align: center; width: 120px">
			  <li><a href="T_allForm.do">오시는 길</a></li>
			  <li><a href="T_parkingAllForm.do">주차 안내</a></li>
			</ul>
			<a class="item" href="P_performanceScheduleForm.do">숙박안내</a> 
			<a class="item" href="P_exhibitionScheduleForm.do">관광안내</a>
>>>>>>> refs/remotes/origin/shinwork
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
				 
				 <input type="button" value="승용차 이용고객 " id="carBtn" class="mapBtn">
				 
			</div>
			
			<br><br><br>
			
			<div id="subwayMap">
				<a href="http://map.naver.com/?menu=subway&amp;region=1000" target="_blank" title="지하철 노선도" class="btn-subway" style="margin:left;">지하철 노선도 보기</a>
				<div style="border:1px solid black">
					<img src="../img/metroMap.jpg">
				</div>
			</div>
			
			<br>
			<div id="carMap" style="border:1px solid black">
				<img src="../img/busMap.jpg">
			</div>

			<div id="busMap" style="border:1px solid black">
				<img src="../img/carMap.jpg">
			</div>
		</div>
		<br>
		
		<!-- footer -->
		<div class="ui compact menu" style="width: 100%; float: right; ">
			<jsp:include page="../main/I_footer.jsp" ></jsp:include>
		</div>
	</div>
		

</body>
</html>