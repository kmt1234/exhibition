<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.ui.inverted.divider2 {
	margin: 5px 0;
}
#currentPaging{
	color: red;
	text-decoration: none;
	cursor: pointer;
}

#paging{
	color: black;
	text-decoration: none;
	cursor: pointer;
}
#textf {
	width: 40%;
	float: left;
}
.ui.left.icon.input {
	width: 300px;
}
.title{
	color: green;
	font-weight: bold;
	cursor:pointer;
}
.ending{
	color: red;
}
</style>
<div class="ui compact menu" style="width: 930px; height:900px auto;  display: inline-block;" >
	<h2 class="box-container" style="float: center; width: 100%; height:126px; text-align: left;">
		<span>마이</span>
		<span class="h-light">페이지</span>
	<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
		<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
		> 고객센터 > 마이페이지(법인) 
		</div>
	<div class="ui divider"></div> 
	</h2>
	<!-- 메인메뉴 --><input type="hidden" id="license_here" value="${c_license}">
	<div style="width: 100%;">
		<!-- 맨위 메뉴 텝 -->
		<div style=" width:880px; float: left; text-align: left;">
			<a class="middle ui button" class="item"id="rental-list"  style=" width:150px; float: left;">임대리스트</a>
			<a class="middle ui button" class="item"id="rental-history"  style=" width:150px; float: left;">지난 임대 내역</a>
		</div>
	</div>
		<div class="" id="modify-Div" style="margin-left: 20px; float: left;" >
				<div style="width: 100%">
			  		<div class="content">
			  			<div class="description" align="left"><br>
			  				<!-- 맨위 히든 -->
			  				<div>
			  					<h2 class="header" id="M-modify-id" style="float: left; " >ID : ${DTO.getC_businessname()}</h2>
						    	<input type="hidden" id="C-modify-password-hidden" value="${DTO.getC_password()}">
			  				</div>
			  				<!-- 회사정보들 -->
			  				<div style="width: 100%;">
			  					<br>
			  					<!-- 사업자명 -->
			  					<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
									<div class="ui labeled input " >
										<div class="ui label " style="width: 100px; text-align: center;">
											<span>사업자명</span>
										</div>
				  					<div class="ui inverted input" style="width: 300px;">
				  						<div class="ui left icon input focus" style="width: 300px; height: 50px;">
											<input type="text" id="C-modify-businessname" readonly="readonly"  value="${DTO.getC_businessname()}">
											<input type="hidden" id="C-modify-businessname-hidden" value="${DTO.getC_businessname()}">
											<i class="user icon"></i>
										</div>
				  					</div>
			  					</div>
			  					</div>
			  					<br>
			  					<!-- 사업자번호 -->
			  					<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
									<div class="ui labeled input " >
										<div class="ui label " style="width: 100px; text-align: center;">
											<span>사업자번호</span>
										</div>
				  					<div class="ui inverted input" style="width: 300px;">
				  						<div class="ui left icon input focus" style="width: 300px; height: 50px;">
											<input type="text" id="modify-license" readonly="readonly" value="${DTO.getC_license()}">
											<input type="hidden" id="C-modify-license-hidden" value="${DTO.getC_license()}">
											<i class="user icon"></i>
										</div>
				  					</div>
			  					</div>
			  					</div>
			  					<br>
			  					<!-- 법인번호 -->
				  				<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
									<div class="ui labeled input " >
										<div class="ui label " style="width: 100px; text-align: center;">
											<span>법인번호</span>
										</div>
					  					<div class="ui inverted input" style="width: 300px;">
					  						<div class="ui left icon input  focus" style="width: 300px; height: 50px;">
												<input type="text" id="modify-corporate" readonly="readonly" value="${DTO.getC_corporate()}">
												<i class="user icon"></i>
											</div>
					  					</div>
				  					</div>
				  				</div>	
			  					<br>
			  					<!-- 대표이름 -->
			  					<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
									<div class="ui labeled input " >
										<div class="ui label " style="width: 100px; text-align: center;">
											<span>대표자</span>
										</div>
				  						<div class="ui inverted input" style="width: 300px;">
				  						<div class="ui left icon input  focus" style="width: 300px; height: 50px;">
											<input type="text" id="textf" readonly="readonly" value="${DTO.getC_representative()}">
											<i class="user icon"></i>
										</div>
				  					</div>
				  					</div>
				  				</div>
			  					<br>
		  						<!-- 비밀번호 -->
		  						<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
									<div class="ui labeled input " >
										<div class="ui label " style="width: 100px; text-align: center;">
											<span>비밀번호</span>
										</div>
				  						<div class="ui inverted input" style="width:300px;">
										<div class="ui left icon input focus" style="width: 300px; height: 50px;">
											<br>
											<input type="password" id="C-modify-pwd"  placeholder="새 비밀번호">
											<i class="lock icon"></i>
										</div>
							  		</div><!--class="ui inverted input"-->
									</div>
								</div>
								<br><span class="C-modify-pwd-Span"></span>
								<!-- 비밀번호 확인 -->
								<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
									<div class="ui labeled input " >
										<div class="ui label " style="width: 100px; text-align: center;">
											<span>재확인</span>
										</div>
										<div class="ui inverted input" style="width: 300px">
										<div class="ui left icon input focus" style="width: 300px; height: 50px;">
											<input type="password" id="C-modify-repwd"  placeholder="새 비밀번호 확인">
											<i class="lock icon"></i>
										</div>
								  		</div><!--class="ui inverted input"-->
							  		</div>
						  		</div>
						  		<br><span class="C-modify-repwd-Span"></span>
						  		<!-- 업종 -->
						  		<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
									<div class="ui labeled input " >
										<div class="ui label " style="width: 100px; text-align: center;">
											<span>업태</span>
										</div>
								  		<div class="ui inverted input" style="width: 300px">
											<div class="ui left icon input focus" style="width: 300px; height: 50px;">
												<input type="text" id="C-modify-condition" value="${DTO.getC_condition()}" >
												<i class="mobile alternate icon"></i>
											</div>
									  	</div><!--class="ui inverted input"-->
							  		</div>
							  	</div>
						  		<br><span class="C-modify-condition-Span"></span><br>
						  		<!-- 우편검색,우편번호 -->
						  		<div class="ui inverted input" style="width: 400px;">
									<button  class="middle ui button" style="width: 100px;" onclick="modifyPostcode()">우편검색</button>
										<div class="ui input focus" style="width:300px;">
			  								<input type="text" id="C-modify-postnumber" value="${DTO.getC_postnumbox()}" readonly="readonly">
			  							</div>
								</div><br>
						  		<!-- 주소 -->
								<div class="ui inverted input" style="width: 400px;">
									<div class="ui left icon input focus" style="width: 100%;">
										<input type="text" id="C-modify-address1" value="${DTO.getC_address1()}" readonly="readonly">
										<i class="address book icon"></i>
									</div>
							  	</div>
								<br><span class="C-modify-address1-Span"></span>
								<!-- 상세주소 -->
								<div class="ui inverted input" style="width: 400px;">
									<div class="ui left icon input focus" style="width: 100%;">
										<input type="text" id="C-modify-address2" value="${DTO.getC_address2()}" placeholder="상세주소">
										<i class="address book icon"></i>
									</div>
							  	</div>
							  	<br><span class="C-modify-address2-Span"></span>
								<!-- 전화번호 -->
								<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
									<div class="ui labeled input " >
										<div class="ui label " style="width: 100px; text-align: center;">
											<span>연락처</span>
										</div>
								  		<div class="ui inverted input" style="width: 300px">
											<div class="ui left icon input focus" style="width: 300px; height: 50px;">
												<input type="text" id="C-modify-phone" value="${DTO.getC_tel()}" >
												<i class="mobile alternate icon"></i>
											</div>
									  	</div>
								  	</div>
							  	</div>
							  	<br><span class="C-modify-phone-Span"></span><br>
								<!-- 이메일 -->
								<div style="width: 100%; text-align: left; margin-top: 20px;display: inline-block; ">
									<div class="ui labeled input " >
										<div class="ui label " style="width: 100px; text-align: center;">
											<span>이메일</span>
										</div>
										<div class="ui inverted input" style="width: 300px">
											<div class="ui left icon input focus"  style="width: 300px; height: 50px;">
												<input type="text" id="C-modify-email" value="${DTO.getC_email()}" >
												<i class="envelope outline icon"></i>
											</div>
									  	</div>
								  	</div>
							  	</div>
							  	<br><span class="C-modify-email-Span"></span>
							  	<span class="C-modify-result-Span"></span><br>
								<!-- 버튼들 -->
								<div class="ui two buttons">
							    	<div class="middle ui button" id="C-modify-modify" style="width: 30%;">수정</div>
							    	<div style="width: 5%;">&nbsp;</div>
							    	<button class="middle ui button" id="company-out" style="width: 30%;">회원탈퇴</button>
							    	<div style="width: 5%;">&nbsp;</div>
							        <div class="middle ui button" id="C-modify-cancel" style="width: 30%;">취소</div>
							    </div>
						  		<div style="margin-top: 40px;"></div>
								<!-- 숨어있다 -->
								<div class="ui modal3">
								  <div class="content">
								    <p>탈퇴하시겠습니까?</p>
								  </div>
								  <div class="actions">
								    <div class="ui negative button" id="out-no">
								      <i class="remove icon"></i>
								      아니오
								    </div>
								    <div class="ui positive right labeled icon button" id="out-yes">
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
	<div style="display: inline-block; border: 1px solid; margin-top:80px; width: 470px; height: auto; padding-bottom:448px">
		<div id="renrenlist">
		<div class="header" id="exhibitionHeader" style="text-align:left;font-size:20px;font-weight: bold; margin-left:10px;margin-top:10px;">박람회</div>
		<table class="ui striped table" id="exhibitionList">
		  <thead>
		  	<tr align="center">
			  	<th>부스명</th>
			  	<th>행사명</th>
			  	<th>행사시작일</th>
			  	<th>행사종료일</th>
			  	<th>진행상황</th>
		  	</tr>
		  </thead>
		  	<tbody id="rental_exhibition" align="center">
	  	
	  		</tbody>	 
	  	</table>
	  	<br>
	  	<div class="header" id="exhibitionHeader" style="text-align:left;font-size:20px;font-weight: bold; margin-left: 10px;">공연</div>
	  <table class="ui striped table" id="concertList">
	 	 <thead>
		  	<tr align="center">
			  	<th>부스명</th>
			  	<th>공연명</th>
			  	<th>공연시작일</th>
			  	<th>공연종료일</th>
			  	<th>진행상황</th>
		  	</tr></thead>
	  	<tbody id="rental_concert" align="center">
  	
  		</tbody>	 
	  </table>
	 </div>
	 <div id="renrenhistory">
	 	<div class="ui rental All" id="Ticket-History-Div">
	 	<div class="header" id="exhibitionHeader" style="text-align:left;font-size:20px;font-weight: bold;">지난 내역</div>
			<table class="ui striped table">
		  <thead>
		  	<tr align="center">
			  	<th>부스명</th>
			  	<th>행사명</th>
			  	<th>행사시작일</th>
			  	<th>행사종료일</th>
			  	<th>진행사항</th>
		  	</tr></thead>
		  	<tbody id="rental_All" align="center">
	  		<c:if test="${listSize eq '0'}">
	  		<tr><td colspan="5">지난 임대 내역이 없습니다.</td></tr>
	  		</c:if>
	  		</tbody>
		  </table>
		  <div name="paging" id="paging"></div>
		</div> 
	 </div><!-- renrenhistory -->
	 
	</div><!-- inline-block -->
