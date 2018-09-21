$(document).ready(function(){
/*HEADER 설명*/	
	/*회원가입 클릭시 2가지로 분류(개인&사업자)~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/	
	//회원가입 클릭 시,
//	if($('#codeName').val()=='3') {
//		$('#C_boardAdd').show();
//	} else {
//		$('#C_boardAdd').hide();
//	}
	
	
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
	$('#P_performanceForm').click(function(){
		location.href="/exhibition/performance/P_performanceForm.do";
	});
	//전체일정(달력&리스트로 분리 되어있음)
	$('#P_allSchedule').click(function(){
		location.href="/exhibition/performance/P_allSchedule.do";
	});
	//공연일정(달력&리스트로 분리 되어 있음)
	$('#P_performanceSchedule').click(function(){
		location.href="/exhibition/performance/P_performanceSchedule.do";
	});
	//박람회일정(달력&리스트로 분리 되어 있음)
	$('#P_exhibitionSchedule').click(function(){
		location.href="/exhibition/performance/P_exhibitionSchedule.do";
	});
	
	/*시설&임대정보(박랍회홀&공연홀로 분리 되어 있음)~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	//시설&임대에 관한 설명
	$('#R_rentalForm').click(function(){
		location.href="/exhibition/rental/R_rentalForm.do";
	});
	//박람회 홀에 대한 정보(부스에 관한 설명과 배치도(클릭시 부스금액 및 일정을 체크 할수 있는 페이지 생성))
	$('#R_exhibition').click(function(){
		location.href="/exhibition/rental/R_exhibition.do";
	});
	//공연장 위치에 대한 정보(공연장 클릭시 공연장에서 행해지는 공연의 일정 정보 뜸) 
	$('#R_performance').click(function(){//공연장 홀
		location.href="/exhibition/rental/R_performance.do";
	});
	//공연장 위치에 대한 정보(공연장 클릭시 공연장에서 행해지는 공연의 일정 정보 뜸) 
	$('#R_businessRoom').click(function(){//공연장 홀
		location.href="/exhibition/rental/R_businessRoom.do";
	});
	
	/*교통&숙박(교통&숙박으로 분리 되어 있음)~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	//교통&숙박시설에 관한 내용
	$('#T_allForm').click(function(){
		location.href="/exhibition/traffic/T_allForm.do";
	});
	$('#T_allFormS').click(function(){//전철이용
		location.href="/exhibition/traffic/T_allForm.do";
	});
	$('#T_hotelForm').click(function(){//숙박안내클릭
		location.href="/exhibition/traffic/T_hotelList.do";
	});

	/*고객센터(공지사항&고객의소리&자주묻는질마누&주요시설열락처 분리 되어 있음)~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	//고객센터 정보
	$('#C_customerServiceForm').click(function(){
		location.href="/exhibition/customerService/C_customerServiceForm.do";
	});
	//공지사항
	$('#C_notice').click(function(){
		location.href="/exhibition/customerService/C_notice.do";
	});
	//고객의소린
	$('#C_emailConfirm').click(function(){
		location.href="/exhibition/customerService/C_emailConfirm.do";
	});
	//자주묻는 질문
	$('#C_QnA').click(function(){
		location.href="/exhibition/customerService/C_QnA.do";
	});
	//주요시설 연락처
	$('#C_contactList').click(function(){
		location.href="/exhibition/customerService/C_contactList.do";
	});
	//마이페이지(개인정보)
	$('#C_mypage').click(function(){
		location.href="/exhibition/login/mypage.do";
	});
	//게시판 추가
	$('#C_boardAdd').click(function(){
		location.href="/exhibition/customerService/C_mainImageboardForm.do?postSelect=0";
	});
	//매출현황
	$('#C_salesExhibition').click(function(){
		location.href="/exhibition/customerService/C_salesExhibitionView.do";
	});
	//회원리스트
	$('#C_memberShib').click(function(){
		location.href="/exhibition/customerService/C_memberShib.do";
	});
	/*회사관련사항(소개&인사말&연혁??)~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	//회사의 전반적인 설명
	$('#I_infoForm').click(function(){
		location.href="/exhibition/introduction/I_companyIntroductionForm.do";
	});
	$('#I_companyIntroductionForm').click(function(){//회사소개
		location.href="/exhibition/introduction/I_companyIntroductionForm.do";
	});
	$('#I_CEOIntroductionForm').click(function(){//CEO인사말
		location.href="/exhibition/introduction/I_CEOIntroductionForm.do";
	});
/*BODY 설명*/	
	
});