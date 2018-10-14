$(document).ready(function(){
	
	$('#C_notice_WriteBtn').click(function(){ 
		location.href="/exhibition/customerService/C_notice_WriteBtn.do";
	});
	
	
	//공지사항 - 작성하기
	$('#C_notice_checkWriteBtn').click(function(){ // 공지사항 - 등록버튼 클릭시
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		
		if($('#subject').val()=='')
			$('#subjectDiv').text("제목을 입력하세요").css('font-size','9pt').css('color','red')
		else if($('#content').val()=='')
			$('#contentDiv').text("내용을 입력하세요").css('font-size','9pt').css('color','red')
		else
			$('#C_notice_Write').submit();
	});
	
	
	$.ajax({
		type : 'GET',
		url : '/exhibition/customerService/C_notice_SearchList.do?pg='+encodeURI($('#pg').val())
		+'&keyword='+encodeURI($('#keyword').val()),
		dataType : 'json',
		success : function(data){
			
			if(data.totalA=='0'){
				$('<tr/>',{
					align: 'center'
				}).append($('<td/>',{
					colspan: '6',
					align : 'center',
					text : '검색된 결과가 없습니다.'
				})).appendTo($('#C_notice_SearchList'));  
				$('#C_notice_SearchPagingDiv').hide();
				
			}else if(data.tataA!='0'){
				$('#C_notice_SearchPagingDiv').show();
				$.each(data.list, function(index, item){
					var search = item.subject
					var k = search.match($('#keyword').val())
 				$('<tr/>').append($('<td/>',{
						align : 'center',
						style: 'width: 20%; height: 9%; text-align: center;',
						text : item.seq,
						id : 'seqA',
						
					})).append($('<td/>',{
						align : 'center',
						id : 'subjectA',
						style: 'width: 45%; height: 7%;text-align: center;',
						class : item.seq+"",
						href : 'javascript:void(0)',
						text : item.subject
					})).append($('<td/>',{
						align : 'center',
						style: 'width: 20%; height: 7%;text-align: center;',
						text : item.logtime,
						id : 'logtime'
					})).appendTo($('#C_notice_SearchList'));
				});
			}
			$('#C_notice_SearchPagingDiv').html(data.customerServicePaging.pagingHTML);
		}
	});
	
	// 공지사항 검색한 값 불러오기
	$('#C_notice_SearchBtn2').click(function(){
		location.href="/exhibition/customerService/C_notice_Search.do?pg=1&keyword="+$('#keyword1').val();
	});
	
	// 공지사항 리스트 제목 클릭시 내용 보여줌
	$('#C_notice_SearchList').on('click','#subjectA',function(){
		alert($('#keyword').val())
		var seq = $(this).prev().text();
		location.href='/exhibition/customerService/C_notice_View.do?seq='+seq+'&pg='+$('#pg').val()+'&keyword='+$('#keyword').val();
	});

});