</div>

<div class="ui mini modal exhibition1" >
	  <div class="header">임대 취소</div>
	  <div class="content" style="width:100%">
	    <div>정말 임대를 취소 하시겠습니까?</div>
	  </div>
	  <div class="actions">
	    <div class="ui negative button">
	        No
	      </div>
	      <div class="ui positive right labeled icon button" id ="exhibitionYesBtn">
	        Yes
	        <i class="checkmark icon"></i>
	      </div>
	  </div>
	</div>

	<div class="ui mini modal exhibition2">
	  <div class="header">임대 취소</div>
	  <div class="content" style="width:100%">
	    <div>진행중인 임대는 취소 불가능 합니다.</div>
	  </div>
	  <div class="actions">
	      <div class="ui positive right labeled icon button" id ="exhibitionnotBtn">
	        Yes
	        <i class="checkmark icon"></i>
	      </div>
	  </div>
	</div>
<input type="hidden" name="pg" id="pg" value="${pg}">
<script>
$(document).ready(function(){
	$('#renrenhistory').hide();
	var date = new Date();
    var year  = date.getFullYear();
    var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
    var day   = date.getDate();
    if (("" + month).length == 1) { month = "0" + month; }
    if (("" + day).length   == 1) { day   = "0" + day;   }
	var toDay = year+"-"+month+"-"+day;
	var ing;
	//임대리스트
	$.ajax({
		type : 'POST',
		url : '/exhibition/login/getmypageRental.do',
		data : {'C_license':$('#license_here').val()},
		dataType : 'json',
		success : function(data){
			$.each(data.list,function(index, item){
				var startDate = item.startDate.toString().slice(0,10);
				var endDate = item.endDate.toString().slice(0,10);
				
				if(startDate <= toDay && endDate >= toDay ){
				 ing = "<font color='green'>진행중</font>";
				 companyDeleteBtn ="";
				}else if(endDate >toDay){
					ing = "<font color='blue'>진행 예정</font>";
				}
				$('<tr/>').append($('<td/>',{
			 		name : 'boothName',
			 		text : item.boothName
			 	})).append($('<td/>',{
			 		name : 'title',
			 		class : 'title',
			 		text : item.title
			 	})).append($('<td/>',{
			 		name : 'startDate',
			 		text : item.startDate
			 	})).append($('<td/>',{
			 		name : 'endDate',
			 		text : item.endDate
			 	})).append($('<td/>',{
			 		name : 'ing',
			 		html : ing
			 	})).appendTo($('#rental_exhibition'));
			});
			$.each(data.list2,function(index, item){
				var startDate = item.startDate.toString().slice(0,10);
				var endDate = item.endDate.toString().slice(0,10);
				
				if(startDate <= toDay && endDate >= toDay ){
				 ing = "<font color='green'>진행중</font>";
				 companyDeleteBtn ="";
				}else if(endDate >toDay){
					ing = "<font color='blue'>진행 예정</font>";
				}
				
				$('<tr/>').append($('<td/>',{
			 		name : 'hallName',
			 		text : item.hallName
			 	})).append($('<td/>',{
			 		name : 'title',
			 		class : 'title',
			 		text : item.title
			 	})).append($('<td/>',{
			 		name : 'startDate',
			 		text : item.startDate
			 	})).append($('<td/>',{
			 		name : 'endDate',
			 		text : item.endDate
			 	})).append($('<td/>',{
			 		name : 'ing',
			 		html : ing
			 	})).appendTo($('#rental_concert'));
			});
		}
	});
	var HiddenboothName;
	var Hiddentitle;
	var HiddenstartDate;
	var HiddenendDate;
	
	$('#exhibitionList').on('click','.title',function(){
		HiddenboothName = $(this).prev().text();
		Hiddentitle = $(this).text();
		HiddenstartDate = $(this).next().text();
		HiddenendDate = $(this).next().next().text();
		$.ajax({
			type : 'POST',
			url : '/exhibition/login/DateCompare.do',
			data : {'startDate':$(this).next().text(),'endDate':$(this).next().next().text()},
			dataType : 'text',
			success : function(data){
				if(data=='exist'){
					$('.ui.mini.modal.exhibition2').modal('show');
				}else if(data=='not_exist'){
					$('.ui.mini.modal.exhibition1').modal('show');
				}
			}
		});
	});
	
	$('#concertList').on('click','.title',function(){
		HiddenboothName = $(this).prev().text();
		Hiddentitle = $(this).text();
		HiddenstartDate = $(this).next().text();
		HiddenendDate = $(this).next().next().text();
		$.ajax({
			type : 'POST',
			url : '/exhibition/login/DateCompare.do',
			data : {'startDate':$(this).next().text(),'endDate':$(this).next().next().text()},
			dataType : 'text',
			success : function(data){
				if(data=='exist'){
					$('.ui.mini.modal.exhibition2').modal('show');
				}else if(data=='not_exist'){
					$('.ui.mini.modal.exhibition1').modal('show');
				}
			}
		});
	});
	
///////////////////////////////////////////////////////////////////////////////////////
	$('#rental-list').click(function(){
		$('#renrenlist').show();
		$('#renrenhistory').hide();
	});
	$('#rental-history').click(function(){
		$('#rental_All').empty();
		$('#renrenlist').hide();
		$('#renrenhistory').show();
		$.ajax({
			type : 'POST',
			url : '/exhibition/login/getAllRental.do',
			data : {'C_license':$('#license_here').val(),'pg':$('#pg').val()},
			dataType : 'json',
			success : function(data){
				$.each(data.list,function(index, item){
					$('<tr/>').append($('<td/>',{
				 		name : 'boothName',
				 		text : item.boothName
				 	})).append($('<td/>',{
				 		name : 'title',
				 		text : item.title
				 	})).append($('<td/>',{
				 		name : 'startDate',
				 		text : item.startDate
				 	})).append($('<td/>',{
				 		name : 'endDate',
				 		text : item.endDate
				 	})).append($('<td/>',{
				 		name : 'ending',
				 		class : 'ending',
				 		text : '진행종료'
				 	})).appendTo($('#rental_All'));
				});
				$('#paging').html(data.memberTicketListPaging.pagingHTML);
			}
		});
		
	});

		 $('#exhibitionYesBtn').click(function(){
			$.ajax({
				type : 'POST',
				url : '/exhibition/login/deleteGOGO.do',
				data : {'boothName':HiddenboothName,'title':Hiddentitle,'startDate':HiddenstartDate,'endDate':HiddenendDate},
				dataType : 'json',
				success : function(data){
					location.href="/exhibition/login/mypage.do";
				}
			});
		}); 

});
function MemberTicketListPaging(pg){
	$('#rental_All').empty();
	$.ajax({
		type : 'POST',
		url : '/exhibition/login/getAllRental.do',
		data : {'C_license':$('#license_here').val(),'pg':$('#pg').val()},
		dataType : 'json',
		success : function(data){
			$.each(data.list,function(index, item){
				$('<tr/>').append($('<td/>',{
			 		name : 'boothName',
			 		text : item.boothName
			 	})).append($('<td/>',{
			 		name : 'title',
			 		text : item.title
			 	})).append($('<td/>',{
			 		name : 'startDate',
			 		text : item.startDate
			 	})).append($('<td/>',{
			 		name : 'endDate',
			 		text : item.endDate
			 	})).append($('<td/>',{
			 		name : 'ending',
			 		class : 'ending',
			 		text : '진행종료'
			 	})).appendTo($('#rental_All'));
			});
			$('#paging').html(data.memberTicketListPaging.pagingHTML);
		}
	});
}
</script>
<jsp:include page="companyOut.jsp"/>