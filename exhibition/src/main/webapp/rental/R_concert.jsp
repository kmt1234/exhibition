<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>	
#concertHall{
	background-image: url(../img/concert.jpg);
    background-size: 100% 100%;
  	background-repeat: no-repeat;
    height: 760px; 
    width: 90%;
    margin-left:46px;
    position: relative;
}
.line{
	transform:rotate(23deg);
	-ms-transform:rotate(23deg); /* IE 9 */
	-moz-transform:rotate(23deg); /* Firefox */
	-webkit-transform:rotate(23deg); /* Safari and Chrome */
	-o-transform:rotate(23deg); /* Opera */
}
#houseImg{
	margin:-3px;
}
.hallImage{
	display: inline-block;
	width: 120px;
	height: 60px;
	cursor: pointer;
}
.ui.steps{
	align: left;
	font-size: 18px;
	margin-bottom: 15px;
}


.active.step.size{
	width: 450px;
}
ul{
	line-height: 20px;
	display: inline-block;
}
.backColor{
	margin-right:3px;
}
	
</style>
</head>
<body>
<h2 class="box-container" style="float: center; width: 100%; text-align: left; padding-bottom: 0px;">
	공연 
	<span class="h-light">홀</span>
	<div style="font-size:13px; float:right; height: 50px; margin-top:30px">
		<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer; " id="houseImg">
		> 소개 > 공연장 홀
	</div>
	<div class="ui divider"></div>
</h2>
<table style=" width: 40%;">
	<tr>
		<td>
			<button class="middle ui button" style="width: 50%;" id="3F">
				지하1층
			</button> 
		</td>
	</tr>
</table>

<c:if test="${code == '3'}">
<div style="position:absolute; width: 500px; margin-left: 360px; margin-top: 5px;">
	<form id="modifyRateConcertHallForm" action="/exhibition/rental/modifyRateConcertHall.do" method="post">
		<select id="hallNameSel" name="hallNameSel">
			<option value="P_Room1">P_Room1</option>
			<option value="P_Room2">P_Room2</option>
			<option value="P_Room3">P_Room3</option>
			<option value="P_Room4">P_Room4</option>
		</select>
		<input type="text" name="hallRate" id="hallRate">
		<button id="modifyHallRateBtn">평당 가격 수정</button>
	</form>
</div>
</c:if>

<br><br>
	<h2 align="left" style="margin-left: 46px; color: #610170;">
		<i class="camera icon"></i>
			내부 전경
	</h2>
	<div id="concertHall1Div"><img src="../img/concertHall1.PNG" width="90%"></div>
	<div id="concertHall2Div"><img src="../img/concertHall2.PNG" width="90%"></div>
	<div id="concertHall3Div"><img src="../img/concertHall3.PNG" width="90%"></div>
	<div id="concertHall4Div"><img src="../img/concertHall4.PNG" width="90%"></div>
	<div style="padding:7px; background-color:#eee; border:1px solid #dcdcdc; display:inline-block; width:90%">
		<span class="backColor"><img src="../img/concertHall1.PNG" class="hallImage" id="concertHall1"></span>
		<span class="backColor"><img src="../img/concertHall2.PNG" class="hallImage" id="concertHall2"></span>
		<span class="backColor"><img src="../img/concertHall3.PNG" class="hallImage" id="concertHall3"></span>
		<span class="backColor"><img src="../img/concertHall4.PNG" class="hallImage" id="concertHall4"></span>
	</div><br><br>
<!-- 3층 -->
<h2 align="left" style="margin-left: 46px; color: #610170;">
	<i class="book icon"></i>
		부스예약
</h2>
<div id="concertHall" class="ui-widget-content">
	<h4 align="left">select Room</h4>
	<div class="line" id="C_room1" style="position:absolute; left:360px;top:95px;">
		<div id="C_room1" style="font-size: 25px; cursor:pointer; margin-top:30px;">P_Room1</div>
	</div>
	
	<div class="line" style="position:absolute;left:698px;top:250px;" >
		<div style="font-size: 25px; cursor:pointer;margin-top:30px;line-height: 25px">Waiting <br>Room</div>
	</div>
	
	<div id="" style="position:absolute; left:54px;top:605px;" >
		<div id="C_room2" style="font-size: 25px; cursor:pointer; margin-top:30px;">P_Room2</div>
	</div>
	
	<div id="" style="position:absolute; left:348px;top:690px" >
		<div id="C_room3" style="font-size: 25px; cursor:pointer;">P_Room3</div>
	</div>
	
	<div id="" style="position:absolute; left:369px;top:360px" >
		<div class="absol" id="C_room4" style="font-size: 25px; cursor:pointer;">P_Room4</div>
	</div>
   
</div>
<script src="../js/businessRoom.js?ver=1"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="../js/concertHall.js?ver=1"></script>
<script src="../js/introduction.js"></script>
</body>
</html>