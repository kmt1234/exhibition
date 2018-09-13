$(document).ready(function(){
	
	//일정-공연일정-달력으로 보기
	$('#calendar_play').click(function(){
		location.href="/exhibition/performance/P_performanceSchedule.do";
	});
	
	
	//예약하기 버튼
	$('.performance_bookBtn').click(function(){
		//시퀀스 번호 얻기 
		var seq = $(this).parent().parent().parent().prev().prev().prev().prev().prev().text();
		alert(seq);
		location.href="/exhibition/performance/performanceBook.do?seq="+seq;
	});
	
	
});