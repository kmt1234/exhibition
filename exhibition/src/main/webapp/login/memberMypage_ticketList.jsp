<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#currentPaging{
	color: red;
	text-decoration: underline;
	cursor: pointer;
}

#paging{
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>
<div class="ui compact menu" style="width: 930px; height:900px auto;  display: inline-block;" >
	<h2 class="box-container" style="float: center; width: 100%; height:126px; text-align: left;">
		<span>마이</span>
		<span class="h-light">페이지</span>
		<div style="font-size:13px; float:right; height: 50px; margin-top:30px ">
		<img src="../img/house.png" width="15px" height="16px" style="cursor: pointer;" id="houseImg"></img>
		> 고객센터 > 마이페이지 
	</div>
	
	<div class="ui divider"></div> 
	
	</h2>
	
	<div style="width: 100%;">
		<!-- 맨위 메뉴 텝 -->
		<div style="margin-left: 20px; width:880px; float: left; text-align: left;">
			<a class="middle ui button" class="active item" id="member-info-modify">
				수정
		  	</a>
		  	<a class="middle ui button" class="item" id="member-ticket-list">
		    	예매리스트
		 	</a>
		  	<a class="middle ui button" class="item" id="member-ticket-history">
		    	예매 내역
		  	</a>
		</div>
	</div>
</div><!--class="ui compact menu"   -->
		
	<!--내용--><input type="hidden" id="pg" value="${pg}"><!--현재 페이지-->	
	<div class="ui segment" id="Ticket-List-Div" style="display: inline-block;">
		
		<form name="eventDetailInfo" id="eventDetailInfo" method="post" action="/exhibition/login/eventDetail.do">
			<table id="ticketList" style="border: solid red;">
				<thead>
					<tr>
						<th>회원 아이디</th><th>공연 및 전시회 명</th><th>예매 일자</th><th>예매 티켓 수량</th>
					
					</tr>
				</thead>
			</table>
		</form>
		
		<div id="paging"></div>
		
	</div>
</body>
<script>
$('.tr').remove();	//예매리스트 내용 초기화

//회원의 예매 리스트를 가져오는 ajax ******************수정해야함 젠장 
$.ajax({
	type : 'GET',
	url : '/exhibition/login/getMemberTicketList.do?pg='+$('#pg').val()+'',
	dataType : 'json',
	success : function(data){
		$.each(data.list, function(index, item){
			$('<tr/>',{
				class : 'tr'
			}).append($('<td/>',{
				text : item.memberId
			}).append($('<input/>',{
				name : 'memberId',
				type : 'text',
				value : item.memberId
			}))).append($('<a/>',{
				/* id : 'bookEventInfo' */
			}).append($('<td/>',{
				text : item.imageName,
				id : 'bookEventInfo',
			}).append($('<input/>',{
				name : 'imageName',
				type : 'text',
				value : item.imageName
			})))).append($('<td/>',{
				text : item.playDate,
			}).append($('<input/>',{
				name : 'playDate',
				type : 'text',
				value : item.playDate
			}))).append($('<td/>',{
				text : item.ticketQty,
			}).append($('<input/>',{
				name : 'ticketQty',
				type : 'text',
				value : item.ticketQty
			}))).appendTo($('#ticketList'));
		});//each
		
		$('#paging').html(data.memberTicketListPaging.pagingHTML);
	}//success
});//ajax
</script>
<script>
/*페이징 */
function MemberTicketListPaging(pg){
	location.href="/exhibition/login/memerMypage_ticketList.do?pg="+pg;
}
	
$(document).ready(function(){
	
	$('#ticketList').on('click','#bookEventInfo',function(){
		$('#eventDetailInfo').submit();
	});
});

</script>
</html>