$(document).ready(function(){
	/*회원가입 클릭시 2가지로 분류(개인&사업자)~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/	
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
	/*로그인 클릭시 2가지로 분류(개인&사업자)~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
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
	/*일정정보(일정설명&전체일정&박람회일정&공연일정)~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	//일정에관한 설명
	$('#P_infoForm').click(function(){
		location.href="/exhibition/performance/P_infoForm.do";
	});
	//전체일정(달력&리스트로 분리 되어있음)
	$('#P_allScheduleForm').click(function(){
		location.href="/exhibition/performance/P_allScheduleForm.do";
	});
	//공연일정(달력&리스트로 분리 되어 있음)
	$('#P_performanceScheduleForm').click(function(){
		location.href="/exhibition/performance/P_performanceScheduleForm.do";
	});
	//박람회일정(달력&리스트로 분리 되어 있음)
	$('#P_exhibitionScheduleForm').click(function(){
		location.href="/exhibition/performance/P_exhibitionScheduleForm.do";
	});
	/*시설&임대정보(박랍회홀&공연홀로 분리 되어 있음)~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	//시설&임대에 관한 설명
	$('#R_infoForm').click(function(){
		location.href="/exhibition/rental/R_infoForm.do";
	});
	//박람회 홀에 대한 정보(부스에 관한 설명과 배치도(클릭시 부스금액 및 일정을 체크 할수 있는 페이지 생성))
	$('#R_exhibitionForm').click(function(){
		location.href="/exhibition/rental/R_exhibitionForm.do";
	});
	//공연장 위치에 대한 정보(공연장 클릭시 공연장에서 행해지는 공연의 일정 정보 뜸) 
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
	$('#T_allForm').click(function(){//전철이용
		location.href="/exhibition/traffic/T_allForm.do";
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