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
<div class="QnA top" style="padding-top: 15px;">
	<table style="width: 100%; height: 40px; " align="center" border="1" bordercolor="#ec008c" cellpadding="2" frame="hsides" rules="rows" >
		<tr>
			<th style="width: 10%; height: 7%; text-align:center;" id="seqA" >번호</th>
			<th style="width: 40%; height: 7%; " id="subjectA">제목</th>
		</tr>
		<tr>
			<div id="C_QnA_List"></div>
		</tr>
	</table>
</div>


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