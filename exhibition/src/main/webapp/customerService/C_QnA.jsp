<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#seqA{
	margin-left :100px;
}
#subjectA{
	margin-left:500px;
}


</style>
</head>
<body>
<div class="QnA top">
	<span id="seqA">번호</span>
	<span id="subjectA">제목</span>
</div>
<div id="C_QnA_List"></div>
<!-- <div>
	<select name="C_QnASearch" id="C_QnASearch">
		<option value="제목">제목
		<option value="내용">내용
	</select>
	<input type="text" width="100">
	<input type="button" value="검색" id="C_noticeSearch">
</div> -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
$(document).ready(function(){
	$.ajax({
		type : 'POST',
		url : '/exhibition/customerService/getQnAList.do',
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
	
	/* $('#C_QnA_List').on('click','#subjectA',function(){
		var seq = $(this).prev().text();
		location.href="/exhibition/customerService/C_QnAView.do?seq="+seq;
	}); */
});
</script>
<div>
	<a href="/exhibition/customerService/C_QnA_WriteForm.do">작성</a>
</div>
</body>
</html>