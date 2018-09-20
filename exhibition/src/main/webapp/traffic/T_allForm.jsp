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
	#slidbar{
	position:absolute;
	top : 0px; 
	left: 0px;
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
				<a class="item menu" style="border: none; width: 227px;" href="T_allForm.do" id="T_map">교통안내</a> 
					<ul class="ui list" id="T_mapList" style="text-align: center; width: 120px">
					  <li><a href="T_allForm.do">오시는 길</a></li>
					  <li><a href="T_parkingAllForm.do">주차 안내</a></li>
					</ul> 
				<a class="item" href="P_performanceScheduleForm.do">숙박안내</a> 
				<a class="item" href="P_exhibitionScheduleForm.do">관광안내</a>
			</div>
		</div>
		<!-- 메인 화면 -->
		<div class="ui compact menu" style="width: 930px; height:900px auto;  display: inline-block;" >
			<!-- 타이틀 -->
			<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
				오시는
				<span class="h-light">길</span>
			 	<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
					<img src="../img/house.png" width="15px" height="16px" id="houseImg"></img>
					> 교통/숙박/관광 > 교통안내 > 오시는 길
				</div>
				<div class="ui divider"></div> 
			</h2>
			<div style="float: left; margin-left: 20px;">
				<input type="button" value="자히철  이용고객" id="subwayBtn" class="middle ui button">
				<input type="button" value="버스  이용고객" id="busBtn" class="middle ui button">
				<input type="button" value="승용차 이용고객 " id="carBtn" class="middle ui button">
			</div>
			<br><br><br>
			
			<div id="subwayMap">	
				<div style="margin-top: 10px;">
					<div style=" width: 150px; display: inline-block;  float:right; margin-right: 60px;">
						<a href="http://map.naver.com/?menu=subway&amp;region=1000" target="_blank" title="지하철 노선도" class="btn-subway" ><i class="subway icon"></i>
						지하철 노선도 보기</a>
					</div>
					<div style=" width: 10px auto; text-align: left; margin-left: 20px;">
						지하철 하차 선을 선택하세요
					</div>
				</div>
				<div style="float: left; text-align: left;  margin-left: 20px; margin-top: 10px;">
					<div style="width:auto; background-color: #e8e8e8;">
						&ensp;&ensp;
						<a id="metro7Btn" class="B">지하철 7호선</a>
						&ensp;&ensp;|
						&ensp;&ensp;
						<a id="metro3Btn" class="B">지하철 3호선</a>
						&ensp;&ensp;		
					</div>
				</div>
				<div id="metro7Div" style="margin-top: 10px;">
					<img style="margin-top: 10px;" src="../img/metroMap.jpg"><br>
					<div class="ui divider"></div>
					<div align="left">
						<span style="padding:7px; color:red;">지하철 7호선 고속터미널역 방면</span>
						고속터미널역 7번출구 직접 연결된 통로로 진입
				</div>
				</div>

				<div id="metro3Div">
					<img style="margin-top: 10px;" src="../img/metroMap3ho.jpg"><br>
					<div class="ui divider"></div>
					<div align="left">
						<span style="padding:7px; color:red;">지하철 3호선 고속터미널역 방면</span>
						고속터미널역 7번출구 직접 연결된 통로로 진입
					</div>
				</div>
			</div>
			
			<br>
			<div id="carMap">
				<div align="left">
					<div style=" width: 10px auto; text-align: left; margin-left: 20px; margin-top: -8px;">
						승용차 이용 시 출발지를 선택하세요
					</div>
						<div style="margin-left:20px; margin-top:10px; background-color: #e8e8e8;">
							&ensp;&ensp;
							<a id="banpoBtn" class="B">반포대교 방면</a>
							&ensp;&ensp;|
							&ensp;&ensp;
							<a id="jamwonBtn" class="B">잠원로 방면</a>
							&ensp;&ensp;|
							&ensp;&ensp;
							<a id="sapyungBtn" class="B">사평 지하차도 방면</a>
							&ensp;&ensp;|
							&ensp;&ensp;
							<a id="seochoBtn" class="B">서초구 방면</a>
							&ensp;&ensp;|
							&ensp;&ensp;
							<a id="banpoStationBtn" class="B">반포역 방면</a>	
							&ensp;&ensp;	
						</div>
					</div>
				<div id="banpoDiv">
					<img style="margin-top:10px;" src="../img/carMap.jpg"><br>
					<div class="ui divider"></div>
					<div align="left">
						<span style="padding:7px; color: red;">반포대교 방면</span><!-- carMap  -->
						<ol>
							<li>반포대교 건너서 우회전 후 직진</li>
							<li>IPEC 북문 GATE로 진입</li>
						</ol>
					</div>
				</div>
				<div id="jamwonDiv">
					<img style="margin-top:10px;" src="../img/carMap3.jpg"><br>
					<div class="ui divider"></div>
					<div align="left">
						<span style="padding:7px; color: red;">잠원로 방면</span> <!-- carMap3  -->
						<ol>
							<li>잠원로 방면으로 직진 </li>
							<li>신 반포로 건너서 직진</li>
							<li>IPEC동문 GATE로 우회전 후 진입</li>
						</ol>
					</div>
				</div>
				<div id="sapyungDiv">
					<img style="margin-top:10px;" src="../img/carMapgosok.jpg"><br>
					<div class="ui divider"></div>
					<div align="left">
						<span style="padding:7px; color: red;">사평 지하차도 방면</span><!-- carMapgosok  -->
						<ol>
						<li>고속터미널 사거리에서 직진 </li>
						<li>IPEC 사거리에서 좌회전</li>
						<li>50m 직진 후 좌회전 IPEC동문 GATE로 진입</li>
						</ol>
					</div>
				</div>
				<div id="seochoDiv">
					<img style="margin-top:10px;" src="../img/eastCarMap.jpg"><br>
					<div class="ui divider"></div>
					<div align="left">
						<span style="padding:7px; color: red;">서초구 방면</span><!-- carMapeast  -->
						<ol>
						<li>사평역 방향에서 직진 </li>
						<li>IPEC 사거리에서 우회전</li>
						<li>50m 직진 후 좌회전 IPEC동문 GATE로 진입</li>
						</ol>
					</div>
				</div>
				<div id="banpoStationDiv">
					<img style="margin-top:10px;" src="../img/carMap2.jpg"><br>
					<div class="ui divider"></div>
					<div align="left">
						<span style="padding:7px; color: red;">반포역 방면</span><!-- carMap2  -->
						<ol>
						<li>반포역 방면에서 직진 </li>
						<li>신반포역 사거리에서 150m 직진 후 좌회전해서 IPEC북문 GATE로 진입</li>
						
						</ol>
					</div>
				</div>
			</div>
			<div id="busMap">
				<div style="float: inherit;">
					<div style=" width: 10px auto; text-align: left; margin-left: 20px; margin-top: -8px;">
						버스 하차 정거장을 선택하세요
					</div>
				</div>
				<div style="float: left; text-align: left;  margin-left: 20px; margin-top: 10px;">
					<div style="background-color: #e8e8e8; ">
						&ensp;&ensp;
						<a id="eastStationBtn" class="B">IPEC 동문 앞</a>
						&ensp;&ensp;|
						&ensp;&ensp;<a id="southStationBtn" class="B">IPEC 남문 앞</a>
						&ensp;&ensp;|
						&ensp;&ensp;<a id="megaboxStationBtn" class="B">메가박스 센트럴 건너편</a>
						&ensp;&ensp;|
						&ensp;&ensp;<a id="exitStationBtn" class="B">고속터미널 1번 출구</a>	
						&ensp;&ensp;		
					</div>
				</div>
				<div id="eastStationDiv">
					<img style="margin-top:10px;" src="../img/busMap.jpg"><br>
					<div class="ui divider"></div>
					<div align="left">
						<span style="margin-left:10px; padding:7px;color: red;">IPEC 동문 앞 | 23501 정류장</span><br><br>
						<ul>
							<li class="stationLi">
								<img  src="../img/blueBus.png" width="20px" height="25px">
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
					<img style="margin-top:10px;" src="../img/megaboxStationMap.jpg"><br>
					<div class="ui divider"></div>
					<div align="left">
						<span style="margin-left:10px; padding:7px;color: red; ">메가박스 센트럴 건너편 | 24058 정류장</span><br><br>
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
					<img style="margin-top:10px;" src="../img/southStationMap.jpg"><br>
					<div class="ui divider"></div>
					<div align="left">
						<span style="margin-left:10px; padding:7px;color: red;">IPEC남문 앞 | 23458 정류장</span><br><br>
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
					<img style="margin-top:10px;" src="../img/exitStation.jpg"><br>
					<div class="ui divider"></div>
					<div align="left">
						<span style="margin-left:10px; padding:7px;color: red;">고속터미널 1번 출구 | 22296 정류장</span><br><br>
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
		</div>
		<br>
		<!-- footer -->
		<div class="ui container" style="margin-top: 20px; min-width:1170px; position: relative; ">
			<jsp:include page="../main/I_footer.jsp" ></jsp:include>
		</div>
	
<script src="../js/slidbar.js"></script>	
<script src="../js/traffic.js?ver=1"></script>	
</body>
</html>