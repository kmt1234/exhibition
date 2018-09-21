<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div>
	<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
		매출<span class="h-light">정보</span>
	</h2>
	<table style=" width: 100%;">
		<tr>
			<td>
				<button class="middle ui button booth" style="width: 100%;" >
					박람회 부스매출
				</button> 
			</td>
			<td>
				<button class="middle ui button" style="width: 100%;" >
					박람회 티켓매출
				</button> 
			</td>
			<td>
				<button class="middle ui button concertHall" style="width: 100%;" >
					공연홀 매출
				</button> 
			</td>
			<td>
				<button class="middle ui button" style="width: 100%;" >
					공연홀 티켓매출
				</button>
			</td>
			<td>
				<button class="middle ui button businessRoom" style="width: 100%;" >
					비즈니스룸 매출
				</button> 
			</td> 
		</tr>
	</table>
	<br>
	
	<!-- 매출 연월 선택 -->
	<div id="C_salesSelect" style="float:left; display: inline-block;" >	
		<div style="display: inline-block;">해당연월 선택</div>
		<div style="display: inline-block;">
			<select id="year" name="year">
				<option>- 연도 선택 -</option>
			</select> 
			<select id="month" name="month">
				<option>- 월 선택 -</option>
			</select> 
		</div>
		<div style="display: inline-block;">
			<input type="button" id="C_salesViewBtn" value="매출보기">
		</div>
	</div>
	<br><br>
	
	<div id="salesDate"></div>
	
	<table border="1" id="salesList">
		<tr>
			<th id="salesName">부스명</th>
			<!-- <th>예약점유 일수</th> -->
			<th>총 매출액</th>
		</tr>
	</table>
	<!-- 매출 연월 선택 -->
	
	
