$(document).ready(function(event, str){
	var index_keyword = $('#index_keyword').val();
	var pg = $('#pg').val();
	var code = $('#hiddenCode').val();
	var PointKeyword = "<span class='aaa'>"+index_keyword+"</span>";
	
	// 메인 검색시 검색된 주요시설 연락처 리스트 불러옴
	$.ajax({
		type : 'GET',
		url : '/exhibition/main/index_QnA_SearchPlus.do?pg='+pg+'&index_keyword='+encodeURI(index_keyword),
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index, item){
				var subject = item.subject;
				$('<div/>').append($('<input/>',{
					type : 'hidden',
					text : item.classify+index
				})).append($('<input/>',{
					align : 'center',
					style: 'width: 880px; text-align: left;',
					type : 'hidden',
					text : item.seq+index
				})).append($('<div/>',{
					style: 'width: auto; height:30px; padding-top:5px; text-align: left;  font-size:13pt; margin-left:5px; border: 1px ridge rgb(255,0,0,.6); margin-top:35px; display: inline-block; float:left;',
					text : "["+item.classify+"]",
				})).append($('<div/>',{
					style: 'width: auto; height:30px; padding-top:7px; text-align:left; float : left; font-size:13pt; margin-left:5px; margin-top:35px; display: inline-block;',
					id : 'subjectA',
					html : item.subject.replaceAll(index_keyword, PointKeyword)
				})).append($('<div/>',{
					style: 'width: 880px; overflow: hidden; white-space: nowrap; text-overflow  : ellipsis;  height: 35px; padding-left:10px; padding-top:10px; text-align: left; font-size:8pt; font-family: inherit;',
					class : 'contentC'+index+'',
					href : 'javascript:void(0)',
					html : item.content.replaceAll(index_keyword, PointKeyword)
				})).appendTo($('#index_QnA_PlusList'));
				if(index=='0' || index=='1'){
					$('<div/>',{
						style:"width:880px;  border-bottom:1px dashed rgb(155,155,155,.6); "
					}).appendTo($('.contentC'+index));
				}
				$('#index_QnA_PlusPagingDiv').html(data.mainPaging.pagingHTML);
			});
		}
	});
	
	$('#index_QnA_PlusList').on('click','#subjectA',function(){
		var seq = $(this).prev().text();
		location.href='/exhibition/customerService/C_QnA.do';
	});
	String.prototype.replaceAll = function(org, dest) {
	    return this.split(org).join(dest);
	}
});
