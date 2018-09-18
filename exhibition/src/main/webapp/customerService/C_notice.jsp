<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#subjectA:link {
	color: black;
	text-decoration: none;
}

#subjectA:visited {
	color: black;
	text-decoration: none;
}

#subjectA:hover {
	color: green;
	text-decoration: underline;
	font-weight: bold;
	cursor: pointer;
}

#subjectA:active {
	color: black;
	text-decoration: none;
}

#currentPaging {
	color: red;
	text-decoration: underline;
	cursor: pointer;
}

#paging {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>

</head>
<body>

	<!-- 타이틀 -->
	<h2 class="box-container"
		style="float: center; width: 100%; text-align: left;">
		공지 <span class="h-light">사항</span>
	</h2>

	<div style="width: 100%;" align="center">
		<table style="width: 100%; height: 40px;" align="center" border="1"
			bordercolor="#ec008c" cellpadding="2" frame="hsides" rules="rows"
			id="C_notice_List" class="ui striped table">
			<tr>
				<th
					style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">번호</th>
				<th
					style="width: 45%; height: 7%; padding-top: 10px; text-align: center;">제목</th>
				<th
					style="width: 35%; height: 7%; padding-top: 10px; text-align: center;">등록일</th>
			</tr>
		</table>
		<br>
		<div id="C_notice_PagingDiv" class="ui center pagination menu"></div>
		<input type="hidden" name="pg" id="pg" value="1"> <br>
		<br> <input type="hidden" id="subject" value="subject">
		<div class="ui input" style="width: 30%;">
			<input type="text" name="keyword" id="keyword" placeholder="검색어 입력" value="${keyword }">
		</div>
		<input type="button" class="middle ui button" value="검색"
			id="C_notice_SearchBtn"> <input type="button"
			class="middle ui button" id="C_notice_WriteBtn" value="관리자 작성">
</div>
<script src="../semantic/semantic.min.js"></script>
<script src="../js/C_notice_js.js?ver=1"></script>
<script type="text/javascript">
//공지사항 리스트 불러오기
$.ajax({
	 type : 'POST',
	url : '/exhibition/customerService/getNoticeList.do',
	data :  'pg=${pg}',
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
$('#C_notice_SearchBtn').click(function(event, str){
	
	if(str!='trigger') $('#pg').val(1);
	
	if($('#keyword').val()=='')
		alert("검색어를 입력하세요");
	else{
		$.ajax({
			type : 'POST',
			url : '/exhibition/customerService/C_notice_Search.do',
			data : {'pg':$('#pg').val(),
					'subject' : $('#subject').val(),
					'keyword':$('#keyword').val()},
			dataType : 'json',
			success : function(data){
				$('#C_notice_List tr:gt(0)').remove();
				if(data.totalA=='0'){
					$('<tr/>',{
						align: 'center'
					}).append($('<td/>',{
						colspan: '3',
						align : 'center',
						text : '검색된 결과가 없습니다.'
					})).appendTo($('#C_notice_List'));  
					$('#C_notice_PagingDiv').remove();
				}else if(data.tataA!='0'){
				
					$.each(data.list, function(index, item){
						$('<tr/>').append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.seq
						})).append($('<td/>',{
							id : 'subjectA',
							style: 'width: 45%; height: 7%;text-align: center;',
							href : 'javascript:void(0)',
							text : item.subject
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 7%;text-align: center;',
							text : item.logtime
						})).appendTo($('#C_notice_List'));     
					
					});
				}
							
				$('#C_notice_PagingDiv').html(data.customerServicePaging.pagingHTML);
			}
		
		});
	}
});

$('#C_notice_List').on('click','#subjectA',function(){
	var seq = $(this).prev().text();
	location.href="/exhibition/customerService/C_notice_View.do?seq="+seq+"&pg=${pg}";
});

function C_notice_Search(pg){
	$('#pg').val(pg);
	$('#C_notice_SearchBtn').trigger('click','trigger');
}

</script>
</body>
</html>