<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#subjectA:link{color:black; text-decoration: none;}
#subjectA:visited{color:black; text-decoration: none;}
#subjectA:hover{color:green; text-decoration: underline; font-weight: bold; cursor: pointer;}
#subjectA:active{color:black; text-decoration: none;}

#currentPaging{
	color: red;
	text-decoration: underline;
	cursor: pointer;
}

#paging{
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	고객의
	<span class="h-light">소리</span>
</h2>
<div style="width: 100%;" align="center">
	<table style="height: 40px; " align="center" border="1" bordercolor="#ec008c" cellpadding="4"  rules="rows"
	id="C_inquire_List" class="ui striped table" >
		<tr>
			<td style="width: 50px;  padding-top: 10px; text-align: center;">번호</td>
			<td style="width: 50px;  padding-top: 10px; text-align: center;"></td>
			<td style="width: 250px;  padding-top: 10px; text-align: center;">제목</td>
			<td style="width: 100px;  padding-top: 10px; text-align: center;">작성자</td>
			<td style="width: 150px;  padding-top: 10px; text-align: center;">이메일</td>
			<td style="width: 100px;  padding-top: 10px; text-align: center;">등록일</td>
		</tr>
	</table>
	<br>
	<div id="C_inquire_PagingDiv" class="ui center pagination menu"></div>
	<input type="hidden" name="pg" id="pg" value="1">
	<br><br>
	<select name="searchOption" id="searchOption"  class="ui selection dropdown" style="width:100px">
		<option value="subject" style="width:100px">제목</option>
		<option value="name">작성자</option>
	</select>
	&nbsp
	<div class="ui input" style="width: 50%;">
		<input type="text" name="keyword" id="keyword" value="${keyword }">
	</div>
	&nbsp
		 <input type="button" class="middle ui button"  value="검색" id="C_inquire_SearchBtn">
</div>
<script src="../semantic/semantic.min.js"></script>
<script src="../js/C_inquire_js.js?ver=1"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type : 'POST',
		url : '/exhibition/customerService/getInquireList.do',
		data :  'pg=${pg}',
		dataType : 'json',
		success : function(data){
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
				})).appendTo($('#C_inquire_List'));
				
				
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
			
			$('#C_inquire_PagingDiv').html(data.customerServicePaging.pagingHTML);
		}
	});
	
	
	
	//고객의소리 리스트 검색한 값 불러오기
	$('#C_inquire_SearchBtn').click(function(event, str){
		
		if(str!='trigger') $('#pg').val(1);
		
		if($('#keyword').val()=='')
			alert("검색어를 입력하세요");
		else{
			$.ajax({
				type : 'POST',
				url : '/exhibition/customerService/C_inquire_Search.do',
				data : {'pg':$('#pg').val(),
						'searchOption':$('#searchOption').val(),
						'keyword':$('#keyword').val()},
				dataType : 'json',
				success : function(data){
					$('#C_inquire_List tr:gt(0)').remove();
					if(data.totalA=='0'){
						$('<tr/>',{
							align: 'center'
						}).append($('<td/>',{
							colspan: '6',
							align : 'center',
							text : '검색된 결과가 없습니다.'
						})).appendTo($('#C_inquire_List'));  
						$('#C_inquire_PagingDiv').remove();
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
							})).appendTo($('#C_inquire_List'));
						
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
					$('#C_inquire_PagingDiv').html(data.customerServicePaging.pagingHTML);
				}
			});
		}
	});
	$('.ui.selection.dropdown').dropdown();	
	
	$('#C_inquire_List').on('click','#subjectA',function(){
		var seq = $(this).prev().prev().text();
		location.href="/exhibition/customerService/C_inquire_View.do?seq="+seq+"&pg=${pg}";
	});
	
	function C_inquire_Search(pg){
		$('#pg').val(pg);
		$('#C_inquire_SearchBtn').trigger('click','trigger');
	}
});
</script>
</body>
</html>