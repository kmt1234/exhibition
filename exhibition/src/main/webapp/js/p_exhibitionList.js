$(document).ready(function(){
	//일정-전시회일정-달력으로 보기
	$('#P_exhibitionCalendarBtn').click(function(){
		location.href="/exhibition/performance/P_exhibitionSchedule.do";
	});
	//이전 전시회
	$('#prevEvent').click(function(){
		location.href="/exhibition/performance/P_prev_exhibitionList.do";
	});
	//다음 전시회
	$('#nextEvent').click(function(){
		location.href="/exhibition/performance/P_next_exhibitionList.do";
	});
	//이번달 전시회
	$('#currEvent').click(function(){
		location.href="/exhibition/performance/P_exhibitionList.do";
	});
	
});