<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매내역</title>
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

.imageName{
	cursor: pointer;
	color: red;
}

#cancelMsg{
	color: red;
	text-align: center;
}

.ui.table td {
    text-align: center;
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
		
	<table class="ui selectable inverted table" id="ticketList">
		<thead>
			<tr>
				<th>회원 아이디</th><th>공연 및 전시회</th><th>예매 일자</th><th>예매 티켓 수량</th><th>환불 여부</th>
			
			</tr>
		</thead>
	</table>
	
	<div id="paging"></div>
	
</div>

</body>
<script type="text/javascript">
$('.tr').remove();	//예매리스트 내용 초기화

//과거 예매 내역 불러오는 ajax
$.ajax({
	type : 'GET',
	url : '/exhibition/login/getTicketHistory.do?pg='+$('#pg').val()+'',
	dataType : 'json',
	success : function(data){
		$.each(data.list, function(index, item){
			$('<tr/>',{
				class : 'tr'
			}).append($('<td/>',{
				text : item.memberId,
				value : item.memberId
			})).append($('<td/>',{
				text : item.imageName,
				class : 'imageName',
				value : item.imageName
			})).append($('<td/>',{
				text : item.playDate,
				value : item.playDate
			})).append($('<td/>',{
				id : 'ticketQtyTd',
				text : item.ticketQty,
				value : item.ticketQty
			})).append($('<td/>',{
				id : 'cancelMsg',
				text : '환불 불가'
			})).appendTo($('#ticketList'));
		});//each
		$('#paging').html(data.TicketHistoryListPaging.pagingHTML);
	}//success
});//ajax


</script>
<script type="text/javascript">
/*페이징 */
function TicketHistoryListPaging(pg){
	location.href="/exhibition/login/ticketHistory.do?pg="+pg;
}

//회원정보 수정 메뉴
$('#member-info-modify').click(function(){
	location.href="/exhibition/login/mypage.do";
	
});

// 예매리스트 탭 
$('#member-ticket-list').click(function(){
	location.href="/exhibition/login/memerMypage_ticketList.do";
});

//예매내역 탭
$('#member-ticket-history').click(function(){
	location.href="/exhibition/login/ticketHistory.do";
});

$('#ticketList').on('click','.imageName',function(){
	 $.alertable.alert('당일 취소 불가능합니다(지난 이벤트 포함)', {
	      show: function() {
	        $(this.overlay).velocity('transition.fadeIn', 300);        
	        $(this.modal).velocity('transition.shrinkIn', 300);
	      },
	      hide: function() {
	        $(this.overlay).velocity('transition.fadeOut', 300);
	        $(this.modal).velocity('transition.shrinkOut', 300);
	      } 
	    });
});

</script>
</html>