$(document).ready(function(event, str){
	var index_keyword = $('#indexkeyword').val();
	var pg = $('#pg').val();
	var code = $('#hiddenCode').val();
	
	// 메인 검색시 검색된 주요시설 연락처 리스트 불러옴
	$.ajax({
		type : 'POST',
		url : '/exhibition/main/index_QnA_SearchPlus.do',
		data : {'pg': $('#pg').val(),
				'index_keyword' : index_keyword},
		dataType : 'json',
		success : function(data){
			
			$('<div/>',{
				
				text : '자주 묻는 질문'
			});
			$.each(data.list, function(index, item){
				$('<tr/>').append($('<input/>',{
					type : 'hidden',
					text : item.classify
				})).append($('<input/>',{
					
					align : 'center',
					style: 'width: 880px; text-align: left;',
					type : 'hidden',
					text : item.seq
				})).append($('<td/>',{
					style: 'width: 880px; text-align: left;',
					id : 'subjectA',
					text : "["+item.classify+"]   "+item.subject
				})).appendTo($('#index_QnA_PlusList'));
			
				$('<tr/>',{
					style: 'width: 880px; height: 35px; text-align: left;'
				}).append($('<td/>',{
					style: 'width: 880px;  height: 35px; text-align: left;',
					class : 'contentC',
					href : 'javascript:void(0)',
					text : item.content
				})).appendTo($('#index_QnA_PlusList'));
			});
			$('#index_QnA_PlusPagingDiv').html(data.mainPaging.pagingHTML);
		}
	});
	
	$('#index_QnA_PlusList').on('click','#subjectA',function(){
		var seq = $(this).prev().text();
		location.href='/exhibition/customerService/C_QnA.do';
	});
});
