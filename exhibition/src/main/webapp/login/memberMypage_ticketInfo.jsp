<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
#uiCard{
	display: inline-block;
}

#uiStatistics{
	display: inherit;
}

#contentId {
    display: contents;
}

span.header {
    text-align: center;
}	

.meta {
    text-align: center;
}

.description {
    text-align: center;
}

div#uiStatistics {
    text-align: center;
}
</style>

</head>
<body>


<jsp:include page="memberMypage.jsp"/>


<div class="ui small modal" style="text-align:center;">
	<div class="ui icon header"><i class="archive icon"></i>
			예매 취소
	</div>
	
	<div class="content" id="contentId" >
  		<div class="ui card" id="uiCard">
		  <div class="image">
		    <img src="../storage/${eventboardDTO.image1}">
		  </div>
		  <div class="content">
		    <span class="header">${imageName }</span>
		    <div class="meta">		<input type="hidden" id="playDate2" value="${playDate2}">
		      <span class="date">${playDate } / ${eventboardDTO.startTime} ~ ${eventboardDTO.endTime}</span>
		    </div>
		    <div class="description">
		      ${eventboardDTO.eventContent}
		    </div>
		  </div>
		  <div class="extra content">
			  <div class="ui statistics" id="uiStatistics">
				  <div class="blue statistic">
				    <div class="value">${ticketQty }</div>	
				    <div class="label">예매 티켓 수</div>
				  </div>
			  </div><!--class="ui statistics"-->
		  </div><!--class="extra content"-->
		</div><!--class="ui card"  -->
	</div>
	
	<div class="actions">
	  	<div class="ui red basic cancel inverted button"><i class="remove icon"></i>
	    		아니오
	  	</div>
  		<div class="ui green ok inverted button" id="cancel"><i class="checkmark icon"></i>
    			예
  		</div>
	</div>
</div>




	

<!--예매 취소하기 위해 필요한 값들-->	
<input type="hidden" id="hiddenImageName" value="${imageName }">
<input type="hidden" id="hiddenPlayDate" value="${playDate }">
<input type="hidden" id="hiddenTicketQty" value="${ticketQty }">

</body>
<script>
$(document).ready(function(){
	
	$('.ui.small.modal')
	  .modal({
			closable : false,
            duration : 460,
		}).modal('show');
	
	
	//get Month 0붙이기
	function getMonth(date) {
	  var month = date.getMonth() + 1;
	  return month < 10 ? '0' + month : '' + month; // ('' + month) for string result
	}  
	
	//현재 날짜
	var Now = new Date();
	var NowTime = Now.getFullYear();
	NowTime += ''+getMonth(Now);
	NowTime += ''+Now.getDate();
	
	//당일 취소 불가
	if(parseInt($('#playDate2').val()) <= parseInt(NowTime)){		
		$('#cancel').text('당일 취소 불가');
		$('#cancel').addClass('disabled');
	} 
	
	//예매취소
	$('#cancel').click(function(){
		
		var result = confirm('정말 취소 하시겠습니까?');
		
		if(result){
			alert('취소하였습니다.');
			
			var form = document.createElement('form');
			
			var objs1;
			objs1 = document.createElement('input');
			objs1.setAttribute('type', 'hidden');
			objs1.setAttribute('name', 'imageName');
			objs1.setAttribute('value', $('#hiddenImageName').val());
			
			var objs2;
			objs2 = document.createElement('input');
			objs2.setAttribute('type', 'hidden');
			objs2.setAttribute('name','playDate');
			objs2.setAttribute('value', $('#hiddenPlayDate').val());
					
			var objs3;
			objs3 = document.createElement('input');
			objs3.setAttribute('type', 'hidden');
			objs3.setAttribute('name', 'ticketQty');
			objs3.setAttribute('value', $('#hiddenTicketQty').val());

			form.appendChild(objs1);
			form.appendChild(objs2);
			form.appendChild(objs3);
			
			form.setAttribute('method', 'post');
			form.setAttribute('action', "/exhibition/login/ticketCancel.do");

			document.body.appendChild(form);
			
			form.submit();
	
		}else{
			
		}
	
				
	});
	
});
</script>
</html>