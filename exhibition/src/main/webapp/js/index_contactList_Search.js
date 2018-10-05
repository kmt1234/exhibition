$(document).ready(function(event, str){
	var index_keyword = $('#indexkeyword').val();
	var pg = $('#pg').val();
	var code = $('#hiddenCode').val();
	
	// 메인 검색시 검색된 주요시설 연락처 리스트 불러옴
	$.ajax({
		type : 'GET',
		url : '/exhibition/main/index_contactList_SearchPlus.do?pg='+encodeURI(pg)+'&index_keyword='+encodeURI(index_keyword),
		dataType : 'json',
		success : function(data){
				$('<tr/>').append($('<th/>',{
					style : "width: 18%; height: 7%; padding-top: 10px; text-align: center;",
					text : '분류'
				})).append($('<th/>',{
					style : "width: 18%; height: 7%; padding-top: 10px; text-align: center;",
					text : '기관 & 시설'
				})).append($('<th/>',{
					style : "width: 18%; height: 7%; padding-top: 10px; text-align: center;",
					text : '명칭'
				})).append($('<th/>',{
					style : "width: 18%; height: 7%; padding-top: 10px; text-align: center;",
					text : '담당자'
				})).append($('<th/>',{
					style : "width: 18%; height: 7%; padding-top: 10px; text-align: center;",
					text : '연락처'
				})).appendTo($('#index_contactList_PlusList'));
				
				$.each(data.list, function(index, item){
					if(code!=3){
						$('<tr/>').append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.classify,
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.facility,
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.title,
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.name,
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.phone,
						})).appendTo($('#index_contactList_PlusList'));
						
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
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.facility,
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.title,
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.name,
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.phone,
						})).appendTo($('#index_contactList_PlusList'));	
					}
				});
				$('#index_contactList_PlusPagingDiv').html(data.mainPaging.pagingHTML);
		}
	});
});
