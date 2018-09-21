<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>연극 일정 리스트</title>

<style>

pre{
	margin : 2%;
}

.performanceTh {
    width: 61%;
}

.play_img{
	margin-left: 0%;
}

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
		 <button id="prevEvent">이전 공연(3개월)</button>
		 <button id="currEvent">이번달 공연</button>
		 <button id="nextEvent">다음 공연(3개월)</button>	
	</div>
		<br>
		<br>
	<!--공연 리스트 -->
	<div align="center">
		<form name="performanceList" id="performanceList" method="post">
			<table border="1"  cellpadding="3" cellspacing="0" frame="hsides" rules="rows">
				<tr>
					<th class="performanceTh">이미지</th>
					<th class="performanceTh" colspan="2">공연 정보</th>
				</tr>
				
				<!--등록된 연극 정보가 없을 때  -->								
				<c:if test="${listSize eq '0'}">	
					<tr>
						<td colspan="5" align="center">현재 등록된 공연 정보가 없습니다</td>
					</tr>
					
				</c:if>
				
				<c:forEach items="${list}" var="list">	
					<tr><td>${list.seq}</td></tr>
					<tr>
						<td rowspan="5"><a target="_blank" href="${list.eventLink}"><img class="play_img" src="../storage/${list.image1}" width="300px" height="350px"></a></td>
						
						<td width="200px"><div>제 목</div></td>
						<td><span class="play_Title_content">${list.imageName}</span></td>
					</tr>
					<tr>
						<td>공연 정보</td>
						<td><pre>${list.eventContent}</pre></td>
					</tr>
					<tr>
						<td>일 시</td>
						<td><span>${list.startDate}</span> ~ <span>${list.endDate}</span></td>
					</tr>
					<tr>
						<td>링 크</td>
						<td><span><a target="_blank" href="${list.eventLink}">홈페이지 방문</a></span></td>
					</tr>
					<tr>
						<td colspan="2"><div align="left"><input type="button" class="performance_bookBtn" value="예약하기"></div></td>
					</tr>
					
					
				</c:forEach>
				
			</table>
			<div align="center">${performancePaging.pagingHTML}</div><br>
			
		</form>
	</div>	
</body>
<script>
/*페이징 */
function performancePaging(pg){
	location.href="/exhibition/performance/P_performanceList.do?pg="+pg;
}

/*3개월 다음 공연 페이징 */
function performanceNextPaging(pg){
	location.href="/exhibition/performance/P_next_performanceList.do?pg="+pg;
}

/*3개월 이전 공연 페이징 */
function performancePrevPaging(pg){
	location.href="/exhibition/performance/P_prev_performanceList.do?pg="+pg;
}

</script>
<script src="../js/p_performanceList.js"></script>
</html>