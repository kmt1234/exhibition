<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

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
	<div style="margin-top: 20px; min-width:1170px; border: 1px solid; position: relative;   ">
		<jsp:include page="../main/I_header.jsp"/>
	</div>
</header>
	<div style="margin-top: 5px; min-width:1170px; position: relative;  border: 1px solid;  " class="ui container" >
		<!-- 사이드바 메뉴 -->
		<div class="ui compact menu" style="width:230px ; height:900px auto; ">
			<div style="display: inline-block;">
				<a class="item" style="width: 230px;" href="R_rentalForm.do">시설임대</a>
				<a class="item" href="R_exhibition.do">박람회홀</a> 
				<a class="item" href="R_performance.do">공연장홀</a> 
				<a class="item" href="R_businessRoom.do">비즈니스룸</a> 
			</div>
		</div>
		<!-- 메인 화면 -->
		<div class="ui compact menu" style="width: 930px; height:900px auto;  display: inline-block;" >
			<jsp:include page="${display }" />
		</div>
	</div>
	<div class="ui container" style="margin-top: 20px; min-width:1170px; position: relative; ">
		<jsp:include page="../main/I_footer.jsp" />
	</div>

</body>
</html>