<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#subjectA:link{color:black; text-decoration: none;}
#subjectA:visited{color:black; text-decoration: none;}
#subjectA:hover{color:green; text-decoration: underline; font-weight: bold; cursor: pointer;}
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
<script src="../js/C_inquire_Search_js.js?ver=1"></script>
<script type="text/javascript">
window.onload=function(){
	if('${searchOption}'=='subject' || '${searchOption}'=='name'){
		document.getElementById("searchOption").value = '${searchOption}';
	}
}
</script>
</head>
<body>
<div class="ui compact menu" style="width: 930px; height:900px auto;  display: inline-block;" >
	<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
		<span>고객의</span>
		<span class="h-light">소리</span>
		<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
			<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
			> 고객센터 > 고객의 소리 > 내용
		</div>
		<div class="ui divider"></div> 
	</h2>

<div style="width: 880px; margin-left: 20px;" align="center">
	<table style="height: 40px; " align="center" border="1" bordercolor="#ec008c" cellpadding="4"  rules="rows"
	id="C_inquire_SearchList" class="ui striped table" >
		<tr>
			<td style="width: 50px;  padding-top: 10px; text-align: center;">번호 </td>
			<td style="width: 50px;  padding-top: 10px; text-align: center;"></td>
			<td style="width: 250px;  padding-top: 10px; text-align: center;">제목</td>
			<td style="width: 100px;  padding-top: 10px; text-align: center;">작성자</td>
			<td style="width: 150px;  padding-top: 10px; text-align: center;">이메일</td>
			<td style="width: 100px;  padding-top: 10px; text-align: center;">등록일</td>
		</tr>
	</table>
	<input type="hidden" id="pg" value="${pg }">
	<input type="hidden" id="keyword" value="${keyword }">
	<br>
	<div id="C_inquire_SearchPagingDiv" class="ui center pagination menu"></div>
	<input type="hidden" name="pg" id="pg1" value="${pg}">
	<br><br>
	<select name="searchOption" id="searchOption"  class="ui selection dropdown">
		<option value="subject" style="width:100px">제목</option>
		<option value="name">작성자</option>
	</select>
	<div class="ui input" style="width: 50%;">
		<input type="text" name="keyword" id="keyword1" value="${keyword }">
	</div>
		<input type="button" class="middle ui button"  value="검색" id="C_inquire_SearchBtn">
	</div>
	<div style="margin-top: 40px;"></div>
</div>


</body>
</html>