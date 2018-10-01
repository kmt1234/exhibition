$(document).ready(function(){
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
		location.href="/exhibition/customerService/C_notice.do";
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
	//마이페이지(개인정보)
	$('#memberList').click(function(){
		location.href="/exhibition/customerService/C_memberShib.do";
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
	
	// 메인화면에 공지사항 리스트 불러오기
	$.ajax({
		type : 'POST',
		url : '/exhibition/customerService/getNoticeMainList.do',
		data : {'pg':$('#pg').val()},
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
	
	// 메인화면 공지사항 리스트 제목 클릭시 내용 보여줌
	$('#C_notice_MainList').on('click','#subjectA',function(){
		var seq = $(this).next().text();
		location.href='/exhibition/customerService/C_notice_View.do?seq='+seq+'&pg='+$('#pg').val();
	});
	
	$('#index_searchBtn').click(function(){
		var index_keyword = $('#index_keyword').val();
		if($('#index_keyword').val()=='')
			alert("검색어를 입력하세요");
		else location.href='/exhibition/main/index_SearchForm.do?index_keyword='+index_keyword;
		
	});
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
	    	alert(date);
	    	$.ajax({
	    		type : 'POST',
				url : '/exhibition/performance/searchAllList.do',
				data : {'date' : date},
				async: false,
				dataType: 'json',
				success : function(data) {
					alert(JSON.stringify(data));
					$('#today_list ul li').remove();
					$.each(data.list, function(index, item){
						if(item.postSelect=='1') {
							if(item.start==1) {
								$('<li/>',{
									class : 'ex_item',
									html : '<br>'
								}).append($('<span/>',{
									style : 'width = 220px',
									html : '<img id="ex_img" width="20px" height="20px" src="../img/Ex.png">'+item.imageName+'</img>',
									style : 'display : block'
								})).append($('<span/>',{
									text : item.startDate.substring(0,10) + '-' + item.endDate.substring(0,10),
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
									html : '<img id="ex_img" width="20px" height="20px" src="../img/Ex.png">'+'일정이 없습니다.'+'</img>',
									style : 'display : block'
								})).appendTo($('#total_list'));
							} else {
								$('<li/>',{
									style: 'display: none',
									class : 'ex_item',
									html : '<br>'
								}).append($('<span/>',{
									style : 'width = 220px',
									html : '<img id="ex_img" width="20px" height="20px" src="../img/Ex.png">'+item.imageName+'</img>',
									style : 'display : block'
								})).append($('<span/>',{
									text : item.startDate.substring(0,10) + '-' + item.endDate.substring(0,10),
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
							
						}

					});
				}
	    		
	    	});
	    }
	});
	
	//달력에 내용 문자열로 보내주기
	var today = new Date();
	var todayDate =today.toISOString().substring(0,10);
	
	$.ajax({
		type : 'POST',
		url : '/exhibition/performance/searchAllList.do',
		data : {'date' : todayDate},
		async: false,
		dataType: 'json',
		success : function(data) {
			console.log(JSON.stringify(data));
			$('#today_list ul li').remove();
		
			$.each(data.list, function(index, item){
				
				
				if(item.postSelect=='1') {
					if(item.start==1) {
						$('<li/>',{
							class : 'ex_item',
							html : '<br>'
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
					} else if(item.start==10) {
						$('<li/>',{
							class : 'ex_item',
							html : '<br>'
						}).append($('<span/>',{
							style : 'width = 220px',
							html : '<img id="ex_img" width="20px" height="20px" src="../img/Ex.png">'+'일정이 없습니다.'+'</img><br><br>',
							style : 'display : block'
						})).appendTo($('#total_list'));
					} else {
						$('<li/>',{
							style: 'display: none',
							class : 'ex_item',
							html : '<br>'
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
					}
					
					
				} else if(item.postSelect=='2') {
					if(item.start==2) {
						$('<li/>',{
							class : 'co_item',
							html : '<br>'
						}).append($('<span/>',{
							html : '<img  id="co_img" width="20px" height="20px" src="../img/Ev.png">'+item.imageName+'</img>',
							style : 'display : block'
						})).append($('<span/>',{
							text : item.startDate.substring(0,10) + '-' + item.endDate.substring(0,10),
							style : 'display : block'
						})).append($('<span/>',{
							text : item.eventPlace,
							style : 'display : block'
						})).appendTo($('#total_list'));
					} else if(item.start==10) {
						$('<li/>',{
							class : 'co_item',
							html : '<br>'
						}).append($('<span/>',{
							style : 'width = 220px',
							html : '<img id="co_img" width="20px" height="20px" src="../img/Ev.png">'+'일정이 없습니다.'+'</img><br><br>',
							style : 'display : block'
						})).appendTo($('#total_list'));
					} else {
						$('<li/>',{
							style: 'display: none',
							class : 'co_item',
							html : '<br>'
						}).append($('<span/>',{
							html : '<img  id="co_img" width="20px" height="20px" src="../img/Ev.png">'+item.imageName+'</img>',
							style : 'display : block'
						})).append($('<span/>',{
							text : item.startDate.substring(0,10) + '-' + item.endDate.substring(0,10),
							style : 'display : block'
						})).append($('<span/>',{
							text : item.eventPlace,
							style : 'display : block'
						})).appendTo($('#total_list'));
					}
				}
				
			});
		}
	});
	
	setInterval(function () {
		if($('li.ex_item').length > 1){moveExItems()}
		if($('li.co_item').length > 1){moveCoItems()}
	}, 3000)
	
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