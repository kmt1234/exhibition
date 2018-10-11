<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#subjectA:link{color:black; text-decoration: none;}
#subjectA:visited{color:black; text-decoration: none;}
#subjectA:hover{color:green; text-decoration: underline; font-weight: bold; cursor: pointer;}
#subjectA:active{color:black; text-decoration: none;}

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
<div class="ui compact menu" style="width: 930px; height:900px auto;  display: inline-block;" >
	<h2 class="box-container"style="float: center; width: 100%; height:126px;  text-align: left;">
		<span>주요시설</span>
		<span class="h-light">연락처</span>
		<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
			<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
			> 고객센터 > 주요시설 연락처 
		</div>
		<div class="ui divider"></div> 
	</h2>
<div style="width: 880px; margin-left: 20px;" align="center">
	<table style="width: 100%; height: 40px; " align="center" border="1" bordercolor="#ec008c" cellpadding="4" frame="hsides" rules="rows"
		id="C_contactList_List" class="ui striped table" >
			<tr>
				 <c:if test="${code=='3' }"> 
				<th style="width: 2%; height: 7%; padding-top: 10px; text-align: center;">
					<input type="checkbox" id="checkAll">
				</th>
			</c:if>
				<th style="width: 172px; height: auto; padding-top: 10px; text-align: center;">분류</th>
				<th style="width: 172px; height: auto; padding-top: 10px; text-align: center;">기관 & 시설</th>
				<th style="width: 172px; height: auto; padding-top: 10px; text-align: center;">명칭</th>
				<th style="width: 172px; height: auto; padding-top: 10px; text-align: center;">담당자</th>
				<th style="width: 156px; height: auto; padding-top: 10px; text-align: center;">연락처</th>
			</tr>
	</table>
	<br>
	<div id="C_contactList_PagingDiv" class="ui center pagination menu"></div>
	<input type="hidden" name="pg" id="pg" value="${pg}">
	<br><br>

	<select class="ui selection dropdown" id="searchOption">
			<option value="facility">기관&시설</option>
			<option value="name">담당자</option>
	</select>

	<div class="ui input" style="width: 40%;">
		<input type="text" name="keyword" id="keyword" value="${keyword }">
	</div>
		<input type="button" class="middle ui button"  value="검색" id="C_contactList_SearchBtn">
		<c:if test="${code=='3' }"> 
			<input type="button" class="middle ui button" id="C_contactList_WriteBtn" value="관리자 작성" >
			<input type="button" class="middle ui button" id="C_contactList_DeleteBtn" value="삭제" >
		</c:if>

</div>
<div style="margin-top: 40px;"></div> 
</div>
<input type="hidden" id="hiddenCode" value="${code}">
<script src="../js/C_contactList_js.js?ver=1"></script>

</body>
</html>