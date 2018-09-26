<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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

#kakaoImg{
	width: 20px;
	height: 20px;
	cursor: pointer;
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
				    <div class="ui submit button" id="Mlogin">로그인</div>	
				    <span id="login-Confirm"></span>
			    </div>
			    
			  </div><!--class="ui inverted form"-->
			  <div><img id="kakaoImg" src="../img/kakaolink_btn_small_ov.png"></div>
			</div><!--class="ui inverted segment"-->
  		</div><!--image content-->
  		 
  		 <!--카카오 로그인 폼  -->
  		<form name="kakaoLogin" id="kakaoLogin" method="post" action="/exhibition/login/Klogin.do">
  		<input type="hidden" name="kakaoId" id="kakaoId">
  		<input type="hidden" name="kakaoNickname" id="kakaoNickname">
  		<input type="hidden" name="kakaoEmail" id="kakaoEmail">
  		</form>
</div>    

<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('346e69ae342208229247757e9fe3bab8');
    function loginWithKakao() {
    	Kakao.Auth.cleanup();
    	 // 로그인 창을 띄웁니다.
        Kakao.Auth.login({
        	persistAccessToken: true,
          persistRefreshToken: true,
          success: function(authObj) {
            alert(JSON.stringify(authObj));
         // 로그인 성공시, API를 호출합니다.
            Kakao.API.request({
              url: '/v2/user/me',
              success: function(res) {
                //alert(JSON.stringify(res));
                console.log(res.id);	//유저의 아이디
                console.log(res.properties['nickname']);	//유저의 닉네임
                console.log(res.kaccount_email);	//유저 이메일
                
                $('#kakaoId').val(res.id);
                $('#kakaoNickname').val(res.properties['nickname']);
                $('#kakaoEmail').val(res.kaccount_email);
                setCookie("kakao_login","done",1); // 쿠키생성 (로그인)
                $('#kakaoLogin').submit();
               
              },
              fail: function(error) {
            	  alert('네트워크 에러 발생. 관리자에게 문의하세요');
            	  location.href='/exhibition/main/index.do';
                //alert(JSON.stringify(error));
              }
            });
          },
          fail: function(err) {
        	  alert('네트워크 에러 발생. 관리자에게 문의하세요');
        	  location.href='/exhibition/main/index.do';
            //alert(JSON.stringify(err));
          }
        });
      };
      
/* 로그인 관련 쿠키 생성 및 삭제 */
function setCookie( name , value , expired ){
 
 var date = new Date();
 date.setHours(date.getHours() + expired);
 var expried_set = "expries="+date.toGMTString();
 document.cookie = name + "=" + value + "; path=/;" + expried_set + ";"
 
}

function getCookie(name){
	 
    var nameofCookie = name + "=";
    var x = 0;
    while(x <= document.cookie.length){
        var y = ( x + nameofCookie.length);
        if(document.cookie.substring(x,y) == nameofCookie){
            if((endofCookie = document.cookie.indexOf(";",y)) == -1)
                endofCookie = document.cookie.length;
            return unescape(document.cookie.substring(y,endofCookie));
        }
        x = document.cookie.indexOf(" ",x) + 1;
        if( x == 0 )
            break;
        }
        
        return "";
}      
</script>


<!--개인회원 아이디 및 비밀번호 찾기 인클루드-->
<jsp:include page="../login/memberFind.jsp"/>