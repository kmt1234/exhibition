$(document).ready(function(){
	
	//일정-전시회일정-달력으로 보기
	$('#calendar_exhibition').click(function(){
		location.href="/exhibition/performance/P_exhibitionSchedule.do";
	});
	
	//예약하기 
	$('.exhibitionBookBtn').click(function(){
		//시퀀스 번호 얻기 
		var seq = $(this).parent().parent().parent().prev().prev().prev().prev().prev().text();
		alert(seq);
		location.href="/exhibition/performance/exhibitionBook.do?seq="+seq;
	});
	
});