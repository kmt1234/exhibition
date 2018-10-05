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
			alert(JSON.stringify(data));
			if(data.totalA<'4'){
				$('#index_notice_SearchPlusBtn').hide();
			}
			if(data.totalA=='0'){
				
				$('<tr/>',{
					align: 'center'
				}).append($('<td/>',{
					align : 'center',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_notice_SearchList'));  
				
			}else if(data.totalA!='0'){
				$('<span/>',{
					text : "("+data.totalA+"건)"
				}).appendTo($('#index_notice_total'));
				$.each(data.list, function(index, item){
					
					var PointKeyword = "<span class='aaa'>"+index_keyword+"</span>";
					var upperSubject = item.subject.toUpperCase();
					var searchSubject = upperSubject.replace(index_keyword,PointKeyword);
					var matchSubject = '/'+index_keyword+'/gi';
					
					alert(item.subject.match(matchSubject));
					
					$('<tr/>').append($('<input/>',{
						align : 'center',
						style: 'width: 880px; text-align: left;',
						type : 'hidden',
						text : item.seq
					})).append($('<td/>',{
						style: 'width: 880px; text-align: left;',
						id : 'subjectA',
						html : searchSubject
					})).appendTo($('#index_notice_SearchList'));

					$('<tr/>',{
						style: 'width: 880px; height: 35px; text-align: left;'
					}).append($('<td/>',{
						style: 'width: 880px;  height: 35px; text-align: left;',
						class : 'contentC',
						href : 'javascript:void(0)',
						text : item.content
					})).appendTo($('#index_notice_SearchList'));
				});
			}
		}
	});
	
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
		data : {'pg': $('#pg').val(),
				'index_keyword' : index_keyword},
		dataType : 'json',
		success : function(data){
			if(data.totalA<'4'){
				$('#index_QnA_SearchPlusBtn').hide();
			}
			if(data.totalA=='0'){
				$('<tr/>',{
					align: 'center'
				}).append($('<td/>',{
					align : 'center',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_QnA_SearchList'));
				
			} else if(data.totalA!='0'){
				$('<span/>',{
					text : "("+data.totalA+"건)"
				}).appendTo($('#index_QnA_total'));
				$.each(data.list, function(index, item){
					var subject = item.subject;
					$('<tr/>').append($('<input/>',{
						type : 'hidden',
						text : item.classify
					})).append($('<input/>',{
						
						align : 'center',
						style: 'width: 880px; text-align: left;',
						type : 'hidden',
						text : item.seq
					})).append($('<td/>',{
						style: 'width: 880px; text-align: left;',
						id : 'subjectA',
						text : "["+item.classify+"]   "+item.subject
					})).appendTo($('#index_QnA_SearchList'));
				
					$('<tr/>',{
						style: 'width: 880px; height: 35px; text-align: left;'
					}).append($('<td/>',{
						style: 'width: 880px;  height: 35px; text-align: left;',
						class : 'contentC',
						href : 'javascript:void(0)',
						text : item.content
					})).appendTo($('#index_QnA_SearchList'));
				});
				/*if(subject.matches(index_keyword)){
					System.out.println("있다");
				}*/
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
		data : {'pg': $('#pg').val(),
				'index_keyword': index_keyword },
		dataType : 'json',
		success : function(data){
			if(data.totalA<'4'){
				$('#index_contactList_SearchPlusBtn').hide();
			}
			if(data.totalA=='0'){
				$('<tr/>',{
					align: 'center'
				}).append($('<td/>',{
					colspan: '6',
					align : 'center',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_contactList_SearchList'));  
				
			}else if(data.totalA!='0'){
				$('<span/>',{
					text : "("+data.totalA+"건)"
				}).appendTo($('#index_contactList_total'));
				
				$('<tr/>').append($('<th/>',{
					style : "width: 18%; height: 7%; padding-top: 10px; text-align: center;",
					text : '분류'
				})).append($('<th/>',{
					style : "width: 18%; height: 7%; padding-top: 10px; text-align: center;",
					text : '기관 & 시설'
				})).append($('<th/>',{
					style : "width: 18%; height: 7%; padding-top: 10px; text-align: center;",
					text : '명칭'
				})).append($('<th/>',{
					style : "width: 18%; height: 7%; padding-top: 10px; text-align: center;",
					text : '담당자'
				})).append($('<th/>',{
					style : "width: 18%; height: 7%; padding-top: 10px; text-align: center;",
					text : '연락처'
				})).appendTo($('#index_contactList_SearchList'));
				
				$.each(data.list, function(index, item){
					if(code!=3){
						$('<tr/>').append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.classify,
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.facility,
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.title,
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.name,
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.phone,
						})).appendTo($('#index_contactList_SearchList'));
						
					} else if(code==3){
						$('<tr/>').append($('<td/>').append($('<input/>',{
							type : 'checkbox',
							value : item.seq,
							name : 'box',
							class : 'box'
						}))).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.classify,
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.facility,
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.title,
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.name,
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
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
		data : {'pg': $('#pg').val(),
				'index_keyword': index_keyword },
		dataType : 'json',
		success : function(data){
			if(data.totalA<'4'){
				$('#index_eventboard_SearchPlusBtn').hide();
			}
			if(data.totalA=='0'){
				$('<tr/>',{
					align: 'center'
				}).append($('<td/>',{
					align : 'center',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_eventboard_SearchList'));  
				
			} else if(data.totalA!='0'){
				$('<span/>',{
					text : "("+data.totalA+"건)"
				}).appendTo($('#index_eventboard_total'));
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
						id : 'eventboard_image'
					}))).append($('<td/>',{
						text : item.imagename,
						id : 'eventboard_name'
					})).appendTo($('#index_eventboard_SearchList'));
					
					$('<tr/>').append($('<td/>',{
						text : item.startdate+"~"+item.enddate
					})).appendTo($('#index_eventboard_SearchList'));
					
					$('<tr/>').append($('<td/>',{
						text : item.starttime+"~"+item.endtime
					})).appendTo($('#index_eventboard_SearchList'));
					
					$('<tr/>').append($('<td/>',{
						text : item.eventplace
					})).appendTo($('#index_eventboard_SearchList'));
					
					$('<tr/>').append($('<td/>',{
						text : item.eventlink
					})).appendTo($('#index_eventboard_SearchList'));
					
					$('<tr/>').append($('<td/>',{
						text : item.eventprice
					})).appendTo($('#index_eventboard_SearchList'));
					
					$('<tr/>').append($('<td/>',{
						text : item.eventseats
					})).appendTo($('#index_eventboard_SearchList'));
					
					$('<tr/>').append($('<td/>',{
						text : item.eventrate
					})).appendTo($('#index_eventboard_SearchList'));
					
					$('<tr/>').append($('<td/>',{
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
		data : {'pg': $('#pg').val(),
				'index_keyword': index_keyword },
		dataType : 'json',
		success : function(data){
			if(data.totalA<'4'){
				$('#index_eventboard_play_SearchPlusBtn').hide();
			}
			if(data.totalA=='0'){
				$('<tr/>',{
					align: 'center'
				}).append($('<td/>',{
					align : 'center',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_eventboard_play_SearchList'));  
				
			} else if(data.totalA!='0'){
				$('<span/>',{
					text : "("+data.totalA+"건)"
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
		data : {'pg': $('#pg').val(),
				'index_keyword': index_keyword },
		dataType : 'json',
		success : function(data){
			if(data.totalA<'4'){
				$('#index_hotel_list_SearchPlusBtn').hide();
			}
			if(data.totalA=='0'){
				$('<tr/>',{
					align: 'center'
				}).append($('<td/>',{
					align : 'center',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_hotel_list_SearchList'));  
				
			} else if(data.totalA!='0'){
				$('<span/>',{
					text : "("+data.totalA+"건)"
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
