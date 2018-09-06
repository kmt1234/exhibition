<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#seqA{
	float :left;
	margin-left :30px;
}
#subjectA{
	float : left;
	margin-left:164px;
}
#nameA{
	float :left;
	margin-left :140px;
}
#emailA{
	float :left;
	margin-left :124px;
}
#logtime{
	margin-left : 125px;
}


</style>
</head>
<body>
<div class="inpuire top">
	<span id="seqA">번호</span>
	<span id="subjectA">제목</span>
	<span id="nameA">작성자</span>
	<span id="emailA">이메일</span>
	<span id="logtime">등록일</span>
</div>
<div id="C_inquire_ListDiv"></div>
<div>
	<select name="C_inquire_Search" id="C_inquire_Search">
		<option value="제목">제목
		<option value="내용">내용
	</select>
	<input type="text" width="100">
	<input type="button" value="검색" id="C_noticeSearch">
</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
$(document).ready(function(){
	$.ajax({
		type : 'POST',
		url : '/exhibition/customerService/getInquireList.do',
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
				})).append($('<span/>',{
					align : 'center',
					text : item.name,
					id : 'nameA'
				})).append($('<span/>',{
					align : 'center',
					text : item.email,
					id : 'emailA'
				})).append($('<span/>',{
					align : 'center',
					text : item.logtime,
					id : 'logtime'
				})).appendTo($('#C_inquire_ListDiv'));
			});
		}
	});
	
	$('#C_inquire_ListDiv').on('click','#subjectA',function(){
		var seq = $(this).prev().text();
		location.href="/exhibition/customerService/C_inqureView.do?seq="+seq+"emil="+email;
	});
});
</script>
<div>
	<a href="/exhibition/customerService/C_inquire_WriteForm.do">작성</a>
</div>
</body>
</html>