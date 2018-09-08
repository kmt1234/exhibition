<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"><!--달력 ui-->

<title></title>

</head>
<body>
<div align="center">
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
			<td><input type="text" name="eventDate1" class="datepicker1">
				 ~
				<input type="text" name="eventDate2" class="datepicker2"></td>
		</tr>
		
		<tr>
			<td class="eventL-td">행사 링크</td>		<!--메인 선택 시,-->
			<td class="exhibitionL-td">박람회 링크</td><!--박람회 선택 시,-->
			<td class="playL-td">연극 링크</td>		<!--연극 선택 시,-->
			<td><input type="text" name="eventLink" id="eventLink" size="45"></td>
		</tr>
		
		<tr>
			<td class="eventI-td">행사 정보</td>		<!--메인 선택 시,-->
			<td class="exhibitionI-td">박람회 정보</td><!--박람회 선택 시,  -->
			<td class="playI-td">연극 정보</td>		<!--연극 선택 시,-->
			<td><textarea rows="15" cols="55" id="eventContent" style="resize: none;"></textarea></td>
		</tr>
	
		<tr class="playF-tr"><!--파일 올리기 연극 선택 시,-->
			<td>첨부 파일</td>
			<td><input type="file" name="img" id="img2" size="30"></td>
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

<!-- <script src="http://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript"></script> -->
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script type="text/javascript" src="../js/boardAdd.js"></script>
</html>