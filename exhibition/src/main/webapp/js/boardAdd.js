$(document).ready(function(){
	
	//시간
	$('.timepicker1, .timepicker2').timepicker({
		timeFormat : 'H:mm',
	    interval: 60,
	    minTime: '08',
	    maxTime: '10:00pm',
	    defaultTime: '08',
	    startTime: '08:00am',
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
	    yearSuffix: '년'
	});
	
	//시작일에 오늘 날짜 설정
	$(".datepicker1").datepicker('setDate', new Date());
	
	
	
	
	//목록 버튼
	$('.imageboardList').click(function(){
		if(index=='0'){
			location.href='/exhibition/customerService/C_mainImageboardListForm.do';
		}else if(index=='1'){
			alert("exhibition");
			location.href='/exhibition/customerService/C_eventboardListForm.do';
		}else if(index=='2'){
			alert("play");
			location.href='/exhibition/customerService/C_eventboardList_playForm.do';
		}
		
	});
	
	//분류 종류(기본 값 : 0(메인)
	var index = $('#postSelect option:selected').val();

	//메인,박람회,연극 선택
	$('.exhibitionS-td').hide();
	$('.playS-td').hide();
	
	$('.exhibitionL-td').hide();
	$('.playL-td').hide();
	
	$('.playT-td').hide();
	$('.exhibitionT-td').hide();
	$('.eventTime').hide();
	
	$('.playP-td').hide();
	$('.exhibitionP-td').hide();
	$('.eventPlace').hide();
	
	$('.playPr-td').hide();
	$('.exhibitionPr-td').hide();
	$('.eventPrice').hide();
	
	$('.playSe-td').hide();
	$('.eventSeats').hide();
	
	$('.playR-td').hide();
	$('.eventRate').hide();
	
	$('.exhibitionI-td').hide();
	$('.playI-td').hide();
	
	$('#postSelect').change(function(){
		//분류 값 (0:메인 1:박람회 2:연극)
		
		index = $('#postSelect option:selected').val();
		
		//초기화
		$('#imageName').val('');
		$('#img').val('');
		$('.datepicker2').datepicker().val('');
		$('#eventLink').val('');
		$('#eventContent').val('');
		$('#img2').val('');

		//유효성 안내글
		$('#imageNameDiv').text('');
		$('#imgDiv').text('');
		
		if(index=='0'){//메인
			$('.eventS-td').show();
			$('.exhibitionS-td').hide();
			$('.playS-td').hide();
			
			$('.eventL-td').show();
			$('.exhibitionL-td').hide();
			$('.playL-td').hide();
			
			$('.eventI-td').show();
			$('.exhibitionI-td').hide();
			$('.playI-td').hide();
			
			
			$('.playT-td').hide();
			$('.exhibitionT-td').hide();
			$('.eventTime').hide();
			
			$('.playP-td').hide();
			$('.exhibitionP-td').hide();
			$('.eventPlace').hide();
			
			$('.playPr-td').hide();
			$('.exhibitionPr-td').hide();
			$('.eventPrice').hide();
			
			$('.playSe-td').hide();
			$('.playR-td').hide();
			
			$('.eventSeats').hide();
			$('.eventRate').hide();
			
						
		}else if(index=='1'){//박람회
			$('.eventS-td').hide();
			$('.exhibitionS-td').show();
			$('.playS-td').hide();
			
			$('.eventL-td').hide();
			$('.exhibitionL-td').show();
			$('.playL-td').hide();
			
			$('.eventI-td').hide();
			$('.exhibitionI-td').show();
			$('.playI-td').hide();
			
			
			$('.playT-td').hide();
			$('.exhibitionT-td').show();
			$('.eventTime').show();
			
			$('.playP-td').hide();
			$('.exhibitionP-td').show();
			$('.eventPlace').show();
			
			$('.playPr-td').hide();
			$('.exhibitionPr-td').show();
			$('.eventPrice').show();
			
			$('.playSe-td').hide();
			$('.eventSeats').hide();
				
			$('.playR-td').hide();
			$('.eventRate').hide();
							
		}else if(index=='2'){//연극
			$('.eventS-td').hide();
			$('.exhibitionS-td').hide();
			$('.playS-td').show();
			
			$('.eventL-td').hide();
			$('.exhibitionL-td').hide();
			$('.playL-td').show();
			
			$('.eventI-td').hide();
			$('.exhibitionI-td').hide();
			$('.playI-td').show();
			
			
			$('.playT-td').show();
			$('.exhibitionT-td').hide();
			$('.eventTime').show();
			
			$('.playP-td').show();
			$('.exhibitionP-td').hide();
			$('.eventPlace').show();
			
			$('.playPr-td').show();
			$('.exhibitionPr-td').hide();
			$('.eventPrice').show();
			
			$('.playSe-td').show();
			$('.eventSeats').show();
			
			$('.playR-td').show();
			$('.eventRate').show();
			
		}
	});
		
	
	//이미지 등록
	$('#checkImageboardWrite').click(function(){
		$('#imageNameDiv').empty();
		$('#imgDiv').empty();
					
		
		alert('시간1 : '+$('.timepicker1').val());
		alert('시간2 : '+$('.timepicker2').val());
		
		if($('#imageName').val()=='')
			$('#imageNameDiv').text('제목을 입력하세요').css('color','red').css('font-size','9pt').css('font-weight','bold');
		else if($('#img').val()=='') 
			$('#imgDiv').text('파일을 선택해 주세요').css('color','magenta').css('font-size','9pt').css('font-weight','bold');
		else if($('.datepicker1').datepicker().val()=='')
			alert('날짜1 입력해야함');
		else if($('.datepicker2').datepicker().val()=='')
			alert('날짜2 입력해야함');
		else if($('.datepicker2').datepicker().val() < $('.datepicker1').datepicker().val())
			alert('날짜2가 날짜1 보다 작음');
		
		//유효성 다시 해야함
		/*else if($('.timepicker1').val() < $('.timepicker2').val()){
			alert('시간2가 시간1 보다 작음');
		}*/
		
		else if(index==0){	//메인 이미지 슬라이더
			$('#imageboardWriteForm').attr({action:'/exhibition/customerService/C_imageboardWrite.do', method:'post'}).submit();
		}else if(index==1){	//박람회
			$('#imageboardWriteForm').attr({action:'/exhibition/customerService/C_eventInfoWrite.do', method:'post'}).submit();
		}else if(index==2){	//연극
			$('#imageboardWriteForm').attr({action:'/exhibition/customerService/C_eventInfoWrite.do', method:'post'}).submit();
		
		}
	});
	
});