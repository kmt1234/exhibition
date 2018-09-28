$(document).ready(function(){

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
	
	//시작일에 오늘 날짜 설정
	$(".datepicker1").datepicker('setDate', new Date());

	//목록 버튼
	$('#imageboardList').click(function(){
		if($('#postSelect').val()=='0'){
			location.href='/exhibition/customerService/C_mainImageboardListForm.do';
		}else if($('#postSelect').val()=='1'){
			location.href='/exhibition/customerService/C_eventboardListForm.do';
		}else if($('#postSelect').val()=='2'){
			location.href='/exhibition/customerService/C_eventboardList_playForm.do';
		}else if($('#postSelect').val()=='3'){
			location.href='/exhibition/customerService/C_hotelListForm.do';	
		}	
	});
	

	
	$('#imageTap').click(function(){
		$('#postSelect').val('0');
		location.href='/exhibition/customerService/C_mainImageboardForm.do?postSelect=0';
	});
	$('#exhibitionTap').click(function(){
		$('#postSelect').val('1');
		location.href='/exhibition/customerService/C_mainImageboardForm.do?postSelect=1';
	});
	$('#PlayTap').click(function(){
		$('#postSelect').val('2');
		location.href='/exhibition/customerService/C_mainImageboardForm.do?postSelect=2';
	});
	$('#HotelTap').click(function(){
		$('#postSelect').val('3');
		location.href='/exhibition/customerService/C_mainImageboardForm.do?postSelect=3';
	});
	
	
	var checkP = false;
	var checkS = false;
	
	//전시회 티켓 금액 유효성
	$('#eventPrice').blur(function(){
		//숫자 유효성
		var test = $('#eventPrice').val();
		console.log(test);
			if (!$.isNumeric(test)) {
				alert('티켓금액은 숫자만 입력하세요(ex.3,000원 -> 3000)');
				return false;
			}else{
				checkP = true;
			}	
	});
	
	
	//관람인원 유효성
	$('#eventSeats').blur(function(){
		//숫자 유효성
		var test = $('#eventSeats').val();
		console.log(test);
			if (!$.isNumeric(test)) {
				alert('관람인원은 숫자만 입력하세요(ex.100석 -> 100)');
				return false;
			}else{
				checkS = true;
			}
	});
	
	
	//예약 중복 확인
	$('#eventPlace').blur(function(){
		$.ajax({
			type : 'POST',
			url : '/exhibition/customerService/checkReservation.do',
			data : {'postSelect':$('#postSelect').val(), 'imageName' : $('#imageName').val(), 'startDate' : $('.datepicker1').val(), 'endDate' : $('.datepicker2').val(),'eventPlace' : $('#eventPlace').val()},
			dataType : 'text',
			success : function(data){
				
			}
		});//ajax
	});
	
	//이미지 등록
	$('#checkImageboardWrite').click(function(){
		$('#imageNameDiv').empty();
		$('#imgDiv').empty();
		$('#hotelDiv').empty();
		$('#telDiv').empty();

		if($('#postSelect').val()=='0'){
			if($('#imageName').val()=='')
				$('#imageNameDiv').text('제목을 입력하세요').css('color','red').css('font-size','9pt').css('font-weight','bold');
			else if($('#img').val()=='') 
				$('#imgDiv').text('파일을 선택해 주세요').css('color','magenta').css('font-size','9pt').css('font-weight','bold');
			else//메인 이미지 슬라이더
				$('#imageboardWriteForm').attr({action:'/exhibition/customerService/C_imageboardWrite.do', method:'post'}).submit();
		}
		
		else if($('#postSelect').val()=='1' || $('#postSelect').val()=='2'){
			
			var date1 = $("#startTime").val();
		     var date2 = $("#endTime").val();
		     
		     var cutDate1 = date1.split(':');
		     var cutDate2 = date2.split(':');
		     
		     console.log(cutDate1[0]);
		     console.log(cutDate2[0]);
			
			if($('#imageName').val()=='')
				$('#imageNameDiv').text('제목을 입력하세요').css('color','red').css('font-size','9pt').css('font-weight','bold');
			else if($('#img').val()=='') 
				$('#imgDiv').text('파일을 선택해 주세요').css('color','magenta').css('font-size','9pt').css('font-weight','bold');
			else if($('.datepicker1').datepicker().val()==''){
				alert('날짜1 입력해야함');
				return false;
			}
			else if($('.datepicker2').datepicker().val()==''){
				alert('날짜2 입력해야함');
				return false;
			}
			else if($('.datepicker2').datepicker().val() < $('.datepicker1').datepicker().val()){
				alert('날짜2가 날짜1 보다 작음');
				return false;
			}
			else if(checkP == false || checkS == false){
				alert('티켓 가격 및 관람인원에는 숫자만 입력하세요');
				return false;
			}
			else if (parseInt(cutDate2[0]) - parseInt(cutDate1[0]) < 0){
			    alert("종료시간이 시작시간보다 이전일수 없습니다");
			    return false;
		    }
			else if($('#postSelect').val()=='1'){	//박람회
				$('#imageboardWriteForm').attr({action:'/exhibition/customerService/C_eventInfoWrite.do', method:'post'}).submit();
			}else if($('#postSelect').val()=='2'){	//연극
				$('#imageboardWriteForm').attr({action:'/exhibition/customerService/C_eventInfoWrite_play.do', method:'post'}).submit();
			}
		}else if($('#postSelect').val()=='3'){
			var reg = /^https?\:\/\/.+/;
			var tel = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})|(02|0[3-9]+[0-9])(\d{3,4})(\d{4})$/;
			if($('#imageName').val()=='')
				$('#imageNameDiv').text('제목을 입력하세요').css('color','red').css('font-size','9pt').css('font-weight','bold');
			else if($('#img').val()=='') 
				$('#imgDiv').text('파일을 선택해 주세요').css('color','magenta').css('font-size','9pt').css('font-weight','bold');
			else if($('#eventLink').val()=='')
				$('#hotelDiv').text('호텔 링크를 입력하세요').css('color','red').css('font-size','9pt').css('font-weight','bold');
			else if(!reg.test($('#eventLink').val())){
				$('#hotelDiv').text('호텔 링크 앞에는 http://가 입력되어야 합니다').css('color','red').css('font-size','9pt').css('font-weight','bold');
			} else if($('#telPlace').val()=='')
				$('#telDiv').text('전화번호를 입력하세요').css('color','red').css('font-size','9pt').css('font-weight','bold');
			else if(!tel.test($('#telPlace').val())){
				$('#telDiv').text('전화번호 양식에 맞지 않습니다').css('color','red').css('font-size','9pt').css('font-weight','bold');
			}else
				$('#imageboardWriteForm').attr({action:'/exhibition/customerService/C_hotelInfoWrite.do', method:'post'}).submit();
		}
		
	});
	
});