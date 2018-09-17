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
	#houseImg{
	margin:-3px;
	}
	#hiTitle{
		font-size: 30px;
		color: #200260;
	}
	#hiContent{
		font-size: 14px;	
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
			<a class="item" href="I_companyIntroductionForm.jsp">회사소개</a> 
			<a class="item" href="I_CEOIntroductionForm.jsp">CEO인사말</a> 
		</div>
		<!-- 메인 화면 -->
		<div class="ui compact menu" style="width: 80%; height: 900px;" >
			<!-- 타이틀 -->
			<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
				회사
				<span class="h-light">소개</span>
				<div style="font-size:13px; float:right;">
					<img src="../img/house.png" width="15px" height="16px" id="houseImg">
					> 소개 > 회사소개
				</div>
				<div class="ui divider"></div>
			</h2>
			<div style="text-align: left;">
			<div id="hiTitle">MICE 산업을 선도(先導)하는 글로벌리더</div><br>
			<font style="font-size: 18px; letter-spacing:1">1979년 3월 개관이래, 글로벌 전시회와 국제회의 개최를 통한 국제교류의 장을 마련하고 글로벌 비즈니스 인프라를 
			두루 갖춘 최고의 전시 문화, 관광의 명소로서 아시아 마이스 비즈니스의 중심으로 자리매김 하였다.</font><br><br><br>
			
			코엑스(연면적 46만㎡)는 지상 1층부터 4층까지 총 4개의 전시장(총 36,007㎡)과 50개의 회의실(총 11,614㎡, 92개까지 분할 가능), 그리고 최고의 편의시설과 공연장, 오피스 공간을 갖추고 있습니다.
			
			뿐만 아니라, 2014년 뉴코엑스몰 오픈, 강남 MICE관광특구 지정, 2015년 SM TOWN 개장 등 무역센터 명소화와 글로벌화를 위한 문화-비즈니스 플랫폼으로 진화, 발전하고 있습니다.
			</div>
		</div>
		<!-- footer -->
		<div class="ui compact menu" style="width: 100%; float: right; ">
			<jsp:include page="../main/I_footer.jsp" ></jsp:include>
		</div>
	</div>

</body>
</html>