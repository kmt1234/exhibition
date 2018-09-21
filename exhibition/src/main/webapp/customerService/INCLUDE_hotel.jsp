<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 내용 입력 -->
<div style="width: 60%;">
<input type="hidden" name="postSelect" id="postSelect" value="3">
	<br>
	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<input type="text" name="imageName" id="imageName" placeholder="호텔명">
			<i class="user icon"></i>
		</div>
  	</div>
  	<div id="imageNameDiv"></div>
  	<br>
  	<div class="ui inverted input" style="width: 100%; height: 50px;">
  		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<input type="file" name="img" id="img">
	 	</div>
	</div>
	<div id="imgDiv"></div>
	<br>
	
  	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<input type="text" name="eventLink" id="eventLink" value="http://">
			<i class="user icon"></i>
		</div>
  	</div>
  	<div id="hotelDiv"></div>
  	<br>
  	
  	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<input type="text" name="eventPlace" id="telPlace" placeholder="TEL">
			<i class="user icon"></i>
		</div>
  	</div>
  	<div id="telDiv"></div>				
		
</div><!--수정영역 텍스트필드-->