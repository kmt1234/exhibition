<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
 .content.size{
 }
 .ui.steps{
 	align: left;
 	font-size: 18px;
 	margin-bottom: 15px;
 }
  .ui.steps{
 	align: left;
 	font-size: 18px;
 	margin-bottom: 15px;
 }
.active.step.size{
	width: 450px;
}
.img1{
	margin-left: 200px;
	margin-right:20px;
	margin-top: 14px;
}
#houseImg{
	margin:-3px;
}
</style>
</head>
<body>
<!-- 타이틀 -->
<h2 class="box-container"  style="float: left; width:100%; text-align: left;">
	<span>일정</span>
	<span class="h-light">정보</span>
	<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
		<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
		> 일정 > 정보
	</div>
	<div class="ui divider"></div> 
</h2>
<div style="text-align: left;">
	<div style="margin-left: 120px;">
		<h1>주최 전시별 <span >기간 정보</span></h1>
			<p style="margin-left: 10px;"><strong><span style="font-size: 15pt; color: #8258FA">IPEX</span></strong>는 지난 30여년간 매년 다양한 전시를 직접 주최하며 <strong><span style="font-size: 12pt;">세계적인 전문 전시 주최 기업으로 성장해왔습니다.</span></strong><br>
			더 많은 전시와 더 많은 감동으로 참가업체와 관람객 모두에게 코엑스 그 이상을 선사하겠습니다.</p>
	</div>
	<div style="margin-left: 120px; margin-top: 50px;">
		<h2>박람회</h2>
	</div>
	 <img class="img1"  src="../img/step.png" width="80px" height="80px"  align="center">
		  <div class="ui steps">
			  <div class="active step size">
			    <div class="content" align="center">
			      <div class="title">1~2월</div>
			      <div class="description">해외 수입자동차 박람회</div>
			    </div>
			  </div>
			</div><br>
			<img class="img1" src="../img/step2.png" width="80px" height="80px" align="center">
			<div class="ui steps">
			  <div class="active step size">
			    <div class="content" align="center">
			      <div class="title">3~4월</div>
			      <div class="description">가구 박람회</div>
			    </div>
			  </div>
			</div><br>
			<img class="img1"  src="../img/step3.png" width="80px" height="80px" align="center">
			<div class="ui steps">
			  <div class="active step size">
			    <div class="content" align="center">
			      <div class="title">5~6월</div>
			      <div class="description">여행 박람회</div>
			    </div>
			  </div>
			</div><br>
			<img class="img1" src="../img/step4.png" width="80px" height="80px" align="center">
			<div class="ui steps">
			  <div class="active step size">
			    <div class="content" align="center">
			      <div class="title">7~8월</div>
			      <div class="description">등가구 박람회</div>
			    </div>
			  </div>
			</div><br>
			<img class="img1"  src="../img/step5.png" width="80px" height="80px" align="center">
			<div class="ui steps">
			  <div class="active step size">
			    <div class="content" align="center">
			      <div class="title">9~10월</div>
			      <div class="description">건축 박람회</div>
			    </div>
			  </div>
			</div><br>
			<img class="img1" src="../img/step6.png" width="80px" height="80px" align="center">
			<div class="ui steps">
			  <div class="active step size">
			    <div class="content" align="center">
			      <div class="title">11~12월</div>
			      <div class="description">ALL 박람회</div>
			    </div>
			  </div>
			</div><br>
	  <div style="margin-left: 120px; margin-top: 50px;">
	  	<h2>연극&공연</h2>
	  </div>
	  <img class="img1" src="../img/event.png" width="80px" height="80px" align="center">
		  <div class="ui steps">
			  <div class="active step size">
			    <div class="content" align="center">
			      <div class="description">365일 내내 다양한 콘텐츠를 제공<br>
	      									좌석은 오시는 순서대로 진행
			    </div>
			  </div>
			</div>
		</div><br>
		<div style="margin-left: 120px; margin-top: 50px;">
			<h2>비즈니스룸</h2>
		</div>
		<img class="img1" src="../img/business.png" width="80px" height="80px" align="center">
		  <div class="ui steps">
			  <div class="active step size">
			    <div class="content" align="center">
			      <div class="description">회의&프리젠테이션이 가능한 최신식 장소<br>
	      									365일 내내 임대로 가능
			    </div>
			  </div>
			</div>
		</div><br>
</div>
</body>
</html>