<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호텔 리스트</title>

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
	
	<header>
		<jsp:include page="../main/I_header.jsp"></jsp:include>
	</header>
	<br>
	<br>
	<div class="ui five column grid container">
		<!-- 사이드바 메뉴 -->
		<div class="ui compact menu" style="width: 20%; height: 977px; ">
			<a class="item" href="P_allScheduleForm.jsp">전체일정</a> 
			<a class="item" href="P_performanceScheduleForm.jsp">공연일정</a> 
			<a class="item" href="P_exhibitionScheduleForm.jsp">전시회일정</a>
		</div>
		<!-- 메인 화면 -->
		<div class="ui compact menu" style="width: 80%; height: 900px;" >
			<!-- 타이틀 -->
			<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
				호텔
				<span class="h-light">리스트</span>
			</h2>
			<br>
			<br>
			
			<!--리스트  -->
			<div align="center">
				<div align="left"><input type="button" class="hotelUploadBtn" value="업로드"></div>
				<form name="hotelListForm" id="hotelListForm" method="post">
					<table id="eventboardListTab" border="1" frame="hsides" rules="rows" cellpadding="3" cellspacing="0">
						<tr>
							<th><input type="checkbox" id="checkAll" class="check"></th>
							<th width="100">번호</th>
							<th width="150">이미지</th>
							<th width="100">호텔명</th>
							<th width="380">호텔정보</th>
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
											<a href="/exhibition/customerService/C_hotel_modify.do?seq=${list.seq}">수정</a></td>
											<td rowspan="2" align="center"><img src="../storage/${list.image1}" width="200" height="150"></td>
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
						<input type="button" value="선택삭제" id="hotelDeleteBtn">
					</div>
					
				</form>
			</div>
			
			
			
		</div>
		<!-- footer -->
		<div class="ui compact menu" style="width: 100%; float: right; ">
			<jsp:include page="../main/I_footer.jsp" ></jsp:include>
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
	
});

</script>
</html>