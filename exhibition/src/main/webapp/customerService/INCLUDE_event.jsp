<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 내용 입력 -->
<div>
	<h2 class="header" id="M-modify-id" style="float: left; " >박람회</h2>
</div>
<br>
<div style="width: 500px;">
<input type="hidden" name="postSelect" id="postSelect" value="1">
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
  	<!-- 파일업로드 -->
  	<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
		<div class="ui labeled input " >
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>포스터</span>
			</div>
		  	<div class="ui inverted input" style="width: 100%; height: 50px;">
		  		<div class="ui left icon input focus" style="width: 400px; height: 50px;">
					<input type="file" name="img" id="img">
			 	</div>
			</div>
		</div>
	</div>
	<div id="imgDiv"></div>
	<!-- 날짜  -->
	<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
		<div class="ui labeled input " >
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>날짜선택</span>
			</div>
			<div class="ui inverted input" style="width: 100%;">
				<div class="ui left icon input focus" style="width: 100%; height: 50px;">
					<input type="text" name="startDate" class="datepicker1" style="width:195px;">
					<div style="width: 10px;">&nbsp;</div>
					<input type="text" name="endDate" class="datepicker2" style="width:195px;">
				</div>
		  	</div>
  		</div>
  	</div>
  	<br>
  	<!-- 클릭시를 위한것 아직은 시행안했음 -->
  	<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
		<div class="ui labeled input " >
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>홈페이지</span>
			</div>
		  	<div class="ui inverted input" style="width: 100%;">
				<div class="ui left icon input  focus" style="width: 400px;  height: 50px;">
					<input type="text" name="eventLink" id="eventLink" placeholder="박람회 링크">
					<i class="user icon"></i>
				</div>
		  	</div>
  		</div>
  	</div>
  	<br>
  	<!-- 시간선택  -->
  	<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
		<div class="ui labeled input " >
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>시간선택</span>
			</div>
		  	<div class="ui inverted input" style="width: 100%;">
				<div class="ui left icon input focus" style="width: 100%; height: 50px;">
					<input type="text" name="startTime" class="timepicker1" id="startTime" style="width:195px;">
					<div style="width: 10px;">&nbsp;</div>
					<input type="text" name="endTime" class="timepicker2" id="endTime" style="width:195px;">
				</div>
		  	</div>
  		</div>
  	</div>
  	<br>
  	<!-- 부스번호 -->
  	<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
		<div class="ui labeled input " >
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>행사위치</span>
			</div>
		  	<div class="ui inverted input" style="width: 100%;">
				<div class="ui left icon input focus" style="width: 400px;  height: 50px;">
					<input type="text" name="eventPlace" id="eventPlace" placeholder="행사위치">
					<i class="user icon"></i>
				</div>
		  	</div>
  		</div>
  	</div>
  	<br>
  	<!-- 티켓 금액-->
  	<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
		<div class="ui labeled input " >
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>티켓금액</span>
			</div>
		  	<div class="ui inverted input" style="width: 100%;">
				<div class="ui left icon input focus" style="width: 400px; height: 50px;">
					<input type="text" name="eventPrice" id="eventPrice" placeholder="티켓 금액">
					<i class="user icon"></i>
				</div>
		  	</div>
  		</div>
  	</div>
  	<br>
  	<!-- 관람인원 -->
  	<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
		<div class="ui labeled input " >
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>관람인원</span>
			</div>	
		  	<div class="ui inverted input" style="width: 100%;">
				<div class="ui left icon input focus" style="width: 400px; height: 50px;">
					<input type="text" name="eventSeats" id="eventSeats" placeholder="관람인원">
					<i class="user icon"></i>
				</div>
		  	</div>
  		</div>
  	</div>
  	<br>
  	<!-- 관람등급 -->
  	<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
		<div class="ui labeled input " >
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>관람등급</span>
			</div>	
		  	<div class="ui inverted input" style="width: 100%;">
				<div class="ui left icon input focus" style="width: 400px; height: 50px;">
					<input type="text" name="eventRate" placeholder="관람등급">
					<i class="user icon"></i>
				</div>
		  	</div>
  		</div>
  	</div>
  	<br><br>
  	<!-- 박람회 정보  -->
  	<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
		<div class="ui labeled input " >
			<div class="ui label " style="width: 100px; text-align: center;">
				<span>박람회내용</span>
			</div>	
		  	<div class="ui inverted input" style="width: 100%;">
				<div class="ui left icon input " >
					<textarea rows="5" cols="78" name="eventContent" id="eventContent" style="resize: none;" placeholder="박람회 정보"></textarea>
				</div>
		  	</div>
  		</div>
  	</div>
  	<br><br>
</div><!--수정영역 텍스트필드-->