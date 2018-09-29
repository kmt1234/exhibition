<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
table {
  width: 100%;
  border: 1px solid #444444;
  border-collapse: collapse;
}
th{
  border: 1px solid #444444;
}
.title{
	color: green;
	font-weight: bold;
	cursor:pointer;
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
	<!-- 메인메뉴 --><input type="hidden" id="license_here" value="${c_license}">
	<div style="width: 100%;">
		<!-- 맨위 메뉴 텝 -->
		<div style="margin-left: 20px; width:880px; float: left; text-align: left;">
			<a class="middle ui button" class="active item" id="company-info-modify" style="margin-left:20px; width:150px; float: left;">수정</a>
			<a class="middle ui button" class="item"id="rental-list"  style=" width:150px; float: left;">임대리스트</a>
			<a class="middle ui button" class="item"id="rental-history"  style=" width:150px; float: left;">지난 임대 내역</a>
		</div>
	</div>
<div class="ui rental exhibition" id="exhibitionModalForm">
	<div class="header" id="exhibitionHeader" style="text-align:left;font-size:20px;font-weight: bold;">박람회</div>
	  <table class="ui striped table" id="exhibitionList">
	  <thead>
	  	<tr align="center">
		  	<th>부스명</th>
		  	<th>행사명</th>
		  	<th>행사시작일</th>
		  	<th>행사종료일</th>
		  	<th>진행상황</th>
	  	</tr></thead>
	  	<tbody id="rental_exhibition" align="center">
  	
  		</tbody>	 
	  </table>
</div>
<br><br>
<div class="ui rental concert" id="concertModalForm">
	<div class="header" id="exhibitionHeader" style="text-align:left;font-size:20px;font-weight: bold;">공연</div>
	  <table class="ui striped table" id="concertList">
	  <thead>
	  	<tr align="center">
		  	<th>부스명</th>
		  	<th>공연명</th>
		  	<th>공연시작일</th>
		  	<th>공연종료일</th>
		  	<th>진행상황</th>
	  	</tr></thead>
	  	<tbody id="rental_concert" align="center">
  	
  		</tbody>	 
	  </table>
</div>

	<div class="ui mini modal exhibition1" >
	  <div class="header">임대 취소</div>
	  <div class="content" style="width:100%">
	    <div>정말 임대를 취소 하시겠습니까?</div>
	  </div>
	  <div class="actions">
	    <div class="ui negative button">
	        No
	      </div>
	      <div class="ui positive right labeled icon button" id ="exhibitionYesBtn">
	        Yes
	        <i class="checkmark icon"></i>
	      </div>
	  </div>
	</div>



	<div class="ui mini modal exhibition2">
	  <div class="header">임대 취소</div>
	  <div class="content" style="width:100%">
	    <div>진행중인 임대는 취소 불가능 합니다.</div>
	  </div>
	  <div class="actions">
	      <div class="ui positive right labeled icon button" id ="exhibitionnotBtn">
	        Yes
	        <i class="checkmark icon"></i>
	      </div>
	  </div>
	</div>

<br><br>
<script>
$(document).ready(function(){
	var date = new Date();
    var year  = date.getFullYear();
    var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
    var day   = date.getDate();
    if (("" + month).length == 1) { month = "0" + month; }
    if (("" + day).length   == 1) { day   = "0" + day;   }
	var toDay = year+"-"+month+"-"+day;
	var ing;
	$.ajax({
		type : 'POST',
		url : '/exhibition/login/getmypageRental.do',
		data : {'C_license':$('#license_here').val()},
		dataType : 'json',
		success : function(data){
			$.each(data.list,function(index, item){
				var startDate = item.startDate.toString().slice(0,10);
				var endDate = item.endDate.toString().slice(0,10);
				
				if(startDate <= toDay && endDate >= toDay ){
				 ing = "<font color='green'>진행중</font>";
				 companyDeleteBtn ="";
				}else if(endDate >toDay){
					ing = "<font color='blue'>진행 예정</font>";
				}
				
				$('<tr/>').append($('<td/>',{
			 		name : 'boothName',
			 		text : item.boothName
			 	})).append($('<td/>',{
			 		name : 'title',
			 		class : 'title',
			 		text : item.title
			 	})).append($('<td/>',{
			 		name : 'startDate',
			 		text : item.startDate
			 	})).append($('<td/>',{
			 		name : 'endDate',
			 		text : item.endDate
			 	})).append($('<td/>',{
			 		name : 'ing',
			 		html : ing
			 	})).appendTo($('#rental_exhibition'));
			});
			
			$.each(data.list2,function(index, item){
				var startDate = item.startDate.toString().slice(0,10);
				var endDate = item.endDate.toString().slice(0,10);
				
				if(startDate <= toDay && endDate >= toDay ){
				 ing = "<font color='green'>진행중</font>";
				 companyDeleteBtn ="";
				}else if(endDate >toDay){
					ing = "<font color='blue'>진행 예정</font>";
				}
				
				$('<tr/>').append($('<td/>',{
			 		name : 'hallName',
			 		text : item.hallName
			 	})).append($('<td/>',{
			 		name : 'title',
			 		class : 'title',
			 		text : item.title
			 	})).append($('<td/>',{
			 		name : 'startDate',
			 		text : item.startDate
			 	})).append($('<td/>',{
			 		name : 'endDate',
			 		text : item.endDate
			 	})).append($('<td/>',{
			 		name : 'ing',
			 		html : ing
			 	})).appendTo($('#rental_concert'));
			});
		}
	});
	var HiddenboothName;
	var Hiddentitle;
	var HiddenstartDate;
	var HiddenendDate;
	
	$('#exhibitionList').on('click','.title',function(){
		HiddenboothName = $(this).prev().text();
		Hiddentitle = $(this).text();
		HiddenstartDate = $(this).next().text();
		HiddenendDate = $(this).next().next().text();
		$.ajax({
			type : 'POST',
			url : '/exhibition/login/DateCompare.do',
			data : {'startDate':$(this).next().text(),'endDate':$(this).next().next().text()},
			dataType : 'text',
			success : function(data){
				if(data=='exist'){
					$('.ui.mini.modal.exhibition2').modal('show');
				}else if(data=='not_exist'){
					$('.ui.mini.modal.exhibition1').modal('show');
				}
			}
		});
	});
	
	$('#concertList').on('click','.title',function(){
		HiddenboothName = $(this).prev().text();
		Hiddentitle = $(this).text();
		HiddenstartDate = $(this).next().text();
		HiddenendDate = $(this).next().next().text();
		$.ajax({
			type : 'POST',
			url : '/exhibition/login/DateCompare.do',
			data : {'startDate':$(this).next().text(),'endDate':$(this).next().next().text()},
			dataType : 'text',
			success : function(data){
				if(data=='exist'){
					$('.ui.mini.modal.exhibition2').modal('show');
				}else if(data=='not_exist'){
					$('.ui.mini.modal.exhibition1').modal('show');
				}
			}
		});
	
	});

		 $('#exhibitionYesBtn').click(function(){
			$.ajax({
				type : 'POST',
				url : '/exhibition/login/deleteGOGO.do',
				data : {'boothName':HiddenboothName,'title':Hiddentitle,'startDate':HiddenstartDate,'endDate':HiddenendDate},
				dataType : 'json',
				success : function(data){
					location.href="/exhibition/login/mypageRental.do";
				}
			});
		}); 
	
	
});
</script>
</body>
</html>