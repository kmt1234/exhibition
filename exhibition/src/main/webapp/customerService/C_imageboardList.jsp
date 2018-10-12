<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<div style="width: 100%; text-align: left;">
	<h2 class="box-container" style="float: center; width: 100%; height:126px; text-align: left;">
		<span>메인</span>
		<span class="h-light">화면</span>
		<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
			<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
			> 고객센터 > 게시판추가 > 목록
		</div>
		<div class="ui divider"></div> 
	</h2>
	<div style="width: 600px; float: left; margin-left: 165px;">
		<div align="left">
			<input type="button" class="eventUploadBtn" value="업로드">
		</div>
		<form name="imageboardListForm" id="imageboardListForm"method="post">
			<table id="imageboardListTab" border="1" frame="hsides" rules="rows" cellpadding="3" cellspacing="0">
				<tr>
					<th width="100"><input type="checkbox" id="checkAll">번호</th>
					<th width="150">이미지</th>
					<th width="100">제목</th>
				</tr>
			</table>
			<div style=" margin-top: 10px;" align="center" id="imagePaging" ></div><br>
			<div style="float:left;">
				<a class="middle ui button"  id="imageSelectBtn">메인등록</a>
				<a class="middle ui button" id="imageDeleteBtn">선택삭제</a>
				<a class="middle ui button" id="imageResetBtn">메인 이미지 초기화</a>
			</div>
			<input type="hidden" name="code" value="6">
		</form>
	</div>
</div>
<script>	
function imageboardPaging(pg){
	location.href="/exhibition/customerService/C_mainImageboardListForm.do?pg="+pg 	//이거는 paging에서 보낸 pg값을 가져온 것이다.
}
</script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type : 'POST',
		url : '/exhibition/customerService/getImageboardList.do',
		data : 'pg=${pg}',
		dataType : 'json',
		success : function(data){
			$.each(data.list,function(index,item){
				var img = '<img src="../storage/'+item.image1+'" width="400px;" height="180px;">';
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
					html : img,
					class : 'play_detail',
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
		if($('#checkAll').prop('checked')){
			$('.check').prop('checked',true);
		}else{
			$('.check').prop('checked',false);
		}
	});
	//선택삭제
	$('#imageDeleteBtn').on('click',function(){
		var count=$('.check:checked').length;

		if(count==0) 
			$.alertable.alert("항목을 선택해주세요");
		else
			$('#imageboardListForm').attr('action','/exhibition/customerService/C_imageboardDelete.do').submit();
	});
	//메인등록
	$('#imageSelectBtn').on('click',function(){
		var count=$('.check:checked').length;
		
		if(count==0) 
			$.alertable.alert("항목을 선택해주세요");
		else
			
			$('#imageboardListForm').attr('action','/exhibition/main/I_body.do').submit();
	});
	//업로드 버튼
	$('.eventUploadBtn').click(function(){
		location.href='/exhibition/customerService/C_mainImageboardForm.do?postSelect=0';
	});
	$('#imageboardListTab').on('click','.play_detail',function(){
			var seq = $(this).parent().prev().text();
			location.href="/exhibition/customerService/C_imageDetail.do?seq="+seq+"";
	});
	
	//메인 이미지 초기화
	$('#imageResetBtn').click(function(){
		$.ajax({
			type : 'GET',
			url : '/exhibition/customerService/reset.do',
			dataType : 'text',
			success : function(data){
				if(data=='delete'){
					alert('초기화 성공했습니다');
					location.href='/exhibition/customerService/C_mainImageboardListForm.do';
				}else{
					alert('관리자에게 문의하세요');
					location.href='/exhibition/main/index.do';
				}
			}
		});
	});
});
</script>
</body>
</html>