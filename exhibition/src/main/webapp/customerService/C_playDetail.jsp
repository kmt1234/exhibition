<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE >
<html>
<head>
</head>
<body>
<div style="width: 100%; text-align: left;">
	<h2 class="box-container" style="float: center; width: 100%; height:126px; text-align: left;">
		<span>공연정보</span>
		<span class="h-light">수정</span>
		<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
			<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
			> 고객센터 > 게시판추가 > 목록 > 수정
		</div>
		<div class="ui divider"></div> 
	</h2>
	<form id="playboardModForm" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="postSelect" id="postSelect" value="2">
		<input type="hidden" name="seq" value="${eventboardDTO.seq}">
		<input type="hidden" name="image1" value="${eventboardDTO.image1}">
	<!-- 내용 입력 -->
		<div style="width: 520px; margin-left: 20px;">
			<!--제목  -->
			<div class="ui labeled input " >
				<div class="ui label " style="width: 100px; text-align: center;">
					<span>제목</span>
				</div>
				<div class="ui inverted input" style="width: 100%;">
					<div class="ui left icon input focus" style="width: 420px; height: 50px;">
						<input type="text" name="imageName" id="imageName" value="${eventboardDTO.imageName}">
		  				<i class="user icon"></i>
		  			</div>
		  		</div>
		  	</div>
		  	<div id="imageNameDiv"></div>
		  	<!-- 포스터 -->
		  	<div class="ui labeled input " style="margin-top: 20px;">
				<div class="ui label " style="width: 100px; text-align: center;">
					<span>포스터</span>
				</div>
				<div class="ui inverted input" style="width: 100%;">
					<div class="ui left icon input focus" style="width: 420px; height: 50px;">
						<input type="file" name="img" id="img" style="width:100%;">
		  			</div>
		  		</div>
		  	</div>
			<div id="imgDiv"></div>
			<!-- 날짜  -->
			<div class="ui labeled input " style="margin-top: 20px;">
				<div class="ui label " style="width: 100px; text-align: center;">
					<span>날짜선택</span>
				</div>
				<div class="ui inverted input" style="width: 100%;">
					<div class="ui left icon input focus" style="width: 100%; height: 50px;">
						<input type="text" name="startDate" id="datepicker_1" class="datepicker1" style="width:205px;">
						<input type="hidden" id="startDate" value="${eventboardDTO.startDate}" >
						<div style="width: 10px;">&nbsp;</div>
						<input type="text" name="endDate" id="datepicker_2" class="datepicker2" style="width:205px;">
						<input type="hidden" id="endDate" value="${eventboardDTO.endDate}">
					</div>
			  	</div>
			</div>
			<div id="dateDiv"></div>
		  	<!-- 홈페이지 -->
		  	<div class="ui labeled input " style="margin-top: 20px;">
				<div class="ui label " style="width: 100px; text-align: center;">
					<span>홈페이지</span>
				</div>
				<div class="ui inverted input" style="width: 100%;">
					<div class="ui left icon input  focus" style="width: 420px;  height: 50px;">
						<input type="text" name="eventLink" id="eventLink" value="${eventboardDTO.eventLink}">
						<i class="user icon"></i>
					</div>
				</div>
		  	</div>
		  	<!-- 시간  -->
		  	<div class="ui labeled input " style="margin-top: 20px;" >
				<div class="ui label " style="width: 100px; text-align: center;">
					<span>시간선택</span>
				</div>
			  	<div class="ui inverted input" style="width: 100%;">
					<div class="ui left icon input focus" style="width: 100%; height: 50px;">
						<input type="text" name="startTime" class="timepicker1" id="startTime">
						<input type="hidden" id="timepicker1" value="${eventboardDTO.startTime}" style="width:195px;">
						<div style="width: 10px;">&nbsp;</div>
						<input type="text" name="endTime" class="timepicker2" id="endTime">
						<input type="hidden" id="timepicker2" value="${eventboardDTO.endTime}" style="width:195px;">
					</div>
			  	</div>
			</div>
			<div id="timeDiv"></div>
			<!-- 공연홀 -->
		  	<div class="ui labeled input " style="margin-top: 20px;" >
				<div class="ui label " style="width: 100px; text-align: center;">
					<span>공연위치</span>
				</div>
				<div class="ui inverted input" style="width: 100%;">
					<div class="ui left icon input focus" style="width: 420px;  height: 50px;">
						<input type="text" name="eventPlace" id="eventPlace" value="${eventboardDTO.eventPlace}">
				  		<i class="user icon"></i>
				  	</div>
				 </div>
		  	</div>
		  	<div id="placeDiv"></div>
		  	<!-- 금액  -->
		  	<div class="ui labeled input " style="margin-top: 20px;" >
				<div class="ui label " style="width: 100px; text-align: center;">
					<span>티켓금액</span>
				</div>
				<div class="ui inverted input" style="width: 100%;">
					<div class="ui left icon input focus" style="width: 420px; height: 50px;">
						<input type="text" name="eventPrice" id="eventPrice" value="${eventboardDTO.eventPrice}">
		  				<i class="user icon"></i>
		  			</div>
		  		</div>
		  	</div>
		  	<div id="priceDiv"></div>
		  	<!-- 관람인원 -->
		  	<div class="ui labeled input " style="margin-top: 20px;">
				<div class="ui label " style="width: 100px; text-align: center;">
					<span>관람인원</span>
				</div>
				<div class="ui inverted input" style="width: 100%;">
					<div class="ui left icon input focus" style="width: 420px; height: 50px;">	
						<input type="text" name="eventSeats" id="eventSeats" value="${eventboardDTO.eventSeats}">
						<i class="user icon"></i>
					</div>
				</div>
		  	</div>
		  	<div id="seatsDiv"></div>
		  	<!-- 관람등급  -->
		  	<div class="ui labeled input " style="margin-top: 20px;">
				<div class="ui label " style="width: 100px; text-align: center;">
					<span>관람등급</span>
				</div>
				<div class="ui inverted input" style="width: 100%;">
					<div class="ui left icon input focus" style="width: 420px; height: 50px;">	
						<input type="text" name="eventRate" value="${eventboardDTO.eventRate}">
						<i class="user icon"></i>
					</div>
				</div>
		  	</div>
		  	<!-- 공연정보 -->
		  	<div class="ui labeled input " style="margin-top: 20px;">
				<div class="ui label " style="width: 100px; text-align: center;">
					<span>공연내용</span>
				</div>	
		   		<div class="ui inverted input" style="width: 100%;">
					<div class="ui left icon input focus" style="width: 420px;" >
						<textarea rows="5" cols="78" name="eventContent" id="eventContent" style="resize: none;"><c:out value="${eventboardDTO.eventContent}"/></textarea>
					</div>
				</div>
		  	</div>
		  	
		    <div class="ui two buttons" style="margin-top: 20px;">
		    	<div class="middle ui button" id="ModeButton" style="width: 15%;">수정</div>
		    	<div style="width: 5%;">&nbsp;</div>
		    	<button class="middle ui button" type="reset" id="writeReset" style="width: 15%;">다시작성</button>
		    	<div style="width: 5%;">&nbsp;</div>
		    	<div class="middle ui button" id="imageboardList" style="width: 15%;"
		    	onclick="location.href='/exhibition/customerService/C_eventboardList_playForm.do'">목록</div>
			</div>
		</div><!--수정영역 텍스트필드-->
		<div id="warnningDiv"></div>
	</form>
