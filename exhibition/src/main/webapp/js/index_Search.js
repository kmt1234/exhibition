$(document).ready(function(){
	var index_keyword = $('#indexkeyword').val();
	var code = $('#hiddenCode').val();
	
	// 메인 검색시 검색된 공지사항 리스트 불러옴
	$.ajax({
		type : 'POST',
		url : '/exhibition/main/index_notice_Search.do',
		data : {'pg':$('#pg').val(),
				'index_keyword' : index_keyword},
		dataType : 'json',
		success : function(data){
			if(data.totalA<'4'){
				$('#index_notice_SearchPlus').remove();
			}
			if(data.totalA=='0'){
				$('<tr/>',{
					align: 'center'
				}).append($('<td/>',{
					align : 'center',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_notice_SearchList'));  
				
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
	
	// 공지사항 제목 클릭시 내용보여줌
	$('#index_notice_SearchList').on('click','#subjectA',function(){
		var seq = $(this).prev().text();
		location.href='/exhibition/customerService/C_notice_View.do?seq='+seq+'&pg='+$('#pg').val();
	});
	
	
	// 메인 검색시 검색된 자주묻는 질문 리스트 불러옴
	$.ajax({
		type : 'POST',
		url : '/exhibition/main/index_QnA_Search.do',
		data : {'pg':$('#pg').val(),
				'index_keyword' : index_keyword},
		dataType : 'json',
		success : function(data){
			if(data.totalA<'4'){
				$('#index_QnA_SearchPlus').remove();
			}
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
						type : 'hidden',
						text : item.classify
					})).append($('<input/>',{
						
						align : 'center',
						style: 'width: 880px; text-align: left;',
						type : 'hidden',
						text : item.seq
					})).append($('<td/>',{
						style: 'width: 880px; text-align: left;',
						id : 'QnA_subject',
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
	$('#index_QnA_SearchList').on('click','#QnA_subject',function(){
		var seq = $(this).prev().text();
		location.href='/exhibition/customerService/C_QnA.do';
	});
	
	// 메인 검색시 검색된 주요시설 연락처 리스트 불러옴
	$.ajax({
		type : 'POST',
		url : '/exhibition/main/index_contactList_Search.do',
		data : {'pg':$('#pg').val(),
				'index_keyword': index_keyword },
		dataType : 'json',
		success : function(data){
			if(data.totalA<'4'){
				$('#index_contactList_SearchPlus').remove();
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
		}
	});
	
	// 메인 검색시 검색된 박람회 리스트 불러옴
	$.ajax({
		type : 'POST',
		url : '/exhibition/main/index_eventboard_Search.do',
		data : {'pg':$('#pg').val(),
				'index_keyword': index_keyword },
		dataType : 'json',
		success : function(data){
			if(data.totalA<'4'){
				$('#index_eventboard_SearchPlus').remove();
			}
			if(data.totalA=='0'){
				$('<tr/>',{
					align: 'center'
				}).append($('<td/>',{
					align : 'center',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_eventboard_SearchList'));  
				
			} else if(data.totalA!='0'){
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
		data : {'pg':$('#pg').val(),
				'index_keyword': index_keyword },
		dataType : 'json',
		success : function(data){
			if(data.totalA<'4'){
				$('#index_eventboard_play_SearchPlus').remove();
			}
			if(data.totalA=='0'){
				$('<tr/>',{
					align: 'center'
				}).append($('<td/>',{
					align : 'center',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#index_eventboard_play_SearchList'));  
				
			} else if(data.totalA!='0'){
				$.each(data.list, function(index, item){
					console.log(JSON.stringify(item));
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
		data : {'pg':$('#pg').val(),
				'index_keyword': index_keyword },
		dataType : 'json',
		success : function(data){
			if(data.totalA<'4'){
				$('#index_hotel_list_SearchPlus').remove();
			}
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
	
	$('#index_hotel_list_SearchList').on('click','.hotel_image',function(){
		location.href=''+eventlink+'';
	});
	
	$('#index_notice_SearchPlus').on('click',function(event, str){
		if(str!='trigger') $('#pg').val(1);
		
		$.ajax({
			type : 'POST',
			url : '/exhibition/main/index_notice_Search.do',
			data : {'pg':$('#pg').val(),
					'index_keyword' : index_keyword},
			dataType : 'json',
			success : function(data){
				$('#index_notice_SearchList tr:gt(0)').remove();
				if(data.totalA=='0'){
					$('<tr/>',{
						align: 'center'
					}).append($('<td/>',{
						align : 'center',
						text : '검색된 결과가 없습니다.'
					})).appendTo($('#index_notice_SearchList'));  
					
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
	});
	
	$('#index_notice_SearchPlus').click(function(){
		$('#index_QnA_div').remove();
		$('#index_contactList_div').remove();
		$('#index_eventboard_div').remove();
		$('#index_eventboard_play_div').remove();
		$('#index_hotel_list_div').remove();
	});

	$('#index_QnA_SearchPlus').click(function(){
		$('#index_notice_div').remove();
		$('#index_contactList_div').remove();
		$('#index_eventboard_div').remove();
		$('#index_eventboard_play_div').remove();
		$('#index_hotel_list_div').remove();
	});
	
	$('#index_contactList_SearchPlus').click(function(){
		$('#index_notice_div').remove();
		$('#index_QnAt_div').remove();
		$('#index_eventboard_div').remove();
		$('#index_eventboard_play_div').remove();
		$('#index_hotel_list_div').remove();
	});
	
	$('#index_eventboard_SearchPlus').click(function(){
		$('#index_notice_div').remove();
		$('#index_QnA_div').remove();
		$('#index_contactList_div').remove();
		$('#index_eventboard_play_div').remove();
		$('#index_hotel_list_div').remove();
	});
	
	$('#index_eventboard_play_SearchPlus').click(function(){
		$('#index_notice_div').remove();
		$('#index_QnA_div').remove();
		$('#index_contactList_div').remove();
		$('#index_eventboard_div').remove();
		$('#index_hotel_list_div').remove();
	});
	
	$('#index_hotel_list_SearchPlus').click(function(){
		$('#index_notice_div').remove();
		$('#index_QnA_div').remove();
		$('#index_contactList_div').remove();
		$('#index_eventboard_div').remove();
		$('#index_eventboard_play_div').remove();
	});

});