<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

.ui.modal>.image.content2 {
	margin-left: 29%;
	margin-bottom: 0%;
	flex-direction: column;
	background-color: black;
}

.ui.modal>.content {
	display: block;
    width: 50%;
    font-size: 1em;
    line-height: 1.4;
    padding: 1.5rem;
    background: #fff;
}


#companyWriteFormPopup{
	/* border: 1px solid red; */
	background-color: black;
}

.C_BtnDiv{
	margin-right: 3%;
}

.C_registerWrapper{
	margin-left: 5%;
}

#CtermDiv{
	color: white;
}

</style>

<!-- 사업자 회원가입 팝업 -->

<div class="ui modal2 modal" id="companyWriteFormPopup">							<i class="close icon"></i>
	 <div class="header" align="center">법인고객 - 회원가입 </div>

	<div class="image content2">


<div class="C_registerWrapper">
	
<form name="companyWriteForm" id="companyWriteForm" method="post"
action="/exhibition/company/companyWrite.do">
<br>
<div class="ui left icon input">
	<input type="text" name="C_businessname" id="Cw_businessname" placeholder="사업자명" style=width:300px>
	<i class="building icon"></i>
</div><br>
<div id="businessnameConfirm"></div>

<div class="ui left icon input">
	<input type="text" name="C_license" id="Cw_license" placeholder="사업자등록번호" style=width:300px>
	<i class="barcode icon"></i>
</div><br>
<div id="licenseConfirm"></div>

<div class="ui left icon input">
	<input type="password" name="C_password" id="Cw_password" placeholder="암호" style=width:300px>
	<i class="barcode icon"></i>
</div><br>
<div id="passwordConfirm"></div>

<div class="ui left icon input">
	<input type="password" name="C_repassword" id="Cw_repassword" placeholder="암호 확인" style=width:300px>
	<i class="barcode icon"></i>
</div><br>
<div id="repasswordConfirm"></div>

<div class="ui left icon input">
	<input type="text" name="C_corporate" id="Cw_corporate" placeholder="법인번호" style=width:300px>
	<i class="barcode icon"></i>
</div><br>
<div id="corporateConfirm"></div>

<div class="ui left icon input">
	<input type="text" name="C_condition" id="Cw_condition" placeholder="업태" style=width:300px>
	<i class="folder icon"></i>
</div><br>
<div id="conditionConfirm"></div>

<div class="ui icon input">
  <input type="text" name="C_postnumbox" id="Cw_postnumber" placeholder="우편번호" style=width:300px readonly>
  <i class="inverted circular search link icon" id="Cw_addrB" onclick="Postcode()"></i>
</div><br>

<div class="ui left icon input">
	<input type="text" name="C_address1" id="Cw_address1" placeholder="주소" readonly style=width:300px>
	<i class="address book icon"></i>
</div><br>
<div id="address1Confirm"></div>

<div class="ui left icon input">
	<input type="text" name="C_address2" id="Cw_address2" placeholder="상세주소" style=width:300px>
	<i class="address book icon"></i>
</div><br>
<div id="address2Confirm"></div>

<div class="ui left icon input">
	<input type="text" name="C_representative" id="Cw_representative" placeholder="대표자" style=width:300px>
	<i class="user icon"></i>
</div><br>
<div id="representativeConfirm"></div>

<div class="ui left icon input">
	<input type="text" name="C_tel" id="Cw_tel" placeholder="전화번호" style=width:300px>
	<i class="phone icon"></i>
</div><br>
<div id="telConfirm"></div>

<div class="ui left icon input">
	<input type="text" name="C_email" id="Cw_email" placeholder="이메일" style=width:300px>
	<i class="envelope icon"></i>
</div><br>
<div id="emailConfirm"></div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</form>

</div>

<div align="center" id="CtermDiv" style="font-size: 12px; margin-left: -40%;">이용약관을 확인하셔야 가입 가능합니다</div>

<br><div class="termDiv" align="center"><a class="ui primary button" id="terms_C" style="margin-left: -42%;">이용약관</a></div>

	<!--회원가입 약관 페이지 인클루드  -->
	<div><jsp:include page="../company/Cterms.jsp"/></div>

	<div class="C_BtnDiv" align="center" style="margin-left: -40%;">
	    <div class="ui black deny button" id="companyWriteForm-close">취소</div>
	    <div class="ui positive right labeled icon button" id="companyWrite">가입<i class="checkmark icon"></i></div>
	</div>



</div>

	

</div>
 

