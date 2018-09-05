<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
#M-LoginModalWrapper{
	width: auto;
}

.ui.modal>.image.LMcontent {
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
    
<div class="ui modal-Login-Member modal" id="M-LoginModalWrapper">							<i class="close icon"></i>
	<div class="header" align="center">개인-로그인</div>
  
		<div class="image LMcontent">  	
		  	
		  	<div class="ui inverted segment">
			  <div class="ui inverted form">
			  
			    <div class="two fields">
				    <form name="loginForm" id="loginForm" method="post" action="/exhibition/member/login.do">	
				      <div class="field">	
				        <label>아이디</label>
				        <input name="M_Id" id="M_Id" placeholder="ID" type="text"><br>
				      </div><span id="id-Confirm"></span><br>
				      <br>
				      <div class="field">
				        <label>비밀번호</label>
				        <input name="M_Pwd" id="M_Pwd" placeholder="Password" type="password"><br>
				      </div><span id="pwd-Confirm"></span><br>
				    </form>
			    </div>
			    
			    <div class="inline field">
			      <div class="M-find-id-pwd" align="center">
			        <a style="cursor: pointer;">아이디 또는 비밀번호 찾기를 원하시면 클릭하세요</a>
			      </div>
			    </div>
			    
			    <div align="center">
				    <div class="ui submit button" id="Mlogin">로그인</div><br>
				    <span id="login-Confirm"></span>
			    </div>
			    
			  </div><!--class="ui inverted form"-->
			</div><!--class="ui inverted segment"-->
		  
  		</div><!--image content-->
  
</div>    

<!--개인회원 아이디 및 비밀번호 찾기 인클루드-->
<jsp:include page="../login/memberFind.jsp"/>