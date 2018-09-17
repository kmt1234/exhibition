<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
</head>
<body>
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	회원 
	<span class="h-light">사항</span>
</h2>

<table style=" width: 100%;">
		<tr>
			<td>
				<button class="middle ui button" style="width: 100%;" id="C_memberList" >
					개인회원
				</button> 
			</td>
			<td>
				<button class="middle ui button" style="width: 100%;" id="C_companyList" >
					사업자회원
				</button> 
			</td>
		</tr>
</table>
</body>
<script>
$(document).ready(function(){
	$('#C_memberList').click(function(){
		alert("여기오니??")
	})
});
</script>
</html>