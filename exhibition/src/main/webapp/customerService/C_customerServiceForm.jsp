<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<div class="ui compact menu" id="slidbar" style="display: inline-block;">
				<a class="item" style="border: none; width: 227px;" href="/exhibition/customerService/C_notice.do">공지사항</a> 
				<a class="item" href="/exhibition/customerService/C_emailConfirm.do">고객의 소리</a> 
				<a class="item" href="/exhibition/customerService/C_QnA.do?classify=위치/교통">자주묻는 질문</a>
				<a class="item" href="/exhibition/customerService/C_contactList.do">주요시설 연락처</a>
			<c:if test="${code == '1' || code == '2' || code =='3' }">
            	<a class="item" href="/exhibition/login/mypage.do">마이페이지</a>
            </c:if>
            <c:if test="${code == '3' }">
              	<a class="item" href="/exhibition/customerService/C_mainImageboardForm.do?postSelect=0">게시판 추가</a>
           		<a class="item" href="/exhibition/customerService/C_salesExhibitionView.do">매출 현황</a>
           		<a class="item" href="/exhibition/customerService/C_memberShib.do">회원리스트</a>
           	</c:if>	
		</div>
		</div>
		<!-- 메인 화면 -->
		<div class="ui compact menu" style="width: 930px; min-height:900px auto;  display: inline-block;" >
			<jsp:include page="${display}"></jsp:include>
		</div>
	</div>
	<!-- footer -->
<footer>
	<div class="ui container" style="margin-top: 20px; min-width:1170px; position: relative; ">
		<jsp:include page="../main/I_footer.jsp" ></jsp:include>
	</div>
</footer>
<script src="../js/slidbar.js"></script>
<script src="../js/companyMypage.js?ver=1"></script>
<script src="../js/introduction.js"></script>
</body>
</html>