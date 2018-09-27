$(document).ready(function(event, str){
	$.ajax({
		type : 'POST',
		url : '/exhibition/main/index_Search.do',
		data : {'index_keyword' : $('#index_keyword').val()},
		dataType : 'json',
		success : function(){
			alert(index_keyword);
			$.each(data.list, function(index, item){
				$('<tr/>').append($('<td/>',{
					text : item.subject
				})).appendTo($('#index_SearchList'));
			});
		}
	});
});