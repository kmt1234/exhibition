<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
.ui.inverted.divider2 {
    margin: 5px 0;
}
.ui.left.icon.input{
	width : 300px;
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
		<div class="ui card" style="width: 35%;>
		  	<div class="content" style="width: 356px;">
		    	<a class="header" id="C-modify-businessname" style="font-size: 20px;">사업자명 : ${DTO.getC_businessname()}</a>
		    	<input type="hidden" id="C-modify-businessname-hidden" value="${DTO.getC_businessname()}">
		    	<div class="meta"><span id="modify-license">사업자번호 : ${DTO.getC_license()}</span></div>
		    	<input type="hidden" id="C-modify-license-hidden" value="${DTO.getC_license()}">
		    	<div class="meta"><span id="modify-corporate">법인번호 : ${DTO.getC_corporate()}</span></div>
		    	
		    	<div class="description">
		      		<div class="ui inverted segment" style="width:90%;">
						
						<div class="ui inverted input">
							<div class="ui left icon input">
								<input type="text" id="" disabled="disabled" value="${DTO.getC_representative()}">
								<i class="user icon"></i>
							</div>
					  	</div>
					
					<div class="ui inverted divider2"></div>
					
						<div class="ui inverted input">
							<div class="ui left icon input">
								<input type="password" id="C-modify-pwd"  placeholder="새 비밀번호">
								<i class="lock icon"></i>
							</div>
					  	</div>
					  	<br><span class="C-modify-pwd-Span"></span>
					  	
					<div class="ui inverted divider2"></div>  	
					  	
					  	<div class="ui inverted input">
							<div class="ui left icon input">
								<input type="password" id="C-modify-repwd"  placeholder="새 비밀번호 확인">
								<i class="lock icon"></i>
							</div>
					  	</div>
					  	<br><span class="C-modify-repwd-Span"></span>
					  	
					<div class="ui inverted divider2"></div>	
					
						<div class="ui inverted input">
							<div class="ui left icon input">
								<input type="text" id="C-modify-condition" value="${DTO.getC_condition()}" >
								<i class="briefcase icon"></i>
							</div>
					  	</div>
					  	<br><span class="C-modify-condition-Span"></span>
					  	
					<div class="ui inverted divider2"></div>
					
					<div>
						<button class="ui inverted button" style="width:31%;" onclick="modifyPostcode()">우편검색</button>
							<div class="ui input" style="width:51%;margin-left:-1%;">
  								<input type="text" id="C-modify-postnumber" value="${DTO.getC_postnumbox()}" disabled="disabled">
  							</div>
					</div>
					
					<div class="ui inverted divider2"></div>					
					
						<div class="ui inverted input">
							<div class="ui left icon input">
								<input type="text" id="C-modify-address1" value="${DTO.getC_address1()}" disabled="disabled">
								<i class="address book icon"></i>
							</div>
					  	</div>
					  	<br><span class="C-modify-address1-Span"></span>
					  	
					<div class="ui inverted divider2"></div>		
						
						<div class="ui inverted input">
							<div class="ui left icon input">
								<input type="text" id="C-modify-address2" value="${DTO.getC_address2()}" placeholder="상세주소">
								<i class="address book icon"></i>
							</div>
					  	</div>
					  	<br><span class="C-modify-address2-Span"></span>
					  	
					<div class="ui inverted divider2"></div>				
						
						<div class="ui inverted input">
							<div class="ui left icon input">
								<input type="text" id="C-modify-phone" value="${DTO.getC_tel()}" >
								<i class="mobile alternate icon"></i>
							</div>
					  	</div>
					  	<br><span class="C-modify-phone-Span"></span>
					  	
					<div class="ui inverted divider2"></div>
						
					
						<div class="ui inverted input">
							<div class="ui left icon input">
								<input type="text" id="C-modify-email" value="${DTO.getC_email()}" >
								<i class="envelope outline icon"></i>
							</div>
					  	</div>
					  	<br><span class="C-modify-email-Span"></span>
					  	
					<div class="ui inverted divider2"></div>
					
						<div class="ui two buttons">
					    	<div class="ui basic green button" id="C-modify-modify">수정</div>
					        <div class="ui basic red button" id="C-modify-cancel">취소</div>
					    </div>
					    <br><span class="C-modify-result-Span"></span>
										
		    		</div>
		    		
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
<script src="../js/companyMypage.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../js/post.js"></script>