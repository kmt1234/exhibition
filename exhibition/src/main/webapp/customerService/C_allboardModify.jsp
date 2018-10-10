<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"><!--달력 ui-->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css"><!--시간 ui-->
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
				<a class="item" style="border: none; width: 227px;" href="C_notice.do">공지사항</a> 
				<a class="item" href="C_emailConfirm.do">고객의 소리</a> 
				<a class="item" href="C_QnA.do">자주묻는 질문</a>
				<a class="item" href="C_contactList.do">주요시설 연락처</a>
			<c:if test="${code == '1' || code == '2' }">
            	<a class="item" href="/exhibition/login/mypage.do">마이페이지</a>
            </c:if>
            <c:if test="${code == '3' }">
              	<a class="item" href="C_mainImageboardForm.do?postSelect=0">게시판 추가</a>
           		<a class="item" href="C_salesExhibitionView.do">매출 현황</a>
           		<a class="item" href="C_memberShib.do">회원리스트</a>
           	</c:if>	
			</div>
		</div>
		<!-- 메인 화면 -->
		<div class="ui compact menu" style="width: 930px; min-height:900px auto;  display: inline-block;" >
			<jsp:include page="${display }"/>
		</div>
	</div>
<!-- footer -->
<div class="ui container" style="margin-top: 20px; min-width:1170px; position: relative; ">
	<jsp:include page="../main/I_footer.jsp" ></jsp:include>
</div>
<script src="../js/slidbar.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script><!-- 시간 -->
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script><!--달력-->	
</body>
</html>