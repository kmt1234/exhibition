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
th {
    border: 1px solid #444444;
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
		<div class="ui divider"></div>
	</h2>
	<!-- 메인메뉴 -->
	<div style="width: 100%;">
		<!-- 맨위 메뉴 텝 -->
		<div style="margin-left: 20px; width:880px; float: left; text-align: left;">
			<a class="middle ui button" class="active item" id="company-info-modify" style="margin-left:20px; width:150px; float: left;">수정</a>
			<a class="middle ui button" class="item"id="rental-list"  style=" width:150px; float: left;">임대리스트 </a>
			<a class="middle ui button" class="item"id="rental-history"  style=" width:150px; float: left;">지난 임대 내역</a>
		</div>
	</div>
	<br><br>
	<div class="ui rental All" id="Ticket-History-Div">
		 <table class="ui striped table">
	  <thead>
	  	<tr align="center">
		  	<th>부스명</th>
		  	<th>행사명</th>
		  	<th>행사시작일</th>
		  	<th>행사종료일</th>
	  	</tr></thead>
	  	<tbody id="rental_All" align="center">
  		<c:if test="${listSize eq '0'}">
  		<tr><td colspan="6">지난 임대 내역이 없습니다.</td></tr>
  		</c:if>
  		</tbody>
	  </table>
	  <div name="paging" id="paging"></div>
	</div>
</div>
<input type="hidden" name="pg" id="pg" value="${pg}">
<script>
$(document).ready(function(){
	$.ajax({
		type : 'POST',
		url : '/exhibition/login/getAllRental.do',
		data : {'C_license':$('#license_here').val(),'pg':$('#pg').val()},
		dataType : 'json',
		success : function(data){
			$.each(data.list,function(index, item){
				$('<tr/>').append($('<td/>',{
			 		name : 'boothName',
			 		text : item.boothName
			 	})).append($('<td/>',{
			 		name : 'title',
			 		text : item.title
			 	})).append($('<td/>',{
			 		name : 'startDate',
			 		text : item.startDate
			 	})).append($('<td/>',{
			 		name : 'endDate',
			 		text : item.endDate
			 	})).appendTo($('#rental_All'));
			});
			$('#paging').html(data.memberTicketListPaging.pagingHTML);
		}
	});

});
function MemberTicketListPaging(pg){
	location.href="/exhibition/login/mypageRentalPast.do?pg="+pg+"";
}
</script>
</body>
</html>