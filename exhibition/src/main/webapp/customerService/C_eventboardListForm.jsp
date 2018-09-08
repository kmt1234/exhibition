<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>박람회 보드 리스트</title>

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

#currentEventPaging{
	color: red;
	text-decoration: underline;
	cursor: pointer;
}

#eventpaging{
	color: black;
	text-decoration: none;
	cursor: pointer;
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
		<div class="ui compact menu" style="width: 20%; height: 977px; ">
			<a class="item" href="P_allScheduleForm.jsp">전체일정</a> 
			<a class="item" href="P_performanceScheduleForm.jsp">공연일정</a> 
			<a class="item" href="P_exhibitionScheduleForm.jsp">전시회일정</a>
		</div>
		<!-- 메인 화면 -->
		<div class="ui compact menu" style="width: 80%; height: 900px;" >
			<!-- 타이틀 -->
			<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
				이미지
				<span class="h-light">업로드</span>
			</h2>
			<!-- 버튼 -->
			 <!-- <div>
				<input type="button" value="달력으로 보기" 
				style="width:150; height:35; background-color:#ffffff;
				 border:1 solid #f702e7; float: left">
				
				<input type="button" value="리스트로 보기" 
				style="width:150; height:35; font-family:돋움; background-color:#ffffff;
				 border:1 solid #f702e7; float: left">
			</div> -->
			<br>
			<br>
			
			<!--리스트  -->
			<div>
				<form name="eventboardListForm" id="eventboardListForm"method="post">
					<table id="eventboardListTab" border="1" frame="hsides" rules="rows" cellpadding="3" cellspacing="0">
						<tr>
							<th><input type="checkbox" id="" class="check"></th>
							<th width="100">번호</th>
							<th width="150">이미지</th>
							<th width="100">상품명</th>
							<th width="380">행사 소개</th>
						</tr>
						
						
						
						<c:forEach items="${list }" var="list">
						<tr>
							<td><input type="checkbox" id="" class="check"></td>
							<td>${list.seq}</td>
							<td><img src="../storage/${list.image1}" width="300" height="150"></td>
							<td>${list.imageName}</td>
							<td>${list.eventContent}</td>
						</tr>
						</c:forEach>
						
					</table>
					<div style=" float:left; width:500px" align="center" id="eventPaging">${imageboardPaging.pagingHTML}</div><br>
					
					<div style="float:left;">
						<input type="button" value="선택삭제" id="">
					</div>
					
				</form>
			</div>
			
			
			
		</div>
		<!-- footer -->
		<div class="ui compact menu" style="width: 100%; float: right; ">
			<jsp:include page="../main/I_footer.jsp" ></jsp:include>
		</div>
	</div>
	
</body>
<script>

function eventboardPaging(pg){
	location.href="/exhibition/customerService/C_eventboardListForm.do?pg="+pg
}

</script>
</html>