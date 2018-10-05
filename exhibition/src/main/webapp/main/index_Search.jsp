<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#subjectA:link {
	color: black;
	text-decoration: none;
}
#subjectA:visited {
	color: black;
	text-decoration: none;
}
#subjectA:hover {
	font-weight: bold;
	cursor: pointer;
}
#subjectA:active {
	color: black;
	text-decoration: none;
}
#currentPaging {
	color: red;
	text-decoration: underline;
	cursor: pointer;
}

#paging {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.contentC {
	display : block;
	width : 200px; 
	overflow: hidden;  
	white-space: nowrap;  
	text-overflow  : ellipsis;
}

.plus:hover{
	color: black;
	text-decoration: underline;
	font-weight: bold;
	cursor: pointer;
	
}
#eventboard_name:hover{
	color: green;
	text-decoration: underline;
	font-weight: bold;
	cursor: pointer;
}
#eventboard_image:hover{
	cursor: pointer;
}
#eventboard_play_name:hover{
	color: green;
	text-decoration: underline;
	font-weight: bold;
	cursor: pointer;
}

#eventboard_play_image:hover{
	cursor: pointer;
}
#hotel_image:hover{
	cursor: pointer;
}
#link:hover{
	color: green;
	cursor: pointer;
}
/* 작업중  */
/* 큰제목 */
.index_Search_title{
	width: auto; 
	margin-left:-20px; 
	display: inline-block;
	text-align: left; 
	font-size: 25px
}
/* 제목사이 공간띄우기 */
.space_border{
	width:885px; 
	margin-left:20px; 
	margin-top: 40px; 
	margin-bottom:40px; 
	border-top:1px ridge rgb(155,155,155,.6);
}
/* 몇건인지 확인 */
.totalCount{
	display: inline-block;
	text-align: left; 
	font-size: 105x
}
.aaa{
	color : #4169E1;
	font-weight: 800;
}
</style>
</head>
<body>
	<!-- 타이틀 -->
	<div class="ui compact menu" style="width: 930px; height:900px auto;  display: inline-block;" >
		<h2 class="box-container"
			style="float: center; width: 100%; height:126px;  text-align: left;">
			통합 <span class="h-light">검색</span>
			<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
					<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
					> 통합 검색
			</div>
			<div class="ui divider"></div> 
		</h2>
		<!--공지사항-->
		<div style="width: 100%;" align="center" id="index_notice_div">
			<div class="index_Search_title"><span>공지 사항</span></div>
			<div class="totalCount" id="index_notice_total" style="width: 279px;"></div>
			<div style="width: 465px; display: inline-block; text-align: right;"><span id="index_notice_SearchPlusBtn" class="plus">더보기</span></div>
			<div id="index_notice_SearchList" style="width: 885px; height: auto; align:center;"  ></div>
		</div>
		<div class="space_border"></div>
		
		<!-- 자주묻는질문  -->
		<div style="width: 100%;" align="center" id="index_QnA_div">
			<div class="index_Search_title" ><span>자주 묻는 질문</span></div>
			<div class="totalCount" id="index_QnA_total" style="width: 225px;"></div>
			<div style="width: 460px; display: inline-block; text-align: right;"><span id="index_QnA_SearchPlusBtn" class="plus">더보기</span></div>
			<div style="width: 885px; height: auto; align:center;" id="index_QnA_SearchList"></div>
		</div>
		<div class="space_border"></div>
		
		<!-- 주요시설연락처 -->
		<div style="width: 100%;" align="center" id="index_contactList_div">
			<div class="index_Search_title"><span>주요 시설 연락처</span></div>
			<div class="totalCount" id="index_contactList_total" style="width: 202px;" ></div>
			<div style="width: 460px; display: inline-block; text-align: right;"><span id="index_contactList_SearchPlusBtn" class="plus">더보기</span></div>
			<div style="width: 885px; height: auto; align:center;" id="index_contactList_SearchList"></div>
		</div>
		<div class="space_border"></div>
		
		<!-- 박람회 -->
		<div style="width: 100%;" align="center" id="index_eventboard_div">
			<div class="index_Search_title"><span>박람회</span></div>
			<div class="totalCount" id="index_eventboard_total" style="width: 310px;" ></div>
			<div style="width: 460px; display: inline-block; text-align: right;"><span id="index_eventboard_SearchPlusBtn" class="plus">더보기</span></div>
			<div style="width: 885px; height: auto; align:center;" id="index_eventboard_SearchList" ></div>
		</div>
		<div class="space_border"></div>
		
		<!-- 연극  -->
		<div style="width: 100%;" align="center" id="index_eventboard_play_div">
			<div class="index_Search_title"><span>연극</span></div>
			<div class="totalCount"  id="index_eventboard_play_total" style="width: 333px;" ></div>
			<div style="width: 460px; display: inline-block; text-align: right;"><span id="index_eventboard_play_SearchPlusBtn" class="plus">더보기</span></div>
			<div style="width: 885px; height: auto; align:center;" id="index_eventboard_play_SearchList"></div>
		</div>
		<div class="space_border"></div>
		
		<!-- 숙박 -->
		<div style="width: 100%;" align="center" id="index_hotel_list_div">
			<div class="index_Search_title" ><span>숙박</span></div>
			<div class="totalCount" id="index_hotel_list_total" style="width: 333px;"></div>
			<div style="width: 460px; display: inline-block; text-align: right;"><span id="index_hotel_list_SearchPlusBtn" class="plus">더보기</span></div>
			<div style="width: 885px; height: auto; align:center;" id="index_hotel_list_SearchList" ></div>
		</div>
		<div class="space_border"></div>
		
		<!--값을 넘겨주기 윈한것  -->
		<input type="hidden" name="index_keyword" id="index_keyword" value="${index_keyword}">
		<input type="hidden" name="pg" id="pg" value="1"> <br>
	</div>
</body>
</html>