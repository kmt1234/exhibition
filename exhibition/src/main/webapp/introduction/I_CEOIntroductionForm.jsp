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
.smallFont{
	font-size: 16px;
    color: #878787;
}
.middleFont{
	color: #302c2c;
	font-size: 18px;
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
				CEO
				<span class="h-light">인사말</span>
				<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
					<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer; " id="houseImg"></img>
					> 소개 > CEO인사말
				</div>
				<div class="ui divider"></div> 
			</h2>
			<div style="width: 880px; margin-left: 20px;">
			<div style="font-size:20px; text-align: left;"><!-- 이미지  넣으면 됨 -->
			<img src="../img/bujin.jpg" align="left" height="505px">
			<p style="color: #ec008c; font-size: 30px;"><strong>IPEX와 함께 큰 꿈을 이루세요!</strong></p>
			<p> <strong>안녕하십니까? IPEX 홈페이지를 찾아주셔서 감사합니다.</strong></p>
			<p class="smallFont">1986년 창립한 IPEX는 연간 200회 이상의 전시회와 3,000회 이상의
				국제회의 및 이벤트를 개최해오며 대한민국 MICE산업의 리더 역할을 하고 있습니다.</p>
			<p class="smallFont">MICE(Meeting, Incentive, Convention & Exhibition)산업은 흔히 굴뚝 없는 산업이라 할 만큼 다양한 분야에 걸쳐 고부가가치를 창출하며 전 세계적으로 각광받고 있습니다.<br>
				우리나라 역시 국제회의 개최 순위 3위를 기록하며, 지속적인 성장세를 이어가고 있습니다.</p>
			<p class="smallFont">
				그리고 IPEX는 전문성을 갖춘 인적자원과 편리한 주변 인프라를 기반으로<br>
				2000년 ASEM(아시아, 유럽정상회의), 2010년 G20 정상회의, 2012년 핵안보 정상회의 등 매머드급 정상회의를 성공리에 치러내며, 
				전 세계에 우리나라 MICE 산업의 저력과 비전을 선보였습니다.
			</p>
			<p class="smallFont">
				IPEX는 앞으로도 글로벌 MICE 업계와의 협력 관계를 확대 발전시키고, 
				해외에서 전시회를 직접 개최하며, 
				대한민국을 대표하는 전시회를 집중 육성하는 등 끊임없는 노력을 기울임으로써, 
				우리나라 MICE산업의 리더로서 역할을 수행해 나갈 것입니다.
			</p>
			</div>
			<br><br>
			<div style="text-align: left;">
				<p class="middleFont">
					<strong>대한민국 대표 명소로 다시 태어나는 IPEX!</strong>
				</p>
				<p class="smallFont">
					한편 IPEX는 무역센터를 찾는 국내외 방문객들에게 한 차원 격상된 서비스를 제공하고 우리나라 서비스 산업 발전에 기여코자,<br>
					무역센터 주요 13개사와의 연계를 통해 2013년 9월, MICE 클러스터 추진위원회 발족을 이끌어 냈으며,<br>
					2014년 12월에는 클러스터 회원사와의 공동 노력의 결실로써, 강남 MICE관광특구로 지정되었습니다.<br>
					IPEX는 이를 토대로 IPEX와 무역센터 일대가 비즈니스와 문화, 관광, 전시컨벤션이 융합된<br>
					대한민국 대표 명소로 자리매김 할 수 있도록 더욱 박차를 가할 것입니다.<br>
				</p>
				<p class="middleFont">
					<strong>IPEX는 전시/컨벤션의 기능 뿐만아니라<br>
					경제/문화복합공간으로서 최고의 시설을 갖추기 위해 끊임없이 노력하고 있습니다.</strong>
				</p>
				<p class="smallFont">
					다양한 즐거움과 기대 이상의 감동이 함께하는 IPEX몰, 우리나라의 대표적 사무공간인 트레이드타워와 아셈타워, 한류 글로벌화의 산실인 SM 타운 등<br>
					최고의 시설을 환경친화적이고 효율적으로 관리/운영하는 전문 노하우를 보유한 기업, 바로 IPEX입니다.<br>
					IPEX는 이러한 시설을 이용하시는 고객 한 분 한 분의 고견에 세심하게 귀 기울이고,<br>
					서비스 품질 향상을 도모하여 더 다양하고 혁신적인 서비스로 고객 여러분들께 다가가고자 합니다.<br>
				</p>
				<p class="middleFont">
					<strong>IPEX는 전시컨벤션산업에서 문화산업에 이르기까지 언제나 그 한가운데에 자리하고 있습니다.</strong>
				</p>
				<p class="smallFont">
				대한민국 최초로서 가져왔던 자부심과 글로벌 시대에 최고로서 가져야할 전문성까지,
				IPEX가 변함없이 지켜내야 할 소중한 가치를 잊지 않도록<br>
				고객 여러분께서 잘 지켜봐주시고 응원해 주시기 바랍니다.
				</p>
				<p class="middleFont">
					감사합니다.
				</p>
			</div>
		</div>
	</div>
	<!-- footer -->
	<div class="ui container" style="margin-top: 20px; min-width:1170px; position: relative; ">
		<jsp:include page="../main/I_footer.jsp" ></jsp:include>
	</div>
	
<script src="../js/slidbar.js"></script>
</body>
</html>