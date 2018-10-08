<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<style>
#exhibition1F{
	background-image: url(../img/cad1F.jpg);
	background-size: 100% 100%;
	background-repeat: no-repeat;
	height: 760px; 
	width: 90%;
	margin-left:46px;
	position: relative;
}

#exhibition2F{
	background-image: url(../img/cad2F.jpg);
	background-size: 100% 100%;
	background-repeat: no-repeat;
	height: 760px; 
	width: 90%;
	margin-left:46px;
	position: relative;
}

.line{
	transform:rotate(22deg);
	-ms-transform:rotate(22deg); /* IE 9 */
	-moz-transform:rotate(22deg); /* Firefox */
	-webkit-transform:rotate(22deg); /* Safari and Chrome */
	-o-transform:rotate(22deg); /* Opera */
	}
.line3{
	transform:rotate(21deg);
	-ms-transform:rotate(21deg); /* IE 9 */
	-moz-transform:rotate(21deg); /* Firefox */
	-webkit-transform:rotate(21deg); /* Safari and Chrome */
	-o-transform:rotate(21deg); /* Opera */
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
	박람회 
	<span class="h-light">홀</span>
	<div style="font-size:13px; float:right; height: 50px; margin-top:30px;">
		<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer; " id="houseImg">
		> 소개 > 박람회 홀
	</div>
	<div class="ui divider"></div>
</h2>
<div id="Layer1" style="position:absolute; left:237px; top:140px; width:164px; height:104px; z-index:1">
<table style="width: 50%; display: inline-block;">
	<tr>
		<td>
			<button class="middle ui button" style="width: 180px;" id="1F">
				1층
			</button> 
		</td>
		<td>
			<button class="middle ui button" style="width: 180px;" id="2F">
				2층
			</button> 
		</td>
	</tr>
</table>
</div>

<c:if test="${code == '3'}">
<div style="position:absolute; width: 500px; margin-left: 360px; margin-top: 5px;">
	<form id="modifyRateExhibitionForm" action="/exhibition/rental/modifyRateExhibition.do" method="post">
		<select id="boothNameSel" name="boothNameSel">
			<option value="Booth1">Booth1</option>
			<option value="Booth2">Booth2</option>
			<option value="Booth3">Booth3</option>
			<option value="Booth4">Booth4</option>
			<option value="Booth5">Booth5</option>
			<option value="Booth6">Booth6</option>
			<option value="Booth7">Booth7</option>
			<option value="Booth8">Booth8</option>
			<option value="Booth9">Booth9</option>
			<option value="Booth10">Booth10</option>
			<option value="Booth11">Booth11</option>
			<option value="Booth12">Booth12</option>
			<option value="Booth13">Booth13</option>
			<option value="Booth14">Booth14</option>
		</select>
		<input type="text" name="boothRate" id="boothRate">
		<button type="button" id="modifyRateBtn">평당 가격 수정</button>
	</form>
	
</div>
</c:if>

<br><br>
<h2 align="left" style="margin-left: 46px; color: #610170;">
<i class="camera icon"></i>
	내부 전경
</h2>
<div id="hall1Div"><img src="../img/AHall1.PNG" width="90%"></div>
<div id="hall2Div"><img src="../img/AHall2.PNG" width="90%"></div>
<div id="hall3Div"><img src="../img/AHall3.PNG" width="90%"></div>
<div id="hall4Div"><img src="../img/AHall4.PNG" width="90%"></div>
<div id="hall5Div"><img src="../img/AHall5.PNG" width="90%"></div>
<div id="hall6Div"><img src="../img/AHall6.PNG" width="90%"></div>
<div id="hall7Div"><img src="../img/AHall7.PNG" width="90%"></div>
<div id="hall8Div"><img src="../img/AHall8.PNG" width="90%"></div>
<div style="padding:7px; background-color:#eee; border:1px solid #dcdcdc; display:inline-block; width:90%">
	<span class="backColor"><img src="../img/AHall1.PNG" class="hallImage" id="hall1" style="margin-left:29px"></span>
	<span class="backColor"><img src="../img/AHall2.PNG" class="hallImage" id="hall2"></span>
	<span class="backColor"><img src="../img/AHall3.PNG" class="hallImage" id="hall3"></span>
	<span class="backColor"><img src="../img/AHall4.PNG" class="hallImage" id="hall4"></span>
	<span class="backColor"><img src="../img/AHall5.PNG" class="hallImage" id="hall5"></span>
	<span class="backColor"><img src="../img/AHall6.PNG" class="hallImage" id="hall6"></span>
	<span class="backColor"><img src="../img/AHall7.PNG" class="hallImage" id="hall7"></span>
	<span class="backColor"><img src="../img/AHall8.PNG" class="hallImage" id="hall8"></span>
</div><br><br>

<h2 align="left" style="margin-left: 46px; color: #610170;">
	<i class="book icon"></i>
		부스예약
</h2>
<!-- 1층 -->	
<div id="exhibition1F" class="ui-widget-content">
	<h4 align="left">select Room</h4>
  	  <div class="line" id="area1" style="position:absolute; left:310px;top:60px;">
     	 <div class="absol" id="Booth1" style="font-size: 25px; cursor:pointer; margin-top:30px;">Booth1</div>
      </div>
   	  <!--button=몇번부터 몇번  -->
   	  <div class="line" id="area2" style="position:absolute; left:447px;top:128px;" >
      	<div class="absol" id="Booth2" style="font-size: 25px; cursor:pointer;margin-top:30px;">Booth2</div>
      </div>
      
      <!--button=몇번부터 몇번  -->
      <div class="line3" id="area3" style="position:absolute; left:706px;top:281px;" >
      	<div class="absol" id="Booth3" style="font-size: 25px; cursor:pointer; margin-top:30px;">Booth3</div>
      </div>
      
      <!--button=몇번부터 몇번  -->
      <div id="area4" style="position:absolute; left:316px;top:370px" >
      	<div class="absol" id="Booth4" style="font-size: 25px; cursor:pointer;">Booth4</div>
      </div>
      <!--button=몇번부터 몇번  -->
   	  <div id="area5" style="position:absolute; left:14px;top:530px" >
      	<div class="absol" id="Booth5" style="font-size: 25px; cursor:pointer;">Booth5</div>
      </div>
  	  <!--button=몇번부터 몇번  -->
   	  <div id="area6" style="position:absolute; left:122px;top:530px" >
     	<div class="absol" id="Booth6" style="font-size: 25px; cursor:pointer;">Booth6</div>
      </div>   
</div>

<!-- 2층 -->
<div id="exhibition2F" class="ui-widget-content">
<h4 align="left">select Room</h4>
  	 <!--button=몇번부터 몇번  -->
  	 <div class="line" id="area7" style="position:absolute; left:310px;top:60px;">
     	 <div class="absol" id="Booth7" style="font-size: 25px; cursor:pointer; margin-top:30px;">Booth7</div>
     </div>
     <div class="line" id="area8" style="position:absolute; left:447px;top:128px;" >
     	 <div class="absol" id="Booth8" style="font-size: 25px; cursor:pointer;margin-top:30px;">Booth8</div>
     </div>
	 	 <!--button=몇번부터 몇번  -->
     <div class="line3" id="area9" style="position:absolute; left:706px;top:281px;" >
      	<div class="absol" id="Booth9" style="font-size: 25px; cursor:pointer; margin-top:30px;">Booth9</div>
     </div>
	 <!--button=몇번부터 몇번  -->
 	 <div id="area10" style="position:absolute; left:307px;top:370px" >
      	<div class="absol" id="Booth10" style="font-size: 25px; cursor:pointer;">Booth10</div>
     </div>
	 <!--button=몇번부터 몇번  -->
	 <div id="area11" style="position:absolute; left:70px;top:529px" >
	    <div class="absol" id="Booth11" style="font-size: 25px; cursor:pointer;">Booth11</div>
	 </div>
  	 <!--button=몇번부터 몇번  -->
     <div id="area12" style="position:absolute; left:70px;top:665px" >
     	 <div class="absol" id="Booth12" style="font-size: 25px; cursor:pointer;">Booth12</div>
     </div>   
	 <!--button=몇번부터 몇번  -->
     <div id="area13" style="position:absolute; left:278px;top:665px" >
      	<div class="absol" id="Booth13" style="font-size: 25px; cursor:pointer;">Booth13</div>
     </div>
     <!--button=몇번부터 몇번  -->
   	 <div id="area14" style="position:absolute; left:494px;top:665px" >
      	<div class="absol" id="Booth14" style="font-size: 25px; cursor:pointer;">Booth14</div>
     </div>
</div>
<script src="../js/exhibition.js?ver=1"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="../js/introduction.js"></script>
</body>
</html>