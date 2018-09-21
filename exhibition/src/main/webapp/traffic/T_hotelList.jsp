<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
#hotelPaging3{
	align:center;
}
#image_DIV{
	height:450px;
	float:center;
}
#slidbar{
	position:absolute;
	top : 0px; 
	left: 0px;
}
</style>
<body>
<header>
	<div style="margin-top: 20px; min-width:1170px; position: relative;   ">
		<jsp:include page="../main/I_header.jsp"></jsp:include>
	</div>
</header>
	<div style="margin-top: 5px; min-width:1170px; position: relative; " class="ui container" >
		<!-- 사이드바 메뉴 -->
		<div style="width:230px; height:900px auto; display: inline-block;">
			<div class="ui compact menu" id="slidbar" style="display: inline-block;">
				<a  class="item" style="border: none; width: 227px;" href="T_allForm.do" id="T_map">교통안내</a> 
					<ul class="ui list" id="T_mapList" style="text-align: center;  width: 120px">
					  <li><a href="T_allForm.do">오시는 길</a></li>
					  <li><a href="T_parkingAllForm.do">주차 안내</a></li>
					</ul>
				<a class="item" href="P_performanceScheduleForm.do">숙박안내</a> 
			</div>
		
		</div>
		<!-- 메인 화면 -->
		<div class="ui compact menu" style="width: 930px; height:900px auto;  display: inline-block;" >
		<!-- 타이틀 -->
		<h2 class="box-container" style="float: center; width: 100%; height:116px; text-align: left;">
			숙박
			<span class="h-light">안내</span>
			<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
					<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
					> 교통&숙박 > 숙박안내 
				</div>
			<div class="ui divider"></div> 
		</h2>
		<div id="image_DIV" style="display: inline-block;">
			<div style="float: left;">
				<c:forEach items="${list }" var="list">
				<div style="float:left; margin-left:20px; width: 210px; text-align: left; margin-top: 10px;">
					<img id="image_check" src="../storage/${list.image1}" width="200" height="150"><br>
					${list.imageName}<br>
					TEL) ${list.eventPlace} &nbsp;
					<i class="home icon" style="cursor: pointer;" onclick="window.open('${list.eventLink }')"></i>
				</div>
				
			</c:forEach>	
		</div>
			<div id="hotelPaging3" style="margin-top: 30px; display: inline-block; ">${imageboardPaging.pagingHTML }</div>
		</div>
	</div>
		
	</div>
	
	<!-- footer -->
	<div class="ui container" style="margin-top: 20px; min-width:1170px; position: relative; ">
		<jsp:include page="../main/I_footer.jsp" ></jsp:include>
	</div>
<script src="../js/traffic.js"></script>
<script src="../js/slidbar.js"></script>	
<script type="text/javascript">
function hotelboardPaging(pg){
	location.href="/exhibition/traffic/T_hotelList.do?pg="+pg
}
</script>

</body>
</html>