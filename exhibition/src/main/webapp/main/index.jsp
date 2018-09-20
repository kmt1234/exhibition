<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
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
		<div style=" margin-left:15px; width:270px; height:200px;  display: inline-block; float: left;" >
			<img style="min-width:270; height: 200px " src='../img/B1.jpg'></img>
		</div>
		<div style=" margin-left:20px; width:270px; height:200px;  display: inline-block; float: left;" >
			<img style="min-width:270; height: 200px " src='../img/B1.jpg'></img>
		</div>
		<div style=" margin-left:20px; width:270px; height:200px;  display: inline-block; float: left;" >
			<img style="min-width:270; height: 200px " src='../img/B1.jpg'></img>
		</div>
		<!-- 공지사항  -->
		<div style="overflow:auto; margin-left:20px; width:270px; height:200px;  display: inline-block; float: left;" >
			<div id="C_notice_MainList" class="ui striped table"></div>
		</div>
	</div>
			<input type="hidden" name="pg" id="pg" value="1"> <br>
			<input type="hidden" name="seq" id="seq" value=""> <br>
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
		url : '/exhibition/customerService/getNoticeList.do',
		data :  'pg=${pg}',
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index, item){
				$('<tr/>').append($('<td/>',{
					align : 'center',
					id : 'subjectA',
					style: 'width: 260px; height: 20px; text-align: left;',
					class : item.seq+"",
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
		var seq = $(this).next().next().text();
		location.href="/exhibition/customerService/C_notice_View.do?seq="+seq+"&pg=${pg}";
	});
});

</script>
</body>
</html>
