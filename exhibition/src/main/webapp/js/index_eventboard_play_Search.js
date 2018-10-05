$(document).ready(function(event, str){
	var index_keyword = $('#indexkeyword').val();
	var pg = $('#pg').val();
	var code = $('#hiddenCode').val();
	
	// 메인 검색시 검색된 박람회 리스트 불러옴
	$.ajax({
		type : 'GET',
		url : '/exhibition/main/index_eventboard_play_SearchPlus.do?pg='+encodeURI(pg)+'&index_keyword='+encodeURI(index_keyword),
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index, item){
				
				$('<tr/>').append($('<input/>',{
					type : 'hidden',
					text : item.seq
				})).append($('<td/>',{
					rowspan : '9',
					style : 'width : 100px; '
				}).append($('<img>',{
					src : '../storage/'+item.image1+'',
					style : 'width : 100px; height : 80px;',
					id : 'eventboard_play_image'
				}))).append($('<td/>',{
					text : item.imagename,
					id : 'eventboard_play_name'
				})).appendTo($('#index_eventboard_play_PlusList'));
				
				$('<tr/>').append($('<td/>',{
					text : item.startdate+"~"+item.enddate
				})).appendTo($('#index_eventboard_play_PlusList'));
				
				$('<tr/>').append($('<td/>',{
					text : item.starttime+"~"+item.endtime
				})).appendTo($('#index_eventboard_play_PlusList'));
				
				$('<tr/>').append($('<td/>',{
					text : item.eventplace
				})).appendTo($('#index_eventboard_play_PlusList'));
				
				$('<tr/>').append($('<td/>',{
					text : item.eventlink
				})).appendTo($('#index_eventboard_play_PlusList'));
				
				$('<tr/>').append($('<td/>',{
					text : item.eventprice
				})).appendTo($('#index_eventboard_play_PlusList'));
				
				$('<tr/>').append($('<td/>',{
					text : item.eventseats
				})).appendTo($('#index_eventboard_play_PlusList'));
				
				$('<tr/>').append($('<td/>',{
					text : item.eventrate
				})).appendTo($('#index_eventboard_play_PlusList'));
				
				$('<tr/>').append($('<td/>',{
					text : item.eventcontent
				})).appendTo($('#index_eventboard_play_PlusList'));
			});
			$('#index_eventboard_play_PlusPagingDiv').html(data.mainPaging.pagingHTML);
		}
	});
	
	$('#index_eventboard_play_PlusList').on('click','#eventboard_play_name',function(){
		var seq = $(this).prev().prev().text();
		location.href='/exhibition//performance/performanceBook.do?seq='+seq;
	});
	$('#index_eventboard_play_PlusList').on('click','#eventboard_play_image',function(){
		var seq = $(this).prev().text();
		location.href='/exhibition//performance/performanceBook.do?seq='+seq;
	});
});
