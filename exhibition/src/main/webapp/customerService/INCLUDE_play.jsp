<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form name="playboardWriteForm2" id="playboardWriteForm2" method="post"
enctype="multipart/form-data">
<!-- 내용 입력 -->
<div style="width: 60%;">
	<br>
	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<input type="text" name="imageName" id="imageName" placeholder="제목">
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
			<input type="text" name="startDate" class="datepicker1">
			<div style="width: 5%;">&nbsp;</div>
			<input type="text" name="endDate" class="datepicker2">
		</div>
  	</div>
  	<br><br>
  	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<input type="text" name="eventLink" id="eventLink" placeholder="연극링크">
			<i class="user icon"></i>
		</div>
  	</div>
  	<br><br>
  	
  	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<input type="text" name="startDate" class="timepicker1">
			<div style="width: 5%;">&nbsp;</div>
			<input type="text" name="endDate" class="timepicker2">
		</div>
  	</div>
  	<br><br>
  
  	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<input type="text" name="eventPlace" placeholder="연극장소">
			<i class="user icon"></i>
		</div>
  	</div>
  	<br><br>
  	
  	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<input type="text" name="eventPrice" placeholder="연극가격">
			<i class="user icon"></i>
		</div>
  	</div>
  	<br><br>
  		
  	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<input type="text" name="eventSeats" placeholder="관람좌석">
			<i class="user icon"></i>
		</div>
  	</div>
  	<br><br>
  	
  	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<input type="text" name="eventRate" placeholder="관람등급">
			<i class="user icon"></i>
		</div>
  	</div>
  	
  	<br><br>
  	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" >
			<textarea rows="5" cols="78" name="eventContent" id="eventContent" style="resize: none;" placeholder="연극정보"></textarea>
		</div>
  	</div>
  	
</div><!--수정영역 텍스트필드-->
</form>