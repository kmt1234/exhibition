$(document).ready(function(event, str){
	var index_keyword = $('#indexkeyword').val();
	var pg = $('#pg').val();
	var code = $('#hiddenCode').val();
	
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
					align : 'center',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_notice_SearchList'));  
				
			}else if(data.totalA!='0'){
				var notice_total = data.totalA;
				$('<span/>',{
					text : "("+notice_total+"건)"
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
						text : item.subject
					})).append($('<div/>',{
						style: 'width: 880px;  height: 35px; padding-left:10px; padding-top:10px; text-align: left; font-size:8pt; font-family: inherit;',
						class : 'contentC',
						href : 'javascript:void(0)',
						text : item.content
					})).appendTo($('#index_notice_SearchList'));
					if(index%2 != 0){
						$('<div/>',{
							style:"width:880px;  border-bottom:1px dashed rgb(155,155,155,.6);"
						}).appendTo($('.contentC'));
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
		var seq = $(this).prev().text();
		location.href='/exhibition/customerService/C_notice_View.do?seq='+seq+'&pg='+$('#pg').val();
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
					align : 'center',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_QnA_SearchList'));
				
			} else if(data.totalA!='0'){
				var QnA_total = data.totalA;
				$('<span/>',{
					text : "("+QnA_total+"건)"
				}).appendTo($('#index_QnA_total'));
				$.each(data.list, function(index, item){
					var subject = item.subject;
					$('<div/>').append($('<input/>',{
						type : 'hidden',
						text : item.classify
					})).append($('<input/>',{
						align : 'center',
						style: 'width: 880px; text-align: left;',
						type : 'hidden',
						text : item.seq
					})).append($('<div/>',{
						style: 'width: 60px; height:30px; padding-left:7px; padding-top:5px; text-align: left;  font-size:13pt; margin-left:5px; border: 1px ridge rgb(255,0,0,.6); margin-top:35px; display: inline-block; float:left;',
						text : "["+item.classify+"]",
					})).append($('<div/>',{
						style: 'width: 800px; height:30px; padding-top:7px; text-align:left;  font-size:13pt; margin-left:5px; margin-top:35px; display: inline-block;',
						id : 'subjectA',
						text : item.subject
					})).append($('<div/>',{
						style: 'width: 880px;  height: 35px; padding-left:10px; padding-top:10px; text-align: left; font-size:8pt; font-family: inherit;',
						class : 'contentC',
						href : 'javascript:void(0)',
						text : item.content
					})).appendTo($('#index_QnA_SearchList'));
					if(index%2 != 0){
						$('<div/>',{
							style:"width:880px;  border-bottom:1px dashed rgb(155,155,155,.6);"
						}).appendTo($('.contentC'));
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
		var seq = $(this).prev().text();
		location.href='/exhibition/customerService/C_QnA.do';
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
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_contactList_SearchList'));  
				
			}else if(data.totalA!='0'){
				var contactList_total = data.totalA;
				$('<span/>',{
					text : "("+contactList_total+"건)"
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
							text : item.classify,
						})).append($('<div/>',{
							style: 'width: 175px; height: 9%; font-size:10pt; margin-top:10px; text-align: left; display :inline-block;',
							text : item.facility,
						})).append($('<div/>',{
							style: 'width: 175px; height: 9%; font-size:10pt; margin-top:10px; text-align: left; display :inline-block;',
							text : item.title,
						})).append($('<div/>',{
							style: 'width: 175px; height: 9%; font-size:10pt; margin-top:10px; text-align: left; display :inline-block;',
							text : item.name,
						})).append($('<div/>',{
							style: 'width: 175px; height: 9%; font-size:10pt; margin-top:10px; text-align: left; display :inline-block;',
							text : item.phone,
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
							text : item.classify,
						})).append($('<div/>',{
							align : 'center',
							style: 'width: 175px; height: 9%; font-size:10pt; margin-top:10px; text-align: left; display :inline-block;',
							text : item.facility,
						})).append($('<div/>',{
							align : 'center',
							style: 'width: 175px; height: 9%; font-size:10pt; margin-top:10px; text-align: left; display :inline-block;',
							text : item.title,
						})).append($('<div/>',{
							align : 'center',
							style: 'width: 175px; height: 9%; font-size:10pt; margin-top:10px; text-align: left; display :inline-block;',
							text : item.name,
						})).append($('<div/>',{
							align : 'center',
							style: 'width: 175px; height: 9%; font-size:10pt; margin-top:10px; text-align: left; display :inline-block;',
							text : item.phone,
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
					align : 'left',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_eventboard_SearchList_Img'));  
				
			} else if(data.totalA!='0'){
				var eventboard_total = data.totalA;
				$('<span/>',{
					text : "("+eventboard_total+"건)"
				}).appendTo($('#index_eventboard_total'));
				
				$.each(data.list, function(index, item){
					$('<div/>').append($('<input/>',{
						type : 'hidden',
						text : item.seq
					})).append($('<img/>',{
						src : '../storage/'+item.image1+'',
						style : 'width : 200px; height: 200px; float:left; border: 1px ridge rgb(155,155,155,.6); ',
						id : 'eventboard_image'
					})).append($('<div/>',{
						style:'float:left; text-align:left; margin-left:20px; width:660px; height:30px; font-size: 15pt; margin-top:10px; ',
						text: item.imagename
					})).append($('<div/>',{
						style:'display:inline-block; width:50px; border: 1px ridge rgb(255,0,0,.6); margin-left:20px; float:left;  height:25px; padding:0; padding-top:3px; font-size: 10pt; font-family: inherit;',
						text : '일시'
					})).append($('<div/>',{
						style : 'display:inline-block; float:left; margin-left:10px; width:580px; text-align:left; padding-top:3px; height:25px;',
						text : item.startdate+"~"+item.enddate
					})).append($('<div/>',{
						style:'display:inline-block; width:50px; margin-top:5px; border: 1px ridge rgb(255,0,0,.6); margin-left:20px; float:left;  height:25px; padding:0; padding-top:3px; font-size: 10pt; font-family: inherit;',
						text : '시간'
					})).append($('<div/>',{
						style : 'display:inline-block; float:left;  margin-top:5px; margin-left:10px; width:580px; text-align:left; padding-top:3px; height:25px;',
						text : item.starttime+"~"+item.endtime
					})).append($('<div/>',{
						style:'display:inline-block; width:50px; margin-top:5px; border: 1px ridge rgb(255,0,0,.6); margin-left:20px; float:left;  height:25px; padding:0; padding-top:3px; font-size: 10pt; font-family: inherit;',
						text : '장소'
					})).append($('<div/>',{
						style : 'display:inline-block; float:left;  margin-top:5px; margin-left:10px; width:580px; text-align:left; padding-top:3px; height:25px;',
						text :  item.eventplace
					})).append($('<div/>',{
						style:'display:inline-block; width:50px; margin-top:5px; border: 1px ridge rgb(255,0,0,.6); margin-left:20px; float:left;  height:25px; padding:0; padding-top:3px; font-size: 10pt; font-family: inherit;',
						text : '싸이트'
					})).append($('<div/>',{
						style : 'display:inline-block; float:left;  margin-top:5px; margin-left:10px; width:580px; text-align:left; padding-top:3px; height:25px;',
						text : item.eventlink
					})).appendTo($('#index_eventboard_SearchList'));
					
					$('<div/>').append($('<div/>',{
						text : item.eventprice
					})).appendTo($('#index_eventboard_SearchList'));
					
					$('<div/>').append($('<div/>',{
						text : item.eventseats
					})).appendTo($('#index_eventboard_SearchList'));
					
					$('<div/>').append($('<div/>',{
						text : item.eventrate
					})).appendTo($('#index_eventboard_SearchList'));
					
					$('<div/>').append($('<div/>',{
						text : item.eventcontent
					})).appendTo($('#index_eventboard_SearchList'));
				});
			}
		}
	});
	
	
	$('#index_eventboard_SearchPlusBtn').click(function(){
		location.href="/exhibition/main/index_eventboard_Plus.do?pg="+pg+"&index_keyword="+index_keyword;
	});
	
	$('#index_eventboard_SearchList').on('click','#eventboard_name',function(){
		var seq = $(this).prev().prev().text();
		location.href='/exhibition//performance/exhibitionBook.do?seq='+seq;
	});

	$('#index_eventboard_SearchList').on('click','#eventboard_image',function(){
		var seq = $(this).prev().text();
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
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_eventboard_play_SearchList'));  
				
			} else if(data.totalA!='0'){
				var eventboard_play_total = data.totalA;
				$('<span/>',{
					text : "("+eventboard_play_total+"건)"
				}).appendTo($('#index_eventboard_play_total'));
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
					})).appendTo($('#index_eventboard_play_SearchList'));
					
					$('<tr/>').append($('<td/>',{
						text : item.startdate+"~"+item.enddate
					})).appendTo($('#index_eventboard_play_SearchList'));
					
					$('<tr/>').append($('<td/>',{
						text : item.starttime+"~"+item.endtime
					})).appendTo($('#index_eventboard_play_SearchList'));
					
					$('<tr/>').append($('<td/>',{
						text : item.eventplace
					})).appendTo($('#index_eventboard_play_SearchList'));
					
					$('<tr/>').append($('<td/>',{
						text : item.eventlink
					})).appendTo($('#index_eventboard_play_SearchList'));
					
					$('<tr/>').append($('<td/>',{
						text : item.eventprice
					})).appendTo($('#index_eventboard_play_SearchList'));
					
					$('<tr/>').append($('<td/>',{
						text : item.eventseats
					})).appendTo($('#index_eventboard_play_SearchList'));
					
					$('<tr/>').append($('<td/>',{
						text : item.eventrate
					})).appendTo($('#index_eventboard_play_SearchList'));
					
					$('<tr/>').append($('<td/>',{
						text : item.eventcontent
					})).appendTo($('#index_eventboard_play_SearchList'));
				});
			}
		}
	});
	
	$('#index_eventboard_play_SearchPlusBtn').click(function(){
		location.href="/exhibition/main/index_eventboard_play_Plus.do?pg="+pg+"&index_keyword="+index_keyword;
	});
	
	$('#index_eventboard_play_SearchList').on('click','#eventboard_play_name',function(){
		var seq = $(this).prev().prev().text();
		location.href='/exhibition//performance/performanceBook.do?seq='+seq;
	});
	$('#index_eventboard_play_SearchList').on('click','#eventboard_play_image',function(){
		var seq = $(this).prev().text();
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
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_hotel_list_SearchList'));  
				
			} else if(data.totalA!='0'){
				var hotel_list_total = data.totalA;
				$('<span/>',{
					text : "("+hotel_list_total+"건)"
				}).appendTo($('#hotel_list_total'));
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
					})).appendTo($('#index_hotel_list_SearchList'));
					
					$('<tr/>').append($('<td/>',{
						text : item.eventplace
					})).appendTo($('#index_hotel_list_SearchList'));
					
					$('<tr/>').append($('<td/>',{
						text : item.eventlink
					})).appendTo($('#index_hotel_list_SearchList'));
					
					
					eventlink = item.eventlink;
					
				});
			}
		}
	});
	
	$('#index_hotel_list_SearchPlusBtn').click(function(){
		location.href="/exhibition/main/index_hotel_list_Plus.do?pg="+pg+"&index_keyword="+index_keyword;
	});
	
	$('#index_hotel_list_SearchList').on('click','.hotel_image',function(){
		location.href=''+eventlink+'';
	});
});
