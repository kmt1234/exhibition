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

#modalWrapper{
	/* border: 1px solid red; */
	background-color: black;
}

.M_BtnDiv{
	margin-right: 34%;
}

.M_registerWrapper{
	margin-left: 5%;
}

.termDiv{
	color: white;
}

</style>
<!-- 개인 회원가입 팝업 -->

<div class="ui modal1 modal" id="modalWrapper">							<i class="close icon"></i>
  <div class="header" align="center">개인고객 - 회원가입 </div>
  
	<div class="image content">
	 
		<div class="M_registerWrapper">
			<form name="registerForm" id="registerForm" method="post" action="/exhibition/member/memberWrite.do">
		
				<div class="ui left icon input">
					<input type="text" name="M_Name" id="Mw_Name" placeholder="이름">
					<i class="user icon"></i>
				</div><br>
				<div id="nameConfirm"></div>
					
				<div class="ui left icon input">
					<input type="text" name="M_Id" id="Mw_Id" placeholder="아이디">
					<i class="id card icon"></i>
				</div><br>
				<div id="idConfirm"></div>
				
				<div class="ui left icon input">
					<input type="password" name="M_Pwd" id="Mw_Pwd" placeholder="비밀번호">
					<i class="lock icon"></i>
				</div><br>
				<div id="pwdConfirm"></div>
				
				<div class="ui left icon input">
					<input type="password" name="M_Pwd2" id="Mw_Pwd2" placeholder="비밀번호 재확인">
					<i class="lock icon"></i>
				</div><br>
				<div id="pwdConfirm2"></div>
				
				<div class="ui left icon input">
					<input type="text" name="M_Email" id="Mw_Email" placeholder="이메일">
					<i class="envelope outline icon"></i>
				</div><br>
				<div id="emailConfirm1"></div>
				
				<div class="ui left icon input">
					<input type="text" name="M_Phone" id="Mw_Phone" placeholder="휴대폰 번호">
					<i class="mobile alternate icon"></i>
				</div><br>
				<div id="phoneConfirm1"></div><br>
			 </form>
		  	
		</div><!--class=M_registerWrapper  -->
		  	
		  	<div class="registerConfirm" align="center"></div>
		  	
		  	<div align="center" class="termDiv" style="font-size: 12px;margin-left: -40%;">이용약관을 확인하셔야 가입 가능합니다</div>
		  	
		  	<br><div class="termDiv" align="center"><a class="ui primary button" id="terms_M" style="margin-left: -42%;">이용약관</a></div>
		  	
		  	<!--회원가입 약관 페이지 인클루드  -->
			<div><jsp:include page="../member/terms.jsp"/></div>
			
			<div class="M_BtnDiv" align="center">
			    <div class="ui black deny button" id="writeForm-close">취소</div>
			    <div class="ui positive right labeled icon button" id="register">가입<i class="checkmark icon"></i></div>
	  		</div>
			
	</div><!--class="image content"-->
 
</div><!--id="modalWrapper"-->

