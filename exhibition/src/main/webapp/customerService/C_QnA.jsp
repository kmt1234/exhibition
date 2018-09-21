<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	자주묻는
	<span class="h-light">질문</span>
</h2>
<div >
	<input type="button" value="위치/교통" id="C_QnA_location"
	style="width:140px; height:35px;
	 border:1 solid #f702e7;" class="ui button QnA">
	
	<input type="button" value="주차" id="C_QnA_parking"
	style="width:140px; height:35px; font-family:돋움;
	 border:1 solid #f702e7; " class="ui button QnA">
	 
	 <input type="button" value="전시&공연" id="C_QnA_exhibition"
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
<div id="C_QnA_List" class="ui styled fluid accordion"></div>
<br>
<div align="left">
	<%-- <c:if test="${code=='3' }">  --%>
		<input class="middle ui button" type="button" value="작성" id="C_QnA_writeBtn">
	<%-- </c:if> --%>
</div>
<script src="../semantic/semantic.min.js"></script>
<script src="../js/C_QnA_js.js?ver=1"></script>

</body>
</html>