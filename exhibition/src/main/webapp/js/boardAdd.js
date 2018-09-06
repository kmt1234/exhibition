$(document).ready(function(){
	
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
	
	
	//분류 종류(기본 값 : 0(메인)
	var index = $('#postSelect option:selected').val();
	
	//메인,박람회,연극 선택
	$('.exhibitionS-td').hide();
	$('.playS-td').hide();
	
	$('.exhibitionL-td').hide();
	$('.playL-td').hide();
	
	$('.exhibitionI-td').hide();
	$('.playI-td').hide();
	
	$('.playF-tr').hide();
	
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
			
			$('.playF-tr').hide();
			
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
			
			$('.playF-tr').hide();
			
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
			
			$('.playF-tr').show();
		}
	});
	
	
	//이미지 등록
	$('#checkImageboardWrite').click(function(){
		$('#imageNameDiv').empty();
		$('#imgDiv').empty();
				
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
		
		else if(index==0){
			alert(index);
		//	$('#imageboardWriteForm').attr({action:'/exhibition/main/index.do', method:'post'}).submit();
		}else if(index==1){
			alert(index);
		//	$('#imageboardWriteForm').attr({action:'/exhibition/main/index.do', method:'post'}).submit();
		}else if(index==2){
			alert(index);
		//	$('#imageboardWriteForm').attr({action:'/exhibition/main/index.do', method:'post'}).submit();
		
		}else
			alert('submit');
	});
	
});