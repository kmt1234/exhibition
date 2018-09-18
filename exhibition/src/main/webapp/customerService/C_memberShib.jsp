<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
</head>
<body>
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	회원 
	<span class="h-light">사항</span>
</h2>
<div style="width: 100%; ">
	<!-- 맨위 메뉴 텝 -->
	<div class="">
		
		<a class="middle ui button" class="active item" id="C_memberList" style="margin-left:20px; width:150px; float: left;" >
			회원정보
	  	</a>
	  	<a class="middle ui button" class="item" id="C_companyList" style=" width:150px; float: left;">
	    	사업자정보
	 	</a>
	 </div>
</div>
<div  class="ui labeled" style="width: 700px; margin-left: 20px; margin-top: 60px;">
	<div  style="float: left; width: 870px;" >
		<div  style="float: left; width: 180px; display: inline-block;">이름(사업자명)</div>
		<div  style="float: left; width: 180px; display: inline-block;">아이디(사업자번호)</div>
		<div  style="float: left; width: 180px; display: inline-block;">이메일</div>
		<div  style="float: left; width: 180px; display: inline-block;">핸드폰(대표번호)</div>
		<div  style="float: left; width: 100px; display: inline-block;">비고</div>
		<div id="C_memberListFrom" style="margin-top: 35px;"></div>
	</div>

</div>
</body>
<script>
$(document).ready(function(){
	
	
	$('#C_memberList').click(function(){
		$('#C_memberListFrom').empty();
		$.ajax({
			type : 'GET',
			url : '/exhibition/customerService/getMemberList.do',
			dataType : 'json',
			success : function(data){
				$.each(data.list,function(index, item){
				 	$('<div/>',{
				 		id : 'memberInput'
				 	}).append($('<div/>',{
				 		class : "ui input",
				 		style : 'width:180px; display:inline-block; float: left;',
				 	}).append($('<input/>',{
				 		type : 'text',
				 		name : 'M_Name',
				 		value : item.m_Name
				  	}))).append($('<div/>',{
				  		
				  		class : "ui input",
				 		style : 'width:180px; display:inline-block; float: left;',
				 	}).append($('<input/>',{
				 		type : 'text',
				 		name : 'M_ID',
				 		value : item.m_Id	
				 	}))).append($('<div/>',{
				 		
				 		class : "ui input",
				 		style : 'width:180px; display:inline-block; float: left;',
				 	}).append($('<input/>',{
				 		type : 'text',
				 		name : 'M_Email',
				 		value : item.m_Email	
				 	}))).append($('<div/>',{
				 		
				 		class : "ui input",
				 		style : 'width:180px; display:inline-block; float: left;',
				 	}).append($('<input/>',{
				 		type : 'text',
				 		name : 'M_Email',
				 		value : item.m_Phone	
				 	}))).append($('<div/>',{
				 		
				 		class : "ui input",
				 		style : 'width:100px; display:inline-block; float: left;',
				 	}).append($('<input/>',{
				 		type : 'text',
				 		name : '',
				 	}))).appendTo($('#C_memberListFrom'));
				});
			}
		});
	})
	$('#C_companyList').click(function(){
		$('#C_memberListFrom').empty();
		$.ajax({
			type : 'GET',
			url : '/exhibition/customerService/getCompanyList.do',
			dataType : 'json',
			success : function(data){
				$.each(data.list,function(index, item){
					$('<div/>').append($('<div/>',{
				 		class : "ui input",
				 		style : 'width:170px; display:inline-block; ',
				 	}).append($('<input/>',{
				 		type : 'text',
				 		name : 'M_Name',
				 		value : item.c_businessname
				  	}))).append($('<div/>',{
				  		class : "ui input",
				 		style : 'width:170px; display:inline-block;',
				 	}).append($('<input/>',{
				 		type : 'text',
				 		name : 'M_ID',
				 		value : item.c_license	
				 	}))).append($('<div/>',{
				 		class : "ui input",
				 		style : 'width:170px; display:inline-block;',
				 	}).append($('<input/>',{
				 		type : 'text',
				 		name : 'M_Email',
				 		value : item.c_email
				 	}))).append($('<div/>',{
				 		class : "ui input",
				 		style : 'width:170px; display:inline-block;',
				 	}).append($('<input/>',{
				 		type : 'text',
				 		name : 'M_Email',
				 		value : item.c_tel
				 	}))).append($('<div/>',{
				 		class : "ui input",
				 		style : 'width:170px; display:inline-block;',
				 	}).append($('<input/>',{
				 		type : 'text',
				 		name : '',
				 	}))).appendTo($('#C_memberListFrom'));
				});
			}
		});
	});
});

</script>
</html>