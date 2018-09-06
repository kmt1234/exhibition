<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
<div style="width: 100%;" align="center">
	<table style="width: 100%; height: 40px; " align="center" border="1" bordercolor="#ec008c" cellpadding="2" frame="hsides" rules="rows" >
		<tr>
			<th style="width: 20%; height: 7%; padding-top: 10px;">번호</th>
			<th style="width: 45%; height: 7%; padding-top: 10px;">제목</th>
			<th style="width: 35%; height: 7%; padding-top: 10px;">등록일</th>
		</tr>
	</table >
	
	
	<table id="C_notice_List" border="1" cellpadding="3" frame="hsides" rules="rows" style="width: 100%;" align="center">
	</table>
	<br><br>
	
	<div style="width: 100%; align="center">
	<select name="C_notice_SearchMenu" id="C_notice_SearchMenu" style="width: 10%;height: 34px; " >
		<option value="제목">제목
		<option value="내용">내용
	</select>
	 <input type="text" style="width: 45%; height: 34px;">
	 <input type="button" value="검색" id="C_noticeSearch" style="width: 8%; height: 34px;">
	  <a href="/exhibition/customerService/C_notice_WriteForm.do"  style="width: 8%; height: 34px;" type="button">작성</a>
	</div>
</div>

	




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
						style: 'width: 20%; height: 9%;',
						text : item.seq,
						id : 'seqA'
					})).append($('<td/>',{
						align : 'center',
						id : 'subjectA',
						class : item.seq+"",
						href : 'javascript:void(0)',
						text : item.subject
					})).append($('<td/>',{
						align : 'center',
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
});
</script>

</body>
</html>