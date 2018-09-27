<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
#currentPaging{
	color: red;
	text-decoration: none;
	cursor: pointer;
}

#paging{
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
<body>
<div class="ui segment" id="Ticket-List-Div" align="center">
	<h2 class="box-container" style="float: center; width: 100%; height:126px; text-align: left;">
		<span>마이</span>
		<span class="h-light">페이지</span>
		<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
		<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
		> 고객센터 > 마이페이지(법인) 
		</div>
	</h2>
	<!-- 메인메뉴 -->
	<div style="width: 100%;">
		<!-- 맨위 메뉴 텝 -->
		<div style="margin-left: 20px; width:880px; float: left; text-align: left;">
			<a class="middle ui button" class="active item" id="member-info-modify" style="margin-left:20px; width:150px; float: left;">수정</a>
			<a class="middle ui button" class="item"id="member-ticket-list"  style=" width:150px; float: left;">임대리스트 </a>
			<a class="middle ui button" class="item"id="member-ticket-history"  style=" width:150px; float: left;">지난 임대 내역</a>
		</div>
	</div>
	<br><br>
	
	<div class="ui segment" id="Ticket-History-Div">
		 <table border="1" style="align:center;width:80%;border-collapse: collapse;">
		  	<tr>
			  	<th>부스명</th>
			  	<th>행사명</th>
			  	<th>행사시작일</th>
			  	<th>행사종료일</th>
			  	<th>이메일</th>
			  	<th>연락처</th>
		  	</tr>
		  	<c:forEach items="${list}" var="list">
		  		<tr>
				  	<td>${list.getBoothName()}</td>
				  	<td>${list.getTitle()}</td>
				  	<td>${list.getStartDate()}</td>
				  	<td>${list.getEndDate()}</td>
				  	<td>${list.getC_email()}</td>
				  	<td>${list.getC_tel()}</td>
			  	 </tr>
			  </c:forEach>		 
		  </table>
		  <br><div align="center">${memberTicketListPaging.pagingHTML}</div><br>
	</div>
</div>
<script>
function MemberTicketListPaging(pg){
	location.href="/exhibition/login/mypageRentalPast.do?pg="+pg;
}
</script>
</body>
</html>