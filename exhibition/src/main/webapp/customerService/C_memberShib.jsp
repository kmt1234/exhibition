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
<div style="width: 100%; ">
	<!-- 맨위 메뉴 텝 -->
	<div class="">
		
		<a class="middle ui button" class="active item" id="C_memberList" style="margin-left:20px; width:150px; float: left;" >
			수정
	  	</a>
	  	<a class="middle ui button" class="item" id="C_companyList" style=" width:150px; float: left;">
	    	예매리스트
	 	</a>
	 </div>
</div>
<div  style="width: 700px; margin-left: 20px; margin-top: 60px;">
<div style="float: left; width: 770px;" id="C_memberListFrom">
	<div style="width: 150px; display: inline-block;">이름</div>
	<div style="width: 150px; display: inline-block;">아이디</div>
	<div style="width: 150px; display: inline-block;">이메일</div>
	<div style="width: 150px; display: inline-block;">핸드폰</div>
	<div style="width: 150px; display: inline-block;">비고</div>
</div>
</div>
<!-- <table style=" width: 500px;" border="1px">
		<tr>
			<td>
				<button class="middle ui button" style="width: 200px;" id="C_memberList" >
					개인회원
				</button> 
			</td>
			<td>
				<button class="middle ui button" style="width: 200px;" id="C_companyList" >
					사업자회원
				</button> 
			</td>
		</tr>
</table> -->
</body>
<script>
$(document).ready(function(){
	$('#C_memberList').click(function(){
		alert("여기오니??")
		$.ajax({
			type : 'GET',
			url : '/exhibition/customerService/getMemberList.do',
			dataType : 'json',
			success : function(data){
				$.each(data.list,function(index, item){
				 	$('<div/>')				
				});
			}
		});
	})
	$('#C_companyList').click(function(){
		alert("여기도 오오오오니??")
	});


});

</script>
</html>