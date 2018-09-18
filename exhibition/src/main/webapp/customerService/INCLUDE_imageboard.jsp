<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 내용 입력 -->
<div style="width: 60%;">
<input type="hidden" name="postSelect" id="postSelect" value="0">
	<br>
	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<input type="text" name="imageName" id="imageName" placeholder="제목">
			<i class="user icon"></i>
		</div>
	</div>
	<div id="imageNameDiv"></div>
	
	<div class="ui inverted input" style="width: 100%; height: 50px;">
		<div class="ui left icon input" style="width: 100%; height: 50px;">
		<input type="file" name="img" id="img">
	 	</div>
	</div>
	<div id="imgDiv"></div>
	
	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<input type="text" name="startDate" class="datepicker1">
			<div style="width: 5%;">&nbsp;</div>
			<input type="text" name="endDate" class="datepicker2">
		</div>
	</div>
	
	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<input type="text" name="eventLink" id="eventLink" placeholder="행사링크">
			<i class="user icon"></i>
		</div>
	</div>
	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" >
			<textarea rows="5" cols="78" name="eventContent" id="eventContent" style="resize: none;" placeholder="행사정보"></textarea>
		</div>
	</div>
</div>

