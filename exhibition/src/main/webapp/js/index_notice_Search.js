$(document).ready(function(event, str){
	var index_keyword = $('#indexkeyword').val();
	var pg = $('#pg').val();
	var code = $('#hiddenCode').val();

	// 메인 검색시 검색된 공지사항 리스트 불러옴
	$.ajax({
		type : 'GET',
		url : '/exhibition/main/index_notice_SearchPlus.do?pg='+encodeURI(pg)+'&index_keyword='+encodeURI(index_keyword),
		dataType : 'json',
		success : function(data){
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
				})).appendTo($('#index_notice_PlusList'));
				
				$('<tr/>',{
					style: 'width: 880px; height: 35px; text-align: left;'
				}).append($('<td/>',{
					style: 'width: 880px;  height: 35px; text-align: left;',
					class : 'contentC',
					href : 'javascript:void(0)',
					text : item.content
				})).appendTo($('#index_notice_PlusList'));
			});
			$('#index_notice_PlusPagingDiv').html(data.mainPaging.pagingHTML);
		}
	
	});
	$('#index_notice_PlusList').on('click','#subjectA',function(){
		var seq = $(this).prev().text();
		location.href='/exhibition/customerService/C_notice_View.do?seq='+seq+'&pg='+$('#pg').val();
	});
});
