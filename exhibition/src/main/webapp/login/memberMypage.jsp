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
<div class="ui compact menu" style="width: 930px; height:900px auto;  display: inline-block;" >
	<h2 class="box-container" style="float: center; width: 100%; height:126px; text-align: left;">
		<span>마이</span>
		<span class="h-light">페이지</span>
		<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
		<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
		> 고객센터 > 마이페이지 
	</div>
	<div class="ui divider"></div> 
	</h2>
	<div style="width: 100%;">
		<!-- 맨위 메뉴 텝 -->
		<div style="margin-left: 20px; width:880px; float: left; text-align: left;">
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
		<div class="" id="modify-Div" style="margin-left: 20px; float: left;" >
			<div>
				<div style="width: 100%">
				  	<div class="content" >
				    	<div class="description" align="left">
				    	<br>
				    		<div >
				    			<h2 class="header" id="M-modify-id" style="float: left;" >ID : ${DTO.getM_Id()}</h2>
					    		<input type="hidden" id="M-modify-id-hidden" value="${DTO.getM_Id()}">
					    	</div>
					    	<!--  -->
				      		<div style="width: 60%;">
								<br>
								<div class="ui labeled input">
									<div class="ui label" style="width: 80px;">
									이 름 
									</div>
									<div class="ui inverted input" style="width: 100%;">
										<div class="ui left icon input" style="width: 100%; height: 50px;">
											<input type="text" id="textf" disabled="disabled" value="${DTO.getM_Name()}">
											<i class="user icon"></i>
										</div>
								  	</div>
							  	</div>
								<br><br>
								<div class="ui labeled input">
								<div class="ui label">
									비밀번호 
									</div>
								<div class="ui inverted input" style="width: 100%;">
									
									<div class="ui left icon input" style="width: 100%; height: 50px;">
										<br>
										<input type="password" id="M-modify-pwd"  placeholder="새 비밀번호">
										<i class="lock icon"></i>
									</div>
							  	</div><!--class="ui inverted input"-->
							  	</div>
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
		
	
	<div class="ui segment" id="Ticket-History-Div">
	  
	 
	  
	</div>		
</div><!-- 전체 -->
</div>
<script src="../js/memberMypage.js?ver=1"></script>