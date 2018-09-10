<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

</style>
</head>
<body>

	<!-- 타이틀 -->
	<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
		공지
		<span class="h-light">사항</span>
	</h2>

<div style="width: 100%;" align="center">
	<table style="width: 100%; height: 40px; " align="center" border="1" bordercolor="#ec008c" cellpadding="2" frame="hsides" rules="rows"
	id="C_notice_List" class="ui striped table" >
		<tr>
			<th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">번호</th>
			<th style="width: 45%; height: 7%; padding-top: 10px; text-align: center;">제목</th>
			<th style="width: 35%; height: 7%; padding-top: 10px; text-align: center;">등록일</th>
		</tr>
	</table>
	<br><br>
	
	<div style="width: 100%;">
		<div class="ui compact selection dropdown">
			<i class="dropdown icon"></i>
			<div class="text">선택하세요</div>
			<div class="menu">
				<div class="item">목록</div>
				<div class="item">내용</div>
			</div>
		</div>
		
		<div class="ui input" style="width: 40%;">
		 <input type="text" >
		</div>
		
		 <input class="middle ui button" type="button" value="검색" id="C_noticeSearch">
		 <input class="middle ui button" href="/exhibition/customerService/C_notice_WriteForm.do" value="작성" type="button">
	</div>
</div>

<script src="../semantic/semantic.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
$(document).ready(function(){
	$.ajax({
		 type : 'POST',
		url : '/exhibition/customerService/getNoticeList.do',
		dataType : 'json',
	
		success : function(data){
			$.each(data.list, function(index, item){
				$('<tr/>').append($('<td/>',{
						align : 'center',
						/* text-decoration : underline, */
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
		}
	});
	$('#C_notice_List').on('click','#subjectA',function(){
		var seq = $(this).prev().text();
		location.href="/exhibition/customerService/C_noticeView.do?seq="+seq;
	});
	$('.ui.compact.selection.dropdown').dropdown();	
});
</script>

</body>
</html>