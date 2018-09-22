<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
#C-LoginModalWrapper{
	width: auto;
}

.ui.modal>.image.LCcontent {
	margin-left: 0%;
	margin-bottom: 0%;
	flex-direction: column;
}

.ui.form .fields {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: horizontal;
    -webkit-box-direction: normal;
    -ms-flex-direction: row;
    flex-direction: row;
    margin: 0 5.5em 1em;
}

</style>

<div class="ui modal-Login-Company modal" id="C-LoginModalWrapper">							<i class="close icon"></i>
  <div class="header" align="center">법인-로그인</div>
  
	  <div class="image LCcontent">
	  
	  	<div class="ui inverted segment">
			  <div class="ui inverted form">
			    <div class="two fields">
				    <form name="CloginForm" id="CloginForm" method="post" action="/exhibition/login/Clogin.do">
				      <div class="field">
				      	<label>사업자번호</label>
				      	<input name="C_license" id="C_license" placeholder="사업자번호" type="text"><br>
				      </div><span id="C_license-Confirm"></span><br>
				      <br>	
				      <div class="field">
				        <label>비밀번호</label>
				        <input name="C_Pwd" id="C_Pwd" placeholder="Password" type="password"><br>
				      </div><span id="C_pwd-Confirm"></span><br>
				    </form>
			    </div>
			    
			    <div class="inline field">
			      <div class="C-find-id-pwd" align="center">
			        <a style="cursor: pointer;">가입된 사업자번호의 비밀번호를 잊었으면 클릭하세요</a>
			      </div>
			    </div>
			    
			    <div class="aa" align="center">
				    <div class="ui submit button" id="Clogin">로그인</div><br>
				    <span id="C_login-Confirm"></span>
			    </div>
			    
			  </div>
			</div>
		  	
  		</div><!--image content-->
</div>

<!--법인회원 아이디 및 비밀번호 찾기 인클루드-->
<jsp:include page="../login/companyFind.jsp"/>   