<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">

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
	주요시설
	<span class="h-light">연락처</span>
</h2>
<div style="width: 100%;" align="center">
	<table style="width: 100%; height: 40px; " align="center" border="1" bordercolor="#ec008c" cellpadding="4" frame="hsides" rules="rows"
		id="C_contactList_List" class="ui striped table" >
			<tr>
				<th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">분류</th>
				<th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">기관 & 시설</th>
				<th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">명칭</th>
				<th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">담당자</th>
				<th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">연락처</th>
			</tr>
	</table>
	<br>
	<div id="C_contactList_PagingDiv"></div>
	<input type="hidden" name="pg" id="pg" value="1">
	<br>
	<select class="ui compact selection dropdown" id="searchOption">
			<option value="facility">기관&시설</option>
			<option value="name">담당자</option>
	</select>

	<div class="ui input" style="width: 40%;">
		<input type="text" name="keyword" id="keyword" value="${keyword }">
	</div>
		<input type="button" class="middle ui button"  value="검색" id="C_contactList_SearchBtn">
		<input type="button" class="middle ui button" id="C_contactList_WriteBtn" value="관리자 작성" >
</div>
<script src="../semantic/semantic.min.js"></script>
<script src="../js/C_contactList_js.js?ver=1"></script>
<script>
$(document).ready(function(){
	$.ajax({
			type : 'POST',
			url : '/exhibition/customerService/getContactList.do',
			data : 'pg=${pg}',
			dataType : 'json',
			success : function(data){
				$.each(data.list, function(index, item){
					$('<tr/>').append($('<td/>',{
						align : 'center',
						style: 'width: 20%; height: 9%; text-align: center;',
						text : item.classify,
						id : 'classifyA'
					})).append($('<td/>',{
						align : 'center',
						style: 'width: 20%; height: 9%; text-align: center;',
						text : item.facility,
						id : 'facilityA'
					})).append($('<td/>',{
						align : 'center',
						style: 'width: 20%; height: 9%; text-align: center;',
						text : item.title,
						id : 'titleA'
					})).append($('<td/>',{
						align : 'center',
						style: 'width: 20%; height: 9%; text-align: center;',
						text : item.phone,
						id : 'phoneA'
					})).append($('<td/>',{
						align : 'center',
						style: 'width: 20%; height: 9%; text-align: center;',
						text : item.name,
						id : 'nameA'
					})).appendTo($('#C_contactList_List'));
				});
				$('#C_contactList_PagingDiv').html(data.customerServicePaging.pagingHTML);
			}
		});
	
	
	$('#C_contactList_SearchBtn').click(function(event, str){
		
		if(str!='trigger') $('#pg').val(1);
		
		if($('#keyword').val()=='')
			alert("검색어를 입력하세요");
		else{
			$.ajax({
				type : 'POST',
				url : '/exhibition/customerService/C_contactList_Search.do',
				data : {'pg':$('#pg').val(),
						'searchOption':$('#searchOption').val(),
						'keyword':$('#keyword').val()},
				dataType : 'json',
				success : function(data){
					$('#C_contactList_List tr:gt(0)').remove();
					
					$.each(data.list, function(index, item){
						$('<tr/>').append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.classify,
							id : 'classifyA'
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.facility,
							id : 'facilityA'
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.title,
							id : 'titleA'
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.name,
							id : 'nameA'
						})).append($('<td/>',{
							align : 'center',
							style: 'width: 20%; height: 9%; text-align: center;',
							text : item.phone,
							id : 'phoneA'
						})).appendTo($('#C_contactList_List'));
					});
					$('#C_contactList_PagingDiv').html(data.customerServicePaging.pagingHTML);
				}
			});
		}
	});
	
	function C_contactList_Search(pg){
		$('#pg').val(pg);
		$('#C_contactList_SearchBtn').trigger('click','trigger');
		alert("11111");
	}

});
</script>
</body>
</html>