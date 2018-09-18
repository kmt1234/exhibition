<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form name="hotelboardWriteForm2" id="hotelboardWriteForm2" method="post"
enctype="multipart/form-data">
<!-- 내용 입력 -->
<div style="width: 60%;">
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
	<br><br>
	
  	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<input type="text" name="eventLink" id="eventLink" placeholder="호텔링크">
			<i class="user icon"></i>
		</div>
  	</div>
  	<div id="hotelDiv"></div>
  	<br>
  	
  	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<input type="text" name="eventPlace" placeholder="TEL">
			<i class="user icon"></i>
		</div>
  	</div>
  	<div id="telDiv"></div>				
		
</div><!--수정영역 텍스트필드-->
</form>