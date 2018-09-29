<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 내용 입력 -->
<div>
	<h2 class="header" id="M-modify-id" style="float: left; " >호텔</h2>
</div>
<br>
<div style="width: 500px;">
<input type="hidden" name="postSelect" id="postSelect" value="3">
	<!-- 제목 -->
	<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
		<div class="ui labeled input " >
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>호텔명</span>
			</div>
			<div class="ui inverted input" style="width: 100%;">
				<div class="ui left icon input focus" style="width: 400px;  height: 50px;">
					<input type="text" name="imageName" id="imageName" placeholder="호텔명">
					<i class="user icon"></i>
				</div>
		  	</div>
  		</div>
  	</div>
  	<div id="imageNameDiv"></div>
  	<!-- 이미지  -->
  	<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
		<div class="ui labeled input " >
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>이미지</span>
			</div>
		  	<div class="ui inverted input" style="width: 100%; height: 50px;">
		  		<div class="ui left icon input focus" style="width: 400px; height: 50px;">
					<input type="file" name="img" id="img">
			 	</div>
			</div>
		</div>
	</div>
	<div id="imgDiv"></div>
	<!-- 홈페이지 -->
	<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
		<div class="ui labeled input " >
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>홈페이지</span>
			</div>
		  	<div class="ui inverted input" style="width: 100%;">
				<div class="ui left icon input focus" style="width: 400px; height: 50px;">
					<input type="text" name="eventLink" id="eventLink" value="http://">
					<i class="user icon"></i>
				</div>
		  	</div>
  		</div>
  	</div>
  	<div id="hotelDiv"></div>
  	
  	<!-- 대표번호  -->
  	<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
		<div class="ui labeled input " >
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>대표번호</span>
			</div>
		  	<div class="ui inverted input" style="width: 100%;">
				<div class="ui left icon input focus" style="width: 400px; height: 50px;">
					<input type="text" name="eventPlace" id="telPlace" placeholder="TEL">
					<i class="user icon"></i>
				</div>
		  	</div>
  		</div>
  	</div>
  	<div id="telDiv"></div>				
	<br>	
</div><!--수정영역 텍스트필드-->