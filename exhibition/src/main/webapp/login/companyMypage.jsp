<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.ui.inverted.divider2 {
	margin: 5px 0;
}
#textf {
	width: 40%;
	float: left;
}
.ui.left.icon.input {
	width: 300px;
}
</style>
<div style="width: 100%;">
	<!-- 맨위 메뉴 텝 -->
	<div class="">
		<a class="middle ui button" class="active item" id="member-info-modify" style="width: 130px;"> 수정 </a>
		<a class="middle ui button" class="item"id="member-ticket-list" style="width: 130px;"> 임대리스트 </a>
		<a class="middle ui button" class="item"id="member-ticket-history" style="width: 130px;"> 임대 내역 </a>
	</div>
	<!-- 메인메뉴 -->
	<div class="ui inverted drovider2" id="modify-Div" align="left">
		<div>
			<div style="width: 100%">
		  		<div class="content">
		  			<div class="description" align="left">
		  				<!-- 맨위 히든 -->
		  				<div>
					    	<input type="hidden" id="C-modify-password-hidden" value="${DTO.getC_password()}">
		  				</div>
		  				<!-- 회사정보들 -->
		  				<div style="width: 60%;">
		  					<br><br>
		  					<!-- 사업자명 -->
		  					<div class="ui inverted input" style="width: 100%;">
		  						<div class="ui left icon input" style="width: 100%; height: 50px;">
									<input type="text" id="C-modify-businessname" disabled="disabled" value="${DTO.getC_businessname()}">
									<input type="hidden" id="C-modify-businessname-hidden" value="${DTO.getC_businessname()}">
									<i class="user icon"></i>
								</div>
		  					</div>
		  					
		  					<br><br>
		  					<!-- 사업자번호 -->
		  					<div class="ui inverted input" style="width: 100%;">
		  						<div class="ui left icon input" style="width: 100%; height: 50px;">
									<input type="text" id="modify-license" disabled="disabled" value="${DTO.getC_license()}">
									<input type="hidden" id="C-modify-license-hidden" value="${DTO.getC_license()}">
									<i class="user icon"></i>
								</div>
		  					</div>
		  					
		  					<br><br>
		  					<!-- 법인번호 -->
		  					<div class="ui inverted input" style="width: 100%;">
		  						<div class="ui left icon input" style="width: 100%; height: 50px;">
									<input type="text" id="modify-corporate" disabled="disabled" value="${DTO.getC_corporate()}">
							
									<i class="user icon"></i>
								</div>
		  					</div>
		  				
		  					<br><br>
		  					<!-- 대표이름 -->
		  					<div class="ui inverted input" style="width: 100%;">
		  						<div class="ui left icon input" style="width: 100%; height: 50px;">
									<input type="text" id="textf" disabled="disabled" value="${DTO.getC_representative()}">
									<i class="user icon"></i>
								</div>
		  					</div>
		  					<!-- 비밀번호 -->
		  					<br><br>
		  					<div class="ui inverted input" style="width: 100%;">
								
								<div class="ui left icon input" style="width: 100%; height: 50px;">
									<br>
									<input type="password" id="C-modify-pwd"  placeholder="새 비밀번호">
									<i class="lock icon"></i>
								</div>
						  	</div><!--class="ui inverted input"-->
							<br><span class="C-modify-pwd-Span"></span>
							<!-- 비밀번호 확인 -->
							<br>
							<div class="ui inverted input" style="width: 100%;">
								<div class="ui left icon input" style="width: 100%; height: 50px;">
									<input type="password" id="C-modify-repwd"  placeholder="새 비밀번호 확인">
									<i class="lock icon"></i>
								</div>
						  	</div><!--class="ui inverted input"-->
					  		<br><span class="C-modify-repwd-Span"></span>
					  		
					  		<!-- 업종 -->
					  		<br>
					  		<div class="ui inverted input" style="width: 100%;">
								<div class="ui left icon input" style="width: 100%; height: 50px;">
									<input type="text" id="C-modify-condition" value="${DTO.getC_condition()}" >
									<i class="mobile alternate icon"></i>
								</div>
						  	</div><!--class="ui inverted input"-->
					  		<br><span class="C-modify-condition-Span"></span>
					  		
					  		<!-- 우편검색,우편번호 -->
					  		<br>
					  		<div class="ui inverted input" style="width: 100%;">
								<button  class="middle ui button" style="width: 30%;" onclick="modifyPostcode()">우편검색</button>
									<div class="ui input" style="width:70%;">
		  								<input type="text" id="C-modify-postnumber" value="${DTO.getC_postnumbox()}" disabled="disabled">
		  							</div>
							</div>
					  		<!-- 주소 -->
					  		<br>
							<div class="ui inverted input" style="width: 100%;">
								<div class="ui left icon input" style="width: 100%;">
									<input type="text" id="C-modify-address1" value="${DTO.getC_address1()}" disabled="disabled">
									<i class="address book icon"></i>
								</div>
						  	</div>
							<br><span class="C-modify-address1-Span"></span>
							
							<!-- 상세주소 -->
							<br>
							<div class="ui inverted input" style="width: 100%;">
								<div class="ui left icon input" style="width: 100%;">
									<input type="text" id="C-modify-address2" value="${DTO.getC_address2()}" placeholder="상세주소">
									<i class="address book icon"></i>
								</div>
						  	</div>
						  	<br><span class="C-modify-address2-Span"></span>
						  	
							<!-- 전화번호 -->
							<br>
					  		<div class="ui inverted input" style="width: 100%;">
								<div class="ui left icon input" style="width: 100%;">
									<input type="text" id="C-modify-phone" value="${DTO.getC_tel()}" >
									<i class="mobile alternate icon"></i>
								</div>
						  	</div>
						  	<br><span class="C-modify-phone-Span"></span>
						  	
							<!-- 이메일 -->
							<br>
							<div class="ui inverted input" style="width: 100%;">
								<div class="ui left icon input" style="width: 100%;">
									<input type="text" id="C-modify-email" value="${DTO.getC_email()}" >
									<i class="envelope outline icon"></i>
								</div>
						  	</div>
						  	<br><span class="C-modify-email-Span"></span>
						  	<span class="C-modify-result-Span"></span>
							<!-- 버튼들 -->
							<br>
							<div class="ui two buttons">
						    	<div class="middle ui button" id="C-modify-modify" style="width: 30%;">수정</div>
						    	<div style="width: 5%;">&nbsp;</div>
						    	<button class="middle ui button" id="company-out" style="width: 30%;">회원탈퇴</button>
						    	<div style="width: 5%;">&nbsp;</div>
						        <div class="middle ui button" id="C-modify-cancel" style="width: 30%;">취소</div>
						    </div>
					  	
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
						</div><!--회사정보들-->
					</div>
			</div>
		</div>
	</div>
