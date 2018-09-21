<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	#exhibition1F{
	background-image: url(../img/cad1F.jpg);
    background-size: 100% 100%;
  	background-repeat: no-repeat;
    height: 760px; 
    width: 100%;
    position: relative;
	}
	
	#exhibition2F{
	background-image: url(../img/cad2F.jpg);
    background-size: 100% 100%;
  	background-repeat: no-repeat;
    height: 760px; 
    width: 100%;
    position: relative;
	}
	
	#exhibition3F{
	background-image: url(../img/businessRoom.jpg);
    background-size: 100% 100%;
  	background-repeat: no-repeat;
    height: 760px; 
    width: 100%;
    position: relative;
	}
	.line{
		transform:rotate(24deg);
		-ms-transform:rotate(24deg); /* IE 9 */
		-moz-transform:rotate(24deg); /* Firefox */
		-webkit-transform:rotate(24deg); /* Safari and Chrome */
		-o-transform:rotate(24deg); /* Opera */
		}
	.line3{
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
	박람회 
	<span class="h-light">홀</span>
</h2>
<table style="margin-left:20px; width: 40%;">
		<tr>
			<td>
				<button class="middle ui button" style="width: 100%;" id="1F">
					1층
				</button> 
			</td>
			<td>
				<button class="middle ui button" style="width: 100%;" id="2F">
					2층
				</button> 
			</td>
		</tr>
	</table>
	<br><br>
<!-- 1층 -->	
<div id="exhibition1F" class="ui-widget-content">
  	  <div class="line" id="area1" style="position:absolute; left:336px;top:60px;">
     	 <div class="absol" id="Booth1" style="font-size: 25px; cursor:pointer; margin-top:30px;">Booth1</div>
      </div>
   	  <!--button=몇번부터 몇번  -->
   	  <div class="line" id="area2" style="position:absolute; left:478px;top:128px;" >
      	<div class="absol" id="Booth2" style="font-size: 25px; cursor:pointer;margin-top:30px;">Booth2</div>
      </div>
      
      <!--button=몇번부터 몇번  -->
      <div class="line3" id="area3" style="position:absolute; left:761px;top:281px;" >
      	<div class="absol" id="Booth3" style="font-size: 25px; cursor:pointer; margin-top:30px;">Booth3</div>
      </div>
      
      <!--button=몇번부터 몇번  -->
      <div id="area4" style="position:absolute; left:340px;top:370px" >
      	<div class="absol" id="Booth4" style="font-size: 25px; cursor:pointer;">Booth4</div>
      </div>
      <!--button=몇번부터 몇번  -->
   	  <div id="area5" style="position:absolute; left:17px;top:530px" >
      	<div class="absol" id="Booth5" style="font-size: 25px; cursor:pointer;">Booth5</div>
      </div>
  	  <!--button=몇번부터 몇번  -->
   	  <div id="area6" style="position:absolute; left:133px;top:530px" >
     	<div class="absol" id="Booth6" style="font-size: 25px; cursor:pointer;">Booth6</div>
      </div>   
</div>

<!-- 2층 -->
<div id="exhibition2F" class="ui-widget-content">
  	 <!--button=몇번부터 몇번  -->
  	 <div class="line" id="area7" style="position:absolute; left:336px;top:60px;">
     	 <div class="absol" id="Booth7" style="font-size: 25px; cursor:pointer; margin-top:30px;">Booth7</div>
     </div>
     <div class="line" id="area8" style="position:absolute; left:478px;top:128px;" >
     	 <div class="absol" id="Booth8" style="font-size: 25px; cursor:pointer;margin-top:30px;">Booth8</div>
     </div>
	 	 <!--button=몇번부터 몇번  -->
     <div class="line3" id="area9" style="position:absolute; left:761px;top:281px;" >
      	<div class="absol" id="Booth9" style="font-size: 25px; cursor:pointer; margin-top:30px;">Booth9</div>
     </div>
	 <!--button=몇번부터 몇번  -->
 	 <div id="area10" style="position:absolute; left:335px;top:370px" >
      	<div class="absol" id="Booth10" style="font-size: 25px; cursor:pointer;">Booth10</div>
     </div>
	 <!--button=몇번부터 몇번  -->
	 <div id="area11" style="position:absolute; left:76px;top:529px" >
	    <div class="absol" id="Booth11" style="font-size: 25px; cursor:pointer;">Booth11</div>
	 </div>
  	 <!--button=몇번부터 몇번  -->
     <div id="area12" style="position:absolute; left:76px;top:665px" >
     	 <div class="absol" id="Booth12" style="font-size: 25px; cursor:pointer;">Booth12</div>
     </div>   
	 <!--button=몇번부터 몇번  -->
     <div id="area13" style="position:absolute; left:304px;top:665px" >
      	<div class="absol" id="Booth13" style="font-size: 25px; cursor:pointer;">Booth13</div>
     </div>
     <!--button=몇번부터 몇번  -->
   	 <div id="area14" style="position:absolute; left:532px;top:665px" >
      	<div class="absol" id="Booth14" style="font-size: 25px; cursor:pointer;">Booth14</div>
     </div>
</div>
<script src="../js/exhibition.js?ver=1"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
</html>