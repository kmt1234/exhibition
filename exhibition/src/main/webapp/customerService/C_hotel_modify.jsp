<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
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
</style>

</head>
<body>
<div style="width: 100%; text-align: left;">
	<h2 class="box-container" style="float: center; width: 100%; height:126px; text-align: left;">
		<span>호텔정보</span>
		<span class="h-light">수정</span>
		<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
			<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
			> 고객센터 > 게시판추가 > 목록 > 수정
		</div>
		<div class="ui divider"></div> 
	</h2>
	<form name="hotelboardModForm" id="hotelboardModForm" method="POST"
		enctype="multipart/form-data">
		<div style="width: 500px; margin-left: 20px;">
		<input type="hidden" name="seq" value="${hotelboardDTO.seq}">
		<input type="hidden" name="image1" value="${hotelboardDTO.image1}">
		<!-- 제목 -->
		<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
			<div class="ui labeled input " >
				<div class="ui label " style="width: 100px; text-align: center;">
					<span>호텔명</span>
				</div>
				<div class="ui inverted input" style="width: 100%;">
					<div class="ui left icon input focus" style="width: 400px;  height: 50px;">
						<input type="text" name="imageName" id="imageName" value="${hotelboardDTO.imageName}">
						<i class="user icon"></i>
					</div>
			  	</div>
	  		</div>
	  	</div>
	  	<div id="imageNameDiv"></div>
	  	<!-- 이미지  -->
	  	<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
			<div class="ui labeled input " >
				<div class="ui label " style="width: 100px; text-align: center;">
					<span>이미지</span>
				</div>
			  	<div class="ui inverted input" style="width: 100%; height: 50px;">
			  		<div class="ui left icon input focus" style="width: 400px; height: 50px;">
						<input type="file" name="img" id="img">
				 	</div>
				</div>
			</div>
		</div>
		<div id="imgDiv"></div>
		<!-- 홈페이지 -->
		<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
			<div class="ui labeled input " >
				<div class="ui label " style="width: 100px; text-align: center;">
					<span>홈페이지</span>
				</div>
			  	<div class="ui inverted input" style="width: 100%;">
					<div class="ui left icon input focus" style="width: 400px; height: 50px;">
						<input type="text" name="eventLink" id="eventLink" value="${hotelboardDTO.eventLink }">
						<i class="user icon"></i>
					</div>
			  	</div>
	  		</div>
	  	</div>
	  	<div id="hotelDiv"></div>
	  	<!-- 대표번호  -->
	  	<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
			<div class="ui labeled input " >
				<div class="ui label " style="width: 100px; text-align: center;">
					<span>대표번호</span>
				</div>
			  	<div class="ui inverted input" style="width: 100%;">
					<div class="ui left icon input focus" style="width: 400px; height: 50px;">
						<input type="text" name="eventPlace" id="telPlace" value="${ hotelboardDTO.eventPlace}">
						<i class="user icon"></i>
					</div>
			  	</div>
	  		</div>
	  	</div>
	  	<div id="telDiv"></div>
	  	<!-- 버튼 -->
	  	<div class="ui two buttons" style="margin-top: 20px;">
		    	<div class="middle ui button" id="hotelboardModBtn" style="width: 15%;">수정</div>
		    	<div style="width: 5%;">&nbsp;</div>
		    	<button class="middle ui button" type="reset" id="writeReset" style="width: 15%;">다시작성</button>
		    	<div style="width: 5%;">&nbsp;</div>
		    	<div class="middle ui button" id="imageboardList" style="width: 15%;"
		    	onclick="location.href='/exhibition/customerService/C_hotelListForm.do'">목록</div>
			</div>
		</div>			
	</form>
</div>
</body>
<script>
$(document).ready(function(){
	//수정완료 클릭시
	$('#hotelboardModBtn').click(function(){
		var reg = /^https?\:\/\/.+/;
		var tel = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})|(02|0[3-9]+[0-9])(\d{3,4})(\d{4})$/;
		if($('#telPlace').val()=='')
			$('#telDiv').text('전화번호를 입력하세요').css('color','red').css('font-size','9pt').css('font-weight','bold');
		else if(!tel.test($('#telPlace').val())){
			$('#telDiv').text('전화번호 양식에 맞지 않습니다').css('color','red').css('font-size','9pt').css('font-weight','bold');
		}else if($('#eventLink').val()=='')
			$('#hotelDiv').text('호텔 링크를 입력하세요').css('color','red').css('font-size','9pt').css('font-weight','bold');
		else if(!reg.test($('#eventLink').val())){
			$('#hotelDiv').text('호텔 링크 앞에는 http://가 입력되어야 합니다').css('color','red').css('font-size','9pt').css('font-weight','bold');
		}else 
			$('#hotelboardModForm').attr('action','/exhibition/customerService/C_hotelboardMod.do').submit();
	});
});
</script>
</html>