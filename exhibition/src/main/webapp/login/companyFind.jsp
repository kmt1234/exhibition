<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="ui modal-Find-Company modal" id="Find-CompanyModalWrapper">			<i class="close icon"></i>
	<div class="header" id="find-C-Result" align="center">법인-비밀번호 찾기</div>
  
		<div class="image FCcontent">  	
		  	<div class="ui inverted segment">
			  <div class="ui inverted form">
				 
				 <div class="ui tabular menu">
				  <div class="item" id="find-C-Pwd" style="color: white">비밀번호 찾기</div>
				</div>
							 
				 <div class="three fields" id="find-C-Pwd-Div">
				 	<div class="field">	
						  <label>사업자등록번호</label>
						  <input name="verify-C-Id" id="verify-C-Id" placeholder="사업자등록번호" type="text"><br>
						  <div class="verify-C-Id-Div"></div>
					</div>
					
					<div class="field">	
						  <label>가입한 이메일</label>
						  <input name="verify-C-Email" id="verify-C-Email" placeholder="가입한 이메일" type="text"><br>
						  <div class="verify-C-Email-Div"></div>
					</div>
					
					<div class="field">	
						  <label>인증번호 - &nbsp;
						  <span id="verify-Number2-Send"><i class="envelope outline icon"></i>인증번호 발송하기</span></label>
						  <input name="verify-Number2" id="verify-Number2" placeholder="인증번호 입력" type="text"><br>
						  <input type="hidden" class="verify-Number2-hidden">
					</div>   
					
				 </div> 
					 	     
			     <div align="center">
			      	<div class="ui primary submit button" id="confirm-C-verifyNum-Btn">인증번호 확인</div>
				    <div class="ui submit button" id="find-C-login-Btn">확인</div>
			     </div>
				  
			  </div><!--class="ui inverted form"-->
			</div><!--class="ui inverted segment"-->
		</div>  
</div>   