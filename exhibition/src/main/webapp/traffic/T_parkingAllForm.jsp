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
.B:link {color:black; text-decoration: none;}	<!--일반 링크 검정 -->
.B:visited {color:green; text-decoration: none;}
.B:hover {color:green; text-decoration: underline;} <!--마우스 올렸을 때 그린색에 언더바 생성. -->
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
				주차
				<span class="h-light">안내</span>
				<div style="font-size:13px; float:right;">
				<img src="../img/house.png" width="15px" height="16px" id="houseImg">
				   > 교통/숙박/관광 > 교통안내 > 주차 안내
				</div>
				<div class="ui divider"></div>
			</h2>
			<div style="float: left;">
				<input type="button" value="주차안내" id="parkingInform" class="middle ui button">
				
				<input type="button" value="주차장 층별 정보" id="parkingB" class="middle ui button">
				
				<input type="button" value="주차요금" id="parkingPriceBtn" class="middle ui button">
				 
				 
			</div>
			
			<br><br><br><br>

			<div id="carMap" style="border:1px solid black">
				<img src="../img/carMap.jpg">
			</div>
			
			<div id="parkingDiv" align="left">
				&ensp;&ensp;주차장 층을 선택 해 주세요
				<div style="background-color: #e8e8e8;">
					&ensp;&ensp;<span id="B1" class="B">B1</span>
					&ensp;&ensp;|
					&ensp;&ensp;<span id="B2" class="B">B2</span>
				</div>
			</div>
			
			<div id="T_parkingB1Map">
				<img src="../img/B1.jpg" width="700px" height="600px">
			</div>
			
			<div id="T_parkingB2Map">
				<img src="../img/B2.jpg" width="700px" height="600px">
			</div>
			
			<div id="T_parkingPriceMap">
					<table class="ui celled table" style="width: 100%;">
				<!-- <table border="1" cellpadding="8" cellspacing="2"> -->
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
		<br>
		
		<!-- footer -->
		<div class="ui compact menu" style="width: 100%; float: right; ">
			<jsp:include page="../main/I_footer.jsp" ></jsp:include>
		</div>
	</div>
<script src="../js/trafficParking.js?ver=1"></script>
</body>
</html>