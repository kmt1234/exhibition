<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>연극 보드 리스트</title>
<style>
.box-container{
	display: inline-block;
	padding-bottom: 40px;
	padding-left: 20px;
	padding-right: 20px;
	padding-top: 20px;
	font-weight:normal;
	font-size: 50px;
}
.h-light{
	color: #ec008c;
}
#currentEventPaging{
	color: red;
	text-decoration: underline;
	cursor: pointer;
}
#eventpaging{
	color: black;
	text-decoration: none;
	cursor: pointer;
}
.eventUploadBtn{
	margin-right: 8%;
}
</style>
</head>
<body>
<div style="width: 100%; text-align: left;">
	<h2 class="box-container" style="float: center; width: 100%; height:126px; text-align: left;">
		<span>공연</span>
		<span class="h-light">정보</span>
		<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
			<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
			> 고객센터 > 게시판추가 > 목록
		</div>
		<div class="ui divider"></div> 
	</h2>
	<!--리스트  -->
	<div style="width: 730px; float: left; margin-left: 100px;">
		<div align="left"><input type="button" class="eventUploadBtn" value="업로드"></div>
		<form name="eventboardListForm" id="eventboardListForm" method="post">
			<table id="eventboardListTab" border="1" frame="hsides" rules="rows" cellpadding="3" cellspacing="0">
				<tr>
					<th><input type="checkbox" id="checkAll" class="check"></th>
					<th width="100px">번호</th>
					<th width="380px">이미지</th>
					<th width="100px">공연명</th>
					<th width="150px">행사기간</th>
				</tr>
				<!--등록된 연극 정보가 없을 때  -->								
				<c:if test="${listSize eq '0'}">	
					<tr>
						<td colspan="5" align="center">현재 등록된 연극 정보가 없습니다</td>
					</tr>
					<input type="hidden" id="hiddenListSize" value="${listSize }">
				</c:if>
				<c:forEach items="${list}" var="list">
					<c:if test="${list ne null}">	
						<tr>
							<td><input type="checkbox" name="check" class="check" value="${list.seq}"></td>
							<td width="100px" align="center">${list.seq}</td>
							<td width="380px" align="center"><a class="play_detail"><img src="../storage/${list.image1}" width="300" height="150"></a></td>
							<td width="100px" align="center">${list.imageName}</td>
							<td width="150px" align="center" >${fn:substring(list.startDate, 0, 10) } ~ ${fn:substring(list.endDate, 0, 10)}</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
			<div style=" margin-top: 10px;" align="center" id="eventPaging">${imageboardPaging.pagingHTML}</div><br>
			<div style="float:left;">
				<a class="middle ui button" id="eventDeleteBtn_play">선택삭제</a>
				<div style="margin-top: 40px;"></div>
			</div>
		
		</form>
	</div>
</div>
</body>
<script>
function eventboardPaging(pg){
	location.href="/exhibition/customerService/C_eventboardList_playForm.do?pg="+pg
}
$(document).ready(function(){
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
	$('#eventDeleteBtn_play').click(function(){
		var count=$('.check:checked').length;

		if(count==0) 
			alert("항목을 선택해주세요");
		else
			$('#eventboardListForm').attr('action','/exhibition/customerService/C_eventboardDelete_play.do').submit();
	});
	//선택삭제 버튼 숨김
	if($('#hiddenListSize').val()==0){
		$('#eventDeleteBtn_play').hide();
	}
	//업로드 버튼
	$('.eventUploadBtn').click(function(){
		location.href='/exhibition/customerService/C_mainImageboardForm.do?postSelect=2';
	});
	//연극 내용 보기
	$('.play_detail').click(function(){
		var seq = $(this).parent().prev().text();
		location.href="/exhibition/customerService/C_playDetail.do?seq="+seq+"";
	});
});

</script>
</html>