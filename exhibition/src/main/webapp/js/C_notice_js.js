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
			$('#C_notice_Write').attr('action','/exhibition/customerService/C_notice_Write.do').submit();
	});
	
	//공지사항 내용보기에서 글수정 버튼 눌렀을때 수정하는 폼
	$('#C_notice_modifyBtn').click(function(){
		location.href="/exhibition/customerService/C_notice_Modify.do?seq="+$('#putSeq').val();
	});
	//공지사항 수정한내용을 데이터 베이스에 저장
	$('#C_notice_checkModifyBtn').click(function(){
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		
		if($('#subject').val()=='')
			$('#subjectDiv').text("제목을 입력하세요").css('font-size','9pt').css('color','red')
		else if($('#content').val()=='')
			$('#contentDiv').text("내용을 입력하세요").css('font-size','9pt').css('color','red')
		else{
			$.ajax({
				type : 'POST',
				url : '/exhibition/customerService/C_notice_checkModify.do',
				data : {'seq' : $('#seq').val() , 'subject' : $('#subject').val() , 'content' : $('#content').val() },
				success : function(data){
					location.href="/exhibition/customerService/C_notice.do";
				}
			});
		}
	});
	
	$('#C_notice_deleteBtn').click(function(){
		location.href="/exhibition/customerService/C_notice_Delete.do?seq="+$('#putSeq').val();
	});
	
	//공지사항 작성중 돌아가기(뒤로)
	$('#C_notice_WriteBack').on('click', function(){
		$('#pg').val(1);
		location.href="/exhibition/customerService/C_notice.do?pg="+$('#pg').val();
	});
	
	$('#C_notice_ListBtn').on('click', function(){
		alert($('#keyword').val())
		location.href="/exhibition/customerService/C_notice.do?pg="+$('#pg').val();
	});
	
	// 공지사항 리스트 불러오기
	$.ajax({
		type : 'POST',
		url : '/exhibition/customerService/getNoticeList.do',
		data : {'pg':$('#pg').val()},
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index, item){
				$('<tr/>').append($('<td/>',{
						align : 'center',
						style: 'width: 20%; height: 9%; text-align: center;',
						text : item.seq,
						id : 'seqA'
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
					})).appendTo($('#C_notice_List'));
				});
			$('#C_notice_PagingDiv').html(data.customerServicePaging.pagingHTML);
		}
	});
	
	// 공지사항 검색한 값 불러오기
	$('#C_notice_SearchBtn').click(function(){
		$('#pg').val(1);
		if($('#keyword').val()=='')
			alert("검색어를 입력하세요");
		else
			location.href="/exhibition/customerService/C_notice_Search.do?pg="+$('#pg').val()+"&keyword="+$('#keyword').val();
	});
	
	
	// 공지사항 리스트 제목 클릭시 내용 보여줌
	$('#C_notice_List').on('click','#subjectA',function(){
		var seq = $(this).prev().text();
		location.href='/exhibition/customerService/C_notice_View.do?seq='+seq+'&pg='+$('#pg').val()+'&keyword='+$('#keyword').val();
	});
	
});
$('.ui.compact.selection.dropdown').dropdown();
	
	
