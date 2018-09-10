<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.B:link {color:black; text-decoration: none;}	<!--일반 링크 검정 -->
.B:visited {color:green; text-decoration: none;}
.B:hover {color:green; text-decoration: underline;} <!--마우스 올렸을 때 그린색에 언더바 생성. -->
.B:active {color:black; text-decoration: none;}
.B{
 cursor: pointer;
}

</style>

<script src="../js/trafficParking.js"></script>
</head>
<body>
<br><br>
<div id="parkingDiv" align="left">
&ensp;&ensp;주차장 층을 선택 해 주세요
<div style="background-color: #e8e8e8;">
&ensp;&ensp;<span id="B1" class="B">B1</span>
&ensp;&ensp;|
&ensp;&ensp;<span id="B2" class="B">B2</span>
</div>
</div>
<div id="T_parkingB1Map">
	<jsp:include page="T_parkingB1.jsp"/>
</div>
<div id="T_parkingB2Map">
	<jsp:include page="T_parkingB2.jsp"/>
</div>

</body>
</html>