</div>



	
	
	
<script>
	$(document).ready(function(){
		
		$('#C_salesSelect').hide();
		$('#salesList').hide();
		

		//셀렉트 연월 선택 세팅
		var date = new Date();
		var year = date.getFullYear();
		var selectValueYear = document.getElementById('year');
		var optionIndexYear = 0;
		for(var i = year-100; i<=year; i++){
			selectValueYear.add(new Option(i+"년",i), optionIndexYear++);
			selectValueYear.value = i;
		}
		var selectValueMonth = document.getElementById('month');
		var optionIndexMonth = 0;
		for(var i = 1; i <= 12; i++){
			selectValueMonth.add(new Option(i+"월",i),optionIndexMonth++);
			selectValueMonth.value = i;
		}
		//셀렉트 연월 선택 세팅

		
		
		//박람회 부스 매출 현황
		$('.middle.ui.button.booth').click(function(){
			
			//매출보기 아이디 변경 전 클릭이벤트 제거
			$('#C_salesconcertHallViewBtn').off('click'); 
			$('#C_salesBusinessRoomViewBtn').off('click');
			
			$('#C_salesSelect').show();
			$('#salesList').hide();
			$('#salesDate').hide();
			
			$('#C_salesViewBtn').attr('id', 'C_salesExhibitionViewBtn');
			$('#C_salesconcertHallViewBtn').attr('id', 'C_salesExhibitionViewBtn');
			$('#C_salesBusinessRoomViewBtn').attr('id', 'C_salesconcertHallViewBtn');
			
			$('#C_salesExhibitionViewBtn').click(function(){
				$('#salesDate').show();
				$('#salesDate').html($('<h2>'+$('#year option:selected').text()+' '+$('#month option:selected').text()+' 박람회 부스 매출'+'</h2>'));
				$.ajax({
					type: "POST",
					url: '/exhibition/customerService/C_salesExhibition.do',
					data: {'year':$('#year option:selected').val(), 'month': $('#month option:selected').val()},
					dataType: "json",
					success: function(data) {
						alert(JSON.stringify(data));
						$('#salesList').show();
						$('#salesName').text('부스명');
						$('#salesList tr:gt(0)').remove();
						$.each(data.list, function(index, item){
							
							$('<tr/>').append($('<td/>',{
								align : 'center',
								text : item.boothName
							})).append($('<td/>',{
								align : 'right',
								text : item.totalRent.toLocaleString()+'원'
							})).appendTo($('#salesList'));       
							
						});
						
						var salesTotalRent = data.salesTotalRent;
			           
						$('<tr/>').append($('<td/>',{
							align : 'center',
							text : '월 총 매출액'
						})).append($('<td/>',{
							align : 'center',
							text : salesTotalRent.toLocaleString()+'원'
						})).appendTo($('#salesList'));
					}
				}); 
			});	
			
		});
		//박람회 부스 매출 현황

		
		//콘서트 홀 매출 현황
		$('.middle.ui.button.concertHall').click(function(){
			
			//매출보기 아이디 변경 전 클릭이벤트 제거
			$('#C_salesExhibitionViewBtn').off('click');
			$('#C_salesBusinessRoomViewBtn').off('click');
			
			$('#C_salesViewBtn').attr('id', 'C_salesconcertHallViewBtn');
			$('#C_salesExhibitionViewBtn').attr('id', 'C_salesconcertHallViewBtn');
			$('#C_salesBusinessRoomViewBtn').attr('id', 'C_salesconcertHallViewBtn');
			
			$('#C_salesSelect').show();
			
			$('#salesDate').hide();
			$('#salesList').hide();
			
			$('#C_salesconcertHallViewBtn').click(function(){
				$('#salesDate').show();
				$('#salesDate').html($('<h2>'+$('#year option:selected').text()+' '+$('#month option:selected').text()+' 콘서트 홀 매출'+'</h2>'));
				$.ajax({
					type: "POST",
					url: '/exhibition/customerService/C_salesConcertHall.do',
					data: {'year':$('#year option:selected').val(), 'month': $('#month option:selected').val()},
					dataType: "json",
					success: function(data) {
						alert(JSON.stringify(data));
						$('#salesList').show();
						$('#salesName').text('홀이름');
						$('#salesList tr:gt(0)').remove();
						$.each(data.list, function(index, item){
							
							$('<tr/>').append($('<td/>',{
								align : 'center',
								text : item.hallName
							})).append($('<td/>',{
								align : 'right',
								text : item.totalRent.toLocaleString()+'원'
							})).appendTo($('#salesList'));       
							
						});
						
						var salesTotalRent = data.salesTotalRent;
			           
						$('<tr/>').append($('<td/>',{
							align : 'center',
							text : '월 총 매출액'
						})).append($('<td/>',{
							align : 'center',
							text : salesTotalRent.toLocaleString()+'원'
						})).appendTo($('#salesList'));
					}
				}); 
			});
			
		});
		//콘서트 홀 매출 현황
		
		
		//비즈니스룸 매출 현황
		$('.middle.ui.button.businessRoom').click(function(){
			$('#C_salesExhibitionViewBtn').off('click');
			$('#C_salesconcertHallViewBtn').off('click'); 
			
			$('#C_salesViewBtn').attr('id', 'C_salesBusinessRoomViewBtn');
			$('#C_salesExhibitionViewBtn').attr('id', 'C_salesBusinessRoomViewBtn');
			$('#C_salesconcertHallViewBtn').attr('id', 'C_salesBusinessRoomViewBtn');
			
			$('#C_salesSelect').show();
			
			$('#salesDate').hide();
			$('#salesList').hide();
			
			$('#C_salesBusinessRoomViewBtn').click(function(){
				$('#salesDate').show();
				$('#salesDate').html($('<h2>'+$('#year option:selected').text()+' '+$('#month option:selected').text()+'비즈니스룸'+'</h2>'));
				$.ajax({
					type: "POST",
					url: '/exhibition/customerService/C_salesBusinessRoom.do',
					data: {'year':$('#year option:selected').val(), 'month': $('#month option:selected').val()},
					dataType: "json",
					success: function(data) {
						alert(JSON.stringify(data));
						$('#salesList').show();
						$('#salesName').text('비즈니스룸 이름');
						$('#salesList tr:gt(0)').remove();
						$.each(data.list, function(index, item){
							
							$('<tr/>').append($('<td/>',{
								align : 'center',
								text : item.roomName
							})).append($('<td/>',{
								align : 'right',
								text : item.totalRent.toLocaleString()+'원'
							})).appendTo($('#salesList'));       
							
						});
						
						var salesTotalRent = data.salesTotalRent;
			           
						$('<tr/>').append($('<td/>',{
							align : 'center',
							text : '월 총 매출액'
						})).append($('<td/>',{
							align : 'center',
							text : salesTotalRent.toLocaleString()+'원'
						})).appendTo($('#salesList'));
					}
				}); 
			});
			
		});
		//비즈니스룸 매출 현황
		

		
		
	});
</script>
</body>
</html>