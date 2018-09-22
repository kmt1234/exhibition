$(document).ready(function(){
	//개인회원정보 불러오기
	 $('#memberSearchDiv').hide();
	 $('#memberSearchDiv').show();
	 $('#memberListTable').empty();
	 $('#reConfirm').hide();
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
	

		$('#memberSearchBtn').click(function(event,str){
			$('#memberListTable').empty();
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
});

