<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
</head>
<style>
body {
	margin: 40px 10px;
	font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
	font-size: 14px;
}
#currentPaging{
	color: red;
	text-decoration: none;
	cursor: pointer;
}
#paging{
	color: black;
	text-decoration: none;
	cursor: pointer;
}
div{
 	border: 1px solid;
}

</style>
<body>
<!-- 메인 화면 -->
<h2 class="box-container"  style="float: left; width:100%; text-align: left;">
	<span>전체 </span>
	<span class="h-light">일정</span>
	<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
		<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
		> 일정 > 전체일정
	</div>
	<div class="ui divider"></div> 
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
	<div style="margin-left: 20px;">
		<table>
			<tr>
				<td>
					<button class="middle ui button" style="width: 150px;" id="P_allLsintBtn_Prev">
						◀이전 행사 리스트(3개월)
					</button> 
				</td>
				<td>
					<button class="middle ui button" style="width: 150px;" id="P_allLsintBtn_Now">
						이번달 행사 리스트
					</button> 
				</td>
				<td>
					<button class="middle ui button" style="width: 150px;" id="P_allLsintBtn_After">
						이후 행사 리스트(3개월)▶
					</button> 
				</td>
			</tr>
		</table>
	</div><br>
	<!-- 전체일정 리스트 -->
	
		<!-- <form name="AllCalendarListForm" id="AllCalendarListForm" method="post"> -->
			<div style="margin-left:115px; width: 700px; border-top: 1px solid; border-bottom: 1px solid;">
				<div>
					<c:if test="${listSize eq '0'}">	
						<div>
							<p>현재 계획된 일정이 없습니다</p>
						</div>
					</c:if>			
					<c:forEach items="${list}" var="list">		
					<div>
					<div style="display: inline-block; float: left;">
						<a target="event_blank" href="${list.eventLink}"><img class="event_img" src="../storage/${list.image1}" width="150px;" height="150px;"></a>
					</div>
					<div style="display: inline-block; float: left; width: 520px;">
						<h2>
							<c:if test="${list.postSelect eq '1'}">박람회</c:if>
							<c:if test="${list.postSelect eq '2'}">공연</c:if>
						</h2> 
					</div>
					<div style="display: inline-block; float:left; width: 260px; height:37px; ">
						<div ><span style="border: 1px solid;">제 목</span></div>
					</div>
					<div style="display: inline-block; float:left; width: 260px; height:37px; ">
						<div><span>${list.imageName}</span></div>
					</div>
					<div style="display: inline-block; float:left; width: 260px; height:37px;">
						<div style="border: 1px solid;">정 보</div>
					</div>
					<div style="display: inline-block; float:left; width: 260px; height:37px; ">
						<div >${list.eventContent}</div>
					</div>
					<div style="display: inline-block; float:left; width: 260px; height:37px;">
						<div>일 시</div>
					</div>
					<div style="display: inline-block; float:left; width: 260px; height:37px; ">
						<div ><span>${list.startDate}</span> ~ <span>${list.endDate}</span></div>
					</div>
					<div style="display: inline-block; float:left; width: 260px; height:37px;">
						<div >링 크</div>
					</div>
					<div style="display: inline-block; float:left; width: 260px; height:37px; ">
						<div ><span><a target="_blank" href="${list.eventLink}">홈페이지 방문</a></span></div>
					</div>
					</div>
				</c:forEach>
			</div>
		</div>	
			<%-- <br><div align="center">${performancePaging.pagingHTML}</div><br> --%>
		<!-- </form> -->

<script>
function performancePaging(pg){
	location.href="/exhibition/performance/P_allScheduleList.do?pg="+pg;
}
</script>
</body>

</html>