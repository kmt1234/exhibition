$(document).ready(function(event, str){
	var index_keyword = $('#index_keyword').val();
	var pg = $('#pg').val();
	var code = $('#hiddenCode').val();
	var PointKeyword = "<span class='aaa'>"+index_keyword+"</span>";
	
	// 메인 검색시 검색된 주요시설 연락처 리스트 불러옴
	$.ajax({
		type : 'GET',
		url : '/exhibition/main/index_contactList_SearchPlus.do?pg='+pg+'&index_keyword='+encodeURI(index_keyword),
		dataType : 'json',
		success : function(data){
			$('<div/>').append($('<div/>',{
				style : "width: 175px; height: 7%; font-size:13pt; margin-top:35px; text-align: left; display :inline-block;",
				text : '분류'
			})).append($('<div/>',{
				style : "width: 175px; height: 7%; font-size:13pt; margin-top:35px; text-align: left; display :inline-block;",
				text : '기관 & 시설'
			})).append($('<div/>',{
				style : "width: 175px; height: 7%;  font-size:13pt; margin-top:35px; text-align: left; display :inline-block;",
				text : '명칭'
			})).append($('<div/>',{
				style : "width: 175px; height: 7%;  font-size:13pt; margin-top:35px; text-align: left; display :inline-block;",
				text : '담당자'
			})).append($('<div/>',{
				style : "width: 175px; height: 7%; font-size:13pt; margin-top:35px; text-align: left; display :inline-block;",
				text : '연락처'
			})).append($('<div/>',{
				style:"width:880px; margin-top:5px; border-bottom:1px dashed rgb(155,155,155,.6);"
			})).appendTo($('#index_contactList_PlusList'));
			
			$.each(data.list, function(index, item){
					$('<div/>').append($('<div/>',{
						style: 'width: 175px; height: 9%; font-size:10pt; margin-top:10px; text-align: left; display :inline-block;',
						html : item.classify.replaceAll(index_keyword, PointKeyword)
					})).append($('<div/>',{
						style: 'width: 175px; height: 9%; font-size:10pt; margin-top:10px; text-align: left; display :inline-block;',
						html : item.facility.replaceAll(index_keyword, PointKeyword)
					})).append($('<div/>',{
						style: 'width: 175px; height: 9%; font-size:10pt; margin-top:10px; text-align: left; display :inline-block;',
						html : item.title.replaceAll(index_keyword, PointKeyword)
					})).append($('<div/>',{
						style: 'width: 175px; height: 9%; font-size:10pt; margin-top:10px; text-align: left; display :inline-block;',
						html : item.name.replaceAll(index_keyword, PointKeyword)
					})).append($('<div/>',{
						style: 'width: 175px; height: 9%; font-size:10pt; margin-top:10px; text-align: left; display :inline-block;',
						html : item.phone.replaceAll(index_keyword, PointKeyword)
					})).appendTo($('#index_contactList_PlusList'));
					$('<div/>',{
						style:"width:880px; margin-top:5px; border-bottom:1px dashed rgb(155,155,155,.6);"
					}).appendTo($('#index_contactList_PlusList'));
			});
			$('#index_contactList_PlusPagingDiv').html(data.mainPaging.pagingHTML);
		}
	});
	String.prototype.replaceAll = function(org, dest) {
	    return this.split(org).join(dest);
	}
});
