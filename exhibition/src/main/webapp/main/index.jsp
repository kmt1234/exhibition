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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
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
			<div id="mainCal" style="min-width:270; height: 200px "></div>
		</div>
		<!-- today -->
		<div style=" margin-left:20px; width:270px; height:200px;  display: inline-block; float: left;" >
			<!-- <img style="min-width:270; height: 200px " src='../img/B1.jpg'></img> -->
			<dl class="todays">
				<dt>Today's</dt>
				<dd id="today_list">
					<ul class="total_list" id="total_list">
						
					</ul>
					<a href="" class="more" title="Today's 더보기">more+</a>
				</dd>
			</dl>
		</div>
		<!-- 공지사항  -->
		<div style="margin-left:20px; width:270px; height:200px;  display: inline-block; float: left;" >
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
	
	
	
	$('#mainCal').datepicker({
		dateFormat : "yy/mm/dd",
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년',
	    onSelect: function (date) {
	    	alert(date);
	    	$.ajax({
	    		type : 'POST',
				url : '/exhibition/performance/searchAllList.do',
				data : {'date' : date},
				async: false,
				dataType: 'json',
				success : function(data) {
					alert(JSON.stringify(data));
					$.each(data.list, function(index, item){
						if(item.postSelect=='1') {
							
						} else if(item.postSelect=='2') {
							
						}
					});
				}
	    		
	    	});
	    }
	});
	  
	
});


</script>
  <script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script><!--달력-->
</body>
</html>
