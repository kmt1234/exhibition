<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

.ui.modal>.image.content {
	margin-left: 37%;
	margin-bottom: 0%;
	flex-direction: column;
	background-color: black;
}

.ui.modal>.content {
	display: block;
    width: 29%;
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

	<div class="image content">


<div class="C_registerWrapper">
	
<form name="companyWriteForm" id="companyWriteForm" method="post"
action="/exhibition/company/companyWrite.do">
<div class="ui left icon input">
	<input type="text" name="C_businessname" id="Cw_businessname" placeholder="사업자명">
	<i class="building icon"></i>
</div><br>
<div id="businessnameConfirm"></div>

<div class="ui left icon input">
	<input type="text" name="C_license" id="Cw_license" placeholder="사업자등록번호">
	<i class="barcode icon"></i>
</div><br>
<div id="licenseConfirm"></div>

<div class="ui left icon input">
	<input type="password" name="C_password" id="Cw_password" placeholder="암호">
	<i class="barcode icon"></i>
</div><br>
<div id="passwordConfirm"></div>

<div class="ui left icon input">
	<input type="password" name="C_repassword" id="Cw_repassword" placeholder="암호 확인">
	<i class="barcode icon"></i>
</div><br>
<div id="repasswordConfirm"></div>

<div class="ui left icon input">
	<input type="text" name="C_corporate" id="Cw_corporate" placeholder="법인번호">
	<i class="barcode icon"></i>
</div><br>
<div id="corporateConfirm"></div>

<div class="ui left icon input">
	<input type="text" name="C_condition" id="Cw_condition" placeholder="업태">
	<i class="folder icon"></i>
</div><br>
<div id="conditionConfirm"></div>

<div class="ui icon input">
  <input type="text" id="addrText" placeholder="주소검색">
  <i class="inverted circular search link icon" id="addrB"></i>
</div><br>

<div class="ui left icon input">
	<input type="text" name="C_address1" id="Cw_address1" value="주소검색를 검색하세요" readonly>
	<i class="address icon"></i>
</div><br>
<div id="address1Confirm"></div>

<div class="ui left icon input">
	<input type="text" name="C_address2" id="Cw_address2" placeholder="상세주소">
	<i class="address icon"></i>
</div><br>
<div id="address2Confirm"></div>

<div class="ui left icon input">
	<input type="text" name="C_representative" id="Cw_representative" placeholder="대표자">
	<i class="user icon"></i>
</div><br>
<div id="representativeConfirm"></div>

<div class="ui left icon input">
	<input type="text" name="C_tel" id="Cw_tel" placeholder="전화번호">
	<i class="phone icon"></i>
</div><br>
<div id="telConfirm"></div>

<div class="ui left icon input">
	<input type="text" name="C_email" id="Cw_email" placeholder="이메일">
	<i class="envelope icon"></i>
</div><br>
<div id="emailConfirm"></div>

</form>

</div>

<div align="center" id="CtermDiv" style="font-size: 12px;">이용약관을 확인하셔야 가입 가능합니다</div>

<br><div class="termDiv" align="center"><a class="ui primary button" id="terms_C">이용약관</a></div>

	<!--회원가입 약관 페이지 인클루드  -->
	<div><jsp:include page="../company/Cterms.jsp"/></div>

	<div class="C_BtnDiv" align="center">
	    <div class="ui black deny button" id="companyWriteForm-close">취소</div>
	    <div class="ui positive right labeled icon button" id="companyWrite">가입<i class="checkmark icon"></i></div>
	</div>



</div>

	

</div>
 

