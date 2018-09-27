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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
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
		<div style=" margin-left:15px; width:270px; height:200px;  display: inline-block; float: left;">
			<jsp:include page="../main/slide.jsp" ></jsp:include>
		</div>
		<!-- 달력  -->
		<div style=" margin-left:20px; width:270px; height:200px;  display: inline-block; float: left;" >
			<div id="mainCal" style="min-width:270; height: 200px "></div>
		</div>
		<!-- today -->
		<div style=" margin-left:20px; width:270px; height:200px;  display: inline-block; float: left; overflow: scroll;" >
			<!-- <img style="min-width:270; height: 200px " src='../img/B1.jpg'></img> -->
			<dl class="todays" id="todays">
				<dt>Today's</dt>
				<dd id="today_list">
					<ul class="total_list" id="total_list" style="list-style:none">
						
					</ul>
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
					$('#today_list ul li:gt(0)').remove();
					$.each(data.list, function(index, item){
						if(item.postSelect=='1') {
							$('<li/>',{
								class : 'ex_item',
							}).append($('<span/>',{
								html : '<img id="ex_img" width="20px" height="20px" src="../img/Ex.png">'+item.imageName+'</img>',
								style : 'display : block'
							})).append($('<span/>',{
								text : item.startDate.substring(0,10) + '-' + item.endDate.substring(0,10),
								style : 'display : block'
							})).append($('<span/>',{
								text : item.eventPlace,
								style : 'display : block'
							})).appendTo($('#total_list'));
							
							
						} else if(item.postSelect=='2') {
							$('<li/>',{
								class : 'co_item',
							}).append($('<span/>',{
								html : '<img  id="co_img" width="20px" height="20px" src="../img/Ev.png">'+item.imageName+'</img>',
								style : 'display : block'
							})).append($('<span/>',{
								class : 't-tit ellipsis',
								text : item.startDate.substring(0,10) + '-' + item.endDate.substring(0,10),
								style : 'display : block'
							})).append($('<span/>',{
								class : 't-tit ellipsis',
								text : item.eventPlace,
								style : 'display : block'
							})).appendTo($('#total_list'));
						}
					});
					
					
				}
	    		
	    	});
	    }
	});
	
	
	$('ul li span img').eq(i).css("visibility","hidden");
	for(var i = 0; i < $('li.ex_item').size(); i++) {
		$('li.ex_item').eq(i).css("visibility","hidden");
		
	}
	for(var i = 0; i < $('li.co_item').size(); i++) {
		$('li.co_item').eq(i).css("visibility","hidden");
	}
	
	
	setInterval(function () {
		if($('li.ex_item').size() > 1){moveExItems()}
		if($('li.co_item').size() > 1){moveCoItems()}
	}, 3000);
	


	function moveExItems() {
		
		var current_item = $('li.ex_item:visible');
		var next_item = current_item.next();
		if(next_item.attr('class') != 'ex_item') {
			next_item = $('li.ex_item').first();
		}
		next_item.fadeIn("slow");
		current_item.hide();
	}
	function moveCoItems() {
		
		var current_item = $('li.co_item:visible');
		var next_item = current_item.next();
		if(next_item.attr('class') != 'co_item') {
			next_item = $('li.co_item').first();
		}
		next_item.fadeIn("slow");
		current_item.hide();
	}
	
	$('.bxslider').bxSlider({
   	 	auto: true,
        speed: 500,
        pause: 4000,
        mode:'fade',
        autoControls: true,
        pager:true,
   });
	   
	
});
</script>
 <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script><!--달력-->
</body>
</html>
