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
#subjectA{
	width: 215px;
   overflow: hidden;
   white-space: nowrap;
   text-overflow: ellipsis;
}
.calSubject {
	width: 215px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
</style>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
</head>
<body>
<header>
	<div class="main_header">
		<jsp:include page="I_header.jsp"/>
	</div>
</header>
<!--메인화면  -->
<section>
	<div class="ui container main_section">
		<jsp:include page="${display}"/>
	</div>
<!--메인화면 아래 부분(일정)  -->
	<div class="ui container main_section1">
		<!-- 공연포스터 슬라이드?? -->
		<div class="main_section2" >
			<jsp:include page="../main/slide.jsp" />
		</div>
		<!-- 달력&일정 -->
		<div class="main_section2" style="width:540px;  " ><!--index.js참조-->
			<!-- 달력  -->
			<div class="main_section3" id="mainCal" style="margin-top: 15px;" ></div>
			<!-- today -->
			<dl class="todays main_section3" id="todays">
				<dt style="margin-left: 20px; font-size: 13pt">Today's <a href="/exhibition/performance/P_allSchedule.do" style="padding-left: 100px;" class="more" title="Today's 더보기">more+</a></dt>
				<dd id="today_list" >
					<ul class="total_list" id="total_list" style="list-style:none;">
					</ul>
				</dd>
			</dl>
		</div>
		<!-- 공지사항  -->
		<div class="main_section2">
			<div style="height : 50px; padding:10px;  font-size: 13pt;" >공지사항<a href="/exhibition/customerService/C_notice.do" style="padding-left: 110px;">more+</a></div>
			<div id="C_notice_MainList" style="height : 220px;  "></div><!--index.js참조-->
		</div>
	</div>
</section>
<footer>
	<div class="ui container main_footer" >
		<jsp:include page="../main/I_footer.jsp"/>
	</div>
</footer>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script><!-- 달력  -->
<script>
$(document).ready(function(){
	//일정 달력 만들어주기
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
	    	$.ajax({
	    		type : 'POST',
				url : '/exhibition/performance/searchAllList.do',
				data : {'date' : date},
				async: false,
				dataType: 'json',
				success : function(data) {
					$('#today_list ul li').remove();
					$.each(data.list, function(index, item){
						if(item.postSelect=='1') {
							if(item.start==1) {
								$('<li/>',{
									class : 'ex_item',
									html : '<br>'
								}).append($('<span/>',{
									class : 'calSubject',
									style : 'width = 220px',
									html : '<img id="ex_img" width="20px" height="20px" src="../img/Ex.png">'+item.imageName+'</img>',
									style : 'display : block'
								})).append($('<span/>',{
									text : item.startDate.substring(0,10) + ' ~ ' + item.endDate.substring(0,10),
									style : 'display : block'
								})).append($('<span/>',{
									text : item.eventPlace,
									style : 'display : block'
								})).appendTo($('#total_list'));
							} else if(item.start==10) {
								$('<li/>',{
									class : 'ex_item',
									html : '<br>'
								}).append($('<span/>',{
									style : 'width = 220px',
									html : '<img  id="ex_img" width="20px" height="20px" src="../img/Ex.png">'+'일정이 없습니다.'+'</img>',
									style : 'display : block'
								})).appendTo($('#total_list'));
							} else {
								$('<li/>',{
									style: 'display: none',
									class : 'ex_item',
									html : '<br>'
								}).append($('<span/>',{
									class : 'calSubject',
									style : 'width = 220px',
									html : '<img id="ex_img" width="20px" height="20px" src="../img/Ex.png">'+item.imageName+'</img>',
									style : 'display : block'
								})).append($('<span/>',{
									text : item.startDate.substring(0,10) + ' ~ ' + item.endDate.substring(0,10),
									style : 'display : block'
								})).append($('<span/>',{
									text : item.eventPlace,
									style : 'display : block'
								})).appendTo($('#total_list'));
							}
						} else if(item.postSelect=='2') {
							if(item.start==2) {
								$('<li/>',{
									class : 'co_item',
									html : '<br>'
								}).append($('<span/>',{
									class : 'calSubject',
									html : '<img  id="co_img" width="20px" height="20px" src="../img/Ev.png">'+item.imageName+'</img>',
									style : 'display : block'
								})).append($('<span/>',{
									class : 't-tit ellipsis',
									text : item.startDate.substring(0,10) + ' ~ ' + item.endDate.substring(0,10),
									style : 'display : block'
								})).append($('<span/>',{
									class : 't-tit ellipsis',
									text : item.eventPlace,
									style : 'display : block'
								})).appendTo($('#total_list'));
							} else if(item.start==10) {
								$('<li/>',{
									class : 'co_item',
									html : '<br>'
								}).append($('<span/>',{
									style : 'width = 220px',
									html : '<img id="co_img" width="20px" height="20px" src="../img/Ev.png">'+'일정이 없습니다.'+'</img>',
									style : 'display : block'
								})).appendTo($('#total_list'));
							} else {
								$('<li/>',{
									style: 'display: none',
									class : 'co_item',
									html : '<br>'
								}).append($('<span/>',{
									class : 'calSubject',
									html : '<img  id="co_img" width="20px" height="20px" src="../img/Ev.png">'+item.imageName+'</img>',
									style : 'display : block'
								})).append($('<span/>',{
									class : 't-tit ellipsis',
									text : item.startDate.substring(0,10) + ' ~ ' + item.endDate.substring(0,10),
									style : 'display : block'
								})).append($('<span/>',{
									class : 't-tit ellipsis',
									text : item.eventPlace,
									style : 'display : block'
								})).appendTo($('#total_list'));
							}
							
						}

					});
				}
	    		
	    	});
	    }
	});
});
</script>
</body>
</html>
