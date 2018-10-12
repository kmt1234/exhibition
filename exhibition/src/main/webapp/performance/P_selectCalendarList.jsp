<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/P_allScheduleList.css" ><!-- 리스트보기 -->
</head>
<body>
<!-- 메인 화면 -->
<h2 class="box-container"  style="float: left; width:100%; text-align: left;">
	<span>전체 </span>
	<span class="h-light">일정</span>
	<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
		<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
		> 일정 > 전체일정 > 목록
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
	<div style="width: 880px; display: inline-block; text-align: left;">
		<h2>
			${date}
		</h2>
	</div><br>
	<!-- 전체일정 리스트 -->
	<div style="margin-left:20px; margin-top:10px; width: 880px; ">
		<c:if test="${listSize eq '0'}">	
			<div>
				<p>현재 계획된 일정이 없습니다</p>
			</div>
		</c:if>			
		<c:forEach items="${list}" var="list">		
		<div  style="width:auto;height:auto; border-top:1px ridge rgb(155,155,155,.6); display: inline-block;">
			<div style="display: inline-block; float:left; width: 880px; height:20px; "></div>
			<div style="display: inline-block; float: left; border: 1px ridge rgb(155,155,155,.6);">
				<a target="event_blank" href="${list.eventLink}"><img class="event_img" src="../storage/${list.image1}" width="200px;" height="200px;"></a>
			</div>
			<div style="display: inline-block; float: left; width: 650px; height:40px; margin-left:20px; margin-top:10px; text-align: left; font-size: 14pt">
				<div >
					<c:if test="${list.postSelect eq '1'}">박람회</c:if>
					<c:if test="${list.postSelect eq '2'}">공연</c:if>
				</div> 
			</div>
			<div class="from">
				<div class="content">제 목 </div>
			</div>
			<div class="from1">
				<div class="content1">${list.imageName}</div>
			</div>
			<div class="from">
				<div class="content" >정 보 </div>
			</div>
			<div class="from1">
				<div class="content1">${list.eventContent}</div>
			</div>
			<div class="from">
				<div class="content" >일 시  </div>
			</div>
			<div class="from1">
				<div class="content1"><span>${list.startDate}</span> ~ <span>${list.endDate}</span></div>
			</div>
			<div class="from">
				<div class="content">사이트 </div>
			</div>
			<div class="from1">
				<div class="content1"><a target="_blank" href="${list.eventLink}">${list.eventLink}</a></div>
			</div>
			<div style="display: inline-block; float:left; width: 880px; height:20px; "></div>
		</div>
		</c:forEach>
	</div>	
<div style="margin:20px; width:880px; " align="center">${performancePaging.pagingHTML}</div>
<script>
function performancePaging(pg){
	location.href="/exhibition/performance/P_selectScheduleList.do?pg="+pg;
}
</script>
<script src='../js/introduction.js'></script>
</body>
</html>