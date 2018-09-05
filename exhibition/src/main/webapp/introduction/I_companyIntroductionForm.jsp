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
			</h2>
			<jsp:include page="I_companyIntroduction.jsp" ></jsp:include>
		</div>
		<!-- footer -->
		<div class="ui compact menu" style="width: 100%; float: right; ">
			<jsp:include page="../main/I_footer.jsp" ></jsp:include>
		</div>
	</div>
	<%-- <footer>
		<jsp:include page="../main/I_footer.jsp"></jsp:include>
	</footer> --%>

</body>
</html>