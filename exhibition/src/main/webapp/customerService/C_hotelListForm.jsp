	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
#currentHotelPaging{
	color: red;
	text-decoration: underline;
	cursor: pointer;
}
#hotelpaging{
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
		<span>호텔</span>
		<span class="h-light">정보</span>
		<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
			<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
			> 고객센터 > 게시판추가 > 목록
		</div>
		<div class="ui divider"></div> 
	</h2>
	<!--리스트  -->
	<div style="width: 730px; float: left; margin-left: 100px;">
		<div align="left"><input type="button" class="hotelUploadBtn" value="업로드"></div>
		<form name="hotelListForm" id="hotelListForm" method="post">
			<table id="eventboardListTab" border="1" frame="hsides" rules="rows" cellpadding="3" cellspacing="0">
				<tr>
					<th><input type="checkbox" id="checkAll" class="check"></th>
					<th width="100">번호</th>
					<th width="380">이미지</th>
					<th width="100">호텔명</th>
					<th width="150">호텔정보</th>
				</tr>
				<!--등록된 박람회 정보가 없을 때  -->								
				<c:if test="${listSize eq '0'}">	
					<tr>
						<td colspan="5" align="center">현재 등록된 호텔정보가 없습니다</td>
					</tr>
					<input type="hidden" id="hiddenListSize" value="${listSize }">
				</c:if>
				<c:forEach items="${list}" var="list">
					<c:if test="${list ne null}">
						<tr>
							<td rowspan="2"><input type="checkbox" name="check" class="check" value="${list.seq}"></td>
							<td rowspan="2" align="center">${list.seq}<br>
							<td rowspan="2" align="center" ><a class="hotel_detail"><img src="../storage/${list.image1}" width="200" height="150"></a></td>
							<td rowspan="2" align="center">${list.imageName}</td>	
							<td>${list.eventLink}</td>
						</tr>
						<tr>
							<td>${list.eventPlace}</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
			<div align="center">${imageboardPaging.pagingHTML }</div>
			<div style="float:left;">
				<a class="middle ui button" id="hotelDeleteBtn">선택삭제</a>
			</div>
		</form>
	</div>
</div>
</body>
<script>
function hotelboardPaging(pg){
	location.href="/exhibition/customerService/C_hotelListForm.do?pg="+pg
}
$(document).ready(function(){
	//전체선택
	$('#checkAll').click(function(){
		if($('#checkAll').prop('checked')){
			$('.check').prop('checked',true);
		}else{
			$('.check').prop('checked',false);
		}
	});
	
	
	//선택삭제
	$('#hotelDeleteBtn').click(function(){
		var count=$('.check:checked').length;

		if(count==0) 
			alert("항목을 선택해주세요");
		else
			$('#hotelListForm').attr('action','/exhibition/customerService/C_hotelDelete.do').submit();
	});
	
	//선택삭제 버튼 숨김
	if($('#hiddenListSize').val()==0){
		$('#hotelDeleteBtn').hide();
	}
	
	//업로드 버튼
	$('.hotelUploadBtn').click(function(){
		location.href='/exhibition/customerService/C_mainImageboardForm.do?postSelect=3';
	});
	$('.hotel_detail').click(function(){
		var seq = $(this).parent().prev().text();
		location.href="/exhibition/customerService/C_hotel_modify.do?seq="+seq+"";
	});
});
</script>
</html>