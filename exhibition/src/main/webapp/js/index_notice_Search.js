$(document).ready(function(event, str){
	var index_keyword = $('#index_keyword').val();
	var pg = $('#pg').val();
	var code = $('#hiddenCode').val();
	var PointKeyword = "<span class='aaa'>"+index_keyword+"</span>";
	
	// 메인 검색 후 공지사항 더보기 버튼 클릭시 리스트 불러옴
	$.ajax({
		type : 'GET',
		url : '/exhibition/main/index_notice_SearchPlus.do?pg='+pg +'&index_keyword='+encodeURI(index_keyword),
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index, item){
				$('<div/>').append($('<input/>',{
					align : 'center',
					style: 'width: 880px; text-align: left; margin-top:15px;',
					type : 'hidden',
					text : item.seq
				}).append($('<input/>',{
				}))).append($('<div/>',{
					style: 'width: 50px; height:30px; padding-left:7px; padding-top:5px; text-align: left;  font-size:13pt; margin-left:5px; border: 1px ridge rgb(255,0,0,.6); margin-top:35px; display: inline-block; float:left;',
					text : '제목',
				})).append($('<div/>',{
					style: 'width: 810px; height:30px; padding-top:7px; text-align:left;  font-size:13pt; margin-left:5px; margin-top:35px; display: inline-block;',
					id : 'subjectA',
					html : item.subject.replaceAll(index_keyword, PointKeyword)
					
				})).append($('<div/>',{
					style: 'width: 880px; overflow: hidden; white-space: nowrap; text-overflow  : ellipsis; height: 35px; padding-left:10px; padding-top:10px; text-align: left; font-size:8pt; font-family: inherit;',
					class : 'contentC'+index+'',
					href : 'javascript:void(0)',
					html : item.content.replaceAll(index_keyword, PointKeyword)
					
				})).appendTo($('#index_notice_PlusList'));
				if(index == 0 || index==1){
					$('<div/>',{
						style:"width:880px;  border-bottom:1px dashed rgb(155,155,155,.6);"
					}).appendTo($('.contentC'+index));
				}
				$('#index_notice_PlusPagingDiv').html(data.mainPaging.pagingHTML);
			});
		}
	
	});
	$('#index_notice_PlusList').on('click','#subjectA',function(){
		var seq = $(this).prev().prev().text();
		location.href='/exhibition/customerService/C_notice_View.do?seq='+seq+'&pg='+$('#pg').val()+'&keyword='+$('#keyword').val();
	});
	String.prototype.replaceAll = function(org, dest) {
	    return this.split(org).join(dest);
	}
});

