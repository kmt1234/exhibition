$(document).ready(function(event, str){
	var index_keyword = $('#indexkeyword').val();
	var code = $('#hiddenCode').val();
	
	$.ajax({
		type : 'POST',
		url : '/exhibition/main/index_NoticeSearch.do',
		data : {'index_keyword' : index_keyword},
		dataType : 'json',
		success : function(data){
			if(data.totalA=='0'){
				$('<tr/>',{
					align: 'center'
				}).append($('<td/>',{
					align : 'center',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_NoticeSearch'));  
				/*$('#C_notice_PagingDiv').remove();*/
			}else if(data.totalA!='0'){
				$.each(data.list, function(index, item){
					$('<tr/>').append($('<input/>',{
						align : 'center',
						style: 'width: 880px; text-align: left;',
						type : 'hidden',
						text : item.seq
					})).append($('<td/>',{
						style: 'width: 880px; text-align: left;',
						id : 'subjectA',
						text : item.subject
					})).appendTo($('#index_NoticeSearch'));
					
					$('<tr/>',{
						style: 'width: 880px; height: 35px; text-align: left;'
					}).append($('<td/>',{
						style: 'width: 880px;  height: 35px; text-align: left;',
						class : 'contentC',
						href : 'javascript:void(0)',
						text : item.content
					})).appendTo($('#index_NoticeSearch'));
				});
			}
		}
	});
	
	$('#index_NoticeSearch').on('click','#subjectA',function(){
		var seq = $(this).prev().text();
		location.href='/exhibition/customerService/C_notice_View.do?seq='+seq+'&pg='+$('#pg').val();
	});
	
	$.ajax({
		type : 'POST',
		url : '/exhibition/main/index_QnASearch.do',
		data : {'index_keyword' : index_keyword},
		dataType : 'json',
		success : function(data){
			if(data.totalA=='0'){
				$('<tr/>',{
					align: 'center'
				}).append($('<td/>',{
					align : 'center',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_QnASearch'));  
				
			} else if(data.totalA!='0'){
				$.each(data.list, function(index, item){
					$('<tr/>').append($('<input/>',{
						align : 'center',
						style: 'width: 880px; text-align: left;',
						type : 'hidden',
						text : item.seq
					})).append($('<td/>',{
						style: 'width: 880px; text-align: left;',
						id : 'subjectA',
						text : item.subject
					})).appendTo($('#index_QnASearch'));
				
					$('<tr/>',{
						style: 'width: 880px; height: 35px; text-align: left;'
					}).append($('<td/>',{
						style: 'width: 880px;  height: 35px; text-align: left;',
						class : 'contentC',
						href : 'javascript:void(0)',
						text : item.content
					})).appendTo($('#index_QnASearch'));
				});
			}
		}
	});
	
	$('#index_QnASearch').on('click','#subjectA',function(){
		var seq = $(this).prev().text();
		location.href='/exhibition/customerService/C_QnA.do';
	});
	
	$.ajax({
		type : 'POST',
		url : '/exhibition/main/index_contactListSearch.do',
		data : {'index_keyword':$('#index_keyword').val()},
		dataType : 'json',
		success : function(data){
			if(data.totalA=='0'){
				$('<tr/>',{
					align: 'center'
				}).append($('<td/>',{
					colspan: '6',
					align : 'center',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_QnASearch'));  
				
			}else if(data.tataA!='0'){
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
						})).appendTo($('#index_contactListSearch'));
						
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
						})).appendTo($('#index_contactListSearch'));	
					}
				});
			}
			/*$('#C_contactList_PagingDiv').html(data.customerServicePaging.pagingHTML);*/
		}
	});
});