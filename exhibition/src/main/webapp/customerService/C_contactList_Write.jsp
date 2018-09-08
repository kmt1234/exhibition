<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<form id="C_contactList_WriteForm" method="post" action="/exhibition/customerService/C_contactList_Write.do">
	<select name="C_contactLiost_classifyMenu" id="C_contactLiost_classifyMenu" onchange="C_contactLiost_classifyMenu">
		<option  value="분류 전체">분류 전체</option>
		<option  value="기관별 주요전화번호">기관별 주요전화번호</option>
		<option  value="시설이용/불편신고">시설이용/불편신고</option>
		<option  value="무역정보 안내">무역정보 안내</option>
		<option  value="편의시설">편의시설</option>
	</select>
	
	<select name="C_contactLiost_agencyMenu1" id="C_contactLiost_agencyMenu1">
		<option value="기관/시설 전체">기관/시설 전체</option>
	</select>
	
	<select name="C_contactLiost_agencyMenu2" id="C_contactLiost_agencyMenu2">
		<option value="기관/시설 전체">기관/시설 전체</option>
		<option value="코엑스">코엑스 협회</option>
		<option value="한국무역 협회">한국무역 협회</option>
		<option value="한국무역 정보통신">한국무역 정보통신</option>
		<option value="한국도심공항">한국도심공항</option>
		<option value="호텔인터컨티넬탈 서울">호텔인터컨티넬탈 서울</option>
		<option value="현대백화점">현대백화점</option>
	</select>
	
	<select name="C_contactLiost_agencyMenu3" id="C_contactLiost_agencyMenu3">
		<option value="기관/시설 전체">기관/시설 전체</option>
		<option value="안전상황실(도난,보안,경비)"></option>
		<option value="화재신고 (무역센터 전체 6000-0119)"></option>
		<option value="전기고장 신고">전기고장 신고</option>
		<option value="승강기고장 신고">승강기고장 신고</option>
		<option value="기계(냉난방, 누수등)고장">기계(냉난방, 누수등)고장</option>
		<option value="전화기 고장신고">전화기 고장신고</option>
		<option value="청소">청소</option>
		<option value="주차">주차</option>
	</select>
	
	<select name="C_contactLiost_agencyMenu4" id="C_contactLiost_agencyMenu4">
		<option value="기관/시설 전체">기관/시설 전체</option>
		<option value="자료실">자료실</option>
		<option value="전시정보">전시정보</option>
		<option value="무역상담 및 경영상담">무역상담 및 경영상담</option>
		<option value="수출입업체 및 거래 알선">수출입업체 및 거래 알선</option>
	</select>
	
	<select name="C_contactLiost_agencyMenu5" id="C_contactLiost_agencyMenu5">
		<option value="기관/시설 전체">기관/시설 전체</option>
		<option value="우체국">우체국</option>
		<option value="전화국">전화국</option>
		<option value="은행">은행</option>
		<option value="항공사">항공사</option>
		<option value="병원">병원</option>
		<option value="약국">약국</option>
	</select>
	
	명칭<input type="text" name="name">
	연락처<input type="text" name="contact">
</form>
<div>
	<input type="button" id="C_contactList_checkWrite" value="등록">
</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/customerService.js"></script>
<script>
/* $(document).ready(function(){
	var C_contactLiost_classifyMenu
	if(C_contactLiost_classifyMenu==){
		
	}
}); */
</script>
</body>
</html>