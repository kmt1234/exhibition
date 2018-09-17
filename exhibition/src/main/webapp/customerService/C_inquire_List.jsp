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
	문의
	<span class="h-light">하기</span>
</h2>

<div style="width: 100%;" align="center">
	<table style="width: 100%; height: 40px; " align="center" border="1" bordercolor="#ec008c" cellpadding="4" frame="hsides" rules="rows"
	id="C_inquire_List" class="ui striped table" >
		<tr>
			<th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">번호</th>
			<th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">제목</th>
			<th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">작성자</th>
			<th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">이메일</th>
			<th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">등록일</th>
		</tr>
	</table>
	<br>
	<div id="C_inquire_PagingDiv" class="ui center pagination menu"></div>
	<input type="hidden" name="pg" id="pg" value="1">
	<br><br>
	<select name="searchOption" id="searchOption"  class="ui compact selection dropdown" style="height: auto; ">
		<option value="subject" selected>제목</option>
		<option value="name">작성자</option>
	</select>
		
	<div class="ui input" style="width: 50%;">
		<input type="text" name="keyword" id="keyword" value="${keyword }">
	</div>
		 <input type="button" class="middle ui button"  value="검색" id="C_inquire_SearchBtn">
</div>
<script src="../semantic/semantic.min.js"></script>
<script src="../js/C_inquire_js.js?ver=1"></script>
<script type="text/javascript">
$.ajax({
	type : 'POST',
	url : '/exhibition/customerService/getInquireList.do',
	data :  'pg=${pg}',
	dataType : 'json',
	success : function(data){
		$.each(data.list, function(index, item){
			var head = "";
			for(var i=0; i<item.lev; i++) {
				head += '&emsp;';
			}
			if(item.pseq!=0)
				head += '<img src="../img/reply.gif">';
				
				
			$('<tr/>').append($('<td/>',{
				align : 'center',
				style: 'width: 20%; height: 9%; text-align: center;',
				text : item.seq,
				id : 'seqA'
			})).append($('<td/>',{
				align : 'center',
				id : 'subjectA',
				style: 'width: 20%; height: 9%; text-align: center;',
				class : item.seq+"",
				href : 'javascript:void(0)',
				text : item.subject
			})).append($('<td/>',{
				align : 'center',
				style: 'width: 20%; height: 9%; text-align: center;',
				text : item.name,
				id : 'nameA'
			})).append($('<td/>',{
				align : 'center',
				style: 'width: 20%; height: 9%; text-align: center;',
				text : item.email,
				id : 'emailA'
			})).append($('<td/>',{
				align : 'center',
				style: 'width: 20%; height: 9%; text-align: center;',
				text : item.logtime,
				id : 'logtime'
			})).appendTo($('#C_inquire_List'));
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
				
				$.each(data.list, function(index, item){
					$('<tr/>').append($('<td/>',{
						align : 'center',
						style: 'width: 20%; height: 9%; text-align: center;',
						text : item.seq,
						id : 'seqA'
					})).append($('<td/>',{
						align : 'center',
						id : 'subjectA',
						style: 'width: 20%; height: 9%; text-align: center;',
						href : 'javascript:void(0)',
						text : item.subject
					})).append($('<td/>',{
						align : 'center',
						style: 'width: 20%; height: 9%; text-align: center;',
						text : item.name,
						id : 'nameA'
					})).append($('<td/>',{
						align : 'center',
						style: 'width: 20%; height: 9%; text-align: center;',
						text : item.email,
						id : 'emailA'
					})).append($('<td/>',{
						align : 'center',
						style: 'width: 20%; height: 9%; text-align: center;',
						text : item.logtime,
						id : 'logtime'
					})).appendTo($('#C_inquire_List'));
				});
				$('#C_inquire_PagingDiv').html(data.customerServicePaging.pagingHTML);
			}
		});
	}
});

$('#C_inquire_List').on('click','#subjectA',function(){
	var seq = $(this).prev().text();
	location.href="/exhibition/customerService/C_inquire_View.do?seq="+seq+"&pg=${pg}";
});

function C_inquire_Search(pg){
	$('#pg').val(pg);
	$('#C_inquire_SearchBtn').trigger('click','trigger');
}
</script>
</body>
</html>