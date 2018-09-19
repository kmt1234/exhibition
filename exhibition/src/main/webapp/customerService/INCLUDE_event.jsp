<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 내용 입력 -->
<div style="width: 60%;">
<input type="hidden" name="postSelect" id="postSelect" value="1">
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
	<div id="imgDiv"></div>
	<br>
	
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
			<input type="text" name="eventLink" id="eventLink" placeholder="박람회 링크">
			<i class="user icon"></i>
		</div>
  	</div>
  	<br><br>
  	
  	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<input type="text" name="startTime" class="timepicker1">
			<div style="width: 5%;">&nbsp;</div>
			<input type="text" name="endTime" class="timepicker2">
		</div>
  	</div>
  	<br><br>
  
  	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<input type="text" name="eventPlace" placeholder="박람회 장소">
			<i class="user icon"></i>
		</div>
  	</div>
  	<br><br>
  	
  	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<input type="text" name="eventPrice" placeholder="박람회 가격">
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
			<textarea rows="5" cols="78" name="eventContent" id="eventContent" style="resize: none;" placeholder="박람회 정보"></textarea>
		</div>
  	</div>
  
</div><!--수정영역 텍스트필드-->