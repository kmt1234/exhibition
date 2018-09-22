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
});