$(document).ready(function(event, str){
	var index_keyword = $('#indexkeyword').val();
	var pg = $('#pg').val();
	var code = $('#hiddenCode').val();
	
	// 메인 검색시 검색 된 숙박 리스트 불러옴
	
	$.ajax({
		type : 'GET',
		url : '/exhibition/main/index_hotel_list_SearchPlus.do?pg='+encodeURI(pg)+'&index_keyword='+encodeURI(index_keyword),
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index, item){
				$('<tr/>').append($('<td/>',{
					rowspan : '3',
					style : 'width : 100px; '
				}).append($('<img>',{
					src : '../storage/'+item.image1+'',
					class : 'hotel_image',
					style : 'width : 100px; height : 80px;'
				}))).append($('<td/>',{
					text : item.imagename
				})).appendTo($('#index_hotel_list_PlusList'));
				
				$('<tr/>').append($('<td/>',{
					text : item.eventplace
				})).appendTo($('#index_hotel_list_PlusList'));
				
				$('<tr/>').append($('<td/>',{
					text : item.eventlink
				})).appendTo($('#index_hotel_list_PlusList'));
				
				
				eventlink = item.eventlink;
			});
			$('#index_hotel_list_PlusPagingDiv').html(data.mainPaging.pagingHTML);
		}
	});
	
	$('#index_hotel_list_PlusList').on('click','.hotel_image',function(){
		location.href=''+eventlink+'';
	});
});
