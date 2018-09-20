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
.B:link {color:black; text-decoration: none;}	<!--일반 링크 검정 -->
.B:visited {color:black; text-decoration: none;}
.B:hover {color:#ec008c; text-decoration: underline;} <!--마우스 올렸을 때 그린색에 언더바 생성. -->
.B:active {color:black; text-decoration: none;}
.B{
 cursor: pointer;
}
#T_map {
    	padding-bottom: 0px;
	}
	
#houseImg{
	margin:-3px;
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
			<a class="item" style="border: none; width: 227px;" href="T_allForm.do" id="T_map">교통안내</a> 
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
			주차
			<span class="h-light">안내</span>
			<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
				<img src="../img/house.png" width="15px" height="16px" id="houseImg">
			   	> 교통/숙박/관광 > 교통안내 > 주차 안내
			</div>
		<div class="ui divider"></div>
		</h2>
		<div style="float: left; margin-left: 20px;">
			<input type="button" value="주차안내" id="parkingInform" class="middle ui button">
			<input type="button" value="주차장 층별 정보" id="parkingB" class="middle ui button">
			<input type="button" value="주차요금" id="parkingPriceBtn" class="middle ui button">
		</div>
		<br><br><br><br>
		<div id="carMap">
			<div align="left">
				<div style=" width: 10px auto; text-align: left; margin-left: 20px; margin-top: -8px;">
					승용차 이용 시 출발지를 선택하세요
				</div>
					<div style="margin-left:20px;margin-top:10px; background-color: #e8e8e8;">
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
						&ensp;&ensp;
					</div>
				</div>
			<div id="banpoDiv">
				<img style="margin-top:10px;" src="../img/carMap.jpg"><br>
				<div class="ui divider"></div>
				<div align="left">
					<span style="padding:7px; color:red">반포대교 방면</span><!-- carMap  -->
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
					<span style="padding:7px; color:red">잠원로 방면</span> <!-- carMap3  -->
					<ol>
					<li>잠원로 방면으로 직진 </li>
					<li>신 반포로 건너서 직진</li>
					<li>IPEC동문 GATE로 우회전 후 진입</li>
					</ol>
				</div>
			</div>
			<div id="sapyungDiv">
				<img style="margin-top:10px;"src="../img/carMapgosok.jpg"><br>
				<div class="ui divider"></div>
				<div align="left">
					<span style="padding:7px; color:red">사평 지하차도 방면</span><!-- carMapgosok  -->
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
					<span style="padding:7px; color:red">서초구 방면</span><!-- carMapeast  -->
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
					<span style="padding:7px; color:red">반포역 방면</span><!-- carMap2  -->
					<ol>
					<li>반포역 방면에서 직진 </li>
					<li>신반포역 사거리에서 150m 직진 후 좌회전해서 IPEC북문 GATE로 진입</li>
					
					</ol>
				</div>
			</div>
		</div>
			
			<div id="parkingDiv" align="left">
				<div style=" width: 10px auto; text-align: left; margin-left: 20px; margin-top: -8px;">
					주차장 층을 선택 해 주세요
				</div>
				<div style="margin-left:20px;margin-top:10px; background-color: #e8e8e8;">
					&ensp;&ensp;
					<a id="B1" class="B">B2</a>
					&ensp;&ensp;|
					<a id="B2" class="B">B3</a>
					&ensp;&ensp;
				</div>
			</div>
			
			<div id="T_parkingB1Map">
				<img src="../img/B1.jpg" width="700px" height="600px">
				<div class="ui divider"></div>
			</div>
			
			<div id="T_parkingB2Map">
				<img src="../img/B2.jpg" width="700px" height="600px">
				<div class="ui divider"></div>
			</div>
			
			<div id="T_parkingPriceMap">
				<table class="ui celled table" style="margin-left:20px; width: 880px;">
					<span style="float:left"><h2>주차요금</h2></span><br>
					<tr>
						<td  align="center" height="30" style="width:10%; background-color: #f7f6e6;text-align: center;">승용차</td>
						<td style="width:20%;text-align: left;" >
							최초 30분 2,400원 / 15분당 1,200원 / 1일 주차시 4만 8천원
						</td>
					</tr>
					<tr>
						<td  align="center" height="30" style="width:10%; background-color: #f7f6e6;text-align: center;">화물차(2.5t이상) 승용차</td>
						<td style="width:20%;text-align: left;" >
							승용차 주차요금의 2배
						</td>
					</tr>
					<tr>
						<td  align="center" height="30" style="width:10%; background-color: #f7f6e6;text-align: center;">대형버스</td>
						<td style="width:20%;text-align: left;" >
							 주차장 이용불가(고속터미널역 주차장 이용)
						</td>
					</tr>	
					<tr>
						<td  align="center" height="30" style="width:10%; background-color: #f7f6e6;text-align: center;">
						Grace Time	
						</td>
						<td style="width:20%;text-align: left;" >
							입차 후 15분 이내 출차 차량 : 주차료 면제<br>
							입차 후 15분 초과 출차 차량 : 정상요금 (15분 포함)<br>
							무인요금계산기 정산 후 출차 시 Grace Time 15분 인정<br>
						</td>
					</tr>
					<tr>
						<td  align="center" height="30" style="width:10%; background-color: #f7f6e6;text-align: center;">장애인, 국가유공자</td>
						<td style="width:20%;text-align: left;" >
							50% 할인
						</td>
					</tr>	
				</table>
				<br>
				<div class="ui divider"></div>
				<table class="ui celled table" style="width: 100%;">
				<span style="float:left"><h2>주차요금 할인</h2></span><br>
					<tr>
						<th align="center" height="30" style="width:10%; background-color: #f7f6e6;text-align: center;">구분</th>
						<th align="center" height="30" style="width:10%; background-color: #f7f6e6;text-align: center;">시간</th>
						<th align="center" height="30" style="width:10%; background-color: #f7f6e6;text-align: center;">그 외 서비스</th>
					</tr>
					<tr>
						<td style="width:20%;">박람회 티켓 소지</td>
						<td style="width:20%;">1시간 주차요금 무료</td>
						<td style="width:20%;" rowspan="4">일부 매장별 할인기준 적용</td>
					</tr>
					<tr>
						<td style="width:20%;">공연 티켓 소지</td>
						<td style="width:20%;">최소 4시간까지 4,800원</td>
					</tr>
					<tr>
						<td style="width:20%;">비즈니스룸 영수증 소지</td>
						<td style="width:20%;">2시간 주차요금 무료</td>
					</tr>
				</table>
			</div><!--T_parkPriceMap  -->
		</div>
	</div>
		
<footer></footer>
	<div class="ui container" style="margin-top: 20px; min-width:1170px; position: relative; ">
		<jsp:include page="../main/I_footer.jsp" ></jsp:include>
	</div>
</footer>
<script src="../js/slidbar.js"></script>	
<script src="../js/trafficParking.js?ver=1"></script>
</body>
</html>