<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.noresize {
  resize: none; /* 사용자 임의 변경 불가 */
}
</style>
</head>
<body>
<form id="C_QnA_checkWrite" method="post" action="/exhibition/customerService/C_QnA_checkWrite.do">
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	자주묻는
	<span class="h-light">질문 작성</span>
</h2>
<table style="width:100%;" class="ui celled table">
	<tr>
		<td style="width:8%; height:40px; background-color: #f7f6e6; font-size: 15px; text-align: center;" >분 류</td>
		
		<td style="width:20%;" >
			<select id="classify" class="ui selection dropdown" style="height: auto;">
				<option  value="위치/교통">위치/교통</option>
				<option  value="주차">주차</option>
				<option  value="전시/공연">전시&공연</option>
				<option  value="임대">임대</option>
				<option  value="시설">시설</option>
				<option  value=기타>기타</option>
			</select>
			<input type="hidden" name="C_qty" id="C_qty">
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
			<input type="button" id="C_QnA_checkWriteBtn" class="middle ui button" value="등록">
			<input type="reset" class="middle ui button" value="다시작성">
</form>
<script src="../semantic/semantic.min.js"></script>
<script src="../js/C_QnA_js.js?ver=1"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.ui.selection.dropdown').dropdown();	
});
</script>
</body>
</html>