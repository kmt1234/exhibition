$(document).ready(function(event, str){
	var index_keyword = $('#index_keyword').val();
	var pg = $('#pg').val();
	var code = $('#hiddenCode').val();
	var PointKeyword = "<span class='aaa'>"+index_keyword+"</span>";
	
	// 메인 검색시 검색 된 숙박 리스트 불러옴
	
	$.ajax({
		type : 'GET',
		url : '/exhibition/main/index_hotel_list_SearchPlus.do?pg='+pg+'&index_keyword='+encodeURI(index_keyword),
		dataType : 'json',
		success : function(data){
			alert(JSON.stringify(data))
				$.each(data.list, function(index, item){
					$('<div/>').append($('<input/>',{
						type : 'hidden',
						text : item.seq
					})).append($('<div/>',{
						style : 'height:345px;',
						class : 'dashed_from'+index+''	
					}).append($('<img/>',{
						src : '../storage/'+item.image1+'',
						style : 'width : 250px; height: 285px; margin-top:60px; float:left; border: 1px ridge rgb(155,155,155,.6); display:inline-block; ',
					})).append($('<div/>',{
						style:'float:left; text-align:left; margin-left:20px; width:610px; height:90px; padding-top:60px; font-size: 15pt; margin-top:10px; ',
						html : item.imagename.replaceAll(index_keyword, PointKeyword)
					})).append($('<div/>',{
						style:'display:inline-block; width:50px; border: 1px ridge rgb(255,0,0,.6); margin-left:20px; float:left;  height:25px; padding:0; padding-top:3px; font-size: 10pt; font-family: inherit;',
						text : '장소'
					})).append($('<div/>',{
						style : 'display:inline-block; float:left;  margin-top:5px; margin-left:10px; width:540px; text-align:left; padding-top:3px; height:25px;',
						html : item.eventplace.replaceAll(index_keyword, PointKeyword)
					})).append($('<div/>',{
						style:'display:inline-block; width:50px; border: 1px ridge rgb(255,0,0,.6); margin-left:20px; float:left;  height:25px; padding:0; padding-top:3px; font-size: 10pt; font-family: inherit;',
						text : '싸이트'
					})).append($('<td/>',{
						style : 'display:inline-block; float:left;  margin-top:5px; margin-left:10px; width:540px; text-align:left; padding-top:3px; height:25px;',
						class : 'link',
						html : '<a href='+item.eventlink.replaceAll(index_keyword, PointKeyword)+'>'+item.eventlink.replaceAll(index_keyword, PointKeyword)+'</a>'
					}))).appendTo($('#index_hotel_list_PlusList'));
					if(index=='1' || index=='2'){
						$('<div/>',{
							style:"width:880px;  border-bottom:1px dashed rgb(155,155,155,.6);"
						}).appendTo($('.dashed_from'+index));
					}
				});
			$('#index_hotel_list_PlusPagingDiv').html(data.mainPaging.pagingHTML);
		}
	});
});
