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
		font-size: 40px;
		color: #4f4f4f;
	}
	.h-light{
		color: #ec008c;
	}
	.smallFont{
	 font-size: 14px;
	 text-align: left;
	 margin-left: 50px;
	 margin-right: 50px;
	}
	.divBox{
	background-color: #ededed;
	margin: 30px;
	padding-top: 30px;
	padding-bottom: 30px;
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
		<div class="ui compact menu" style="width: 20%; height: 520px; ">
			<a class="item" href="/exhibition/customerService/C_privacy.do">개인정보 처리방침</a> 
			<a class="item" href="/exhibition/customerService/C_emailRefuse.do">이메일무단수집거부</a>
			<a class="item" href="">사이트맵</a>

		</div>
		<!-- 메인 화면 -->
		<div class="ui compact menu" style="width: 80%; height: 520px;" >
			<!-- 타이틀 -->
			<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
				이메일무단수집거부
				<div style="font-size:13px; float:right;">
				<img src="../img/house.png" width="15px" height="16px" id="houseImg">
				> 이용안내 > 이메일무단수집거부
				</div>
				<div class="ui divider"></div>
			</h2>
			<div class="divBox">
				<p class="smallFont">
					본 웹사이트에 게시된 이메일 주소가 전자우편수집 프로그램이나 그밖의 기술적장치를 이용하여 무단으로 수집되는 것을 거부하며, <br>
					이를 위반시 정보통신망 이용촉진 및 정보보호등에 관한 법률에 의해 처벌 받을 수 있습니다.
				</p>
			</div>
		</div>
		<!-- footer -->
		<div class="ui compact menu" style="width: 100%; float: right; ">
			<jsp:include page="../main/I_footer.jsp" ></jsp:include>
		</div>
	</div>
		

</body>
</html>