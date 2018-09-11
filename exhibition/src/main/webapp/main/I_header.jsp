<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<link rel="stylesheet" type="text/css" href="../semantic/semantic.min.css">


<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
* {
	font-family: 'Nanum Gothic';
}
.column {
   align-self: center;
}
.item {
   text-align: center;
}
#main {
   height: 200px;
}
#mainMenu {
   float: none;
}
.ui.compact.menu {
   display: table;
   width: 20%;
}
.ui.simple.dropdown.item {
   display: table-cell;
   vertical-align: middle;
   text-align: center;
}

.menu {
   text-align: center;
}
#T_inform{
 font-size: 18px;
}


#T_Atag:link {color:black; text-decoration: none;}	<!--일반 링크 검정 -->
#T_Atag:visited {color:black; text-decoration: none;}
#T_Atag:hover {color:black; text-decoration: underline;} <!--마우스 올렸을 때 그린색에 언더바 생성. -->
#T_Atag:active {color:black; text-decoration: none;}
#T_Atag{
 font-color:black;
}

</style>
	<header>
		<div id="main" class="ui three column grid container">
			<div class="column" style="width: 25%; height: 50px;">
				<a href="http://localhost:8080/exhibition/main/index.do"><img alt="" src="../img/logo.jpg"
					style="width: 150px; height: 50px;"></a>
			</div>
			<div class="column" style="width: 49%; padding-top: 100px;">
				<div class="ui input" style="width: 100%;">
					<div class="ui action input"  style="width: 100%; height: 40px;">
						<input type="text" placeholder="Search..." style="width: 30%;">
						<button class="ui icon button">
							<i class="search icon"></i>
						</button>
					</div>
				</div>
			</div>
			
			<div class="column" style="width: 23%; height: 50px; text-align: right; padding-top: 30px;">
			
			<!--회원가입 시, 축하메세지 출력(1분 동안)-->
				<c:if test="${registerMessage != null}">
					<div>${registerMessage}</div>
				</c:if>
				
				<c:if test="${homepageMember == nul}">
					<div>&nbsp;</div>
					<div class="circular ui icon button" id="M_member"><i class="dropdown icon"></i>회원가입
						<div class="ui member1 dropdown">
							<div class="menu" class="info">
								<div class="item" id="M_individual" style="cursor: pointer; display:block;">개인</div>
								<div class="item" id="C_company" style="cursor: pointer;  display:block;">법인</div>
							</div>
						</div>
					</div>
				</c:if>
				
				<c:if test="${homepageMember == nul}">
					<div class="circular ui icon button" id="L_login"><i class="dropdown icon"></i>로그인
						<div class="ui member2 dropdown">
							<div class="menu" class="info1">
								<div class="item" id="M_individual_L" style="cursor: pointer; display:block;">개인</div>
								<div class="item" id="C_company_L" style="cursor: pointer;  display:block;">법인</div>
							</div>
						</div>
					</div>
				</c:if>
			
			<c:if test="${homepageMember != nul}">
				<div align="center" style="text-align: right;">
				<div>${homepageMemberName} 님 접속중입니다</div>
					<div class="circular ui icon button" id="logout">
						<i class="power off icon"></i>로그아웃
					</div>
					<div class="circular ui icon button" id="mypage">
						<i class="user circle icon"></i>마이페이지
					</div>
				</div>
			</c:if>				
				
			</div><!--class="column"-->
		</div><!--id="main"-->
		
		<div class="ui five column grid container">
			<div class="ui compact menu">
				<div class="ui simple dropdown item">
					<span id="P_performanceForm">일정</span>
					<div class="menu">
						<div class="item" id="P_allSchedule">전체일정</div>
						<div class="item" id="P_performanceSchedule">공연일정</div>
						<div class="item" id="P_exhibitionSchedule">전시회일정</div>
					</div>
				</div>
			</div>
			<div class="ui compact menu" style="width: 20%;">
				<div class="ui simple dropdown item">
					<span id="R_rentalForm">시설/임대</span>
					<div class="menu">
						<div class="item" id="R_exhibitionForm">전시회 홀</div>
						<div class="item" id="R_consertForm">공연장 홀</div>
					</div>
				</div>
			</div>
			<div class="ui compact menu" style="width: 20%;">
				<div class="ui simple dropdown item">
					<span id="T_infoForm">교통/숙박/관광</span>
					<div class="menu">
						<div class="item" id="T_allForm">교통안내</div>
						<div class="item" id="T_hotelForm">숙박안내</div>
					</div>
				</div>
			</div>
			<div class="ui compact menu" style="width: 20%;">
				<div class="ui simple dropdown item">
					<span id="C_customerServiceForm" >고객센터</span>
					<div class="menu">
						<div class="item" id="C_notice">공지사항</div>
						<div class="item" id="C_emailConfirmForm">고객의 소리</div>
						<div class="item" id="C_QnAForm">자주묻는 질문</div>
						<div class="item" id="C_contactListForm">주요시설 연락처</div>
						<div class="item" id="C_personalInformation">개인정보</div>
						<div class="item" id="C_boardAdd">게시판 추가</div><!--세션값에 따라 보이게 할 예정-->
					</div>
				</div>
			</div>
			<div class="ui compact menu" style="width: 20%;">
				<div class="ui simple dropdown item">
					<span id="I_infoForm">소개</span> 
					<div class="menu">
						<div class="item" id="I_companyIntroductionForm">회사소개</div>
						<div class="item" id="I_CEOIntroductionForm">CEO인사말</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	
<!--개인회원 회원가입 양식 페이지 인클루드-->
<jsp:include page="../member/writeForm.jsp"/>
<!--기업회원 회원가입 양식 페이지 인클루드  -->
<jsp:include page="../company/writeForm.jsp"/>
<!--개인회원 로그인 양식 페이지 인클루드  -->
<jsp:include page="../login/memberLoginForm.jsp"/>
<!--법인회원 로그인 양식 페이지 인클루드  -->
<jsp:include page="../login/companyLoginForm.jsp"/>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="../semantic/semantic.min.js"></script>
<script src="../js/index.js" charset="UTF-8"></script>  <!--  -->
<script src="../js/member.js" charset="UTF-8"></script> <!--  -->
<script src="../js/company.js" charset="UTF-8"></script><!--  -->
<script src="../js/login.js" charset="UTF-8"></script>	<!--  -->
<script src="../js/post.js" charset="UTF-8"></script>	<!--  -->