</div>

	<div class="ui segment" id="Ticket-List-Div" align="center">
	<div align="left">박람회</div>
		  <table border="1" style="align:center;width:80%;border-collapse: collapse;">
		  	<tr>
			  	<th>부스명</th>
			  	<th>행사명</th>
			  	<th>행사시작일</th>
			  	<th>행사종료일</th>
			  	<th>이메일</th>
			  	<th>연락처</th>
		  	</tr>
		  	<c:forEach items="${list}" var="list">
		  		<tr>
				  	<td>${list.getBoothName()}</td>
				  	<td>${list.getTitle()}</td>
				  	<td>${list.getStartDate()}</td>
				  	<td>${list.getEndDate()}</td>
				  	<td>${list.getC_email()}</td>
				  	<td>${list.getC_tel()}</td>
			  	 </tr>
			  </c:forEach>		 
		  </table> 
<br><br>
	<div align="left">공연</div>
	<table border="1" style="align:center;width:80%;border-collapse: collapse;">
		  	<tr>
			  	<th>부스명</th>
			  	<th>공연명</th>
			  	<th>공연시작일</th>
			  	<th>공연종료일</th>
			  	<th>이메일</th>
			  	<th>연락처</th>
		  	</tr>
		  	<c:forEach items="${list}" var="list">
		  		<tr>
				  	<td>${list2.getBoothName()}</td>
				  	<td>${list2.getTitle()}</td>
				  	<td>${list2.getStartDate()}</td>
				  	<td>${list2.getEndDate()}</td>
				  	<td>${list2.getC_email()}</td>
				  	<td>${list2.getC_tel()}</td>
			  	 </tr>
			  </c:forEach>		 
		  </table> 
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

</div>
<jsp:include page="companyOut.jsp"/>

<!--페이지 인클루드 후 삭제해야합니다!!!!******(제이쿼리 충돌 방지 )  -->
<script src="../js/companyMypage.js?ver=1"></script>

