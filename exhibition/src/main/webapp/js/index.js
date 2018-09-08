$(document).ready(function(){
		
	//회원가입 클릭 시,
	$('#M_member').click(function(){
		$('.ui.member1.dropdown').dropdown('show');
	});
	
	//개인 회원가입 클릭 시,
	$('#M_individual').click(function(){
		$('.ui.modal1.modal').modal('show');
	});
	
	//법인 회원가입 클릭 시,
	$('#C_company').click(function(){
		$('.ui.modal2.modal').modal('show');
	});
	
	//로그인 클릭 시,
	$('#L_login').click(function(){
		$('.ui.member2.dropdown').dropdown('show');
	});
	
	//개인회원 로그인 클릭 시,
	$('#M_individual_L').click(function(){
		$('.ui.modal-Login-Member.modal').modal('show');
	});
	
	//법인회원 로그인 클릭 시,
	$('#C_company_L').click(function(){
		$('.ui.modal-Login-Company.modal').modal('show');
	});
	//일정
	$('#P_infoForm').click(function(){//일정정보
		location.href="/exhibition/performance/P_infoForm.do";
	});
	$('#P_allScheduleForm').click(function(){//전체일정
		location.href="/exhibition/performance/P_allScheduleForm.do";
	});
	$('#P_performanceScheduleForm').click(function(){//공연일정
		location.href="/exhibition/performance/P_performanceScheduleForm.do";
	});
	$('#P_exhibitionScheduleForm').click(function(){//전시회일정
		location.href="/exhibition/performance/P_exhibitionScheduleForm.do";
	});
	//시설/임대
	$('#R_infoForm').click(function(){//일정정보
		location.href="/exhibition/rental/R_infoForm.do";
	});
	$('#R_exhibitionForm').click(function(){//전시회 홀
		location.href="/exhibition/rental/R_exhibitionForm.do";
	});
	$('#R_consertForm').click(function(){//공연장 홀
		location.href="/exhibition/rental/R_consertForm.do";
	});
	//교통/숙박/관광
	$('#T_infoForm').click(function(){//교통정보
		location.href="/exhibition/traffic/T_infoForm.do";
	});
	
	$('#T_carForm').click(function(){//자동차이용
		location.href="/exhibition/traffic/T_carForm.do";
	});
	$('#T_busForm').click(function(){//버스이용
		location.href="/exhibition/traffic/T_busForm.do";
	});
	$('#T_subwayForm').click(function(){//전철이용
		location.href="/exhibition/traffic/T_subwayForm.do";
	});
//고객센터
	
	//공지사항
	$('#C_infoForm').click(function(){
		location.href="/exhibition/customerService/C_infoForm.do";
	});
	
	$('#C_noticeForm').click(function(){
		location.href="/exhibition/customerService/C_noticeForm.do";
	});
	//고객의소리
	$('#C_emailConfirmForm').click(function(){
		location.href="/exhibition/customerService/C_emailConfirmForm.do";
	});
	//자주묻는 질문
	$('#C_QnAForm').click(function(){
		location.href="/exhibition/customerService/C_QnAForm.do";
	});
	//주요시설 연락처
	$('#C_contactListForm').click(function(){
		location.href="/exhibition/customerService/C_contactListForm.do";
	});
	$('#C_boardAdd').click(function(){
		location.href="/exhibition/customerService/C_mainImageboardForm.do";
	});
	
	
	
	
	//소개
	$('#I_infoForm').click(function(){//소개정보
		location.href="/exhibition/introduction/I_infoForm.do";
	});
	
	$('#I_companyIntroductionForm').click(function(){//회사소개
		location.href="/exhibition/introduction/I_companyIntroductionForm.do";
	});
	$('#I_CEOIntroductionForm').click(function(){//CEO인사말
		location.href="/exhibition/introduction/I_CEOIntroductionForm.do";
	});
	
	$('#I_companyIntroductionForm').click(function(){//회사소개
		location.href="/exhibition/introduction/I_companyIntroductionForm.do";
	});
	$('#I_CEOIntroductionForm').click(function(){//CEO인사말
		location.href="/exhibition/introduction/I_CEOIntroductionForm.do";
	});
	//싸이트맵
	$('#site_map').click(function(){
		  window.open('/exhibition/main/map.jsp',"","width=900px, height=600px");
		
	});
});