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
				<button class="middle ui button" style="width: 100%;" >
					비즈니스룸 매출
				</button> 
			</td> 
		</tr>
	</table>
	<br>
	
	<!-- 박람회 부스 매출 연월 선택 -->
	<div id="C_salesExhibitionSelect" style="float:left; display: inline-block;" >	
		<div style="display: inline-block;">해당연월 선택</div>
		<div style="display: inline-block;">
			<select id="exhibitionYear" name="year">
				<option>- 연도 선택 -</option>
			</select> 
			<select id="exhibitionMonth" name="month">
				<option>- 월 선택 -</option>
			</select> 
		</div>
		<div style="display: inline-block;">
			<input type="button" id="C_salesExhibitionViewBtn" value="매출보기">
		</div>
	</div>
	<br><br>
	
	<div id="exhibitionBoothsalesDate"></div>
	
	<table border="1" id="salesExhibitionList">
		<tr>
			<th>부스명</th>
			<th>예약점유 일수</th>
			<th>총 매출액</th>
		</tr>
	</table>
	<!-- 박람회 부스 매출 연월 선택 -->
	
	
	<!-- 콘서트홀 매출 연월 선택 -->
	<!-- <div id="C_salesConcertHallSelect" style="float:left; display: inline-block;" >	
		<div style="display: inline-block;">해당연월 선택</div>
		<div style="display: inline-block;">
			<select id="concertHallYear" name="year">
				<option>- 연도 선택 -</option>
			</select> 
			<select id="concertHallMonth" name="month">
				<option>- 월 선택 -</option>
			</select> 
		</div>
		<div style="display: inline-block;">
			<input type="button" id="C_salesconcertHallViewBtn" value="매출보기">
		</div>
	</div>
	<br><br>
	
	<div id="concertHallSalesDate"></div>
	
	<table border="1" id="salesConcertHallList">
		<tr>
			<th>공연장</th>
			<th>예약점유 일수</th>
			<th>총 매출액</th>
		</tr>
	</table> -->
	<!-- 콘서트홀 매출 연월 선택 -->
	
</div>



	
	
	
<script>
	$(document).ready(function(){
		
		
		//박람회 부스 셀렉트, 테이블 숨김
		$('#salesExhibitionList').hide();
		$('#C_salesExhibitionSelect').hide();
		//박람회 부스 셀렉트, 테이블 숨김
		
		//콘서트홀 셀렉트, 테이블 숨김
		$('#salesConcertHallList').hide();
		$('#C_salesConcertHallSelect').hide();
		//콘서트홀 셀렉트, 테이블 숨김
		
		

		
		
		//박람회 부스 매출 현황
		$('.middle.ui.button.booth').click(function(){
			$('#salesConcertHallList').hide();
			$('#C_salesConcertHallSelect').hide();
			$('#concertHallSalesDate').hide();
			
			$('#C_salesExhibitionSelect').show();
			
			//박람회 부스 셀렉트 연월 선택 세팅
			var date = new Date();
			var year = date.getFullYear();
			var selectValueYear = document.getElementById('exhibitionYear');
			var optionIndexYear = 0;
			for(var i = year-100; i<=year; i++){
				selectValueYear.add(new Option(i+"년",i), optionIndexYear++);
				selectValueYear.value = i;
			}
			var selectValueMonth = document.getElementById('exhibitionMonth');
			var optionIndexMonth = 0;
			for(var i = 1; i <= 12; i++){
				selectValueMonth.add(new Option(i+"월",i),optionIndexMonth++);
				selectValueMonth.value = i;
			}
			//박람회 부스 셀렉트 연월 선택 세팅
			
			$('#C_salesExhibitionViewBtn').click(function(){
				
				$('#exhibitionBoothsalesDate').html($('<h2>'+$('#exhibitionYear option:selected').text()+' '+$('#exhibitionMonth option:selected').text()+'</h2>'));
				$.ajax({
					type: "POST",
					url: '/exhibition/customerService/C_salesExhibition.do',
					data: {'year':$('#exhibitionYear option:selected').val(), 'month': $('#exhibitionMonth option:selected').val()},
					dataType: "json",
					success: function(data) {
						alert(JSON.stringify(data));
						$('#salesExhibitionList').show();
						$('#salesExhibitionList tr:gt(0)').remove();
						$.each(data.list, function(index, item){
							
							$('<tr/>').append($('<td/>',{
								align : 'center',
								text : item.boothName
							})).append($('<td/>',{
								align : 'center',
								text : item.saleDays+'일'
							})).append($('<td/>',{
								align : 'right',
								text : item.totalRent.toLocaleString()+'원'
							})).appendTo($('#salesExhibitionList'));       
							
						});
						
						var salesTotalRent = data.salesTotalRent;
			           
						$('<tr/>').append($('<td/>',{
							align : 'center',
							colspan : '2',
							text : '월 총 매출액'
						})).append($('<td/>',{
							align : 'center',
							text : salesTotalRent.toLocaleString()+'원'
						})).appendTo($('#salesExhibitionList'));
					}
				}); 
			});
		});
		//박람회 부스 매출 현황
		
		


		
		//콘서트 홀 매출 현황
		$('.middle.ui.button.concertHall').click(function(){
			$('#salesExhibitionList').hide();
			$('#C_salesExhibitionSelect').hide();
			$('#exhibitionBoothsalesDate').hide();
			
			$('#C_salesConcertHallSelect').show();
			
			//콘서트 홀 셀렉트 연월 선택 세팅
			var date = new Date();
			var year = date.getFullYear();
			var selectValueYear = document.getElementById('concertHallYear');
			var optionIndexYear = 0;
			for(var i = year-100; i<=year; i++){
				selectValueYear.add(new Option(i+"년",i), optionIndexYear++);
				selectValueYear.value = i;
			}
			var selectValueMonth = document.getElementById('concertHallMonth');
			var optionIndexMonth = 0;
			for(var i = 1; i <= 12; i++){
				selectValueMonth.add(new Option(i+"월",i),optionIndexMonth++);
				selectValueMonth.value = i;
			}
			//콘서트 홀 셀렉트 연월 선택 세팅
			
			$('#C_salesconcertHallViewBtn').click(function(){
				
				$('#concertHallSalesDate').html($('<h2>'+$('#concertHallYear option:selected').text()+' '+$('#concertHallMonth option:selected').text()+'</h2>'));
				$.ajax({
					type: "POST",
					url: '/exhibition/customerService/C_salesConcertHall.do',
					data: {'year':$('#concertHallYear option:selected').val(), 'month': $('#concertHallMonth option:selected').val()},
					dataType: "json",
					success: function(data) {
						alert(JSON.stringify(data));
						$('#salesConcertHallList').show();
						$('#salesConcertHallList tr:gt(0)').remove();
						$.each(data.list, function(index, item){
							
							$('<tr/>').append($('<td/>',{
								align : 'center',
								text : item.hallName
							})).append($('<td/>',{
								align : 'center',
								text : item.saleDays+'일'
							})).append($('<td/>',{
								align : 'right',
								text : item.totalRent.toLocaleString()+'원'
							})).appendTo($('#salesConcertHallList'));       
							
						});
						
						var salesTotalRent = data.salesTotalRent;
			           
						$('<tr/>').append($('<td/>',{
							align : 'center',
							colspan : '2',
							text : '월 총 매출액'
						})).append($('<td/>',{
							align : 'center',
							text : salesTotalRent.toLocaleString()+'원'
						})).appendTo($('#salesConcertHallList'));
					}
				}); 
			});
		});
		//콘서트 홀 매출 현황
		
	});
</script>
</body>
</html>