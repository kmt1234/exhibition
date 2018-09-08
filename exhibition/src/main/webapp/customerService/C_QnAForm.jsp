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
			<a class="item" href="C_noticeForm.jsp">공지사항</a> 
			<a class="item" href="C_emailConfirmForm.jsp">고객의소리</a> 
			<a class="item" href="C_QnAForm.jsp">자주묻는 질문</a> 
			<a class="item" href="C_contactListForm.jsp">주요시설 연락처</a> 
		</div>
		<!-- 메인 화면 -->
		<div class="ui compact menu" style="width: 80%; height: 900px;" >
			<!-- 타이틀 -->
			<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
				자주묻는
				<span class="h-light">질문</span>
			</h2>
			<div>
				<input type="button" value="위치/교통" id="C_QnA_location"
				style="width:16%; height:35; background-color:#ffffff;
				 border:1 solid #f702e7; ">
				
				<input type="button" value="주차" id="C_QnA_parking"
				style="width:16%; height:35; font-family:돋움; background-color:#ffffff;
				 border:1 solid #f702e7; ">
				 
				 <input type="button" value="전시&공연" id="C_QnA_exhibition"
				style="width:16%; height:35; font-family:돋움; background-color:#ffffff;
				 border:1 solid #f702e7; ">
				 
				 <input type="button" value="임대" id="C_QnA_rent"
				style="width:16%; height:35; font-family:돋움; background-color:#ffffff;
				 border:1 solid #f702e7; ">
				 
				 <input type="button" value="시설" id="facility"
				style="width:16%; height:35; font-family:돋움; background-color:#ffffff;
				 border:1 solid #f702e7; ">
				 
				 <input type="button" value="기타" id="etc"
				style="width:16%; height:35; font-family:돋움; background-color:#ffffff;
				 border:1 solid #f702e7; ">
			</div>
			
			<jsp:include page="C_QnA.jsp" ></jsp:include>
			
		</div>
	</div>
	<footer>
		<div class="ui compact menu" style="width: 100%; float: right; ">
			<jsp:include page="../main/I_footer.jsp" ></jsp:include>
		</div>
		</footer>
</body>
</html>