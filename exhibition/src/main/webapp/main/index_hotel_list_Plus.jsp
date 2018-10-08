<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		<div style="width: 400px; display: inline-block; text-align: left; font-size: 25px"><span>숙박</span></div>
		<div style="width: 460px; display: inline-block; text-align: right;"></div>
			<table style="width: 880px; height: 40px;" align="center" border="1"
				bordercolor="#ec008c" cellpadding="2" frame="hsides" rules="rows"
				id="index_hotel_list_PlusList" class="ui striped table">
			</table>
			<br>
			<div id="index_hotel_list_PlusPagingDiv" class="ui center pagination menu"></div>
			<br><br> 
		</div>
		</div>
		<input type="hidden" name="index_keyword" id="index_keyword" value="${index_keyword}">
		<input type="hidden" name="pg" id="pg" value="${pg}"> <br>
<script src="../js/index_hotel_list_Search.js?ver=1" charset="UTF-8"></script>
</body>
</html>