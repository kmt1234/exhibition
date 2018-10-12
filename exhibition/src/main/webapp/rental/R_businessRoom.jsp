<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>	
#exhibition3F{
	background-image: url(../img/businessRoom.jpg);
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
	비즈니스 
	<span class="h-light">룸</span>
	<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
		<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer; " id="houseImg">
		> 소개 > 비즈니스 룸
	</div>
	<div class="ui divider"></div>
</h2>
<div id="Layer1" style="position:absolute; left:237px; top:140px; width:164px; height:104px; z-index:1">
<table style="width: 50%; display: inline-block;">
	<tr>
		<td>
			<button class="middle ui button" style="width: 180px;" id="3F">
				3층
			</button> 
		</td>
	</tr>
</table>
</div>

<c:if test="${code == '3'}">
<div style="position:absolute; width: 500px; margin-left: 180px; margin-top: 5px;">
	<form id="modifyRateBusinessRoomForm" action="/exhibition/rental/modifyRateBusinessRoom.do" method="post">
		<select id="roomNameSel" name="roomNameSel">
			<option value="Room1">Room1</option>
			<option value="Room2">Room2</option>
			<option value="Room3">Room3</option>
			<option value="Room4">Room4</option>
			<option value="Room5">Room5</option>
			<option value="Room6">Room6</option>
		</select>
		<input type="text" name="roomRate" id="roomRate">
		<button type="button" id="modifyRoomRateBtn">방 별 가격 수정</button>
	</form>
</div>
</c:if>

<br><br>
<h2 align="left" style="margin-left: 46px; color: #610170;">
	<i class="camera icon"></i>
		내부 전경
</h2>
<div id="businessRoom1Div"><img src="../img/room1,4.jpg" width="90%"></div>
	<div id="businessRoom2Div"><img src="../img/room2.jpg" width="90%"></div>
	<div id="businessRoom3Div"><img src="../img/room3.jpg" width="90%"></div>
	<div id="businessRoom4Div"><img src="../img/room5,6.jpg" width="90%"></div>
	<div style="padding:7px; background-color:#eee; border:1px solid #dcdcdc; display:inline-block; width:90%">
		<span class="backColor"><img src="../img/room1,4.jpg" class="hallImage" id="businessRoom1"></span>
		<span class="backColor"><img src="../img/room2.jpg" class="hallImage" id="businessRoom2"></span>
		<span class="backColor"><img src="../img/room3.jpg" class="hallImage" id="businessRoom3"></span>
		<span class="backColor"><img src="../img/room5,6.jpg" class="hallImage" id="businessRoom4"></span>
	</div><br><br>
<!-- 3층 -->
<h2 align="left" style="margin-left: 46px; color: #610170;">
	<i class="book icon"></i>
		부스예약
</h2>
<div id="exhibition3F" class="ui-widget-content">
	<h4 align="left">select Room</h4>
	<div class="line" id="room1" style="position:absolute; left:390px;top:104px;">
		<div id="Room1" style="font-size: 25px; cursor:pointer; margin-top:30px;">Room1</div>
	</div>
	
	<div class="line" id="room2" style="position:absolute; left:706px;top:259px;" >
		<div id="Room2" style="font-size: 25px; cursor:pointer;margin-top:30px;">Room2</div>
	</div>
	
	<div id="room3" style="position:absolute; left:71px;top:515px;" >
		<div id="Room3" style="font-size: 25px; cursor:pointer; margin-top:30px;">Room3</div>
	</div>
	
	<div id="room4" style="position:absolute; left:71px;top:672px" >
		<div id="Room4" style="font-size: 25px; cursor:pointer;">Room4</div>
	</div>
	
	<div id="room5" style="position:absolute; left:291px;top:690px" >
		<div id="Room5" style="font-size: 25px; cursor:pointer;">Room5</div>
	</div>

	<div id="Room6" style="position:absolute; left:436px;top:690px" >
		<div class="absol" id="Room6" style="font-size: 25px; cursor:pointer;">Room6</div>
	</div>
</div>




<script src="../js/businessRoom.js?ver=1"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="../js/introduction.js"></script>
</body>
</html>