$(document).ready(function(event, str){
	var index_keyword = $('#index_keyword').val();
	var pg = $('#pg').val();
	var code = $('#hiddenCode').val();
	var PointKeyword = "<span class='aaa'>"+index_keyword+"</span>";
	var classify;
	String.prototype.replaceAll = function(org, dest) {
	    return this.split(org).join(dest);
	}
	
	// 메인 검색시 검색된 공지사항 리스트 불러옴
	$.ajax({
		type : 'POST',
		url : '/exhibition/main/index_notice_Search.do',
		data : {'pg': 1,
				'index_keyword' : index_keyword},
		dataType : 'json',
		success : function(data){
			if(data.totalA<'4'){
				$('#index_notice_SearchPlusBtn').hide();
			}
			if(data.totalA=='0'){
				$('<div/>',{
					align: 'left'
				}).append($('<div/>',{
					align : 'left',
					style : 'margin-top:35px; margin-left:10px;',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_notice_SearchList'));  
				
			}else if(data.totalA!='0'){
				$('<span/>',{
					text : "("+data.totalA+"건)"
				}).appendTo($('#index_notice_total'));
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
						
					})).appendTo($('#index_notice_SearchList'));
					if(index == 0 || index==1){
						$('<div/>',{
							style:"width:880px;  border-bottom:1px dashed rgb(155,155,155,.6);"
						}).appendTo($('.contentC'+index));
					}
				});//each
				
			}//else if
		}//success
	});//ajax
	
	$('#index_notice_SearchPlusBtn').click(function(){
		location.href="/exhibition/main/index_notice_Plus.do?pg="+pg+"&index_keyword="+index_keyword;
	});
	// 공지사항 제목 클릭시 내용보여줌
	$('#index_notice_SearchList').on('click','#subjectA',function(){
		var seq = $(this).prev().prev().text();
		location.href='/exhibition/customerService/C_notice_View.do?seq='+seq+'&pg='+$('#pg').val()+'&keyword='+$('#keyword').val();
	});
	

	// 메인 검색시 검색된 자주묻는 질문 리스트 불러옴
	$.ajax({
		type : 'POST',
		url : '/exhibition/main/index_QnA_Search.do',
		data : {'pg': 1,
				'index_keyword' : index_keyword},
		dataType : 'json',
		success : function(data){
			if(data.totalA<'4'){
				$('#index_QnA_SearchPlusBtn').hide();
			}
			if(data.totalA=='0'){
				$('<div/>',{
					align: 'left'
				}).append($('<div/>',{
					align : 'left',
					style : 'margin-top:35px; margin-left:10px;',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_QnA_SearchList'));
				
			} else if(data.totalA!='0'){
				$('<span/>',{
					text : "("+data.totalA+"건)"
				}).appendTo($('#index_QnA_total'));
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
						style: 'width: 50px; height:30px; padding-left:7px; padding-top:5px; text-align: left;  font-size:13pt; margin-left:5px; border: 1px ridge rgb(255,0,0,.6); margin-top:35px; display: inline-block; float:left;',
						text : item.classify
					})).append($('<div/>',{
						style: 'width: auto; height:30px; padding-top:7px; text-align:left; float : left; font-size:13pt; margin-left:5px; margin-top:35px; display: inline-block;',
						id : 'subjectA',
						html : item.subject.replaceAll(index_keyword, PointKeyword)
					})).append($('<div/>',{
						style: 'width: 880px; overflow: hidden; white-space: nowrap; text-overflow  : ellipsis;  height: 35px; padding-left:10px; padding-top:10px; text-align: left; font-size:8pt; font-family: inherit;',
						class : 'contentC'+index+'',
						href : 'javascript:void(0)',
						html : item.content.replaceAll(index_keyword, PointKeyword)
					})).appendTo($('#index_QnA_SearchList'));
					if(index=='0' || index=='1'){
						$('<div/>',{
							style:"width:880px;  border-bottom:1px dashed rgb(155,155,155,.6); "
						}).appendTo($('.contentC'+index));
					}
				});
			}
		}
	});
	
	$('#index_QnA_SearchPlusBtn').click(function(){
		location.href="/exhibition/main/index_QnA_Plus.do?pg="+pg+"&index_keyword="+index_keyword;
	});
	
	//
	$('#index_QnA_SearchList').on('click','#subjectA',function(){
		classify = $(this).prev().text();
		location.href='/exhibition/customerService/C_QnA.do?classify='+classify;
	});
	
	// 메인 검색시 검색된 주요시설 연락처 리스트 불러옴
	$.ajax({
		type : 'POST',
		url : '/exhibition/main/index_contactList_Search.do',
		data : {'pg': 1,
				'index_keyword': index_keyword },
		dataType : 'json',
		success : function(data){
			if(data.totalA<'4'){
				$('#index_contactList_SearchPlusBtn').hide();
			}
			if(data.totalA=='0'){
				$('<div/>',{
					align: 'left'
				}).append($('<div/>',{
					colspan: '6',
					align : 'left',
					style : 'margin-top:35px; margin-left:10px;',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_contactList_SearchList'));  
				
			}else if(data.totalA!='0'){
				$('<span/>',{
					text : "("+data.totalA+"건)"
				}).appendTo($('#index_contactList_total'));
				
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
				})).appendTo($('#index_contactList_SearchList'));
				
				$.each(data.list, function(index, item){
					if(code!=3){
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
						})).appendTo($('#index_contactList_SearchList'));
						$('<div/>',{
							style:"width:880px; margin-top:5px; border-bottom:1px dashed rgb(155,155,155,.6);"
						}).appendTo($('#index_contactList_SearchList'));
					} else if(code==3){
						$('<div/>').append($('<div/>').append($('<input/>',{
							type : 'checkbox',
							value : item.seq,
							name : 'box',
							class : 'box'
						}))).append($('<div/>',{
							align : 'center',
							style: 'width: 175px; height: 9%; font-size:10pt; margin-top:10px; text-align: left; display :inline-block;',
							html : item.classify.replaceAll(index_keyword, PointKeyword)
						})).append($('<div/>',{
							align : 'center',
							style: 'width: 175px; height: 9%; font-size:10pt; margin-top:10px; text-align: left; display :inline-block;',
							html : item.facility.replaceAll(index_keyword, PointKeyword)
						})).append($('<div/>',{
							align : 'center',
							style: 'width: 175px; height: 9%; font-size:10pt; margin-top:10px; text-align: left; display :inline-block;',
							html : item.title.replaceAll(index_keyword, PointKeyword)
						})).append($('<div/>',{
							align : 'center',
							style: 'width: 175px; height: 9%; font-size:10pt; margin-top:10px; text-align: left; display :inline-block;',
							html : item.name.replaceAll(index_keyword, PointKeyword)
						})).append($('<div/>',{
							align : 'center',
							style: 'width: 175px; height: 9%; font-size:10pt; margin-top:10px; text-align: left; display :inline-block;',
							html : item.phone.replaceAll(index_keyword, PointKeyword)
						})).appendTo($('#index_contactList_SearchList'));	
					}
				});
				$('#index_contactList_PagingDiv').html(data.mainPaging.pagingHTML);
			}
		}
	});
	
	
	$('#index_contactList_SearchPlusBtn').click(function(){
		location.href="/exhibition/main/index_contactList_Plus.do?pg="+pg+"&index_keyword="+index_keyword;
	});
	
	
	// 메인 검색시 검색된 박람회 리스트 불러옴
	$.ajax({
		type : 'POST',
		url : '/exhibition/main/index_eventboard_Search.do',
		data : {'pg': 1,
				'index_keyword': index_keyword },
		dataType : 'json',
		success : function(data){
			if(data.totalA<'4'){
				$('#index_eventboard_SearchPlusBtn').hide();
			}
			if(data.totalA=='0'){
				$('<div/>',{
					align: 'left'
				}).append($('<div/>',{
					style : 'margin-top:35px; margin-left:10px;',
					align : 'left',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_eventboard_SearchList'));  
				
			} else if(data.totalA!='0'){
				
				$('<span/>',{
					text : "("+data.totalA+"건)"
				}).appendTo($('#index_eventboard_total'));
				
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
						style : 'display:inline-block; float:left;  margin-top:5px; margin-left:10px; width:540px; text-align:left; padding-top:3px; height:25px;',
						html : item.eventcontent.replaceAll(index_keyword, PointKeyword)
					}))).appendTo($('#index_eventboard_SearchList'));
					if(index=='1' || index=='2'){
						$('<div/>',{
							style:"width:880px;  border-bottom:1px dashed rgb(155,155,155,.6);"
						}).appendTo($('.dashed_from'+index));
					}
				});
				
			}
		}
	});
	
	
	$('#index_eventboard_SearchPlusBtn').click(function(){
		location.href="/exhibition/main/index_eventboard_Plus.do?pg="+pg+"&index_keyword="+index_keyword;
	});
	
	$('#index_eventboard_SearchList').on('click','.name',function(){
		var seq = $(this).parent().prev().text();
		location.href='/exhibition//performance/exhibitionBook.do?seq='+seq;
	});

	$('#index_eventboard_SearchList').on('click','.image',function(){
		var seq = $(this).parent().prev().text();
		location.href='/exhibition//performance/exhibitionBook.do?seq='+seq;
	});
	
	
	// 메인 검색시 검색된 연극 리스트 불러옴
	$.ajax({
		type : 'POST',
		url : '/exhibition/main/index_eventboard_play_Search.do',
		data : {'pg': 1,
				'index_keyword': index_keyword },
		dataType : 'json',
		success : function(data){
			if(data.totalA<'4'){
				$('#index_eventboard_play_SearchPlusBtn').hide();
			}
			if(data.totalA=='0'){
				$('<div/>',{
					align: 'left'
				}).append($('<div/>',{
					align : 'left',
					style : 'margin-top:35px; margin-left:10px;',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_eventboard_play_SearchList'));  
				
			} else if(data.totalA!='0'){
				$('<span/>',{
					text : "("+data.totalA+"건)"
				}).appendTo($('#index_eventboard_play_total'));
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
						style : 'display:inline-block; float:left;  margin-top:5px; margin-left:10px; width:540px; text-align:left; padding-top:3px; height:25px;',
						html : item.eventcontent.replaceAll(index_keyword, PointKeyword)
					}))).appendTo($('#index_eventboard_play_SearchList'));
					if(index=='1' || index=='2'){
						$('<div/>',{
							style:"width:880px;  border-bottom:1px dashed rgb(155,155,155,.6);"
						}).appendTo($('.dashed_from'+index));
					}
				});
			}
		}
	});
	
	$('#index_eventboard_play_SearchPlusBtn').click(function(){
		location.href="/exhibition/main/index_eventboard_play_Plus.do?pg="+pg+"&index_keyword="+index_keyword;
	});
	
	$('#index_eventboard_play_SearchList').on('click','.name',function(){
		var seq = $(this).parent().prev().text();
		location.href='/exhibition//performance/performanceBook.do?seq='+seq;
	});
	$('#index_eventboard_play_SearchList').on('click','.image',function(){
		var seq = $(this).parent().prev().text();
		location.href='/exhibition//performance/performanceBook.do?seq='+seq;
	});
	
	
	
	var eventlink;
	// 메인 검색시 검색된 숙박 리스트 불러옴
	$.ajax({
		type : 'POST',
		url : '/exhibition/main/index_hotel_list_Search.do',
		data : {'pg': 1,
				'index_keyword': index_keyword },
		dataType : 'json',
		success : function(data){
			if(data.totalA<'4'){
				$('#index_hotel_list_SearchPlusBtn').hide();
			}
			if(data.totalA=='0'){
				$('<div/>',{
					align: 'left'
				}).append($('<div/>',{
					align : 'left',
					style : 'margin-top:35px; margin-left:10px;',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_hotel_list_SearchList'));  
				
			} else if(data.totalA!='0'){
				$('<span/>',{
					text : "("+data.totalA+"건)"
				}).appendTo($('#index_hotel_list_total'));
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
					}))).appendTo($('#index_hotel_list_SearchList'));
					if(index=='1' || index=='2'){
						$('<div/>',{
							style:"width:880px;  border-bottom:1px dashed rgb(155,155,155,.6);"
						}).appendTo($('.dashed_from'+index));
					}
				});
			}
		}
	});
	
	$('#index_hotel_list_SearchPlusBtn').click(function(){
		location.href="/exhibition/main/index_hotel_list_Plus.do?pg="+pg+"&index_keyword="+index_keyword;
	});
	

	
	
	
});
