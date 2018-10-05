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

.background{
background-image: url(../img/sogae.jpg);
   background-size: 100% 100%;
 	background-repeat: no-repeat;
   position: absolute;
}
.middleFont{
	color: #4b4c4c;
	font-size: 25px;
	text-align: left;
}
.smallFont{
 font-size: 16px;
 color: #878787;
}
#slidbar{
	position:absolute;
	top : 0px; 
	left: 0px;
}
#houseImg{
	margin:-3px;
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
			<div class="ui compact menu" id="slidbar" style="display: inline-block; ">
				<a class="item" style="border: none; width: 227px;" href="I_companyIntroductionForm.jsp">회사소개</a> 
				<a class="item" href="I_CEOIntroductionForm.jsp">CEO인사말</a> 
			</div>
		</div>
		<!-- 메인 화면 -->
		<div class="ui compact menu" style="width: 930px; height:900px auto;  display: inline-block;" >
			<!-- 타이틀 -->
			<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
				회사
				<span class="h-light">소개</span>
				<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
					<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer; " id="houseImg">
					> 소개 > 회사소개
				</div>
				<div class="ui divider"></div> 
			</h2>
			<div>
				<div style="width: 880px; margin-left: 20px;">
				<div style="font-size:20px; text-align: left;">
					<div style="font-size: 30px;">MICE 산업을 선도(先導)하는 <span style="color: #ec008c; font-size: 35px;">글로벌리더</span></div><br>
					<p>1979년 3월 개관이래, 글로벌 전시회와 국제회의 개최를 통한 국제교류의 장을 마련하고 글로벌 비즈니스 인프라를 
					두루 갖춘 최고의 전시 문화, 관광의 명소로서 아시아 마이스 비즈니스의 중심으로 자리매김 하였다.</p>
					
					<p class="smallFont">IPEX(연면적 46만㎡)는 지상 1층부터 4층까지 총 4개의 전시장(총 36,007㎡)과 50개의 회의실(총 11,614㎡, 92개까지 분할 가능), 그리고 최고의 편의시설과 공연장, 오피스 공간을 갖추고 있습니다.</P>
					
					<p class="smallFont">뿐만 아니라, 2014년 NEW IPEX 오픈, 강남 MICE관광특구 지정, 2015년 SM TOWN 개장 등 무역센터 명소화와 글로벌화를 위한 문화-비즈니스 플랫폼으로 진화, 발전하고 있습니다.</p>
					<br><br>
					<div class="ui divider"></div>
					<p class="middleFont">강남 마이스 <span style="color: #350b7c; font-size: 30px;">관광특구</span></p>
					<p class="smallFont">
					IPEX는 강남 마이스 관광특구인 무역센터를 아시아의 마이스 비즈니스의 중심지로 육성시키고, 국내 서비스산업의 
					육성에 기여하고자 합니다. MICE산업의 글로벌 경쟁력 강화를 추진하고 기존 전시컨벤션 중심의 운영에서 
					한류, 쇼핑, 공연 등 문화와 산업이 융합된 MICE클러스터 구축을 추진을 통해 아시아 최고의 경제・무역・문화・관광 
					랜드마크로 거듭나고 있습니다.
					
					</p>
					<p class="middleFont">국내 마이스 산업 <span style="color: #350b7c; font-size: 30px;">리더</span></p>
					<p class="smallFont">
					연간 200회 이상의 전시회와 2,500회 이상의 국제회의 및 이벤트를 개최하는 등 국내 마이스산업의 리더 역할을 
					수행하고 있으며, 2000년 아시아유럽정상회의(ASEM), 2002년 월드컵 미디어센터 운영, 2010년 G20정상회의, 
					2012년 핵안보정상회의, 2013 UFI총회, 2014년 생물다양성협약총회 등 대형 국제회의를 성공적으로 유치 개최해 
					오고 있습니다.
					</p>
					<p class="middleFont">최고의 전문가 <span style="color: #350b7c; font-size: 30px;">그룹</span></p>
					<p class="smallFont">
					세계적인 수준의 하드웨어뿐만이 아니라 30여년의 다양한 경험과 노하우를 바탕으로 대한민국 최고의 마이스산업 분야 
					전문가를 보유한 전문성을 확보하고 있습니다. 국제전시협회(UFI)의 국제인증과 산업통상자원부의 인증을 받은 다수의 
					전시회를 포함 대한민국 최대의 전시컨벤션 주최사 입니다.
					</p>
					<br><br>
				<div style="font-size:17px;">
				<img src="../img/sogae.jpg" align="right" width="400px" height="200px">
					<p class="smallFont">
						세계적인 수준의 서비스로 고객에게 보답하고 사회에 기여하는 기업,<br>
						국가경쟁력 향상에 기여하는 대한민국 최고의 전시컨벤션센터,<br>
						미래지향적 기업구조로 비전을 제시하는 교역증대의 장,<br>
					</p>
					<p>
						<span style="color: #ec008c; font-size: 25px;">
							<strong>대한민국 비즈니스의 중심에 IPEX가 있습니다.</strong>
						</span>
					</p>
					<p class="smallFont">
						세계적 수준의 전시컨벤션센터 IPEX에서 풍부한 역량을 갖춘 회의, 전시 전문가가<br>
						드리는 최고의 서비스를 받으십시오.
					</p>
					<p>
						<span style="color: #350b7c; font-size: 20px;">
							IPEX와 함께 하면 반드시 성공합니다.
						</span>
					</p>
				</div>
				</div>
			</div>
		</div>
		</div>
	</div>
	<!-- footer -->
	<div class="ui container" style="margin-top: 20px; min-width:1170px; position: relative; ">
		<jsp:include page="../main/I_footer.jsp" ></jsp:include>
	</div>
<script src="../js/slidbar.js"></script>	
<script src="../js/introduction.js"></script>
</body>
</html>