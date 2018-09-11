<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
.ui.inverted.divider {
    margin: 5px 0;
}
</style>

<div class="ui secondary pointing menu">
	
	<a class="active item" id="member-info-modify">
		수정
  	</a>
  	<a class="item" id="member-ticket-list">
    	예매리스트
 	</a>
  	<a class="item" id="member-ticket-history">
    	예매 내역
  	</a>
  
  	<div class="right menu">
    	<a class="ui item">마이페이지</a>
  	</div>
  	
</div>

<div class="ui segment" id="modify-Div"><a class="ui red left ribbon label">Modify</a>
	<div align="center">
		<div class="ui card"><!-- <div class="image"><img src="../img/userModify.png"></div> -->
		  	<div class="content">
		    	<a class="header" id="M-modify-id">ID : ${DTO.getM_Id()}</a>
		    	<input type="hidden" id="M-modify-id-hidden" value="${DTO.getM_Id()}">
		    	<div class="meta"><span>가입일자(DB 수정해야함)</span></div>
		    	
		    	<div class="description">
		      		<div class="ui inverted segment">
						
						<div class="ui inverted input">
							<div class="ui left icon input">
								<input type="text" id="" disabled="disabled" value="${DTO.getM_Name()}">
								<i class="user icon"></i>
							</div>
					  	</div><!--class="ui inverted input"-->
					
					<div class="ui inverted divider"></div>
					
						<div class="ui inverted input">
							<div class="ui left icon input">
								<input type="password" id="M-modify-pwd"  placeholder="새 비밀번호">
								<i class="lock icon"></i>
							</div>
					  	</div><!--class="ui inverted input"-->
					  	<br><span class="M-modify-pwd-Span"></span>
					  	
					<div class="ui inverted divider"></div>  	
					  	
					  	<div class="ui inverted input">
							<div class="ui left icon input">
								<input type="password" id="M-modify-pwd2"  placeholder="새 비밀번호 확인">
								<i class="lock icon"></i>
							</div>
					  	</div><!--class="ui inverted input"-->
					  	<br><span class="M-modify-pwd2-Span"></span>
					  	
					<div class="ui inverted divider"></div>
						
						
						<div class="ui inverted input">
							<div class="ui left icon input">
								<input type="text" id="M-modify-phone" value="${DTO.getM_Phone()}" >
								<i class="mobile alternate icon"></i>
							</div>
					  	</div><!--class="ui inverted input"-->
					  	<br><span class="M-modify-phone-Span"></span>
					  	
					<div class="ui inverted divider"></div>
						
					
						<div class="ui inverted input">
							<div class="ui left icon input">
								<input type="text" id="M-modify-email" value="${DTO.getM_Email()}" >
								<i class="envelope outline icon"></i>
							</div>
					  	</div><!--class="ui inverted input"-->
					  	<br><span class="M-modify-email-Span"></span>
					  	
					<div class="ui inverted divider"></div>
					
						<div class="ui two buttons">
					    	<div class="ui basic green button" id="M-modify-modify">수정</div>
					        <div class="ui basic red button" id="M-modify-cancel">취소</div>
					    </div>
					    <br><span class="M-modify-result-Span"></span>
							
							
							<div><!-- 회원탈퇴버튼 -->
								<button class="ui black button" id="member-out" style="margin-right: -340%;">회원탈퇴</button>
							</div>
							
							<div class="ui modal3">
								  <div class="content">
								    <p>탈퇴하시겠습니까?</p>
								  </div>
								  <div class="actions">
								    <div class="ui red basic cancel inverted button" id="out-no">
								      <i class="remove icon"></i>
								      	아니오
								    </div>
								    <div class="ui green submit inverted button" id="out-yes">
								      <i class="checkmark icon"></i>
								      	네
								    </div>
								  </div>
							</div>
							
							
							<jsp:include page="memberOut.jsp"/>
							
							
							
							
										
		    		</div><!--class="ui inverted segment"-->
		    		
		  		</div><!--class="description"  -->
			  	
			</div><!--class="content"  -->
		</div><!--class="ui card"-->
	</div><!--align="center"  -->
</div><!--id="modify-Div"  -->


<div class="ui segment" id="Ticket-List-Div">
<a class="ui blue left ribbon label">Ticket List</a>
  
  <div>
	  <p>예매리스트</p>
	  <p>예매리스트</p>
	  <p>예매리스트</p>
	  <p>예매리스트</p>
	  <p>예매리스트</p>
	  <p>예매리스트</p>
	  <p>예매리스트</p>
	  <p>예매리스트</p>
	  <p>예매리스트</p>
	  <p>예매리스트</p>
  </div>
  
</div>	

<div class="ui segment" id="Ticket-History-Div">
<a class="ui green left ribbon label">Ticket History</a>
  
  <div>
	  <p>예매내역</p>
	  <p>예매내역</p>
	  <p>예매내역</p>
	  <p>예매내역</p>
	  <p>예매내역</p>
	  <p>예매내역</p>
	  <p>예매내역</p>
	  <p>예매내역</p>
	  <p>예매내역</p>
  </div>
  
</div>		

<!--페이지 인클루드 후 삭제해야합니다!!!!******(제이쿼리 충돌 방지 )  -->
<link rel="stylesheet" type="text/css" href="../semantic/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="../semantic/semantic.min.js"></script>
<script src="../js/memberMypage.js"></script>