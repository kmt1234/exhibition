$(document).ready(function(){
	var C_name = /^[가-힣]+$/;	//한글만 가능 
	var C_phone =  /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;	//휴대폰 번호 양식
	var Cw_regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; //이메일 양식
	var classify = "위치/교통";
	var code = $('#hiddenCode').val();
	
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
	
	// 자주 묻는 질문 리스트 불러오기
	$.ajax({
		type : 'POST',
		url : '/exhibition/customerService/getQnA_Classify.do',
		data : {'classify' : classify },
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index, item){
				if(code != 3) {
					$('<div/>',{
						align : 'left',
						class : 'title',
						href : 'javascript:void(0)'
					}).append($('<i/>',{
						class : 'dropdown icon',
						style : 'margin-left : 10px',
						align : 'left',
						width : '100px'
					})).append($('<span/>',{
						align : 'left',
						id : 'subjectA',
						text : "["+item.classify+"]   "+item.subject
					})).appendTo($('#C_QnA_List'));
					
					$('<div/>',{
						id : 'contentA',
						class : 'content',
						align : 'left',
						style : 'margin-left : 104px',
						text : item.content
					}).appendTo($('#C_QnA_List'));
				}
				else if (code==3 ){
					$('<div/>',{
						align : 'left',
						class : 'title',
						href : 'javascript:void(0)'
					}).append($('<p/>')).append($('<input/>',{
						type : 'checkbox',
						value : item.seq,
						style : 'margin-left : 30px',
						name : 'box',
						class : 'box'
					})).append($('<i/>',{
						class : 'dropdown icon',
						style : 'margin-left : 10px',
						align : 'left',
						width : '100px'
					})).append($('<span/>',{
						align : 'left',
						id : 'subjectA',
						text : "["+item.classify+"]   "+item.subject
					})).appendTo($('#C_QnA_List'));
					
					$('<div/>',{
						id : 'contentA',
						class : 'content',
						align : 'left',
						style : 'margin-left : 104px',
						text : item.content
					}).appendTo($('#C_QnA_List'));
				} 
			});
		}
	});
	
	// 자주 묻는 질문 버튼에 따라 리스트 불러오기
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
					if(code != 3) {
						$('<div/>',{
							align : 'left',
							class : 'title',
							href : 'javascript:void(0)'
						}).append($('<i/>',{
							class : 'dropdown icon',
							style : 'margin-left : 10px',
							align : 'left',
							width : '100px'
						})).append($('<span/>',{
							align : 'left',
							id : 'subjectA',
							text : "["+item.classify+"]   "+item.subject
						})).appendTo($('#C_QnA_List'));
						
						$('<div/>',{
							id : 'contentA',
							class : 'content',
							align : 'left',
							style : 'margin-left : 104px',
							text : item.content
						}).appendTo($('#C_QnA_List'));
					}
					else if (code==3 ){
						$('<div/>',{
							align : 'left',
							class : 'title',
							href : 'javascript:void(0)'
						}).append($('<p/>')).append($('<input/>',{
							type : 'checkbox',
							value : item.seq,
							style : 'margin-left : 30px',
							name : 'box',
							class : 'box'
						})).append($('<i/>',{
							class : 'dropdown icon',
							style : 'margin-left : 10px',
							align : 'left',
							width : '100px'
						})).append($('<span/>',{
							align : 'left',
							id : 'subjectA',
							text : "["+item.classify+"]   "+item.subject
						})).appendTo($('#C_QnA_List'));
						
						$('<div/>',{
							id : 'contentA',
							class : 'content',
							align : 'left',
							style : 'margin-left : 104px',
							text : item.content
						}).appendTo($('#C_QnA_List'));
						
					} 
				});
			}
		});
	});
	
	//전체선택
	$('#checkAll').click(function(){
		if($('#checkAll').prop('checked')){
			//$('.box')[i].checked = true;
			$('.box').prop('checked',true);
		}else {
			//$('.box').prop('checked',false);
			$('.box').prop('checked',false);
		}
	});
	
	//선택 삭제
	$('#C_QnA_DeleteBtn').click(function(){
		var count = $('.box:checked').length;
		if(count==0) alert("항목을 선택하세요");
		else $('#C_QnA_delete').submit();
	}); 
	
	$('.ui.styled.fluid.accordion').accordion({
		selector: {
			trigger: '.title'
		}
	});	
	
	
});