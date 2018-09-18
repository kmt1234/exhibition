<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	    width: 100%;
	    position: relative;
		}
	.line{
		transform:rotate(23deg);
		-ms-transform:rotate(23deg); /* IE 9 */
		-moz-transform:rotate(23deg); /* Firefox */
		-webkit-transform:rotate(23deg); /* Safari and Chrome */
		-o-transform:rotate(23deg); /* Opera */
		}
	
</style>
</head>
<body>
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	공연 
	<span class="h-light">홀</span>
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
	<br><br>
<!-- 3층 -->
<div id="concertHall" class="ui-widget-content">
 <div class="line" id="C_room1" style="position:absolute; left:406px;top:95px;">
      <div id="C_room1" style="font-size: 25px; cursor:pointer; margin-top:30px;">Room1</div>
      <!-- <div>예약하기</div>
      <div>2,592(㎡)</div>
      <div>요율단가 : 2,350원</div>
      <div>요율 : 1.0</div>
      <div>1일 기준(08:00~20:00)</div>-->
      </div>
 
   <div class="line" style="position:absolute;left:758px;top:250px;" >
      <div style="font-size: 25px; cursor:pointer;margin-top:30px;line-height: 25px">Waiting <br>Room</div>
     <!-- <div>예약하기</div>
      <div>2,592(㎡)</div>
      <div>요율단가 : 2,350원</div>
      <div >요율 : 1.0</div>
      <div>1일 기준(08:00~20:00)</div>-->
   </div>

    <div id="C_room2" style="position:absolute; left:76px;top:605px;" >
      <div id="C_room2" style="font-size: 25px; cursor:pointer; margin-top:30px;">Room2</div>
     <!-- <div>예약하기</div>
      <div>2,592(㎡)</div>
      <div>요율단가 : 2,350원</div>
      <div>요율 : 1.0</div>
      <div>1일 기준(08:00~20:00)</div>-->
   </div>

   <div id="C_room3" style="position:absolute; left:390px;top:690px" >
      <div id="C_room3" style="font-size: 25px; cursor:pointer;">Room3</div>
      <!-- <div>예약하기</div>
      <div>6,343(㎡)</div>
      <div>요율단가 : 2,350원</div>
      <div>요율 : 1.2</div>
      <div>1일 기준(08:00~20:00)</div> -->
   </div>
   
   <div id="C_room4" style="position:absolute; left:400px;top:360px" >
      <div class="absol" id="C_room4" style="font-size: 25px; cursor:pointer;">Room4</div>
      <!-- <div>예약하기</div>
      <div>6,343(㎡)</div>
      <div>요율단가 : 2,350원</div>
      <div>요율 : 1.2</div>
      <div>1일 기준(08:00~20:00)</div> -->
   </div>
</div>
<script src="../js/businessRoom.js?ver=1"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
</html>