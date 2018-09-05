<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<style>
#verify-Number-Send{
	cursor: pointer;
}
	
</style>
<div class="ui modal-Find-Member modal" id="Find-MemberModalWrapper">			<i class="close icon"></i>
	<div class="header" id="find-M-Result" align="center">개인-아이디 및 비밀번호 찾기</div>
  
		<div class="image FMcontent">  	
		  	
		  	<div class="ui inverted segment">
			  <div class="ui inverted form">
				 
				 <div class="ui tabular menu">
				  <div class="item active" id="find-M-Id">아이디 찾기</div>
				  <div class="item" id="find-M-Pwd" style="color: white">비밀번호 찾기</div>
				</div>
				 
				 <div class="three fields" id="find-M-Id-Div">
					  <div class="field">	
						  <label>이름</label>
						  <input name="find-M-Name" id="find-M-Name" placeholder="이름" type="text"><br>
						  <div class="find-M-Name-Div"></div>
					  </div>
					  <div class="field">	
						  <label>연락처</label>
						  <input name="find-M-Phone" id="find-M-Phone" placeholder="핸드폰" type="text"><br>
						  <div class="find-M-Phone-Div"></div>
					  </div>
					  <div class="field">	
						  <label>이메일</label>
						  <input name="find-M-Email" id="find-M-Email" placeholder="이메일" type="text"><br>
						  <div class="find-M-Email-Div"></div>
					  </div>
				</div>
				
				<div align="center">
				    <div class="ui primary submit button" id="find-M-Id-Btn">아이디 찾기</div><br>
			    </div>
				 
				 <div class="three fields" id="find-M-Pwd-Div">
				 	<div class="field">	
						  <label>아이디</label>
						  <input name="verify-M-Id" id="verify-M-Id" placeholder="아이디" type="text"><br>
						  <div class="verify-M-Id-Div"></div>
					</div>
					
					<div class="field">	
						  <label>가입한 이메일</label>
						  <input name="verify-Email" id="verify-Email" placeholder="가입한 이메일" type="text"><br>
						  <div class="verify-Email-Div"></div>
					</div>
					
					<div class="field">	
						  <label>인증번호 - &nbsp;
						  <span id="verify-Number-Send"><i class="envelope outline icon"></i>인증번호 발송하기</span></label>
						  <input name="verify-Number" id="verify-Number" placeholder="인증번호 입력" type="text"><br>
						  <input type="hidden" class="verify-Number-hidden">
					</div>
					
				 </div> 
					 	     
			     <div align="center">
			      	<div class="ui primary submit button" id="confirm-M-verifyNum-Btn">인증번호 확인</div>
				    <div class="ui submit button" id="find-M-login-Btn">로그인</div>
			     </div>
				  
			  </div><!--class="ui inverted form"-->
			</div><!--class="ui inverted segment"-->
		</div><!--class="image FMcontent"  -->  
</div>