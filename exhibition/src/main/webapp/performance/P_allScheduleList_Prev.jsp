<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
body {
	margin: 40px 10px;
	font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
	font-size: 14px;
}
#calendar {
	max-width: 880px;
	margin: 0 auto;
}
#currentPaging{
	color: red;
	text-decoration: none;
	cursor: pointer;
}
#sub-high{
	color:#999999;
	font-size:23px;
}
#paging{
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
<body>
	<!-- 메인 화면 -->
	<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
		전체
		<span class="h-light">일정</span>
		<span id="sub-high">- 3개월 이전 행사 리스트</span>
	</h2>
	<!-- 버튼 -->
	<div>
		<table style="margin-left:20px; width: 40%;">
			<tr>
				<td>
					<button class="middle ui button" style="width: 100%;" id="P_allCalendarBtn">
						달력으로 보기
					</button> 
				</td>
				<td>
					<button class="middle ui button" style="width: 100%;" id="P_allLsintBtn">
						리스트로 보기
					</button> 
				</td>
			</tr>
		</table>
	</div>
<br><br>
		<div align="center">
		<table style="align:center; width: 70%;">
			<tr>
				<td>
					<button class="ui inverted pink button" style="width: 100%;" id="P_allLsintBtn_Prev">
						◀이전 행사 리스트(3개월)
					</button> 
				</td>
				<td>
					<button class="ui inverted pink button" style="width: 100%;" id="P_allLsintBtn_Now">
						이번달 행사 리스트
					</button> 
				</td>
				<td>
					<button class="ui inverted pink button" style="width: 100%;" id="P_allLsintBtn_After">
						이후 행사 리스트(3개월)▶
					</button> 
				</td>
			</tr>
		</table>
	</div><br>
	<!-- 전체일정 리스트 -->
	<div align="center" style="margin-left:20px; width: 880px;">
		<form name="AllCalendarList_PrevForm" id="AllCalendarList_PrevForm" method="post">
			<table  frame="hsides" border="1px" cellpadding="3" cellspacing="0" width="100%"><!-- rules="rows" -->
				<tr>
					<th class="event_performanceTh" width="250px"  style="background-color: #FF99FF;">이미지</th>
					<th class="event_performanceTh" colspan="2" style="background-color: #FF99FF;">행사  정보</th>
				</tr>
				<!--등록된 정보가 없을 때  -->								
				<c:if test="${listSize eq '0'}">	
					<tr>
						<td colspan="3" align="center">3개월 이전 행사는 없습니다</td>
					</tr>
				</c:if>			
				<c:forEach items="${list}" var="list">		
					<tr>
						<td rowspan="5"><a target="event_blank" href="${list.eventLink}"><img class="event_img" src="../storage/${list.image1}" width="200px" height="250px"></a></td>
						<td colspan="2" width="60px" align="left">
							<c:if test="${list.postSelect eq '1'}">박람회</c:if>
							<c:if test="${list.postSelect eq '2'}">공연</c:if>
						</td>
					</tr>
					
					<tr>
						<td align="center"><span class="event_Title_content">제 목</span></td>
						<td><pre>${list.imageName}</pre></td>
					</tr>
					<tr>
						<td align="center">정 보</td>
						<td><pre>${list.eventContent}</pre></td>
					</tr>
					<tr>
						<td align="center">일 시</td>
						<td><span>${list.startDate}</span> ~ <span>${list.endDate}</span></td>
					</tr>
					<tr>
						<td align="center">링 크</td>
						<td><span><a target="_blank" href="${list.eventLink}">홈페이지 방문</a></span></td>
					</tr>
				</c:forEach>
			</table>	
			<br><div align="center">${performancePaging.pagingHTML}</div><br>
		</form>
	</div>
<script>
function performancePaging(pg){
	location.href="/exhibition/performance/P_allScheduleList_Prev.do?pg="+pg;
}
</script>
</body>
</html>