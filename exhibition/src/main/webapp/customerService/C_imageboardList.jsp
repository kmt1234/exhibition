<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>	
function imageboardPaging(pg){
	location.href="/exhibition/customerService/C_mainImageboardListForm.do?pg="+pg 	//이거는 paging에서 보낸 pg값을 가져온 것이다.
}
</script>
<style type="text/css">
#subjectA:link{color:black; text-decoration: none;}
#subjectA:visited{color:black; text-decoration: none;}
#subjectA:hover{color:green; text-decoration: underline;}
#subjectA:active{color:black; text-decoration: none;}

#currentPaging{
	color: red;
	text-decoration: underline;
	cursor: pointer;
}
#paging{
	color: black;
	text-decoration: none;
	cursor: pointer;
}

</style>

</head>
<body>
<div>
<div align="left"><input type="button" class="eventUploadBtn" value="업로드"></div>
<form name="imageboardListForm" id="imageboardListForm"method="post">
<table id="imageboardListTab" border="1" frame="hsides" rules="rows" cellpadding="3" cellspacing="0">
<tr>
	<th width="100"><input type="checkbox" id="checkAll">번 호</th>
	<th width="150">이미지</th>
	<th width="100">상품명</th>
	
</tr>
</table>
<div style=" float:left; width:500px" align="center" id="imagePaging" name="imagePaging"></div><br>

<div style="float:left;">
	<input type="button" value="메인등록" id="imageSelectBtn">
	<input type="button" value="선택삭제" id="imageDeleteBtn">
</div>
<input type="hidden" id="code" value="2">
</form>
</div>
<!-- <script src="http://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript"></script> -->
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type : 'POST',
		url : '/exhibition/customerService/getImageboardList.do',
		data : 'pg=${pg}',
		dataType : 'json',
		success : function(data){
			$.each(data.list,function(index,item){
				var img = '<img src="../storage/'+item.image1+'" width="700" height="210">';
				$('<tr/>',{align:'center'})
				.append($('<td/>',{	//tr , 뒤에 align하면 tr안에서 align이 다 먹힌다.
					}).append($('<input/>',{
						type : 'checkbox',
						class : 'check',
						name : 'check',
						value : item.seq
					
				}),item.seq
				)).append($('<td/>',{
				}).append($('<a/>',{
					html : img
				}))
				).append($('<td/>',{
					text : item.imageName
				})).appendTo($('#imageboardListTab'));
			});//each문
			
			$('#imagePaging').html(data.imageboardPaging.pagingHTML);
		}
	})//ajax
	
	//전체선택
	$('#checkAll').click(function(){
		//alert($('.check').length);		//클래스를 나타낼때는 앞에 .을 찍는다.
		if($('#checkAll').prop('checked')){
			$('.check').prop('checked',true);
		}else{
			$('.check').prop('checked',false);
		}
	});
	
	//선택삭제
	$('#imageDeleteBtn').click(function(){
		var count=$('.check:checked').length;

		if(count==0) 
			alert("항목을 선택해주세요");
		else
			$('#imageboardListForm').attr('action','/exhibition/customerService/C_imageboardDelete.do').submit();
	});
	
	//메인등록
	$('#imageSelectBtn').click(function(){
		var count=$('.check:checked').length;
		if(count==0) 
			alert("항목을 선택해주세요");
		else
			$('#imageboardListForm').attr('action','/exhibition/main/I_body.do').submit();
			
	});
	
	//업로드 버튼
	$('.eventUploadBtn').click(function(){
		location.href='/exhibition/customerService/C_mainImageboardForm.do';
	});
});
</script>
</body>
</html>