$(document).ready(function(){
	var date = new Date();
    var year  = date.getFullYear();
    var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
    var day   = date.getDate();
    if (("" + month).length == 1) { month = "0" + month; }
    if (("" + day).length   == 1) { day   = "0" + day;   }
    
    

   var C_name = /^[가-힣]+$/;   //한글만 가능 
   var C_phone =  /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;   //휴대폰 번호 양식
   
   $('#C_notice_WriteBtn').click(function(){ 
      location.href="/exhibition/customerService/C_notice_WriteBtn.do";
   });
   
   
   //공지사항 - 작성하기
   $('#C_notice_checkWriteBtn').click(function(){ // 공지사항 - 등록버튼 클릭시
      $('#subjectDiv').empty();
      $('#contentDiv').empty();
      
      if($('#subject').val()=='')
         $('#subjectDiv').text("제목을 입력하세요").css('font-size','9pt').css('color','red')
      else if($('#content').val()=='')
         $('#contentDiv').text("내용을 입력하세요").css('font-size','9pt').css('color','red')
      else
         $('#C_notice_Write').submit();
   });
   
   //공지사항 내용보기에서 글수정 버튼 눌렀을때 수정하는 폼
   $('#C_notice_modifyBtn').click(function(){
      location.href="/exhibition/customerService/C_notice_Modify.do?seq="+$('#putSeq').val();
   });
   //공지사항 수정한내용을 데이터 베이스에 저장
   $('#C_notice_checkModifyBtn').click(function(){
      $('#C_notice_checkModify').submit();
   });
   
   $('#C_notice_deleteBtn').click(function(){
      location.href="/exhibition/customerService/C_notice_Delete.do?seq="+$('#putSeq').val();
   });
   //공지사항 - 공지사항뷰에서 목록보기
   $('#C_noticeListBtn').click(function(){
      location.href="/exhibition/customerService/C_notice.do";
   });

   //고객의 소리 - 이메일 인증 - 인증번호 전송 버튼 클릭시
   $('#C_emailSendBtn').click(function() {
      if($('#email').val()==''){
         $('#emailDiv').text("이메일을 입력하세요").css('font-size','9pt').css('color','red')
      } else {
         $.ajax({
         type : 'POST',
         url : '/exhibition/customerService/sendEmail.do',
         data : {'email':$('#email').val()},
         dataType: 'text',
         success : function(data){
            alert(data);
            $('#reC_EmailConfirm').val(data);
            alert('메일을 보냈습니다.')
         }
      });
      }
   });
   
   //인증 확인 버튼 클릭시
   $('#C_emailConfirmBtn').click(function() {      //인증 확인 버튼 클릭시
      var email = $('#email').val()
      if ($('#checkEmail').val()=='')
         $('#checkEmailDiv').text("인증번호를 입력하세요").css('font-size','9pt').css('color','red')
         else if ($('#reC_EmailConfirm').val()!=($('#checkEmail').val())) 
            $('#checkEmailDiv').text('인증번호가 틀렸습니다').css('font-size','9pt').css('color','red')
            else 
               location.href = '/exhibition/customerService/C_inquire.do?email='+email;
   });
   
   // 고객의 소리 - 문의하기 -  등록버튼 클릭시
   $('#C_checkInquireBtn').click(function(){
      $('#nameDiv').empty();
      $('#phoneDiv').empty();
      $('#subjectDiv').empty();
      $('#contentDiv').empty();
      if($('#name').val()=='')
         $('#nameDiv').text("이름을 입력하세요").css('font-size','9pt').css('color','red')
      else if(!C_name.test($('#name').val()))
         $('#nameDiv').text("이름은 한글만 가능합니다").css('font-size','9pt').css('color','red')
      else if($('#phone').val()=='')
         $('#phoneDiv').text("연락처를 입력하세요").css('font-size','9pt').css('color','red')
      else if(!C_phone.test($('#phone').val()))
         $('#phoneDiv').text("전화번호 형식이 맞지 않습니다").css('font-size','9pt').css('color','red')
      else if($('#subject').val()=='')
         $('#subjectDiv').text("제목을 입력하세요").css('font-size','9pt').css('color','red')
      else if($('#content').val()=='')
         $('#contentDiv').text("내용을 입력하세요").css('font-size','9pt').css('color','red')
      else
         $('#C_Inquire').submit();
   });

   //고객의 소리 - 관리자 버튼
   $('#C_email_ListBtn').click(function(){
      location.href="/exhibition/customerService/C_inquire_List.do";
   });
   
   //고객의 소리  - 답변하기 폼
   $('#C_inquire_replyBtn').click(function(){
      $('#C_inquire_writeReply').submit();
   });
   
   $('#C_checkReplyBtn').click(function(){
      if($('#subject').val()=='')
         $('#subjectDiv').text("제목을 입력하세요").css('font-size','9pt').css('color','red')
      else if($('#content').val()=='')
         $('#contentDiv').text("내용을 입력하세요").css('font-size','9pt').css('color','red')
      else
         $('#C_inquire_checkReply').submit();
   });
   
   //자주 묻는 질문 - 작성하기 폼
   $('#C_QnA_writeBtn').click(function(){
      location.href="/exhibition/customerService/C_QnA_Write.do";
   });
   
   
   //자주 묻는 질문 작성하기 등록버튼
   $('#C_QnA_checkWriteBtn').click(function(){
      var classify = $('#classify option:selected').val();
      alert(classify);
      $('#subjectDiv').empty();
      $('#contentDiv').empty();
      if($('#subject').val()=='')
         $('#subjectDiv').text("제목을 입력하세요").css('font-size','9pt').css('color','red')
      else if($('#content').val()=='')
         $('#contentDiv').text("내용을 입력하세요").css('font-size','9pt').css('color','red')
      else{
         $('#C_qty').val(classify);
         $('#C_QnA_checkWrite').submit();
      }   
   });
   
   //주요시설 연락처 - 작성하기 폼
   $('#C_contactList_WriteBtn').click(function(){
      location.href="/exhibition/customerService/C_contactList_Write.do";
   });
   
   $('#C_contactList_checkWriteBtn').click(function(){
      $('#C_contactList_checkWrite').submit();
   });
   
   
   //사업자 정보 불러오기
   $('#companySearchDiv').hide();
	$('#companyBtn').click(function(event,str){
		if(str!='trigger') $('#pg').val(1);
		$('#memberSearchDiv').hide();
		$('#companySearchDiv').show();
		$('#memberListTable').empty();
		
		$.ajax({
			type : 'POST',
			url : '/exhibition/customerService/getCompanyList.do',
			data : {'pg' : $('#pg').val()},
			dataType : 'json',
			success : function(data){
				/* $('#C_memberListFrom div:gt(0)').remove(); */
				$.each(data.list,function(index, item){
					$('<tr/>').append($('<td/>',{
				 		name : 'C_businessname',
				 		text : item.c_businessname
				 	})).append($('<td/>',{
				 		name : 'C_license',
				 		class : 'C_license',
				 		text : item.c_license
				 	})).append($('<td/>',{
				 		name : 'C_email',
				 		text : item.c_email
				 	})).append($('<td/>',{
				 		name : 'C_tel',
				 		text : item.c_tel
				 	})).appendTo($('#memberListTable'));
				});
				$('#paging').html(data.customerServicePaging.pagingHTML);
			}
		});
	});
		
		//사업자 검색
		$('#companySearchBtn').click(function(event,str){
			$('#memberListTable').empty();
			if(str!='trigger') $('#pg').val(1);
			if($('#companySearch').val()==''){
				alert("검색어를 입력하세요");
			}else{
				$.ajax({
					type: 'POST',
					url : '/exhibition/customerService/CompanySearch.do',
					data : {'pg' : $('#pg').val()
						,'companySearchOption' : $('#companySearchOption').val() 
						,'companySearch' : $('#companySearch').val()
						},
					dataType : 'json',
					success : function(data){
						$('#C_memberListFrom div:gt(0)').remove();
						/*  alert(JSON.stringify(data)); */
						 $.each(data.list,function(index, item){
							 $('<tr/>').append($('<td/>',{
							 		name : 'C_businessname',
							 		text : item.c_businessname
							 	})).append($('<td/>',{
							 		name : 'C_license',
							 		class : 'C_license',
							 		text : item.c_license
							 	})).append($('<td/>',{
							 		name : 'C_email',
							 		text : item.c_email
							 	})).append($('<td/>',{
							 		name : 'C_tel',
							 		text : item.c_tel
							 	})).appendTo($('#memberListTable'));
							});
						 $('#paging').html(data.customerServicePaging.pagingHTML);
						 
						}
				});
			}
		});
	
	
	//개인회원정보 불러오기
	 $('#memberSearchDiv').hide();
	$('#memberBtn').click(function(event,str){
		if(str!='trigger') $('#pg').val(1);
		$('#companySearchDiv').hide();
		$('#memberSearchDiv').show();
		$('#memberListTable').empty();
		
		$.ajax({
			type : 'POST',
			url : '/exhibition/customerService/getMemberList.do',
			data : {'pg' : $('#pg').val()},
			dataType : 'json',
			success : function(data){
				/*alert(JSON.stringify(data));*/
				/*$('#memberListTable td:gt(0)').remove();*/
				$.each(data.list,function(index, item){
					$('<tr/>').append($('<td/>',{
				 		name : 'M_Name',
				 		text : item.m_Name
				 	})).append($('<td/>',{
				 		name : 'M_Id',
				 		class : 'M_Id',
				 		text : item.m_Id
				 	})).append($('<td/>',{
				 		name : 'M_Email',
				 		text : item.m_Email
				 	})).append($('<td/>',{
				 		name : 'M_Phone',
				 		text : item.m_Phone
				 	})).appendTo($('#memberListTable'));
				});
				$('#paging').html(data.customerServicePaging.pagingHTML);
			}
	
		});
	});
	

		$('#memberSearchBtn').click(function(event,str){
			$('#memberListTable').hide();$('#memberListTable').show();
			if(str!='trigger') $('#pg').val(1);
			if($('#memberSearch').val()==''){
				alert("검색어를 입력하세요");
			}else{
				$.ajax({
					type: 'POST',
					url : '/exhibition/customerService/memberListSearch.do',
					data : {'pg' : $('#pg').val()
						,'memberSearchOption' : $('#memberSearchOption').val() 
						,'memberSearch' : $('#memberSearch').val()
						},
					dataType : 'json',
					success : function(data){
						$('#C_memberListFrom div:gt(0)').remove();
						
						 $.each(data.list,function(index, item){
							 $('<tr/>').append($('<td/>',{
							 		name : 'M_Name',
							 		text : item.m_Name
							 	})).append($('<td/>',{
							 		name : 'M_Id',
							 		class : 'M_Id',
							 		text : item.m_Id
							 	})).append($('<td/>',{
							 		name : 'M_Email',
							 		text : item.m_Email
							 	})).append($('<td/>',{
							 		name : 'M_Phone',
							 		text : item.m_Phone
							 	})).appendTo($('#memberListTable'));
							});
						$('#paging').html(data.customerServicePaging.pagingHTML);
					}
				});
			}
		});
	
		
	$('#memberListTable').on('click','.C_license',function(){
		
		var toDay = year+"-"+month+"-"+day;
		var ing;
		$.ajax({
			type : 'POST',
			url : '/exhibition/customerService/companyView.do',
			data : {'C_license' : $(this).text()},
			dataType : 'json',
			success : function(data){
				$('#companyModalForm tr:gt(0)').remove();
				/*alert(JSON.stringify(data));*/
				$.each(data.list,function(index, item){
					var startDate = item.startDate.toString().slice(0,10);
					var endDate = item.endDate.toString().slice(0,10);
					var allDate = startDate+"~"+endDate;
					
					if(startDate <= toDay && endDate >= toDay ){
					 ing = "<font color='green'>진행중</font>";
					}else if(endDate >toDay){
						ing = "<font color='blue'>진행 예정</font>";
					}else if(startDate < toDay){
						ing = "<font color='red'>진행 종료</font>";
					}	
				
				
					$('#companyHeader').text(item.c_license+"님 예약 정보");
					$('<tr/>').append($('<td/>',{
				 		name : 'boothName',
				 		text : item.boothName
				 	})).append($('<td/>',{
				 		name : 'title',
				 		text : item.title
				 	})).append($('<td/>',{
				 		text : allDate
				 	})).append($('<td/>',{
				 		name : 'c_license',
				 		html : ing
				 	})).appendTo($('#reservationCompanyTable'));
					});
				$('.ui.modal.member.com').modal('show');
			}
		});	
	});
	
	
	$('#memberListTable').on('click','.M_Id',function(){
		var toDay = year+"-"+month+"-"+day;
		var ing;
		$.ajax({
			type : 'POST',
			url : '/exhibition/customerService/memberView.do',
			data : {'M_Id' : $(this).text()},
			dataType : 'json',
			success : function(data){
				/*alert(JSON.stringify(data));*/
				$('#memberModalForm tr:gt(0)').remove();
				$.each(data.list,function(index, item){
					var playDate = item.playDate.toString().slice(0,10);
					
					
					if(playDate < toDay){
						ing = "<font color='gray'>기간만료</font>"
					}else if(playDate >= toDay){
						ing = "<font color='green'>예매완료</font>"
					}
					
					$('#memberHeader').text(item.memberId+"님 예약 정보");
					$('<tr/>').append($('<td/>',{
				 		name : 'imageName',
				 		text : item.imageName
				 	})).append($('<td/>',{
				 		name : 'playDate',
				 		text : playDate
				 	})).append($('<td/>',{
				 		name : "Status",
				 		html : ing
				 	})).append($('<td/>',{
				 		name : 'tickeyQty',
				 		text : item.ticketQty
				 	})).appendTo($('#reservationMemberTable'));
					
					});
				$('.ui.modal.member.mem').modal('show');
			}
		});
			
	});
	
});