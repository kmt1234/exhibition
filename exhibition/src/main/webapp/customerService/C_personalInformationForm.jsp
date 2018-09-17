<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.box-container{
	/* 	display: inline-block; */
		padding-bottom: 40px;
		padding-left: 20px;
		padding-right: 20px;
		padding-top: 20px;
		font-weight:normal;
		font-size: 50px;
	}
	#new1{
	    display: block;
	    margin: 0;
	    vertical-align: middle;
	}
	.h-light{
		color: #ec008c;
	
	}
	.menu1{
		display: block;
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
		<div class="ui compact menu" id="new1"  style="width: 20%; height: 900px; ">
			<a class="item" class="menu1" href="C_noticeForm.jsp">공지사항</a> 
			<a class="item" class="menu1" href="C_emailConfirmForm.jsp">고객의소리</a> 
			<a class="item" class="menu1" href="C_QnAForm.jsp">자주묻는 질문</a> 
			<a class="item" class="menu1" href="C_contactListForm.jsp">주요시설 연락처</a> 
			<a class="item" class="menu1" href="C_personalInformation.jsp">마이페이지</a>
			<a class="item" class="menu1" href="">게시판추가</a> 
		</div>
		<!-- 메인 화면 -->
		<div class="ui compact menu" style="width: 80%; height: 900px;" >
			<div style="width: 100%; text-align: left;">
				<h2 class="box-container" style="float: center;">
					마이
					<span class="h-light">페이지</span>
				</h2>
				<jsp:include page="../login/memberMypage.jsp" ></jsp:include>
			</div>	
		</div>
			
		
		<!-- footer -->
		<div class="ui compact menu" style="width: 100%; float: right; ">
			<jsp:include page="../main/I_footer.jsp" ></jsp:include>
		</div>
	</div>
	
</body>
</html>