<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
#OutModalWrapper{
	width: auto;
}

#Outcontent {
	margin-left: 0%;
	margin-bottom: 0%;
	flex-direction: column;
}

</style>
    
<div class="ui basic modal" id="OutModalWrapper">
  <div class="ui icon header">
    <i class="archive icon"></i>
   	회원탈퇴
  </div>
  <div class="content" id=Outcontent>
    <p style="font-color:'red'">탈퇴를 진행하기 위해 비밀번호를 입력하세요</p>
  </div>
  
  	<div>
	 	<div class="ui input error">
  			<input type="password" id="del_pass" placeholder="비밀번호를 입력하세요" style="width: 300px;">
		</div>
    </div>
  <div id="del_check"></div>
  
  <div class="actions">
    <div class="ui red basic cancel inverted button" id="del_cancel">
      <i class="remove icon"></i>
      	취소
    </div>
    <div class="ui green basic ok inverted button" id="del_OK">
      <i class="checkmark icon"></i>
      	확인
    </div>
  </div>
</div>