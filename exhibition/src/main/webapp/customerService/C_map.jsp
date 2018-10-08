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
	font-size: 40px;
	color: #4f4f4f;
}
.h-light{
	color: #ec008c;
}
#houseImg{
	margin:-3px;
	cursor: pointer;
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
				<a class="item" style="border: none; width: 227px;" href="/exhibition/customerService/C_privacy.do">개인정보 처리방침</a> 
				<a class="item" href="/exhibition/customerService/C_emailRefuse.do">이메일무단수집거부</a>
				<a class="item" href="/exhibition/customerService/C_map.do">사이트맵</a>
			</div>
		</div>
		<!-- 메인 화면 -->
		<div class="ui compact menu" style="width: 930px; height:900px auto;  display: inline-block;" >
			<!-- 타이틀 -->
			<h2 class="box-container" style="float: center; width: 100%; height:126px; text-align: left;">
				<span>위치</span> 
				<span class="h-light">정보</span>
				<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
					<img src="../img/house.png" width="15px" height="16px" id="houseImg">
					> 이용안내 > 위치정보
				</div>
				<div class="ui divider"></div>
			</h2>
			<div class="divBox" >
				<jsp:include page="${display }"/>
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