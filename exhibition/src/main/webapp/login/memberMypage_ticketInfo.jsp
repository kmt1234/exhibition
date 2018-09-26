<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
#uiCard{
	display: inline-block;
}

#uiStatistics{
	display: inherit;
}
	
</style>

</head>
<body>
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
	</div>
</div><!--class="ui compact menu"   -->

	<div class="ui card" id="uiCard">
	  <div class="image">
	    <img src="../storage/${eventboardDTO.image1}">
	  </div>
	  <div class="content">
	    <span class="header">${imageName }</span>
	    <div class="meta">		<input type="hidden" id="playDate2" value="${playDate2}">
	      <span class="date">${playDate } / ${eventboardDTO.startTime} ~ ${eventboardDTO.endTime}</span>
	    </div>
	    <div class="description">
	      ${eventboardDTO.eventContent}
	    </div>
	  </div>
	  <div class="extra content">
		  <div class="ui statistics" id="uiStatistics">
			  <div class="blue statistic">
			    <div class="value">${ticketQty }</div>	
			    <div class="label">예매 티켓 수</div>
			  </div>
			  <button class="ui negative basic button" id="cancel">예매취소</button>
		  </div><!--class="ui statistics"-->
	  </div><!--class="extra content"-->
	</div><!--class="ui card"  -->


</body>
<script>
$(document).ready(function(){
	//현재 날짜
	var Now = new Date();
	var NowTime = Now.getFullYear();
	NowTime += ''+(Now.getMonth() + 1);
	NowTime += ''+Now.getDate();
	
	//당일 취소 불가
	if(parseInt($('#playDate2').val()) <= parseInt(NowTime)){
		$('#cancel').text('당일 취소 불가');
		$('#cancel').addClass('disabled');
	} 
	
	//예매취소
	$('#cancel').click(function(){
		alert('취소');
	});
});
</script>
</html>