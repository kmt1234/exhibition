<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<form id="C_contactList_delete" method="post" action="C_contactList_Delete.do">
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	주요시설
	<span class="h-light">연락처</span>
</h2>
<div style="width: 100%;" align="center">
	<table style="width: 100%; height: 40px; " align="center" border="1" bordercolor="#ec008c" cellpadding="4" frame="hsides" rules="rows"
		id="C_contactList_List" class="ui striped table" >
			
			<tr>
				<c:if test="${code=='3' }">
					<th style="width: 2%; height: 7%; padding-top: 10px; text-align: center;">
						<input type="checkbox" id="checkAll">
				</th>
				</c:if>
				<th style="width: 18%; height: 7%; padding-top: 10px; text-align: center;">분류</th>
				<th style="width: 18%; height: 7%; padding-top: 10px; text-align: center;">기관 & 시설</th>
				<th style="width: 18%; height: 7%; padding-top: 10px; text-align: center;">명칭</th>
				<th style="width: 18%; height: 7%; padding-top: 10px; text-align: center;">담당자</th>
				<th style="width: 18%; height: 7%; padding-top: 10px; text-align: center;">연락처</th>
			</tr>
	</table>
	<br>
	<div id="C_contactList_PagingDiv" class="ui center pagination menu"></div>
	<input type="hidden" name="pg" id="pg" value="1">
	<br><br>
	<select class="ui compact selection dropdown" id="searchOption">
			<option value="facility">기관&시설</option>
			<option value="name">담당자</option>
	</select>

	<div class="ui input" style="width: 40%;">
		<input type="text" name="keyword" id="keyword" value="${keyword }">
	</div>
		<input type="button" class="middle ui button"  value="검색" id="C_contactList_SearchBtn">
		<c:if test="${code=='3' }"> 
			<input type="button" class="middle ui button" id="C_contactList_WriteBtn" value="관리자 작성" >
			<input type="button" class="middle ui button" id="C_contactList_DeleteBtn" value="삭제" >
		</c:if>
</div>
</form>
<input type="hidden" id="hiddenCode" value="${code}">
<script src="../semantic/semantic.min.js"></script>
<script src="../js/C_contactList_js.js?ver=1"></script>
<script type="text/javascript">
$(document).ready(function(){
	var code = $('#hiddenCode').val();
	$.ajax({
			type : 'POST',
			url : '/exhibition/customerService/getContactList.do',
			data : 'pg=${pg}',
			dataType : 'json',
			success : function(data){
				
				$.each(data.list, function(index, item){	
					if(code!=3){
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
					}else if(code==3){
						$('<tr/>').append($('<td/>').append($('<input/>',{
							type : 'checkbox',
							value : item.seq,
							name : 'box',
							class : 'box'
						}))).append($('<td/>',{
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
					}
					
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
					if(data.totalA=='0'){
						$('<tr/>',{
							align: 'center'
						}).append($('<td/>',{
							colspan: '6',
							align : 'center',
							text : '검색된 결과가 없습니다.'
						})).appendTo($('#C_contactList_List'));  
						$('#C_contactList_PagingDiv').remove();
					}else if(data.tataA!='0'){
						$.each(data.list, function(index, item){
							if(code!=3){
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
							}else if(code==3){
								$('<tr/>').append($('<td/>').append($('<input/>',{
									type : 'checkbox',
									value : item.seq,
									name : 'box',
									class : 'box'
								}))).append($('<td/>',{
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
							}
						});
					}
					$('#C_contactList_PagingDiv').html(data.customerServicePaging.pagingHTML);
				}
			});
		}
	});
	
	
	//전체선택
	$('#checkAll').click(function(){
		if($('#checkAll').prop('checked')){
			//$('.box')[i].checked = true;
			$('.box').prop('checked',true);
		}else {
			//$('.box').prop('checked',false);
			$('.box').prop('checked',false);
		}
	});
	//선택 삭제
	$('#C_contactList_DeleteBtn').click(function(){
		var count = $('.box:checked').length;
		if(count==0) alert("항목을 선택하세요");
		else $('#C_contactList_delete').submit();
	}); 

});

function C_contactList_Search(pg){
	$('#pg').val(pg);
	$('#C_contactList_SearchBtn').trigger('click','trigger');
}
</script>
</body>
</html>