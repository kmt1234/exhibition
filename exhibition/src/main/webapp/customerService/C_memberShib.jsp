<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<style>
 #paging{
	color: black;
	text-decoration: none;
	cursor: pointer;
}
.C_license{
  cursor: pointer;
}
.M_Id{
	cursor: pointer;
}

</style>
<script type="text/javascript">
//사업자 페이지
function CompanyList(pg){
	/* location.href="/exhibition/customerService/C_memberShib.do?pg="+pg */
	$('#pg').val(pg);
	$('#companyBtn').trigger('click','trigger');
}
//사업자 검색
function CompanySearch(pg){
	$('#pg').val(pg);
	$('#companySearchBtn').trigger('click','trigger');
	
}

function memberList(pg){
	$('#pg').val(pg);
	$('#memberBtn').trigger('click','trigger');
}
//사업자 검색
function memberSearch(pg){
	$('#pg').val(pg);
	$('#memberSearchBtn').trigger('click','trigger');
	
}


</script>
</head>
<body>
<input type="hidden" id="PG" value="${pg}">
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	회원 
	<span class="h-light">사항</span>
</h2>
<div style="width: 100%; ">
	<!-- 맨위 메뉴 텝 -->
	<div class="">
		
		<a class="middle ui button" class="active item" id="memberBtn" style="margin-left:20px; width:150px; float: left;" >
			회원정보
	  	</a>
	  	<a class="middle ui button" class="item" id="companyBtn" style=" width:150px; float: left;">
	    	사업자정보
	 	</a>
	 </div>
</div><br><br>
<!-- <div id="labelList" class="ui labeled" style="width: 700px; margin-left: 20px; margin-top: 60px;">
	<div  style="float: left; width: 870px;" >
		<div  style="float: left; width: 180px; display: inline-block;">이름(사업자명)</div>
		<div  style="float: left; width: 180px; display: inline-block;">아이디(사업자번호)</div>
		<div  style="float: left; width: 180px; display: inline-block;">이메일</div>
		<div  style="float: left; width: 180px; display: inline-block;">핸드폰(대표번호)</div>
		<div  style="float: left; width: 100px; display: inline-block;">비고</div>
		<div id="C_memberListFrom" style="margin-top: 35px;"></div>
	</div>
</div> -->
<table class="ui striped table">
  <thead>
    <tr  align="center">
	    <th>이름(사업자명)</th>
	    <th>아이디(사업자번호)</th>
	    <th>이메일</th>
	    <th>핸드폰(대표번호)</th>
 	</tr>
 </thead>
  <tbody id="memberListTable" align="center">
  
  </tbody>
 </table>

<div name="paging" id="paging"></div>

<!-- 사업자 검색 -->
<div id="companySearchDiv" class="ui input" align="center" style="margin-top:70px">
	<input type="hidden" name="pg" id="pg" value="1">
	<select class="ui compact selection dropdown" id="companySearchOption">
			<option value="C_license">아이디</option>
			<option value="C_businessname">이름</option>
	</select>
	<div  class="ui action input"  style="width: 300px; height: 40px;"align="center">
		<input type="text" placeholder="Search..." style="width: 30%;" id="companySearch">
		<input type="button" class="middle ui button"  value="검색" id="companySearchBtn">
	</div>	
</div>


<!-- 회원검색 -->
<div id="memberSearchDiv" class="ui input" align="center" style="margin-top:70px">
	<input type="hidden" name="pg" id="pg" value="1">
	<select class="ui compact selection dropdown" id="memberSearchOption">
			<option value="M_Id">아이디</option>
			<option value="M_Name">이름</option>
	</select>
	<div  class="ui action input"  style="width: 300px; height: 40px;"align="center">
		<input type="text" placeholder="Search..." style="width: 30%;" id="memberSearch">
		<input type="button" class="middle ui button"  value="검색" id="memberSearchBtn">
	</div>	
</div>

<div class="ui modal member com" id="companyModalForm">
	<div class="header" id="companyHeader"></div>
	<table class="ui striped table">
	  <thead>
	    <tr align="center">
	    	<th>번호</th>
		    <th>부스 장소</th>
		    <th>부스명</th>
		    <th>사용일자</th>
		    <th>진행상황</th>
		    <th>예매 티켓 수</th>
		    <th>취소</th>
	  </tr></thead>
	  <tbody id="reservationCompanyTable" align="center">
	  
	  </tbody>
 </table>
</div>

<div class="ui modal member mem" id="memberModalForm">
	<div class="header" id="memberHeader"></div>
	<table class="ui striped table">
	  <thead>
	    <tr align="center">
	    	<th>번호</th>
		    <th>예약명</th>
		    <th>예매 날짜</th>
		    <th>예매 현황</th>
		    <th>예매 티켓 수</th>
		    <th>취소</th>
	  </tr></thead>
	  <tbody id="reservationMemberTable" align="center">
	  
	  </tbody>
 </table>
</div>
<div id="reConfirm">
	<div class="ui mini modal mem" >
	  <div class="header">예매 취소</div>
	  <div class="content" style="width:100%">
	    <div>정말 예매를 취소 하시겠습니까?</div>
	  </div>
	  <div class="actions">
	    <div class="ui negative button">
	        No
	      </div>
	      <div class="ui positive right labeled icon button" id ="memberYesBtn">
	        Yes
	        <i class="checkmark icon"></i>
	      </div>
	  </div>
	</div>
</div>

<div id="notReConfirm">
	<div class="ui mini modal not member">
	  <div class="header">예매 취소</div>
	  <div class="content" style="width:100%">
	    <div>당일 예매 취소는 불가능 합니다.</div>
	  </div>
	  <div class="actions">
	      <div class="ui positive right labeled icon button" id ="notYesBtn">
	        Yes
	        <i class="checkmark icon"></i>
	      </div>
	  </div>
	</div>
</div>

<div id="reConfirmCompany">
	<div class="ui mini modal company" >
	  <div class="header">예약 취소</div>
	  <div class="content" style="width:100%">
	    <div>정말 예약를 취소 하시겠습니까?</div>
	  </div>
	  <div class="actions">
	    <div class="ui negative button">
	        No
	      </div>
	      <div class="ui positive right labeled icon button" id ="companyYesBtn">
	        Yes
	        <i class="checkmark icon"></i>
	      </div>
	  </div>
	</div>
</div>

<div id="dialog-confirm"></div>

<input type="file" value="확인">
</body>
<script src="../js/customerService.js?ver=1"></script>
<script src="../js/customerMember.js?ver=1"></script>
</html>