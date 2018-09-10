<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<div class="QnA top">
		<span id="seqA">번호</span>
		<span id="subjectA">제목</span>
	</div>
</div>
<div>
	<div>
		<input type="text" id="keyword">
		<span id="C_contactList_Search">검색</span>
	</div>
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
});
</script>
	<a href="/exhibition/customerService/C_contactList_WriteForm.do">작성</a>
</div>
<script src="../js/customerService.js?ver=1"></script>
</body>
</html>