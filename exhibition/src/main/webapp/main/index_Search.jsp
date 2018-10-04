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
	color: green;
	text-decoration: underline;
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
		<div style="width: 100%;" align="center" id="index_notice_div">
		<div style="width: 121px; display: inline-block; text-align: left; font-size: 25px"><span>공지 사항</span></div>
		<div style="width: 279px; display: inline-block; text-align: left; font-size: 105x" id="index_notice_total"></div>
		<div style="width: 460px; display: inline-block; text-align: right;"><span id="index_notice_SearchPlusBtn" class="plus">더보기</span></div>
			<table style="width: 880px; height: 40px;" align="center" border="1"
				bordercolor="#ec008c" cellpadding="2" frame="hsides" rules="rows"
				id="index_notice_SearchList" class="ui striped table">
			</table>
			<br>
			<br><br> 
		</div>
		
		<div style="width: 100%;" align="center" id="index_QnA_div">
		<div style="width: 175px; display: inline-block; text-align: left; font-size: 25px"><span>자주 묻는 질문</span></div>
		<div style="width: 225px; display: inline-block; text-align: left; font-size: 105x" id="index_QnA_total"></div>
		<div style="width: 460px; display: inline-block; text-align: right;"><span id="index_QnA_SearchPlusBtn" class="plus">더보기</span></div>
			<table style="width: 880px; height: 40px;" align="center" border="1"
				bordercolor="#ec008c" cellpadding="2" frame="hsides" rules="rows"
				id="index_QnA_SearchList" class="ui striped table">
			</table>
			<br>
			<br><br> 
		</div>
		
		<div style="width: 100%;" align="center" id="index_contactList_div">
		<div style="width: 198px; display: inline-block; text-align: left; font-size: 25px"><span>주요 시설 연락처</span></div>
		<div style="width: 202px; display: inline-block; text-align: left; font-size: 105x" id="index_contactList_total"></div>
		<div style="width: 460px; display: inline-block; text-align: right;"><span id="index_contactList_SearchPlusBtn" class="plus">더보기</span></div>
			<table style="width: 880px; height: 40px;" align="center" border="1"
				bordercolor="#ec008c" cellpadding="2" frame="hsides" rules="rows"
				id="index_contactList_SearchList" class="ui striped table">
			</table>
			<br>
			<br><br>
		</div>
		
		<div style="width: 100%;" align="center" id="index_eventboard_div">
		<div style="width: 90px; display: inline-block; text-align: left; font-size: 25px"><span>박람회</span></div>
		<div style="width: 310px; display: inline-block; text-align: left; font-size: 105x" id="index_eventboard_total"></div>
		<div style="width: 460px; display: inline-block; text-align: right;"><span id="index_eventboard_SearchPlusBtn" class="plus">더보기</span></div>
			<table style="width: 880px; height: 40px;" align="center" border="1"
				bordercolor="#ec008c" cellpadding="2" frame="hsides" rules="rows"
				id="index_eventboard_SearchList" class="ui striped table">
			</table>
			<br>
			<br><br>
		</div>
		
		<div style="width: 100%;" align="center" id="index_eventboard_play_div">
		<div style="width: 67px; display: inline-block; text-align: left; font-size: 25px"><span>연극</span></div>
		<div style="width: 333px; display: inline-block; text-align: left; font-size: 105x" id="index_eventboard_play_total"></div>
		<div style="width: 460px; display: inline-block; text-align: right;"><span id="index_eventboard_play_SearchPlusBtn" class="plus">더보기</span></div>
			<table style="width: 880px; height: 40px;" align="center" border="1"
				bordercolor="#ec008c" cellpadding="2" frame="hsides" rules="rows"
				id="index_eventboard_play_SearchList" class="ui striped table">
			</table>
			<br>
			<br><br>
		</div>
		
		<div style="width: 100%;" align="center" id="index_hotel_list_div">
		<div style="width: 67px; display: inline-block; text-align: left; font-size: 25px"><span>숙박</span></div>
		<div style="width: 333px; display: inline-block; text-align: left; font-size: 105x" id="index_hotel_list_total"></div>
		<div style="width: 460px; display: inline-block; text-align: right;"><span id="index_hotel_list_SearchPlusBtn" class="plus">더보기</span></div>
			<table style="width: 880px; height: 40px;" align="center" border="1"
				bordercolor="#ec008c" cellpadding="2" frame="hsides" rules="rows"
				id="index_hotel_list_SearchList" class="ui striped table">
			</table>
			<br>
			<br><br>
		</div>
		
		<input type="hidden" name="index_keyword" id="index_keyword" value="${index_keyword}">
		<input type="hidden" name="pg" id="pg" value="1"> <br>
		<div style="height: 40px;"></div>
	</div>
</body>
</html>