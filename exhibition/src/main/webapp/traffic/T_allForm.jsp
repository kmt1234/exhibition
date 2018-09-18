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
<script src="../js/traffic.js?ver=1"></script>

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
	#houseImg{
	margin:-3px;
}

	ul{
		list-style:none;
	   padding-left:0px;
	   padding-top:5px;
	}	
	.stationLi{
		margin-bottom:14px;
		margin-left: 15px;
		}
	.B:link {color:black; text-decoration: none;}	<!--일반 링크 검정 -->
	.B:visited {color black; text-decoration: none;}
	.B:hover {color:#ec008c; text-decoration: underline;} <!--마우스 올렸을 때 그린색에 언더바 생성. -->
	.B:active {color:black; text-decoration: none;}
	.B{
	 cursor: pointer;
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
				오시는
				<span class="h-light">길</span>
				<div style="font-size:13px; float:right;">
				<img src="../img/house.png" width="15px" height="16px" id="houseImg">
				> 교통/숙박/관광 > 교통안내 > 오시는 길
				</div>
				<div class="ui divider"></div>
			</h2>
			<div style="float: left;">
				<input type="button" value="자히철  이용고객" id="subwayBtn" class="middle ui button">
				
				<input type="button" value="버스  이용고객" id="busBtn" class="middle ui button">
				 
				 <input type="button" value="승용차 이용고객 " id="carBtn" class="middle ui button">
				 
			</div>
			
			<br><br><br>
			
			<div id="subwayMap">
				<a href="http://map.naver.com/?menu=subway&amp;region=1000" target="_blank" title="지하철 노선도" class="btn-subway" style="margin:left;">지하철 노선도 보기</a>
				<div align="left">
				&ensp;&ensp;지하철 하차 선을 선택하세요
					<div style="background-color: #e8e8e8;">
						&ensp;&ensp;
						<span id="metro7Btn" class="B">지하철 7호선</span>
						&ensp;&ensp;|
						&ensp;&ensp;
						<span id="metro3Btn" class="B">지하철 3호선</span>		
					</div>
				</div>
				
				<div id="metro7Div">
					<img src="../img/metroMap.jpg"><br>
					<div class="ui divider"></div>
					<div align="left">
						<span style="border:1px solid gray;padding:7px">지하철 7호선 고속터미널역 방면</span>
						고속터미널역 7번출구 직접 연결된 통로로 진입
				</div>
				</div>

				<div id="metro3Div">
					<img src="../img/metroMap3ho.jpg"><br>
					<div class="ui divider"></div>
					<div align="left">
						<span style="border:1px solid gray;padding:7px">지하철 3호선 고속터미널역 방면</span>
						고속터미널역 7번출구 직접 연결된 통로로 진입
					</div>
				</div>
			</div>
			
			<br>
			<div id="carMap">
				<div align="left">
					&ensp;&ensp;승용차 이용 시 출발지를 선택하세요
						<div style="background-color: #e8e8e8;">
							&ensp;&ensp;
							<span id="banpoBtn" class="B">반포대교 방면</span>
							&ensp;&ensp;|
							&ensp;&ensp;
							<span id="jamwonBtn" class="B">잠원로 방면</span>
							&ensp;&ensp;|
							&ensp;&ensp;
							<span id="sapyungBtn" class="B">사평 지하차도 방면</span>
							&ensp;&ensp;|
							&ensp;&ensp;
							<span id="seochoBtn" class="B">서초구 방면</span>
							&ensp;&ensp;|
							&ensp;&ensp;
							<span id="banpoStationBtn" class="B">반포역 방면</span>		
						</div>
					</div>
				<div id="banpoDiv">
					<img src="../img/carMap.jpg"><br>
					<div class="ui divider"></div>
					<div align="left">
						<span style="border:1px solid gray;padding:7px">반포대교 방면</span><!-- carMap  -->
						<ol>
						<li>반포대교 건너서 우회전 후 직진</li>
						<li>IPEC 북문 GATE로 진입</li>
						</ol>
					</div>
				</div>
				<div id="jamwonDiv">
					<img src="../img/carMap3.jpg"><br>
					<div class="ui divider"></div>
					<div align="left">
						<span style="border:1px solid gray;padding:7px">잠원로 방면</span> <!-- carMap3  -->
						<ol>
						<li>잠원로 방면으로 직진 </li>
						<li>신 반포로 건너서 직진</li>
						<li>IPEC동문 GATE로 우회전 후 진입</li>
						</ol>
					</div>
				</div>
				<div id="sapyungDiv">
					<img src="../img/carMapgosok.jpg"><br>
					<div class="ui divider"></div>
					<div align="left">
						<span style="border:1px solid gray;padding:7px">사평 지하차도 방면</span><!-- carMapgosok  -->
						<ol>
						<li>고속터미널 사거리에서 직진 </li>
						<li>IPEC 사거리에서 좌회전</li>
						<li>50m 직진 후 좌회전 IPEC동문 GATE로 진입</li>
						</ol>
					</div>
				</div>
				<div id="seochoDiv">
					<img src="../img/eastCarMap.jpg"><br>
					<div class="ui divider"></div>
					<div align="left">
						<span style="border:1px solid gray;padding:7px">서초구 방면</span><!-- carMapeast  -->
						<ol>
						<li>사평역 방향에서 직진 </li>
						<li>IPEC 사거리에서 우회전</li>
						<li>50m 직진 후 좌회전 IPEC동문 GATE로 진입</li>
						</ol>
					</div>
				</div>
				<div id="banpoStationDiv">
					<img src="../img/carMap2.jpg"><br>
					<div class="ui divider"></div>
					<div align="left">
						<span style="border:1px solid gray;padding:7px">반포역 방면</span><!-- carMap2  -->
						<ol>
						<li>반포역 방면에서 직진 </li>
						<li>신반포역 사거리에서 150m 직진 후 좌회전해서 IPEC북문 GATE로 진입</li>
						
						</ol>
					</div>
				</div>
			</div>
			
			
			
			<div id="busMap">
				<div align="left">
				&ensp;&ensp;버스 하차 정거장을 선택하세요
					<div style="background-color: #e8e8e8;">
						&ensp;&ensp;
						<span id="eastStationBtn" class="B">IPEC 동문 앞</span>
						&ensp;&ensp;|
						&ensp;&ensp;<span id="southStationBtn" class="B">IPEC 남문 앞</span>
						&ensp;&ensp;|
						&ensp;&ensp;<span id="megaboxStationBtn" class="B">메가박스 센트럴 건너편</span>
						&ensp;&ensp;|
						&ensp;&ensp;<span id="exitStationBtn" class="B">고속터미널 1번 출구</span>			
					</div>
				</div>
			
				
				<div id="eastStationDiv">
					<img src="../img/busMap.jpg"><br>
					<div class="ui divider"></div>
					<div align="left">
						<span style="border:1px solid gray;padding:7px">IPEC 동문 앞 | 23501 정류장</span><br><br>
						<ul>
							<li class="stationLi">
								<img src="../img/blueBus.png" width="20px" height="25px">
								간선버스 - 146, 341, 360, 337, 740, N13(심야), 하남 9303
							</li>
							<li class="stationLi">
								<img src="../img/greenBus.png" width="20px" height="25px">
								지선버스 – 6411
							</li>
							<li class="stationLi">
								<img src="../img/yellowBus.png" width="20px" height="25px">
								순환버스 – 41
							</li>
							<li class="stationLi">
								<img src="../img/redBus.png" width="20px" height="25px">
								간선버스 – 1100, 1700, 2000, 2000-1, 7007, 8001, 9414
							</li>
						</ul>
					</div>
				</div>
				
				<div id="megaboxStationDiv">
					<img src="../img/megaboxStationMap.jpg"><br>
					<div class="ui divider"></div>
					<div align="left">
						<span style="border:1px solid gray;padding:7px">메가박스 센트럴 건너편 | 24058 정류장</span><br><br>
						<ul>
							<li class="stationLi">
								<img src="../img/blueBus.png" width="20px" height="25px">
								간선버스 – 143
							</li>
							<li class="stationLi">
								<img src="../img/greenBus.png" width="20px" height="25px">
								지선버스 – 2413, 4419
							</li>
							<li class="stationLi">
								<img src="../img/yellowBus.png" width="20px" height="25px">
								순환버스
							</li>
							<li class="stationLi">
								<img src="../img/redBus.png" width="20px" height="25px">
								간선버스 – 9407, 9414, 9507, 9607
							</li>
						</ul>
					</div>
					
				</div>
				
				<div id="southStationDiv">
					<img src="../img/southStationMap.jpg"><br>
					<div class="ui divider"></div>
					<div align="left">
						<span style="border:1px solid gray;padding:7px">IPEC남문 앞 | 23458 정류장</span><br><br>
						<ul>
							<li class="stationLi">
								<img src="../img/blueBus.png" width="20px" height="25px">
								간선버스 – 146, 301, 401, 351, 352, N61(심야)
							</li>
							<li class="stationLi">
								<img src="../img/greenBus.png" width="20px" height="25px">
								지선버스 – 2415, 3217, 3411, 3412, 3414, 4318
							</li>
							<li class="stationLi">
								<img src="../img/yellowBus.png" width="20px" height="25px">
								순환버스
							</li>
							<li class="stationLi">
								<img src="../img/redBus.png" width="20px" height="25px">
								간선버스
							</li>
						</ul>
					</div>
				</div>
				
				<div id="exitStationDiv">
					<img src="../img/exitStation.jpg"><br>
					<div class="ui divider"></div>
					<div align="left">
						<span style="border:1px solid gray;padding:7px">고속터미널 1번 출구 | 22296 정류장</span><br><br>
						<ul>
							<li class="stationLi">
								<img src="../img/blueBus.png" width="20px" height="25px">
								간선버스 – 143, 146, 301, 401, 351, 352, N61(심야)
							</li>
							<li class="stationLi">
								<img src="../img/greenBus.png" width="20px" height="25px">
								지선버스 – 2413, 2415, 3217, 3412, 3414, 3417, 4419, 4318
							</li>
							<li class="stationLi">
								<img src="../img/yellowBus.png" width="20px" height="25px">
								순환버스
							</li>
							<li class="stationLi">
								<img src="../img/redBus.png" width="20px" height="25px">
								간선버스
							</li>
						</ul>
					</div>
				</div>
			
				
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