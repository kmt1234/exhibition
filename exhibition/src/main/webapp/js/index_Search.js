$(document).ready(function(event, str){
	var index_keyword = $('#indexkeyword').val();
	$.ajax({
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
				})).appendTo($('#index_NoticeSearch'));
			});
		}
	});
	
	$('#index_NoticeSearch').on('click','#subjectA',function(){
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