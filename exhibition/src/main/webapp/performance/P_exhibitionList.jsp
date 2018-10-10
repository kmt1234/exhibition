<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/P_allScheduleList.css" ><!-- 리스트보기 -->
<style>
.performanceTh {
    width: 61%;
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
<h2 class="box-container"  style="float: left; width:100%; text-align: left;">
	<span>박람회 </span>
	<span class="h-light">일정</span>
	<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
		<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
		> 일정 > 박람회일정 > 목록
	</div>
	<div class="ui divider"></div> 
</h2>
<!-- 버튼 -->
<div>
	<table style="margin-left:20px; width: 40%;">
		<tr>
			<td>
				<button class="middle ui button" style="width: 100%;" id="P_exhibitionCalendarBtn">
					달력으로 보기
				</button> 
			</td>
			<td>
				<button class="middle ui button" style="width: 100%;" id="list_exhibition">
					리스트로 보기
				</button> 
			</td>
		</tr>
	</table>
</div>
	<br><br>	
	<div style="width: 880px; display: inline-block; text-align: left;">
		<div style="width: 100px; display: inline-block;">
			<p id="prevEvent">◀지난 리스트	</p> 
		</div>
			<div style="width: 100px; display: inline-block; ">
			<p id="currEvent">이달 리스트</p> 
		</div>
			<div style="width: 100px; display: inline-block; ">
			<p id="nextEvent">예정 리스트▶</a> 
		</div>
	</div><br>
	<!--전시회 리스트 -->
	<div style="margin-left:20px; margin-top:10px; width: 880px; ">
		<!--등록된 연극 정보가 없을 때  -->								
		<c:if test="${listSize eq '0'}">	
			<div>
				<p>현재 등록된 박람회 정보가 없습니다</p>
			</div>
		</c:if>
		<c:forEach items="${list}" var="list">		
			<div  style="width:auto;height:auto; border-top:1px ridge rgb(155,155,155,.6); display: inline-block;">
				<input type="hidden" id="seqId" value="${list.seq }">
				<div style="display: inline-block; float:left; width: 880px; height:20px; "></div>
				<div style="display: inline-block; float: left; border: 1px ridge rgb(155,155,155,.6);">
					<a target="_blank" href="${list.eventLink}"><img class="play_img" src="../storage/${list.image1}" width="200px" height="200px"></a></td>
				</div>
				<div style="display: inline-block; float: left; width: 650px; height:40px; margin-left:20px; margin-top:10px; text-align: left; font-size: 14pt">	
					${list.imageName}
				</div>
				<div class="from">
					<div class="content">박람회 정보</div>
				</div>
				<div class="from1">
					<div class="content1">${list.eventContent}</div>
				</div>
				<div class="from">
					<div class="content">일 시</div>
				</div>
				<div class="from1">
					<div class="content1"><span>${list.startDate}</span> ~ <span>${list.endDate}</span></div>
				</div>
				<div class="from">
					<div class="content">사이트</div>
				</div>
				<div class="from1">
					<div class="content1"><a target="_blank" href="${list.eventLink}">${list.eventLink}</a></div>
				</div>
				<div style="float: left; margin-left: 20px;">
					<button class="middle ui button exhibitionBookBtn" >예약하기</button>
				</div>
				
			</div>
		</c:forEach>
		<div align="center">${performancePaging.pagingHTML}</div><br>
	</div>	
</body>
<script>
/*페이징 */
function performancePaging_exhibition(pg){
	location.href="/exhibition/performance/P_exhibitionList.do?pg="+pg;
}
/*3개월 다음 전시회 페이징 */
function exhibitionNextPaging(pg){
	location.href="/exhibition/performance/P_next_exhibitionList.do?pg="+pg;
}

/*3개월 이전 전시회 페이징 */
function exhibitionPrevPaging(pg){
	location.href="/exhibition/performance/P_prev_exhibitionList.do?pg="+pg;
}

</script>
<script src="../js/p_exhibitionList.js"></script>
</html>