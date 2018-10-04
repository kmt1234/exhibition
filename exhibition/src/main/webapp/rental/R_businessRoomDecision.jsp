<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<link href='../calendar2/fullcalendar.css' rel='stylesheet' />
<link href='../calendar2/fullcalendar.print.css' rel='stylesheet' media='print' />
<style type="text/css">
.fc-toolbar {
	height: 53px;
}
td.empty {
    padding: 50px 0 !important;
    text-align: center;
    background-color: #fff !important;
}
div{
	 border: 1px solid; 
}
</style>
</head>
<body>
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
	${businessRoom} 
</h2>
<div>
	<div id='calendar' style="width: 520px; display: inline-block; float: left; margin-left: 20px;"></div>
</div>
<div style="width: 370px; float: left; height:400px; display: inline-block; margin-top: 70px;">
	<h3>
		<span id="timeListTitle">비즈니스룸 이용 일자 선택</span>
	</h3>
	<form id="businessRoomForm" method="post" action="/exhibition/rental/rentalBusinessRoom.do">
		<div style="min-height:100px; ">
			<div style="display: inline-block; ">
				<div style="width: 50px; height:25px; float:left; display: inline-block;">
					<input type="checkbox" id="checkAll">
					<div id="chechboxDiv" style="width: 50px; height:25px; "></div>
				</div>
				<div style="width: 230px; height:25px; float:left;  display: inline-block;">
					이용 시간
					<div id="hours_of_useDiv" style="width: 230px; height:25px; display: inline-block;"></div>
				</div>
				<div style="width: 70px; height:25px; float:left;  display: inline-block; ">
					상태
					<div id="stateDiv" style="width: 70px; height:25px; display: inline-block;"></div>
				</div>
			</div>
		</div>
		<div id="peopleDiv"></div>	
		<div id="numberPeopleDiv"></div> 
		<div style="background-color: red;">
			<!-- <select name="numberPeople">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
				</select> -->
			<c:if test="${code == '1'}">
				<input type="hidden" name="M_Id" value="${homepageMember.getM_Id()}">
				<input type="hidden" name="M_Email" value="${homepageMember.getM_Email()}">
			</c:if>
			<input type="hidden" id="startDate" name="startDate" value="">
			<input type="hidden" name="roomName" value="${businessRoom}">
			<input type="button" value="예약하기" id="rentalBusinessRoomBtn">
		</div>	
	</form>
</div>
<div class="ui mini modal rental"> <!-- 사업자 예약 못하게 하는 모달 -->
  <div class="header">
  	<i class="huge home icon"></i>
  </div>
  <div class="content" style="width: 100%">
    <span>개인으로 로그인해주세요</span>
  </div>
  <div class="actions">
    <div class="ui approve button">확인</div>
  </div>
</div>

<div class="ui mini modal day"> <!-- 오늘날짜 보다 이전 날짜 예약못하게 하는 모달-->
  <div class="header">
  	<i class="huge home icon"></i>
  </div>
  <div class="content" style="width: 100%">
    <span>예약하실 수 없는 날짜입니다</span>
  </div>
  <div class="actions">
    <div class="ui approve button">확인</div>
  </div>
</div>

<div class="ui mini modal success"> <!-- 예약성공 모달 -->
  <div class="header">
  	<i class="huge home icon"></i>
  </div>
  <div class="content" style="width: 100%">
    <span>예약성공</span>
  </div>
  <div class="actions">
    <div class="ui approve button success">확인</div>
  </div>
</div>
<input type="hidden" id="code" value="${code}">

