<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"><!--달력 ui-->

<!--시간 ui-->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

<style>

.imageboardList{
	margin-left: 53%;	
}

</style>

<title></title>

</head>
<body>
<div align="center"><div class="imageboardList"><input type="button" value="목록"></div>	
<form name="imageboardWriteForm" id="imageboardWriteForm" method="post"
	enctype="multipart/form-data"><!--/exhibition/customerService/C_imageboardWrite.do  --> 
	<table border="1" cellpadding="3" cellspacing="0">
		<tr>
			<td width="100">분류</td>
			<td>
				<select name="postSelect" id="postSelect" style="width: 120px">
						<option value="0">메인</option>
						<option value="1">박람회</option>
						<option value="2">연극</option>
				</select>
			</td>
		</tr>
		<tr>
			<td width="100">제목</td>
			<td><input type="text" name="imageName" id="imageName" size="45" >
				<div id="imageNameDiv"></div>
			</td>
		</tr>
		<tr><!--파일 올리기-->
			<td>이미지</td>
			<td><input type="file" name="img" id="img" size="30">
				<div id="imgDiv"></div>
			</td>
		</tr>
		
		<tr>
			<td class="eventS-td">행사 일정</td>		<!--메인 선택 시,-->
			<td class="exhibitionS-td">박람회 일정</td><!--박람회 선택 시,-->
			<td class="playS-td">연극 일정</td>		<!--연극 선택 시,-->
			<td><input type="text" name="startDate" class="datepicker1">
				 ~
				<input type="text" name="endDate" class="datepicker2"></td>
		</tr>
		
		<tr>
			<td class="eventL-td">행사 링크</td>		<!--메인 선택 시,-->
			<td class="exhibitionL-td">박람회 링크</td><!--박람회 선택 시,-->
			<td class="playL-td">연극 링크</td>		<!--연극 선택 시,-->
			<td><input type="text" name="eventLink" id="eventLink" size="45"></td>
		</tr>
		
		<tr>
			<td class="exhibitionT-td">박람회 시간</td>
			<td class="playT-td">연극 시간</td>
			<td class="eventTime">
				<input type="text" name="startTime" class="timepicker1">
				~
				<input type="text" name="endTime" class="timepicker2">
			</td>
		</tr>
		
		<tr>
			<td class="exhibitionP-td">박람회 장소</td>
			<td class="playP-td">연극 장소</td>
			<td class="eventPlace"><input type="text" name="eventPlace"></td>
		</tr>
		
		<tr>
			<td class="exhibitionPr-td">박람회 가격</td>	
			<td class="playPr-td">연극 가격</td>
			<td class="eventPrice"><input type="text" name="eventPrice"></td>
		</tr>
		
		<tr>
			<td class="playSe-td">관람좌석</td>
			<td class="eventSeats"><input type="text" name="eventSeats"></td>
		</tr>
		
		<tr>
			<td class="playR-td">관람등급</td>
			<td class="eventRate"><input type="text" name="eventRate"></td>
		</tr>
		
				
		<tr>
			<td class="eventI-td">행사 정보</td>		<!--메인 선택 시,-->
			<td class="exhibitionI-td">박람회 정보</td><!--박람회 선택 시,  -->
			<td class="playI-td">연극 정보</td>		<!--연극 선택 시,-->
			<td><textarea rows="15" cols="55" name="eventContent" id="eventContent" style="resize: none;"></textarea></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="checkImageboardWrite" value="이미지등록">		
				<input type="reset" value="다시작성">
 			</td>
			
		</tr>
		
		</table>
</form>
</div>

</body>

<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script><!--시간  -->
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script><!--달력-->


<script type="text/javascript" src="../js/boardAdd.js"></script>
</html>