$(document).ready(function(event, str){
	var index_keyword = $('#indexkeyword').val();
	var code = $('#hiddenCode').val();
	
	// 메인 검색시 검색된 공지사항 리스트 불러옴
	$.ajax({
		type : 'POST',
		url : '/exhibition/main/index_Notice_Search.do',
		data : {'index_keyword' : index_keyword},
		dataType : 'json',
		success : function(data){
			if(data.totalA=='0'){
				$('<tr/>',{
					align: 'center'
				}).append($('<td/>',{
					align : 'center',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_Notice_SearchList'));  
				
			}else if(data.totalA!='0'){
				$.each(data.list, function(index, item){
					$('<tr/>').append($('<input/>',{
						align : 'center',
						style: 'width: 880px; text-align: left;',
						type : 'hidden',
						text : item.seq
					})).append($('<td/>',{
						style: 'width: 880px; text-align: left;',
						id : 'subjectA',
						text : item.subject
					})).appendTo($('#index_Notice_SearchList'));
					
					$('<tr/>',{
						style: 'width: 880px; height: 35px; text-align: left;'
					}).append($('<td/>',{
						style: 'width: 880px;  height: 35px; text-align: left;',
						class : 'contentC',
						href : 'javascript:void(0)',
						text : item.content
					})).appendTo($('#index_Notice_SearchList'));
				});
			}
		}
	});
	// 공지사항 제목 클릭시 내용보여줌
	$('#index_NoticeSearch').on('click','#subjectA',function(){
		var seq = $(this).prev().text();
		location.href='/exhibition/customerService/C_notice_View.do?seq='+seq+'&pg='+$('#pg').val();
	});
	
	// 메인 검색시 검색된 자주묻는 질문 리스트 불러옴
	$.ajax({
		type : 'POST',
		url : '/exhibition/main/index_QnA_Search.do',
		data : {'index_keyword' : index_keyword},
		dataType : 'json',
		success : function(data){
			
			if(data.totalA=='0'){
				$('<tr/>',{
					align: 'center'
				}).append($('<td/>',{
					align : 'center',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_QnA_SearchList'));  
				
			} else if(data.totalA!='0'){
				$.each(data.list, function(index, item){
					$('<tr/>').append($('<input/>',{
						align : 'center',
						style: 'width: 880px; text-align: left;',
						type : 'hidden',
						text : item.seq
					})).append($('<td/>',{
						style: 'width: 880px; text-align: left;',
						id : 'subjectA',
						text : item.subject
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
			}
		}
	});
	
	//
	$('#index_QnASearch').on('click','#subjectA',function(){
		var seq = $(this).prev().text();
		location.href='/exhibition/customerService/C_QnA.do';
	});
	
	// 메인 검색시 검색된 주요시설 연락처 리스트 불러옴
	$.ajax({
		type : 'POST',
		url : '/exhibition/main/index_contactList_Search.do',
		data : {'index_keyword': index_keyword },
		dataType : 'json',
		success : function(data){
			if(data.totalA=='0'){
				$('<tr/>',{
					align: 'center'
				}).append($('<td/>',{
					colspan: '6',
					align : 'center',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_contactList_SearchList'));  
				
			}else if(data.totalA!='0'){
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
							id : 'classifyA'
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.facility,
							id : 'facilityA'
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.title,
							id : 'titleA'
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.name,
							id : 'nameA'
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.phone,
							id : 'phoneA'
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
							id : 'classifyA'
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.facility,
							id : 'facilityA'
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.title,
							id : 'titleA'
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.name,
							id : 'nameA'
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.phone,
							id : 'phoneA'
						})).appendTo($('#index_contactList_SearchList'));	
					}
				});
			}
			/*$('#C_contactList_PagingDiv').html(data.customerServicePaging.pagingHTML);*/
		}
	});
	
	// 메인 검색시 검색된 박람회 리스트 불러옴
	$.ajax({
		type : 'POST',
		url : '/exhibition/main/index_eventboard_Search.do',
		data : {'index_keyword': index_keyword },
		dataType : 'json',
		success : function(data){
			if(data.totalA=='0'){
				$('<tr/>',{
					align: 'center'
				}).append($('<td/>',{
					align : 'center',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_eventboard_SearchList'));  
				
			} else if(data.totalA!='0'){
				$.each(data.list, function(index, item){
					$('<tr/>').append($('<td/>',{
						rowspan : '9',
						style : 'width : 100px; '
					}).append($('<img>',{
						src : '../storage/'+item.image1+'',
						style : 'width : 100px; height : 80px;'
					}))).append($('<td/>',{
						text : item.imagename
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
	
	// 메인 검색시 검색된 연극 리스트 불러옴
	$.ajax({
		type : 'POST',
		url : '/exhibition/main/index_eventboard_play_Search.do',
		data : {'index_keyword': index_keyword },
		dataType : 'json',
		success : function(data){
			if(data.totalA=='0'){
				$('<tr/>',{
					align: 'center'
				}).append($('<td/>',{
					align : 'center',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_eventboard_play_SearchList'));  
				
			} else if(data.totalA!='0'){
				$.each(data.list, function(index, item){
					$('<tr/>').append($('<td/>',{
						rowspan : '9',
						style : 'width : 100px; '
					}).append($('<img>',{
						src : '../storage/'+item.image1+'',
						style : 'width : 100px; height : 80px;'
					}))).append($('<td/>',{
						text : item.imagename
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
	
	// 메인 검색시 검색된 숙박 리스트 불러옴
	$.ajax({
		type : 'POST',
		url : '/exhibition/main/index_hotel_list_Search.do',
		data : {'index_keyword': index_keyword },
		dataType : 'json',
		success : function(data){
			if(data.totalA=='0'){
				$('<tr/>',{
					align: 'center'
				}).append($('<td/>',{
					align : 'center',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_hotel_list_SearchList'));  
				
			} else if(data.totalA!='0'){
				$.each(data.list, function(index, item){
					$('<tr/>').append($('<td/>',{
						rowspan : '3',
						style : 'width : 100px; '
					}).append($('<img>',{
						src : '../storage/'+item.image1+'',
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
					
					
					
					
				});
			}
		}
	});
	

});