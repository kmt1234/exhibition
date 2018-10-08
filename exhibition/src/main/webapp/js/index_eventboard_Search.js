$(document).ready(function(event, str){
	var index_keyword = $('#indexkeyword').val();
	var pg = $('#pg').val();
	var code = $('#hiddenCode').val();
	var PointKeyword = "<span class='aaa'>"+index_keyword+"</span>";
	
	// 메인 검색시 검색된 박람회 리스트 불러옴
	$.ajax({
		type : 'GET',
		url : '/exhibition/main/index_eventboard_SearchPlus.do?pg='+pg+'&index_keyword='+encodeURI(index_keyword),
		dataType : 'json',
		success : function(data){
			alert(JSON.stringify(data))
			$.each(data.list, function(index, item){
				var time = item.starttime+"~"+item.endtime;
				var date = item.startdate+"~"+item.enddate;
				$('<div/>').append($('<input/>',{
					type : 'hidden',
					text : item.seq
				})).append($('<div/>',{
					style : 'height:345px;',
					class : 'dashed_from'+index+''	
				}).append($('<img/>',{
					src : '../storage/'+item.image1+'',
					style : 'width : 250px; height: 285px; margin-top:60px; float:left; border: 1px ridge rgb(155,155,155,.6); display:inline-block; ',
					class : 'image'
				})).append($('<div/>',{
					style:'float:left; text-align:left; margin-left:20px; width:610px; height:90px; padding-top:60px; font-size: 15pt; margin-top:10px; ',
					class : 'name',
					html : item.imagename.replaceAll(index_keyword, PointKeyword)
				})).append($('<div/>',{
					style:'display:inline-block; width:50px; border: 1px ridge rgb(255,0,0,.6); margin-left:20px; float:left;  height:25px; padding:0; padding-top:3px; font-size: 10pt; font-family: inherit;',
					text : '일시'
				})).append($('<div/>',{
					style : 'display:inline-block; float:left; margin-left:10px; width:540px; text-align:left; padding-top:3px; height:25px;',
					html : date.replaceAll(index_keyword, PointKeyword)
				})).append($('<div/>',{
					style:'display:inline-block; width:50px; margin-top:5px; border: 1px ridge rgb(255,0,0,.6); margin-left:20px; float:left;  height:25px; padding:0; padding-top:3px; font-size: 10pt; font-family: inherit;',
					text : '시간'
				})).append($('<div/>',{
					style : 'display:inline-block; float:left;  margin-top:5px; margin-left:10px; width:540px; text-align:left; padding-top:3px; height:25px;',
					html : time.replaceAll(index_keyword, PointKeyword)
				})).append($('<div/>',{
					style:'display:inline-block; width:50px; margin-top:5px; border: 1px ridge rgb(255,0,0,.6); margin-left:20px; float:left;  height:25px; padding:0; padding-top:3px; font-size: 10pt; font-family: inherit;',
					text : '장소'
				})).append($('<div/>',{
					style : 'display:inline-block; float:left;  margin-top:5px; margin-left:10px; width:540px; text-align:left; padding-top:3px; height:25px;',
					html : item.eventplace.replaceAll(index_keyword, PointKeyword)
				})).append($('<div/>',{
					style:'display:inline-block; width:50px; margin-top:5px; border: 1px ridge rgb(255,0,0,.6); margin-left:20px; float:left;  height:25px; padding:0; padding-top:3px; font-size: 10pt; font-family: inherit;',
					text : '싸이트'
				})).append($('<div/>',{
					style : 'display:inline-block; float:left;  margin-top:5px; margin-left:10px; width:540px; text-align:left; padding-top:3px; height:25px;',
					class : 'link',
					html : '<a href='+item.eventlink.replaceAll(index_keyword, PointKeyword)+'>'+item.eventlink.replaceAll(index_keyword, PointKeyword)+'</a>'
				})).append($('<div/>',{
					style:'display:inline-block; width:50px; margin-top:5px; border: 1px ridge rgb(255,0,0,.6); margin-left:20px; float:left;  height:25px; padding:0; padding-top:3px; font-size: 10pt; font-family: inherit;',
					text : '가격'
				})).append($('<div/>',{
					style : 'display:inline-block; float:left;  margin-top:5px; margin-left:10px; width:540px; text-align:left; padding-top:3px; height:25px;',
					html : item.eventprice.replaceAll(index_keyword, PointKeyword)
				})).append($('<div/>',{
					style:'display:inline-block; width:50px; margin-top:5px; border: 1px ridge rgb(255,0,0,.6); margin-left:20px; float:left;  height:25px; padding:0; padding-top:3px; font-size: 10pt; font-family: inherit;',
					text : '좌석수'
				})).append($('<div/>',{
					style : 'display:inline-block; float:left;  margin-top:5px; margin-left:10px; width:540px; text-align:left; padding-top:3px; height:25px;',
					html : item.eventseats.replaceAll(index_keyword, PointKeyword)
				})).append($('<div/>',{
					style:'display:inline-block; width:50px; margin-top:5px; border: 1px ridge rgb(255,0,0,.6); margin-left:20px; float:left;  height:25px; padding:0; padding-top:3px; font-size: 10pt; font-family: inherit;',
					text : '등급'
				})).append($('<div/>',{
					style : 'display:inline-block; float:left;  margin-top:5px; margin-left:10px; width:540px; text-align:left; padding-top:3px; height:25px;',
					html : item.eventrate.replaceAll(index_keyword, PointKeyword)
				})).append($('<div/>',{
					style:'display:inline-block; width:50px; margin-top:5px; border: 1px ridge rgb(255,0,0,.6); margin-left:20px; float:left;  height:25px; padding:0; padding-top:3px; font-size: 10pt; font-family: inherit;',
					text : '내용'
				})).append($('<div/>',{
					style : 'overflow: hidden; white-space: nowrap; text-overflow  : ellipsis; display:inline-block; float:left;  margin-top:5px; margin-left:10px; width:540px; text-align:left; padding-top:3px; height:5px;',
					html : item.eventcontent.replaceAll(index_keyword, PointKeyword)
				}))).appendTo($('#index_eventboard_PlusList'));
				if(index=='1' || index=='2'){
					$('<div/>',{
						style:"width:880px;  border-bottom:1px dashed rgb(155,155,155,.6);"
					}).appendTo($('.dashed_from'+index));
				}
			});
			$('#index_eventboard_PlusPagingDiv').html(data.mainPaging.pagingHTML);
		}
	});
	$('#index_eventboard_PlusList').on('click','.name',function(){
		var seq = $(this).parent().prev().text();
		location.href='/exhibition//performance/exhibitionBook.do?seq='+seq;
	});
	$('#index_eventboard_PlusList').on('click','.image',function(){
		var seq = $(this).parent().prev().text();
		location.href='/exhibition//performance/exhibitionBook.do?seq='+seq;
	});
	String.prototype.replaceAll = function(org, dest) {
	    return this.split(org).join(dest);
	}
});
