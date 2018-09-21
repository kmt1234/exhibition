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
</style>
</head>
<body>
	<header>
		<jsp:include page="../main/I_header.jsp"></jsp:include>
	</header>
	<br>
	<br>
	<div class="ui container">
		<!-- 사이드바 메뉴 -->
		<div class="ui compact menu" style="width: 20%; height: 960px; ">
			<a class="item" href="C_notice.do">공지사항</a> 
			<a class="item" href="C_emailConfirm.do">고객의 소리</a> 
			<a class="item" href="C_QnA.do">자주묻는 질문</a>
			<a class="item" href="C_contactList.do">주요시설 연락처</a>
			<c:if test="${code==null  }">
            	<a class="item" href="mypage.do">개인정보</a>
            </c:if>
            <c:if test="${code==null }">
              	<a class="item" href="C_mainImageboardForm.do">게시판 추가</a>
           		<a class="item" href="C_salesExhibitionView.do">매출 현황</a>
           		<a class="item" href="C_memberShib.do">회원리스트</a>
           	</c:if>	
		</div>
		<!-- 메인 화면 -->
		<div class="ui compact menu" style="width: 80%; height: 900px;" >
			<jsp:include page="${display}"></jsp:include>
		</div>
		<!-- footer -->
		<div class="ui compact menu" style="width: 100%; float: right; ">
			<jsp:include page="../main/I_footer.jsp" ></jsp:include>
		</div>
	</div>
</body>
</html>