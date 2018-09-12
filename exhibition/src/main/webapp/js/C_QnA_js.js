$(document).ready(function(){
	var C_name = /^[가-힣]+$/;	//한글만 가능 
	var C_phone =  /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;	//휴대폰 번호 양식
	var Cw_regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; //이메일 양식
	var classify = "위치/교통";
	
	//자주 묻는 질문 - 작성하기 폼
	$('#C_QnA_writeBtn').click(function(){
		location.href="/exhibition/customerService/C_QnA_Write.do";
	});
	
	
	//자주 묻는 질문 작성하기 등록버튼
	$('#C_QnA_checkWriteBtn').click(function(){
		var classify = $('#classify option:selected').val();
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		if($('#subject').val()=='')
			$('#subjectDiv').text("제목을 입력하세요").css('font-size','9pt').css('color','red')
		else if($('#content').val()=='')
			$('#contentDiv').text("내용을 입력하세요").css('font-size','9pt').css('color','red')
		else{
			$('#C_qty').val(classify);
			$('#C_QnA_checkWrite').submit();
		}	
	});
	
		
	$.ajax({
		type : 'POST',
		url : '/exhibition/customerService/getQnA_Classify.do',
		data : {'classify' : classify },
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index, item){
				$('<tr/>',{
					class : 'title',
					align : 'center',
					style: 'width: 100%; height: 9%; align: center;',	
				}).append($('<td/>',{
					align : 'center',
					style: 'width: 100%; height: 9%; align: center;',
					id : 'subjectA',
					href : 'javascript:void(0)',
					text : item.subject
				})).appendTo($('#C_QnA_List'));
				
				$('<tr/>',{
					class : 'content',
					align : 'center',
					style: 'width: 100%; height: 9%; align: center;',
				}).append($('<td/>',{
					align : 'center',
					style: 'width: 100%; height: 9%; align: center;',
					id : 'contentA',
					text : item.content
				})).appendTo($('#C_QnA_List'));
			});
		}
	});
	
	
	$('.QnA').click(function(){
		var child = $('#C_QnA_List').empty();
		var classify = $(this).val();
		$.ajax({
			type : 'POST',
			url : '/exhibition/customerService/getQnA_Classify.do',
			data : {'classify' : classify },
			dataType : 'json',
			success : function(data){
				$.each(data.list, function(index, item){
					$('<tr/>',{
						class : 'title'
					}).append($('<td/>',{
						align : 'center',
						style: 'width: 100%; height: 9%; text-align: center;',
						id : 'subjectA',
						href : 'javascript:void(0)',
						text : item.subject
					})).appendTo($('#C_QnA_List'));
					
					$('<tr/>',{
						class : 'content'
					}).append($('<td/>',{
						align : 'center',
						style: 'width: 100%; height: 9%; text-align: center;',
						id : 'contentA',
						text : item.content
					})).appendTo($('#C_QnA_List'));
				});
			}
		});
	});
	
	
	$('.ui.styled.fluid.accordion').accordion({
		selector: {
			trigger: '.title'
		}
	});	
	
});