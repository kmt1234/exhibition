<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
selector    : {
  accordion : '.ui.styled.fluid.accordion',
  title     : '.title',
  trigger   : '.title',
  content   : '.content'
}
</style>
</head>
<body>
<div class="ui compact menu" style="width: 930px; height:900px auto;  display: inline-block;" >
<form id="C_QnA_delete" method="post" action="C_QnA_Delete.do">
	<h2 class="box-container"style="float: center; width: 100%; height:126px;  text-align: left;">
		<span>자주묻는</span>
		<span class="h-light">질문</span>
		<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
			<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
			> 고객센터 > 자주묻는 질문 
		</div>
		<div class="ui divider"></div> 
	</h2>
	<div>
		<input type="button" value="위치/교통" id="C_QnA_location"
		style="width:140px; height:35px;
		 border:1 solid #f702e7;" class="ui button QnA">
		
		<input type="button" value="주차" id="C_QnA_parking"
		style="width:140px; height:35px; font-family:돋움;
		 border:1 solid #f702e7; " class="ui button QnA">
		 
		 <input type="button" value="전시/공연" id="C_QnA_exhibition"
		style="width:140px; height:35px; font-family:돋움;
		 border:1 solid #f702e7; " class="ui button QnA">
		 
		 <input type="button" value="임대" id="C_QnA_rent"
		style="width:140px; height:35px; font-family:돋움;
		 border:1 solid #f702e7; " class="ui button QnA">
		 
		 <input type="button" value="시설" id="C_QnA_facility"
		style="width:140px; height:35px; font-family:돋움; 
		 border:1 solid #f702e7; " class="ui button QnA">
		 
		 <input type="button" value="기타" id="C_QnA_etc"
		style="width:140px; height:35px; font-family:돋움; 
		 border:1 solid #f702e7; " class="ui button QnA">
	</div>
	<br>
	<ul>
	</ul>
	<div id="C_QnA_List" style="width: 880px; margin-left: 20px;" class="ui styled fluid accordion"></div>
	<br>
	<div align="left" style="margin-left: 64px;">
		<c:if test="${code=='3' }"> 
			<th style="width: 300px; height: 7%; padding-top: 10px; text-align: center;">
				<input type="checkbox" id="checkAll">
			</th>
		<input class="middle ui button" type="button" style="margin-left: 50px;" value="작성" id="C_QnA_writeBtn">
		<input type="button" class="middle ui button" id="C_QnA_DeleteBtn" value="삭제" >
		<input type="hidden" name="pg" id="pg" value="1">
		</c:if>
	</div>
	<div style="margin-top: 40px;"></div>
</form>
</div>

<input type="hidden" id="hiddenCode" value="${code}">
<script src="../semantic/semantic.min.js"></script>
<script src="../js/C_QnA_js.js?ver=1"></script>

</body>
</html>