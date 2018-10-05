$(document).ready(function(){
	var C_name = /^[가-힣]+$/;	//한글만 가능 
	var C_phone =  /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;	//휴대폰 번호 양식
	var Cw_regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; //이메일 양식
	
	//고객의 소리 - 이메일 인증 - 인증번호 전송 버튼 클릭시
	$('#C_emailSendBtn').click(function() {
		$('#emailDiv').empty();
		
		if($('#email').val()==''){
			$('#emailDiv').text("이메일을 입력하세요").css('font-size','9pt').css('color','red')
		} else if(!Cw_regEmail.test($('#email').val())){
			$('#emailDiv').text("이메일 양식에 맞지 않습니다. ex) XXX@XXX.XXX").css("font-size","9pt").css("color","red");
		}else {
			$.ajax({
			type : 'POST',
			url : '/exhibition/customerService/sendEmail.do',
			data : {'email':$('#email').val()},
			dataType: 'text',
			success : function(data){
				$('#reC_EmailConfirm').val(data);
				alert($('#email').val()+"메일을 보냈습니다.");
			}
		});
		}
	});
	
	//인증 확인 버튼 클릭시
	$('#C_emailConfirmBtn').click(function() {		//인증 확인 버튼 클릭시
		$('#checkEmailDiv').empty();
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
			$('#C_inquire').submit();
	});

	//고객의 소리 - 관리자 버튼
	$('#C_email_ListBtn').click(function(){
		location.href="/exhibition/customerService/C_inquire_List.do";
	});
	
	//고객의 소리  - 답변하기 폼
	$('#C_inquire_replyBtn').click(function(){
		$('#C_inquire_writeReply').submit();
	});

	// 고객의 소리 문의 받은 글 불러오기
	$.ajax({
		type : 'POST',
		url : '/exhibition/customerService/getInquireList.do',
		data : {'pg':$('#pg').val()},
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index, item){
	
				$('<tr/>').append($('<td/>',{
					text : item.seq,
					style : 'text-align : center',
					id : 'seqA',
				})).append($('<td/>',{
					class : item.seq+""
				})).append($('<td/>',{
					id : 'subjectA',
					style : 'text-align : center',
					href : 'javascript:void(0)',
					text : item.subject
				})).append($('<td/>',{
					style : 'text-align : center',
					text : item.name,
					id : 'nameA'
				})).append($('<td/>',{
					style : 'text-align : center',
					text : item.email,
					id : 'emailA'
				})).append($('<td/>',{
					style : 'text-align : center',
					text : item.logtime,
					id : 'logtime'
				})).appendTo($('#C_inquire_List'));
				
				
					if(item.pseq!=0){//답글
						$('.'+item.seq).append($('<i/>',{
							class : 'check icon'
						}));
					} else {
						$('.'+item.seq).append($('<i/>',{
							class : 'question icon'
						}));
					}
			});
			$('#C_inquire_PagingDiv').html(data.customerServicePaging.pagingHTML);
		}
	});
	
	//고객의소리 리스트 검색한 값 불러오기
	$('#C_inquire_SearchBtn').click(function(){
		$('#pg').val(1);
		if($('#keyword').val()=='')
			alert("검색어를 입력하세요");
		else
			location.href="/exhibition/customerService/C_inquire_SearchList.do?pg="+$('#pg').val()+'&searchOption='+$('#searchOption').val()+"&keyword="+$('#keyword').val();
	});
	// 고객의 소리 문의 받은 글 제목 클릭시 내용 보여주기
	$('#C_inquire_List').on('click','#subjectA',function(){
		var seq = $(this).prev().prev().text();
		location.href="/exhibition/customerService/C_inquire_View.do?seq="+seq+"&pg="+$('#pg').val()+"&keyword="+$('#keyword').val();
	});
	
	$('#C_inquire_ListBtn').on('click', function(){
		if($('#keyword').val()==''){
			location.href="/exhibition/customerService/C_inquire_List.do?pg="+$('#pg').val();
		} else {
			location.href="/exhibition/customerService/C_inquire_SearchList.do?pg="+$('#pg').val()+'&searchOption='+$('#searchOption').val()+"&keyword="+$('#keyword').val();
		}
	});
	$('.ui.selection.dropdown').dropdown();
});