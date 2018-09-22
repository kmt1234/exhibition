$(document).ready(function(){
	var C_name = /^[가-힣]+$/;	//한글만 가능 
	var C_phone =  /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;	//휴대폰 번호 양식
	var code = $('#hiddenCode').val();
	
	//주요시설 연락처 - 작성하기 폼
	$('#C_contactList_WriteBtn').click(function(){
		location.href="/exhibition/customerService/C_contactList_Write.do";
	});
	
	$('#C_contactList_checkWriteBtn').click(function(){
		$('#classifyDiv').empty();
		$('#facilityDiv').empty();
		$('#titleDiv').empty();
		$('#nameDiv').empty();
		$('#phoneDiv').empty();
		
		if($('#classify').val()=='')
			$('#classifyDiv').text("분류를 입력하세요").css('font-size','9pt').css('color','red')
		else if($('#facility').val()=='')
			$('#facilityDiv').text("기관&시설을 입력하세요").css('font-size','9pt').css('color','red')
		else if($('#title').val()=='')
			$('#titleDiv').text("명칭을 입력하세요").css('font-size','9pt').css('color','red')
		else if($('#name').val()=='')
			$('#nameDiv').text("담당자를 입력하세요").css('font-size','9pt').css('color','red')
		else if($('#phone').val()=='')
			$('#phoneDiv').text("연락처를 입력하세요").css('font-size','9pt').css('color','red')
		else 
			$('#C_contactList_checkWrite').submit();
	});
	
	
	$('.ui.compact.selection.dropdown').dropdown();	
	
	
	$.ajax({
		type : 'POST',
		url : '/exhibition/customerService/getContactList.do',
		data : {'pg':$('#pg').val()},
		dataType : 'json',
		success : function(data){
			
			$.each(data.list, function(index, item){
				if(code!=3){
					$('<tr/>').append($('<td/>',{
						align : 'center',
						style: 'width: 20%; height: 9%; text-align: center;',
						text : item.classify,
						id : 'classifyA'
					})).append($('<td/>',{
						align : 'center',
						style: 'width: 20%; height: 9%; text-align: center;',
						text : item.facility,
						id : 'facilityA'
					})).append($('<td/>',{
						align : 'center',
						style: 'width: 20%; height: 9%; text-align: center;',
						text : item.title,
						id : 'titleA'
					})).append($('<td/>',{
						align : 'center',
						style: 'width: 20%; height: 9%; text-align: center;',
						text : item.name,
						id : 'nameA'
					})).append($('<td/>',{
						align : 'center',
						style: 'width: 20%; height: 9%; text-align: center;',
						text : item.phone,
						id : 'phoneA'
					})).appendTo($('#C_contactList_List'));
					
				} else if(code==3){
					$('<tr/>').append($('<td/>').append($('<input/>',{
						type : 'checkbox',
						value : item.seq,
						name : 'box',
						class : 'box'
					}))).append($('<td/>',{
						align : 'center',
						style: 'width: 20%; height: 9%; text-align: center;',
						text : item.classify,
						id : 'classifyA'
					})).append($('<td/>',{
						align : 'center',
						style: 'width: 20%; height: 9%; text-align: center;',
						text : item.facility,
						id : 'facilityA'
					})).append($('<td/>',{
						align : 'center',
						style: 'width: 20%; height: 9%; text-align: center;',
						text : item.title,
						id : 'titleA'
					})).append($('<td/>',{
						align : 'center',
						style: 'width: 20%; height: 9%; text-align: center;',
						text : item.name,
						id : 'nameA'
					})).append($('<td/>',{
						align : 'center',
						style: 'width: 20%; height: 9%; text-align: center;',
						text : item.phone,
						id : 'phoneA'
					})).appendTo($('#C_contactList_List'));	
				}
				
			});
			$('#C_contactList_PagingDiv').html(data.customerServicePaging.pagingHTML);
		}
	});
	
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
	$('#C_contactList_DeleteBtn').click(function(){
		var count = $('.box:checked').length;
		if(count==0) alert("항목을 선택하세요");
		else $('#C_contactList_delete').submit();
	}); 
});

function C_contactList_Search(pg){
	$('#pg').val(pg);
	$('#C_contactList_SearchBtn').trigger('click','trigger');
}

$('.ui.selection.dropdown')
.dropdown()
;