<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style="width: 100%;">
	<div class="ui compact selection dropdown">
		<i class="dropdown icon"></i>
		<div class="text">선택하세요</div>
		<div class="menu">
			<div class="item">번호</div>
			<div class="item">제목</div>
		</div>
	</div>
	
	<div class="ui input" style="width: 40%;">
		<input type="text" id="keyword">
	</div>
	<input class="middle ui button" type="button" value="검색" id="C_contactList_Search">
</div>

<div align="left" style="padding-left: 170px; padding-top: 15px;">
	<input class="middle ui button" type="button" id="C_contactList_checkWrite" value="관리자 작성">
	<!-- 	<a href="/exhibition/customerService/C_contactList_WriteForm.do">작성</a> -->
</div>

<div>
<script>
$(document).ready(function(){
	$.ajax({
		type : 'POST',
		url : '/exhibition/customerService/getContactList.do',
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index, item){
				$('<div/>').append($('<span/>',{
					align : 'center',
					text : item.seq,
					id : 'seqA'
				})).append($('<a/>',{
					align : 'center',
						id : 'subjectA',
						class : item.seq+"",
						href : 'javascript:void(0)',
						text : item.subject
				})).appendTo($('#C_QnA_List'));
			});
		}
	});
	$('.ui.compact.selection.dropdown').dropdown();	
});
</script>

</div>
<script src="../js/customerService.js?ver=1"></script>
</body>
</html>