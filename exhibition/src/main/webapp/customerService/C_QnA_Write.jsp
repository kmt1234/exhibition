<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.noresize {
  resize: none; /* 사용자 임의 변경 불가 */
}
</style>
<script type="text/javascript">
window.onload=function(){
	if('${classify}'=='위치/교통' || '${classify}'=='주차' || 
			'${classify}'=='전시/공연' || '${classify}'=='임대' || 
			'${classify}'=='시설' || '${classify}'=='기타'){
		document.getElementById("classify").value = '${classify}';
	}
}
</script>
</head>
<body>
<div class="ui compact menu" style="width: 930px; height:900px auto;  display: inline-block;" >
<form id="C_QnA_checkWrite" method="post" action="/exhibition/customerService/C_QnA_checkWrite.do">
	<h2 class="box-container"style="float: center; width: 100%; height:126px;  text-align: left;">
		<span>자주묻는</span>
		<span class="h-light">질문 작성</span>
		<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
			<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
			> 고객센터 > 자주묻는 질문  > 자주묻는 질문작성
		</div>
		<div class="ui divider"></div> 
	</h2>
	<table style="width:880px; margin-left: 20px;" class="ui celled table">
		<tr>
			<td style="width:8%; height:40px; background-color: #f7f6e6; font-size: 15px; text-align: center;" >분 류</td>
			
			<td style="width:20%;" >
				<select id="classify" class="ui selection dropdown" style="height: auto;">
					<option  value="위치/교통">위치/교통</option>
					<option  value="주차">주차</option>
					<option  value="전시/공연">전시&공연</option>
					<option  value="임대">임대</option>
					<option  value="시설">시설</option>
					<option  value="기타">기타</option>
				</select>
				<input type="text" name="C_qty" id="C_qty" value="${C_qty }">
			</td>
		</tr>
		<tr>
			<td style="width:8%; height:40px; background-color: #f7f6e6; font-size: 15px; text-align: center;" >제 목</td>
			
			<td style="width:20%;">
				<div>
					<input type="text" name="subject" id="subject" style="float: left; width:100%; height:40px;">
					<div id="subjectDiv"></div>
				</div>
			</td>
		</tr>	
		<tr>
			<td  align="center" style="width:8%; background-color: #f7f6e6; font-size: 15px;text-align: center;">내 용</td>
			
			<td style="width:20%; height: 15%">
				<div>
					<div><textArea name="content" id="content"  class=noresize style="float: left; width:100%; height: 300px;"></textArea></div>
					<div id="contentDiv"></div>
				</div>
			</td>
		</tr>
	
	</table>
	<div style="float: left; margin-left: 20px; ">
		<input type="button" id="C_QnA_checkWriteBtn" class="middle ui button" value="등록">
		<input type="reset" class="middle ui button" value="다시작성">
	</div>
	<div style="margin-top: 80px; " ></div>
</form>
</div>
<script src="../semantic/semantic.min.js"></script>
<script src="../js/C_QnA_js.js?ver=1"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.ui.selection.dropdown').dropdown();	
});
</script>
</body>
</html>