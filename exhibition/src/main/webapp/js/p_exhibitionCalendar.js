$(document).ready(function(){
	
	//일정-전시회일정-리스트로 보기
	$('#list_exhibition').click(function(){
		location.href="/exhibition/performance/P_exhibitionList.do";
	});
	//전체일정-리스트로 보기
	$('#P_allLsintBtn').click(function(){
		location.href="/exhibition/performance/P_allScheduleList.do";
	});
	
	//전체일정-달력으로 보기
	$('#P_allCalendarBtn').click(function(){
		location.href="/exhibition/performance/P_allSchedule.do";
	});
	
	//전체일정-달력으로 보기 이번달
	$('#P_allLsintBtn_Now').click(function(){
		location.href="/exhibition/performance/P_allScheduleList.do";
	});
	
	//전체일정-달력으로 보기 3개월 이전
	$('#P_allLsintBtn_Prev').click(function(){
		location.href="/exhibition/performance/P_allScheduleList_Prev.do";
	});
	
	//전체일정-달력으로 보기 3개월 이후
	$('#P_allLsintBtn_After').click(function(){
		location.href="/exhibition/performance/P_allScheduleList_After.do";
	});
});