</div>
</body>
<script>
$(document).ready(function(){
	var startDate = $('#startDate').val().substring(0,4)+"/"+$('#startDate').val().substring(5,7)+"/"+$('#startDate').val().substring(8,10);
	var endDate = $('#endDate').val().substring(0,4)+"/"+$('#endDate').val().substring(5,7)+"/"+$('#endDate').val().substring(8,10);
	var startTime = $('#timepicker1').val().substring(0,2);
	var endTime = $('#timepicker2').val().substring(0,2);
	//시간
	$('.timepicker1').timepicker({
		timeFormat : 'H:mm',
	    interval: 60,
	    minTime: '09',
	    maxTime: '10:00pm',
	    defaultTime: '09',
	    startTime: '09:00am',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: false	
	});
		
	$('.timepicker2').timepicker({
		timeFormat : 'H:mm',
	    interval: 60,
	    minTime: $('.timepicker1').val(),
	    maxTime: '10:00pm',
	    defaultTime: $('.timepicker1').val(),
	    dynamic: false,
	    dropdown: true,
	    scrollbar: false	
	});
	//날짜
	$(".datepicker1, .datepicker2").datepicker({
		dateFormat : "yy/mm/dd",
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    minDate: 0,
	    yearSuffix: '년'
	});
	
	//시작일과 마지막날짜 설정
	$('.datepicker1').datepicker('setDate', startDate);
	$('.datepicker2').datepicker('setDate', endDate);
	

	//행사위치 유효성
	var checkReservation = false;
	$('#eventPlace').blur(function(){
		if($('#eventPlace').val()==''){
			checkReservation = false;
		}else if($('#eventPlace').val()!=''){
			//예약 중복 확인
			$.ajax({
				type : 'POST',
				url : '/exhibition/customerService/checkReservation.do',
				data : {'postSelect':$('#postSelect').val(), 'imageName' : $('#imageName').val(), 'startDate' : $('.datepicker1').val(), 'endDate' : $('.datepicker2').val(),'eventPlace' : $('#eventPlace').val()},
				dataType : 'text',
				success : function(data){
					if(data=='no_data'){
						checkReservation = true;
					} 
					else if(data=='yes_data'){
						$.alertable.alert('일정이 중복됩니다', {
					      show: function() {
					        $(this.overlay).velocity('transition.fadeIn', 300);        
					        $(this.modal).velocity('transition.shrinkIn', 300);
					      },
					      hide: function() {
					        $(this.overlay).velocity('transition.fadeOut', 300);
					        $(this.modal).velocity('transition.shrinkOut', 300);
					      } 
					    });
					}
				}
			});//ajax
		}
	});
	
	//전시회 티켓 금액 유효성
	var checkP = true;
	$('#eventPrice').blur(function(){
		//숫자 유효성
		var test = $('#eventPrice').val();
		console.log(test);
		if ($.isNumeric(test)) checkP = true;
		else checkP = false;
	});
	
	//관람인원 유효성
	var checkS = true;
	$('#eventSeats').blur(function(){
		//숫자 유효성
		var test = $('#eventSeats').val();
		console.log(test);
		if ($.isNumeric(test)) checkS = true;
		else checkS = false;
	});
	
	$('#ModeButton').click(function(){
		//시간 비교
		var date1 = $("#startTime").val();
	    var date2 = $("#endTime").val();
	     
	    var cutDate1 = date1.split(':');
	    var cutDate2 = date2.split(':');
	     
	    console.log(cutDate1[0]);
	    console.log(cutDate2[0]);
	    
		$('#imageNameDiv').empty();
		$('#imgDiv').empty();
		$('#dateDiv').empty();
		$('#placeDiv').empty();
		$('#priceDiv').empty();
		$('#timeDiv').empty();
		$('#warnningDiv').empty();
		
		if($('#imageName').val()==''){
			$('#imageNameDiv').text('제목은 필수입니다').css('color','red').css('font-size','9pt').css('font-weight','bold');
		}else if($('.datepicker1').datepicker().val()==''){
			$('#dateDiv').text('날짜는 필수입니다').css('color','red').css('font-size','9pt').css('font-weight','bold');
		}else if($('.datepicker2').datepicker().val()==''){
			$('#dateDiv').text('날짜는 필수입니다').css('color','red').css('font-size','9pt').css('font-weight','bold');
		}else if($('.datepicker2').datepicker().val() < $('.datepicker1').datepicker().val()){
			$('#dateDiv').text('시작 및 종료일자를 확인하세요').css('color','red').css('font-size','9pt').css('font-weight','bold');
		}else if (parseInt(cutDate2[0]) - parseInt(cutDate1[0]) <= 0){
		    $('#timeDiv').text('시작 및 종료시간을 확인하세요').css('color','red').css('font-size','9pt').css('font-weight','bold');
	    }else if($('#eventPlace').val()=='' || $('#eventPlace').val()!='1층' && $('#eventPlace').val()!='2층'&& $('#eventPlace').val()!='P_Room1' && $('#eventPlace').val()!='P_Room2' && $('#eventPlace').val()!='P_Room3' && $('#eventPlace').val()!='P_Room4'){
			$('#placeDiv').text('전시회는 1층 또는 2층 / 공연은 공연 위치(대문자 : P_Room1 ~ P_Room4)를 입력하세요 (ex.1층 또는 P_Room1)').css('color','red').css('font-size','7pt').css('font-weight','bold');
		}else if(checkP == false || checkS == false){
			$('#priceDiv').text('티켓 가격 및 관람인원에는 숫자만 입력하세요(ex. 3,000원 -> 3000 / 120석 -> 120)').css('color','red').css('font-size','9pt').css('font-weight','bold');
		}else if(checkReservation==false){
			 $('#warnningDiv').text('행사 기간이 겹칩니다. 날짜를 다시 확인하세요').css('color','red').css('font-size','9pt').css('font-weight','bold');
		}
		else{
			$('#playboardModForm').attr('action','/exhibition/customerService/C_playboardMod.do').submit();
		}
	});
});
</script>
</html>