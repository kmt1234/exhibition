<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

</head>
<body>
<div>
<form name="imageboardWriteForm" id="imageboardWriteForm" method="post"
	enctype="multipart/form-data" action="/exhibition/customerService/C_imageboardWrite.do"> 
	<table border="1" cellpadding="3" cellspacing="0">
		<tr>
			<td width="70" align="center">포스터 종류</td>
			<td>
				<select name="postSelect" style="width: 120px">
	
						<option value="main">메인</option>
	
						<option value="exhibition">박람회</option>
	
						<option value="performance">연극</option>
	
				</select>
			</td>
		</tr>
		<tr>
			<td width="70" align="center">포스터 제목</td>
			<td><input type="text" name="imageName" id="imageName" size="45" >
				<div id="imageNameDiv"></div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="file" name="img" id="img" size="50">
				<div id="imgDiv"></div>
			</td>
		</tr>
		<!-- <tr>
			<td colspan="2">
				<input type="file" name="img" id="img" size="50">
				<div id="image1Div"></div>
			</td>
		</tr> -->
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="checkImageboardWrite" value="이미지등록">			
				<input type="reset" value="다시작성">
 			</td>
			
		</tr>
		
		</table>
</form>
</div>
<!-- <script src="http://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript"></script> -->
<script type="text/javascript">
$(document).ready(function(){
	//회원가입
	$('#checkImageboardWrite').click(function(){
		$('#imageNameDiv').empty();
		$('#imgDiv').empty();
		
		if($('#imageName').val()=='')
			$('#imageNameDiv').text('상품명을 입력하세요').css('color','red').css('font-size','9pt').css('font-weight','bold');
		else if($('#img').val()=='') 
			$('#imgDiv').text('파일을 선택해 주세요').css('color','magenta').css('font-size','9pt').css('font-weight','bold');
		else
			$('#imageboardWriteForm').submit();
	});
});
</script>

</body>
</html>