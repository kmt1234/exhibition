$(document).ready(function(event, str){
	var index_keyword = $('#indexkeyword').val();
	$.ajax({
		type : 'POST',
		url : '/exhibition/main/index_NoticeSearch.do',
		data : {'index_keyword' : index_keyword},
		dataType : 'json',
		success : function(data){
			$('#index_NoticeSearch tr:gt(0)').remove();
			if(data.totalA=='0'){
				$('<tr/>',{
					align: 'center'
				}).append($('<td/>',{
					align : 'center',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_NoticeSearch'));  
				/*$('#C_notice_PagingDiv').remove();*/
			}else if(data.tataA!='0'){
				$.each(data.list, function(index, item){
					$('<tr/>').append($('<input/>',{
						align : 'center',
						style: 'width: 100px; text-align: left;',
						type : 'hidden',
						text : item.seq
					})).append($('<td/>',{
						style: 'width: 100px; text-align: left;',
						id : 'subjectC',
						text : item.subject
					})).appendTo($('#index_NoticeSearch'));
					
					$('<tr/>',{
						style: 'width: 700px; height: 35px; text-align: left;'
					}).append($('<td/>',{
						colspan : '2',
						style: 'width: 700px;  height: 35px; text-align: left;',
						class : 'contentC',
						href : 'javascript:void(0)',
						text : item.content
					})).appendTo($('#index_NoticeSearch'));
				});
			}
		}
	});
	
	$('#index_NoticeSearch').on('click','#subjectC',function(){
		var seq = $(this).prev().text();
		location.href='/exhibition/customerService/C_notice_View.do?seq='+seq+'&pg='+$('#pg').val();
	});
	
	/*$.ajax({
		type : 'POST',
		url : '/exhibition/main/index_Search.do',
		data : {'index_keyword' : index_keyword},
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index, item){
				$('<tr/>').append($('<td/>',{
					align : 'center',
					style: 'width: 100px; text-align: center;',
					text : item.seq
				})).append($('<td/>',{
					style: 'width: 500px; text-align: center;',
					id : 'subjectA',
					text : item.subject
				})).append($('<td/>',{
					style: 'width: 100px; text-align: center;',
					text : item.logtime
				})).appendTo($('#index_SearchList'));
			});
		}
	});*/
});