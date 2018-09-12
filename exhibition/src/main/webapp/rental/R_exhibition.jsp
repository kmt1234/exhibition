<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	박람회 
	<span class="h-light">홀</span>
</h2>
<table style=" width: 40%;">
		<tr>
			<td>
				<button class="middle ui button" style="width: 100%;">
					1층
				</button> 
			</td>
			<td>
				<button class="middle ui button" style="width: 100%;">
					2층
				</button> 
			</td>
			<td>
				<button class="middle ui button" style="width: 100%;">
					3층
				</button> 
			</td>
		</tr>
	</table>
	<br><br>
<div style="border: 2px solid; height: 760px; width: 100%; ">
   <button class="ui inverted secondary button booth" type="button" id="area1" style="float: left;  height: 150px; width: 15%;
      margin-top:20px; margin-left:20px;" >
      <div id="Booth1" style="font-size: 25px;">Booth1</div>
      <div>예약하기</div>
      <div>2,592(㎡)</div>
      <div>요율단가 : 2,350원</div>
      <div>요율 : 1.0</div>
      <div>1일 기준(08:00~20:00)</div>
   </button>
   
   <button class="ui inverted secondary button booth" type="button" id="area2" style="float: left; display: inline-block; height: 150px; width: 15%;
      margin-top:20px; margin-left:80px;" >
      <div id="Booth2" style="font-size: 25px;">Booth2</div>
      <div>예약하기</div>
      <div>2,592(㎡)</div>
      <div>요율단가 : 2,350원</div>
      <div >요율 : 1.0</div>
      <div>1일 기준(08:00~20:00)</div>
   </button>
   
   <button class="ui inverted secondary button booth" type="button" id="area3" style="float: left; display: inline-block; height: 150px; width: 15%;
      margin-top:20px; margin-left:50px;" >
      <div id="Booth3" style="font-size: 25px;">Booth3</div>
      <div>예약하기</div>
      <div>2,592(㎡)</div>
      <div>요율단가 : 2,350원</div>
      <div>요율 : 1.0</div>
      <div>1일 기준(08:00~20:00)</div>
   </button>
   
   <button class="ui inverted secondary button booth" type="button" id="area4" style="display: inline-block; height: 150px; width: 15%;
      margin-top:20px; margin-left:80px;" >
      <div id="Booth4" style="font-size: 25px;">Booth4</div>
      <div>예약하기</div>
      <div>2,592(㎡)</div>
      <div>요율단가 : 2,350원</div>
      <div>요율 : 1.0</div>
      <div>1일 기준(08:00~20:00)</div>
   </button>

   <!--  -->
   <button class="ui inverted secondary button booth" type="button" id="area5" style="float: left; display: inline-block; height: 300px; width: 25%; 
     margin-top:20px;   margin-left:105px;">
      <div id="Booth5" style="font-size: 25px;">Booth5</div>
      <div>예약하기</div>
      <div>6,343(㎡)</div>
      <div>요율단가 : 2,350원</div>
      <div>요율 : 1.2</div>
      <div>1일 기준(08:00~20:00)</div>
   </button>
   
    <button class="ui inverted secondary button booth" type="button" id="area6" style="float: left; display: inline-block; height: 300px; width: 25%; 
       margin-top:20px; margin-left:270px; ">
      <div id="Booth6" style="font-size: 25px;">Booth6</div>
      <div>예약하기</div>
      <div>6,343(㎡)</div>
      <div>요율단가 : 2,350원</div>
      <div>요율 : 1.2</div>
      <div>1일 기준(08:00~20:00)</div>
   </button>   
   <!--  -->

   <button class="ui inverted secondary button booth" type="button" id="area7" style="float: left; display: inline-block; height: 150px; width: 15%;
      margin-top:65px; margin-left:20px;" >
      <div id="Booth7" style="font-size: 25px;">Booth7</div>
      <div>예약하기</div>
      <div>2,592(㎡)</div>
      <div>요율단가 : 2,350원</div>
      <div>요율 : 1.0</div>
      <div>1일 기준(08:00~20:00)</div>
   </button>
   <button class="ui inverted secondary button booth" type="button" id="area8" style="float: left; display: inline-block; height: 150px; width: 15%;
      margin-top:65px; margin-left:80px;" >
      <div id="Booth8" style="font-size: 25px;">Booth8</div>
      <div>예약하기</div>
      <div>2,592(㎡)</div>
      <div>요율단가 : 2,350원</div>
      <div>요율 : 1.0</div>
      <div>1일 기준(08:00~20:00)</div>
   </button>
   <button class="ui inverted secondary button booth" type="button" id="area9" style="float: left; display: inline-block; height: 150px; width: 15%;
      margin-top:65px; margin-left:50px;" >
      <div id="Booth9" style="font-size: 25px;">Booth9</div>
      <div>예약하기</div>
      <div>2,592(㎡)</div>
      <div>요율단가 : 2,350원</div>
      <div>요율 : 1.0</div>
      <div>1일 기준(08:00~20:00)</div>
    </button>
    
  <button class="ui inverted secondary button booth" type="button" id="area10" style="float: left;display: inline-block; height: 150px; width: 15%;
      margin-top:65px; margin-left:80px;" >
      <div id="Booth10" style="font-size: 25px;">Booth10</div>
      <div>예약하기</div>
      <div>2,592(㎡)</div>
      <div>요율단가 : 2,350원</div>
      <div>요율 : 1.0</div>
      <div>1일 기준(08:00~20:00)</div>
    </button>
</div>



<script src="../js/exhibition.js"></script>
</body>
</html>