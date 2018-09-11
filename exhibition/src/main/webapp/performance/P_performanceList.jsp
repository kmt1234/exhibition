<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>연극 일정 리스트</title>

<style>

#currentPaging{
	color: red;
	text-decoration: underline;
	cursor: pointer;
}

#paging{
	color: black;
	text-decoration: none;
	cursor: pointer;
}


</style>


</head>
<body>
	<!-- 메인 화면 -->
	<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
		공연
		<span class="h-light">일정</span>
	</h2>
	<!-- 버튼 -->
	<div>
		<input type="button" id="calendar_play" value="달력으로 보기" 
			style="width:150; height:35; background-color:#ffffff;
		 border:1 solid #f702e7; float: left">
		<input type="button" id="list_play" value="리스트로 보기" 
			style="width:150; height:35; font-family:돋움; background-color:#ffffff;
		 	border:1 solid #f702e7; float: left">
		 <span style="float: right;">
		 <img src="../img/Ex.png" style="width:25px; height: 25px; " align='absmiddle'> 전시회
		 </span>
		 
		 <span style="float: right;">
		 	<img src="../img/Ev.png" style="width:25px; height: 25px;" align='absmiddle'> 공연  &ensp;&ensp;
		 </span>
	</div>
		<br>
		<br>
	<!--공연 리스트 -->
	<div>
		<form name="performanceList" id="performanceList" method="post">
			<table border="1" frame="hsides" rules="rows" cellpadding="3" cellspacing="0">
				<tr>
					<th>번호</th>
					<th>이미지</th>
					<th>연극명</th>
					<th>소 개</th>
				</tr>
				
				<!--등록된 연극 정보가 없을 때  -->								
				<c:if test="${listSize eq '0'}">	
					<tr>
						<td colspan="5" align="center">현재 등록된 연극 정보가 없습니다</td>
					</tr>
					
				</c:if>
				
				<c:forEach items="${list}" var="list">		
					<tr>
						<td>${list.seq}</td>
						<td><img src="../storage/${list.image1}" width="100" height="100"></td>
						<td>${list.imageName}</td>
						<td>${list.eventContent}</td>
					</tr>
				</c:forEach>
				
			</table>
			<div style=" float:left; width:500px" align="center" id="">${performancePaging.pagingHTML}</div><br>
			
		</form>
	</div>	
</body>
<script>
/*페이징 */
function performancePaging(pg){
	location.href="/exhibition/performance/P_performanceList.do?pg="+pg;
}
</script>
<script src="../js/p_performanceList.js"></script>
</html>