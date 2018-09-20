<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<style type="text/css">
#subjectA:hover{
	cursor: pointer;
	font-weight: bold;
}
#C_notice_MainList{
	font-weight: bold;
}
.subjectC {
	width             : 200px; 
	overflow: hidden;  
	white-space: nowrap;  
	text-overflow     : ellipsis;
}

</style>
</head>
<body>
<header>
<div style="margin-top: 20px; min-width:1170px; position: relative;   ">
	<jsp:include page="I_header.jsp"></jsp:include>
</div>
</header>

<!--메인화면  -->
<div >
<section>
	<div style="margin-top: 7px; min-width:1170px; position: relative;" class="ui container" >
		<jsp:include page="${display }"/>
	</div>
<!--메인화면 아래 부분(일정)  -->
	<div class="ui container" style="margin-top: 20px; min-width:1170px; height:200px;  ">
		<!-- 공연포스터 슬라이드?? -->
		<div style=" margin-left:15px; width:270px; height:200px;  display: inline-block; float: left;" >
			<img style="min-width:270; height: 200px " src='../img/B1.jpg'></img>
		</div>
		<!-- 달력  -->
		<div style=" margin-left:20px; width:270px; height:200px;  display: inline-block; float: left;" >
			<img style="min-width:270; height: 200px " src='../img/B1.jpg'></img>
		</div>
		<!-- today -->
		<div style=" margin-left:20px; width:270px; height:200px;  display: inline-block; float: left;" >
			<img style="min-width:270; height: 200px " src='../img/B1.jpg'></img>
		</div>
		<!-- 공지사항  -->
		<div style="overflow:auto; margin-left:20px; width:270px; height:200px;  display: inline-block; float: left;" >
			<div style="height : 50px; font-weight: bold; font-size: x-large;" >공지사항</div>
			<div id="C_notice_MainList" style="height : 170px;"></div>
		</div>
	</div>
</section>
</div>
<footer>
	<div class="ui container" style="margin-top: 20px; min-width:1170px; position: relative; ">
		<jsp:include page="../main/I_footer.jsp" ></jsp:include>
	</div>
</footer>
<script>
$(document).ready(function(){
	$.ajax({
		type : 'POST',
		url : '/exhibition/customerService/getNoticeMainList.do',
		data :  'pg=${pg}',
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index, item){
				$('<ul/>').append($('<p/>',{
					align : 'center',
					id : 'subjectA',
					style: ' width : 250px; height: 35px; margin-left : 20px; text-align: left;',
					class : 'subjectC',
					href : 'javascript:void(0)',
					text : item.subject
				})).append($('<input>',{
					type : 'hidden',
					text : item.seq
				})).appendTo($('#C_notice_MainList'));
			});
		}
	});
	
	$('#C_notice_MainList').on('click','#subjectA',function(){
		var seq = $(this).next().text();
		location.href="/exhibition/customerService/C_notice_View.do?seq="+seq+"&pg=${pg}";
	});
});


</script>
</body>
</html>