<script src='../calendar2/lib/moment.min.js'></script>
<script src='../calendar2/lib/jquery.min.js'></script>
<script src='../calendar2/fullcalendar.min.js'></script>
<script src="../semantic/semantic.min.js"></script>
<script>
//호출한 roomName의 예약현황을 달력에 표시가하기 위해 해당 페이지 호출하는 동시에 listView를 
var dataset = [
		<c:forEach var="listView" items="${listView}" varStatus="status">
		    <c:if test="${listView.startDate != ''}">
		        {'title' :"<c:out value='${listView.title}'/>"
		        , 'start' :"<c:out value='${listView.startDate}'/>"} 
		        <c:if test="${!status.last}">,</c:if>
		    </c:if>
		</c:forEach>
		];  
	var code = $('#code').val(); //로그인 코드 받아오기
	
	$(document).ready(function(){
		$('#calendar').fullCalendar({
			header: {
	            left: 'prev,next today',
	            center: 'title',
	            right: 'month,basicWeek,basicDay'
	        },
	        defaultDate: new Date(),
	        navLinks: true, 
	        editable: false,
	        eventLimit: true,
	        events: dataset,
			dayClick: function(date) { //예약되어있지 않는 날짜 클릭 이벤트
				var startDate = date.format("YYYY") + '-' + date.format("MM") + '-' + date.format("DD");
				var defaultDay = new Date().toISOString().slice(0,10);
				if(startDate <= defaultDay) { //오늘 날짜보다 이전 날짜 예약 못하게 함
					$('.ui.mini.modal.day').modal('show');
					return;
				}
				
				$('#startDate').val(startDate);
				$.ajax({
					type : 'POST',
					url : '/exhibition/rental/searchBusinessRoom.do',
					data : {'roomName': '${businessRoom}',
							'startDate' : startDate},
					async: false,
					dataType: 'json',
					success : function(data) {  //룸 이름과 클릭한 날짜를 보내 해당 날짜 예약현황 보여주기
						$('#chechboxDiv').empty();
						$('#hours_of_useDiv').empty();
						$('#stateDiv').empty();
						$('#peopleDiv').empty();
						$('#numberPeopleDiv').empty();
						
						$('#timeListTitle').html('<pre>'+startDate + ' 이용 시간 선택'+'</pre>');
						
						$('<div/>',{
				        }).append($('<div/>').append($('<input/>',{
				              style : "margin-top:10px;",
				               type : 'checkbox',
				               name: 'checkRow',
				               id: 'firstCheck',
				               value: 'first'
				            }))).appendTo('#chechboxDiv');
						$('<div/>',{	
						}).append($('<div/>',{
					            text : '09 : 00 ~ 12 : 00'
						})).appendTo('#hours_of_useDiv');
						
						$('<div/>',{	
					    }).append($('<div/>',{
					    	style : "color:green;",
					            id: 'first',
					            text : '예약가능'
					    })).appendTo('#stateDiv');
						
						$('<div/>',{
			            }).append($('<div/>').append($('<input/>',{
			               style : "margin-top:10px;",
			               type : 'checkbox',
			               name: 'checkRow',
			               id: 'secondCheck',
			               value: 'first'
			            }))).appendTo('#chechboxDiv');
						$('<div/>',{	
						}).append($('<div/>',{
							    style: "margin-top:10px;",
					            text : '12 : 00 ~ 15 : 00'
						})).appendTo('#hours_of_useDiv');
						$('<div/>',{	
					    }).append($('<div/>',{
					    	style : "color:green;",
					            id: 'second',
					            text : '예약가능'
					    })).appendTo('#stateDiv');
						
						$('<div/>',{
			            }).append($('<div/>').append($('<input/>',{
			               style : "margin-top:10px;",
			               type : 'checkbox',
			               name: 'checkRow',
			               id: 'thirdCheck',
			               value: 'third'
			            }))).appendTo('#chechboxDiv');
						$('<div/>',{	
						}).append($('<div/>',{
					            text : '15 : 00 ~ 18 : 00'
						})).appendTo('#hours_of_useDiv');
						$('<div/>',{	
					    }).append($('<div/>',{
					    	style : "color:green;",
					            id: 'third',
					            text : '예약가능'
					    })).appendTo('#stateDiv');
						
						$('<div/>',{
			            }).append($('<div/>').append($('<input/>',{
			               style : "margin-top:10px;",
			               type : 'checkbox',
			               name: 'checkRow',
			               id: 'fourthCheck',
			               value: 'fourth'
			            }))).appendTo('#chechboxDiv');
						$('<div/>',{	
						}).append($('<div/>',{
					            text : '18 : 00 ~ 21 : 00'
						})).appendTo('#hours_of_useDiv');
						$('<div/>',{	
					    }).append($('<div/>',{
					    		style : "color:green;",
					            id: 'fourth',
					            text : '예약가능'
					    })).appendTo('#stateDiv');
						$('<div/>',{
							text : '인원'
						}).appendTo('#peopleDiv')
						
						$.each(data.list, function(index, item){ //예약되어있는 시간대는 예약불가능이라고 써주고 체크박스 제거
							
							if(item.first=='Y') {
								$('#first').text('예약불가능').css('color', 'red');
								$('#firstCheck').remove();
							}
							if(item.second=='Y') {
								$('#second').text('예약불가능').css('color', 'red');
								$('#secondCheck').remove();
							}
							if(item.third=='Y') {
								$('#third').text('예약불가능').css('color', 'red');
								$('#thirdCheck').remove();
							}
							if(item.fourth=='Y') {
								$('#fourth').text('예약불가능').css('color', 'red');
								$('#fourthCheck').remove();
							}
						});
						
					}
					
				});
				
			},//밑에는 예약되어있는 날짜 클릭이벤트
			eventClick: function(event){
				var startDate = event.start.format("YYYY") + '-' + event.start.format("MM") + '-' + event.start.format("DD");
				var defaultDay = new Date().toISOString().slice(0,10);
				if(startDate <= defaultDay) { //오늘 날짜보다 이전 날짜 예약 못하게 막는 것
					$('.ui.mini.modal.day').modal('show');
					return;
				}
				$('#startDate').val(startDate);
				$.ajax({ //룸 이름과 클릭한 날짜를 보내 해당 날짜 예약현황 보여주기
					type : 'POST',
					url : '/exhibition/rental/searchBusinessRoom.do',
					data : {'roomName': '${businessRoom}',
							'startDate' : startDate},
					async: false,
					dataType: 'json',
					success : function(data) {
						$('#time_list tr:gt(0)').remove();
						
						$('#timeListTitle').html('<pre>'+startDate + ' 이용 시간 선택'+'</pre>');
						
						$('<tr/>',{
				               align : 'center'
				            }).append($('<td/>').append($('<input/>',{
				               type : 'checkbox',
				               name: 'checkRow',
				               id: 'firstCheck',
				               value: 'first'
				            }))).append($('<td/>',{
				               text : '09 : 00 ~ 12 : 00'
				            })).append($('<td/>',{
				               text : '12,000'
				            })).append($('<td/>',{
				               id: 'first',
				               text : '예약가능'
				            })).appendTo('#time_list');
						
						$('<tr/>',{
				               align : 'center'
				            }).append($('<td/>').append($('<input/>',{
				               type : 'checkbox',
				               name: 'checkRow',
				               id: 'secondCheck',
				               value: 'second'
				            }))).append($('<td/>',{
				               text : '12 : 00 ~ 15 : 00'
				            })).append($('<td/>',{
				               text : '12,000'
				            })).append($('<td/>',{
				            	id: 'second',
				               text : '예약가능'
				            })).appendTo('#time_list');
						
						$('<tr/>',{
				               align : 'center'
				            }).append($('<td/>').append($('<input/>',{
				               type : 'checkbox',
					           name: 'checkRow',
					           id: 'thirdCheck',
					           value: 'third'
				            }))).append($('<td/>',{
				               text : '15 : 00 ~ 18 : 00'
				            })).append($('<td/>',{
				               text : '12,000'
				            })).append($('<td/>',{
				            	id: 'third',
				               text : '예약가능'
				            })).appendTo('#time_list');
						
						$('<tr/>',{
				               align : 'center'
				            }).append($('<td/>').append($('<input/>',{
				               type : 'checkbox',
				               name: 'checkRow',
				               id: 'fourthCheck',
				               value: 'fourth'
				            }))).append($('<td/>',{
				               text : '18 : 00 ~ 21 : 00'
				            })).append($('<td/>',{
				               text : '12,000'
				            })).append($('<td/>',{
				            	id: 'fourth',
				               text : '예약가능'
				            })).appendTo('#time_list');
						$.each(data.list, function(index, item){ //예약되어있는 시간대는 예약불가능이라고 써주고 체크박스 제거
							
							if(item.first=='Y') {
								$('#first').text('예약불가능').css('color', 'red');
								$('#firstCheck').remove();
							}
							if(item.second=='Y') {
								$('#second').text('예약불가능').css('color', 'red');
								$('#secondCheck').remove();
							}
							if(item.third=='Y') {
								$('#third').text('예약불가능').css('color', 'red');
								$('#thirdCheck').remove();
							}
							if(item.fourth=='Y') {
								$('#fourth').text('예약불가능').css('color', 'red');
								$('#fourthCheck').remove();
							}
						});
						
					}
					
				});
			}
			
		});
		
		
		//checkBox 전체 선택, 해제
		$('#checkAll').on('click', function(){
			var cbox = $('[name="checkRow"]');
			for(var i = 0; i < cbox.length; i++) {
				cbox[i].checked = $('#checkAll').is(':checked') ;
			}
		});
			//예약하기 버튼
			$('#rentalBusinessRoomBtn').on('click', function(){
				//개인으로 로그인 할때만 submit
				if($('#code').val()=='1') {
				
					$('.ui.mini.modal.success').modal({
						closable : false,
			            duration : 460,
					}).modal('show');
					
					$('.ui.approve.button.success').on('click', function(){
						$('#businessRoomForm').submit();
					});
				} else {
					$('.ui.mini.modal.rental').modal('show');
				}
				
			});
		

	});
</script>
</body>
</html>