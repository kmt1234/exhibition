$(document).ready(function(){
	var C_name = /^[가-힣]+$/;	//한글만 가능 
	var C_phone =  /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;	//휴대폰 번호 양식
	var Cw_regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; //이메일 양식
	
	//고객의 소리  - 답변하기 폼
	$('#C_inquire_replyBtn').click(function(){
		$('#C_inquire_writeReply').submit();
	});
	
	
	
	
	// 고객의 소리 문의 받은 글 불러오기
	$.ajax({
		type : 'GET',
		url : '/exhibition/customerService/C_inquire_Search.do?pg='+encodeURI($('#pg').val())
		+'&searchOption='+encodeURI($('#searchOption').val())+'&keyword='+encodeURI($('#keyword').val()),
		dataType : 'json',
		success : function(data){
			if(data.totalA=='0'){
				$('<tr/>',{
					align: 'center'
				}).append($('<td/>',{
					colspan: '6',
					align : 'center',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#C_inquire_SearchList'));  
				$('#C_inquire_SearchPagingDiv').hide();
				
			}else if(data.tataA!='0'){
				$('#C_inquire_SearchPagingDiv').show();
				$.each(data.list, function(index, item){
				$('<tr/>').append($('<td/>',{
					text : item.seq,
					style : 'text-align : center',
					id : 'seqA',
				})).append($('<td/>',{
					class : item.seq+""
				})).append($('<td/>',{
					id : 'subjectA',
					style : 'text-align : center',
					href : 'javascript:void(0)',
					text : item.subject
				})).append($('<td/>',{
					style : 'text-align : center',
					text : item.name,
					id : 'nameA'
				})).append($('<td/>',{
					style : 'text-align : center',
					text : item.email,
					id : 'emailA'
				})).append($('<td/>',{
					style : 'text-align : center',
					text : item.logtime,
					id : 'logtime'
				})).appendTo($('#C_inquire_SearchList'));
				
				
					if(item.pseq!=0){//답글
						$('.'+item.seq).append($('<i/>',{
							class : 'check icon'
						}));
					} else {
						$('.'+item.seq).append($('<i/>',{
							class : 'question icon'
						}));
					}
				});
			}
		
			$('#C_inquire_SearchPagingDiv').html(data.customerServicePaging.pagingHTML);
		}
	});
	
	//고객의소리 리스트 검색한 값 불러오기
	$('#C_inquire_SearchBtn').click(function(){
		location.href="/exhibition/customerService/C_inquire_SearchList.do?pg="+$('#pg1').val()+'&searchOption='+$('#searchOption').val()+"&keyword="+$('#keyword1').val();
		/*$('#pg1').val(1);
		if($('#keyword').val()=='')
			alert("검색어를 입력하세요");
		else{
			$.ajax({
				type : 'GET',
				url : '/exhibition/customerService/C_inquire_Search.do?pg='+encodeURI($('#pg1').val())
				+'&searchOption='+encodeURI($('#searchOption').val())+'&keyword='+encodeURI($('#keyword1').val()),
				dataType : 'json',
				success : function(data){
					$('#C_inquire_SearchList tr:gt(0)').remove();
					if(data.totalA=='0'){
						$('<tr/>',{
							align: 'center'
						}).append($('<td/>',{
							colspan: '6',
							align : 'center',
							text : '검색된 결과가 없습니다.'
						})).appendTo($('#C_inquire_SearchList'));  
						$('#C_inquire_SearchPagingDiv').hide();
						
					}else if(data.tataA!='0'){
						$.each(data.list, function(index, item){
							$('<tr/>').append($('<td/>',{
								text : item.seq,
								style : 'text-align : center',
								id : 'seqA',
							})).append($('<td/>',{
								class : item.seq+""
							})).append($('<td/>',{
								id : 'subjectA',
								style : 'text-align : center',
								href : 'javascript:void(0)',
								text : item.subject
							})).append($('<td/>',{
								style : 'text-align : center',
								text : item.name,
								id : 'nameA'
							})).append($('<td/>',{
								style : 'text-align : center',
								text : item.email,
								id : 'emailA'
							})).append($('<td/>',{
								style : 'text-align : center',
								text : item.logtime,
								id : 'logtime'
							})).appendTo($('#C_inquire_SearchList'));
						
						if(item.pseq!=0){//답글
							$('.'+item.seq).append($('<i/>',{
								class : 'check icon'
							}));
						} else {
							$('.'+item.seq).append($('<i/>',{
								class : 'question icon'
							}));
						}
						});
					}
					$('#C_inquire_SearchPagingDiv').show();
					$('#C_inquire_SearchPagingDiv').html(data.customerServicePaging.pagingHTML);
				}
			});
		}*/
	});
	
	$('.ui.selection.dropdown').dropdown();	
	
	// 고객의 소리 문의 받은 글 제목 클릭시 내용 보여주기
	$('#C_inquire_SearchList').on('click','#subjectA',function(){
		var seq = $(this).prev().prev().text();
		location.href='/exhibition/customerService/C_inquire_View.do?seq='+seq+'&pg='+$('#pg').val()+"&keyword="+$('#keyword').val();
	});
});