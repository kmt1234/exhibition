<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
.ui.inverted.divider {
    margin: 5px 0;
}
#textf {
	width: 40%;
	float: left;
}
</style>
<div style="width: 100%;">
	<!-- 맨위 메뉴 텝 -->
	<div class="">
		
		<a class="middle ui button" class="active item" id="member-info-modify">
			수정
	  	</a>
	  	<a class="middle ui button" class="item" id="member-ticket-list">
	    	예매리스트
	 	</a>
	  	<a class="middle ui button" class="item" id="member-ticket-history">
	    	예매 내역
	  	</a>
	  	
	</div>
	<!-- 메인메뉴 -->
	<div class="" id="modify-Div" align="left" >
		<div>
			<div style="width: 100%">
			  	<div class="content" >
			    	<div class="description" align="left">
			    	<br>
			    		<div >
			    		<h2 class="header" id="M-modify-id" style="float: left;" >ID : ${DTO.getM_Id()}</h2>
				    	<input type="hidden" id="M-modify-id-hidden" value="${DTO.getM_Id()}">
				   		
				    	<span class="meta" style="float: left; padding-top: 12px;">&nbsp;&nbsp;&nbsp;가입일자(DB 수정해야함)</span>
				    	</div>
				    	<!--  -->
			      		<div style="width: 60%;">
							<br>
							<div class="ui inverted input" style="width: 100%;">
								<div class="ui left icon input" style="width: 100%; height: 50px;">
									<input type="text" id="textf" disabled="disabled" value="${DTO.getM_Name()}">
									<i class="user icon"></i>
								</div>
						  	</div>
						  	
							<br><br>
							<div class="ui inverted input" style="width: 100%;">
								
								<div class="ui left icon input" style="width: 100%; height: 50px;">
									<br>
									<input type="password" id="M-modify-pwd"  placeholder="새 비밀번호">
									<i class="lock icon"></i>
								</div>
						  	</div><!--class="ui inverted input"-->
						  	<br><span class="M-modify-pwd-Span"></span>
								
						  	<br>
						  	<div class="ui inverted input" style="width: 100%;">
								<div class="ui left icon input" style="width: 100%; height: 50px;">
									<input type="password" id="M-modify-pwd2"  placeholder="새 비밀번호 확인">
									<i class="lock icon"></i>
								</div>
						  	</div><!--class="ui inverted input"-->
						  	<br><span class="M-modify-pwd2-Span"></span>
							
							<br>
							<div class="ui inverted input" style="width: 100%;">
								<div class="ui left icon input" style="width: 100%; height: 50px;">
									<input type="text" id="M-modify-phone" value="${DTO.getM_Phone()}" >
									<i class="mobile alternate icon"></i>
								</div>
						  	</div><!--class="ui inverted input"-->
						  	<br><span class="M-modify-phone-Span"></span>
							
							<br>
							<div class="ui inverted input" style="width: 100%;">
								<div class="ui left icon input" style="width: 100%; height: 50px;">
									<input type="text" id="M-modify-email" value="${DTO.getM_Email()}" >
									<i class="envelope outline icon"></i>
								</div>
						  	</div><!--class="ui inverted input"-->
						  	<br><span class="M-modify-email-Span"></span>
							
							<br>
							<div class="ui two buttons">
						    	<div class="middle ui button" id="M-modify-modify" style="width: 30%;">수정</div>
						    	<div style="width: 5%;">&nbsp;</div>
						    	<button class="middle ui button" id="member-out" style="width: 30%;">회원탈퇴</button>
						    	<div style="width: 5%;">&nbsp;</div>
						        <div class="middle ui button" id="M-modify-cancel" style="width: 30%;">취소</div>
						    </div>
						    <br><span class="M-modify-result-Span"></span>
								
								<!-- 숨어있다 -->
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
								</div><!-- 숨어있다 -->
								
								
								<jsp:include page="memberOut.jsp"/>
								
								
			    		</div><!--수정영역 텍스트필드-->
			    		
			  		</div><!--class="description"  -->
				  	
				</div><!--class="content"  -->
			</div><!--class="ui card"-->
		</div><!--align="center"  -->
	</div><!--id="modify-Div"  -->
	
	
	<div class="ui segment" id="Ticket-List-Div">
	  
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
</div><!-- 전체 -->
<!--페이지 인클루드 후 삭제해야합니다!!!!******(제이쿼리 충돌 방지 )  -->
<link rel="stylesheet" type="text/css" href="../semantic/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="../semantic/semantic.min.js"></script>
<script src="../js/memberMypage.js?ver=1"></script>