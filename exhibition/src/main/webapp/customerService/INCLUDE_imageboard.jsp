<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 내용 입력 -->
<div>
	<h2 class="header" id="M-modify-id" style="float: left; " >메인페이지</h2>
</div>
<br>
<div style="width: 100%;">
<input type="hidden" name="postSelect" id="postSelect" value="0">
	<!-- 제목 -->
	<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
		<div class="ui labeled input " >
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>제목</span>
			</div>
			<div class="ui inverted input" style="width: 100%;">
				<div class="ui left icon input focus" style="width: 400px; height: 50px;">
					<input type="text" name="imageName" id="imageName" placeholder="제목">
					<i class="user icon"></i>
				</div>
			</div>
		</div>
	</div>
	<div id="imageNameDiv"></div>
	<!-- 파일선택 -->
	<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
		<div class="ui labeled input " >
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>파일선택</span>
			</div>
			<div class="ui inverted input" style="width: 400px; height: 50px;">
				<div class="ui left icon input  focus" style="width: 100%; height: 50px;">
				<input type="file" name="img" id="img">
				<i class="user icon"></i>
			 	</div>
			</div>
		</div>
	</div>
	<div id="imgDiv"></div><br>
	<!-- 날짜 -->
	<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
		<div class="ui labeled input " >
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>날짜선택</span>
			<div class="ui inverted input" style="width: 100%;">
				<div class="ui left icon input" style="width: 300px; height: 50px;">
					<input type="text" name="startDate1" class="datepicker1">
					<div style="width: 5%;">&nbsp;</div>
					<input type="text" name="endDate2" class="datepicker2">
				</div>
			</div>
		</div>
	</div>
	</div>
	<br><br>
	<!-- 클릭시를 위한것 아직은 시행안했음 -->
	<div class="ui inverted input" style="width: 100%;">
		<div class="ui left icon input" style="width: 100%; height: 50px;">
			<input type="text" name="eventLink" id="eventLink" placeholder="행사링크">
			<i class="user icon"></i>
		</div>
	</div>
	<br><br>
</div>

