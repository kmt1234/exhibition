<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#houseImg{
	margin:-3px;
	cursor: pointer;
}
</style>
</head>
<body>
<div>
	<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
		매출<span class="h-light">현황</span>
		<div style="font-size:13px; float:right; margin-top: 29px;">
		<img src="../img/house.png" width="15px" height="16px" id="houseImg">
		> 고객센터 > 매출 현황
		</div>
		<div class="ui divider"></div>
	</h2>
	<table style=" width: 100%;">
		<tr>
			<td>
				<button class="middle ui button booth" style="width: 100%;" >
					박람회 부스매출
				</button> 
			</td>
			<td>
				<button class="middle ui button exhibitionTicket" style="width: 100%;" >
					박람회 티켓매출
				</button> 
			</td>
			<td>
				<button class="middle ui button concertHall" style="width: 100%;" >
					공연홀 매출
				</button> 
			</td>
			<td>
				<button class="middle ui button concertTicket" style="width: 100%;" >
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
	<!-- 매출 연월 선택 -->
	
	<div id="salesDate"></div>
	
	<table class="ui striped table" border="1" id="salesList" style="text-align: center;">
		<tr>
			<th id="salesName">부스명</th>
			<!-- <th>예약점유 일수</th> -->
			<th>총 매출액</th>
		</tr>
	</table>
	
	
	<div id="monthSaleChart" style="width: 550px; height: 400px; margin: 0 auto"></div>
	
	
</div>

	
<script src="http://code.highcharts.com/highcharts.js"></script>
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
			$('#C_salesConcertTicketViewBtn').off('click');
			$('#C_salesExhibitionTicketViewBtn').off('click');
			
			$('#C_salesSelect').show();
			$('#salesList').hide();
			$('#salesDate').hide();
			
			$('#monthSaleChart').empty();
			
			$('#C_salesViewBtn').attr('id', 'C_salesExhibitionViewBtn');
			$('#C_salesconcertHallViewBtn').attr('id', 'C_salesExhibitionViewBtn');
			$('#C_salesBusinessRoomViewBtn').attr('id', 'C_salesExhibitionViewBtn');
			$('#C_salesConcertTicketViewBtn').attr('id', 'C_salesExhibitionViewBtn');
			$('#C_salesExhibitionTicketViewBtn').attr('id', 'C_salesExhibitionViewBtn');
			
			$('#C_salesExhibitionViewBtn').click(function(){
				$('#salesDate').show();
				$('#salesDate').html($('<h2>'+$('#year option:selected').text()+' '+$('#month option:selected').text()+' 박람회 부스 매출'+'</h2>'));
				$.ajax({
					type: "POST",
					url: '/exhibition/customerService/C_salesExhibition.do',
					data: {'year':$('#year option:selected').val(), 'month': $('#month option:selected').val()},
					dataType: "json",
					success: function(data) {
						console.log(JSON.stringify(data.yearMonth));
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
						
						var title = {
							      text: '홀 별 연 매출'   
							   };
							
							   var xAxis = {
							      categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
							         'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
							   };
							   var yAxis = {
							      title: {
							         text: '매출액 (원)'
							      },
							      plotLines: [{
							         value: 0,
							         width: 1,
							         color: '#808080'
							      }]
							   };   

							   var tooltip = {
							      valueSuffix: '원'
							   }

							   var legend = {
							      layout: 'vertical',
							      align: 'right',
							      verticalAlign: 'middle',
							      borderWidth: 0
							   };

							   var series= data.yearMonth; 

							   var json = {};

							   json.title = title;
							   json.xAxis = xAxis;
							   json.yAxis = yAxis;
							   json.tooltip = tooltip;
							   json.legend = legend;
							   json.series = series;
					      
					      
					  
					   $('#monthSaleChart').highcharts(json); 
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
			$('#C_salesConcertTicketViewBtn').off('click');
			$('#C_salesExhibitionTicketViewBtn').off('click');
			
			$('#C_salesViewBtn').attr('id', 'C_salesconcertHallViewBtn');
			$('#C_salesExhibitionViewBtn').attr('id', 'C_salesconcertHallViewBtn');
			$('#C_salesBusinessRoomViewBtn').attr('id', 'C_salesconcertHallViewBtn');
			$('#C_salesConcertTicketViewBtn').attr('id', 'C_salesconcertHallViewBtn');
			$('#C_salesExhibitionTicketViewBtn').attr('id', 'C_salesconcertHallViewBtn');
			
			$('#C_salesSelect').show();
			
			$('#salesDate').hide();
			$('#salesList').hide();
			
			$('#monthSaleChart').empty();
			
			$('#C_salesconcertHallViewBtn').click(function(){
				$('#salesDate').show();
				$('#salesDate').html($('<h2>'+$('#year option:selected').text()+' '+$('#month option:selected').text()+' 콘서트 홀 매출'+'</h2>'));
				$.ajax({
					type: "POST",
					url: '/exhibition/customerService/C_salesConcertHall.do',
					data: {'year':$('#year option:selected').val(), 'month': $('#month option:selected').val()},
					dataType: "json",
					success: function(data) {
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
						
						
						var title = {
							      text: '부스 별 연 매출'   
							   };
							
							   var xAxis = {
							      categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
							         'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
							   };
							   var yAxis = {
							      title: {
							         text: '매출액 (원)'
							      },
							      plotLines: [{
							         value: 0,
							         width: 1,
							         color: '#808080'
							      }]
							   };   

							   var tooltip = {
							      valueSuffix: '원'
							   }

							   var legend = {
							      layout: 'vertical',
							      align: 'right',
							      verticalAlign: 'middle',
							      borderWidth: 0
							   };

							   var series= data.yearMonth; 

							   var json = {};

							   json.title = title;
							   json.xAxis = xAxis;
							   json.yAxis = yAxis;
							   json.tooltip = tooltip;
							   json.legend = legend;
							   json.series = series;
					   
					   
					    $('#monthSaleChart').highcharts(json); 
					}
				}); 
			});
			
		});
		//콘서트 홀 매출 현황
		
		
		//비즈니스룸 매출 현황
		$('.middle.ui.button.businessRoom').click(function(){
			$('#C_salesExhibitionViewBtn').off('click');
			$('#C_salesconcertHallViewBtn').off('click'); 
			$('#C_salesConcertTicketViewBtn').off('click');
			$('#C_salesExhibitionTicketViewBtn').off('click');
			
			$('#C_salesViewBtn').attr('id', 'C_salesBusinessRoomViewBtn');
			$('#C_salesExhibitionViewBtn').attr('id', 'C_salesBusinessRoomViewBtn');
			$('#C_salesconcertHallViewBtn').attr('id', 'C_salesBusinessRoomViewBtn');
			$('#C_salesConcertTicketViewBtn').attr('id', 'C_salesBusinessRoomViewBtn');
			$('#C_salesExhibitionTicketViewBtn').attr('id', 'C_salesBusinessRoomViewBtn');
			
			$('#C_salesSelect').show();
			
			$('#salesDate').hide();
			$('#salesList').hide();
			
			$('#monthSaleChart').empty();
			
			$('#C_salesBusinessRoomViewBtn').click(function(){
				$('#salesDate').show();
				$('#salesDate').html($('<h2>'+$('#year option:selected').text()+' '+$('#month option:selected').text()+'비즈니스룸'+'</h2>'));
				$.ajax({
					type: "POST",
					url: '/exhibition/customerService/C_salesBusinessRoom.do',
					data: {'year':$('#year option:selected').val(), 'month': $('#month option:selected').val()},
					dataType: "json",
					success: function(data) {
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
						
						var title = {
							      text: '비즈니스 룸 별 연 매출'   
							   };
							
							   var xAxis = {
							      categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
							         'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
							   };
							   var yAxis = {
							      title: {
							         text: '매출액 (원)'
							      },
							      plotLines: [{
							         value: 0,
							         width: 1,
							         color: '#808080'
							      }]
							   };   

							   var tooltip = {
							      valueSuffix: '원'
							   }

							   var legend = {
							      layout: 'vertical',
							      align: 'right',
							      verticalAlign: 'middle',
							      borderWidth: 0
							   };

							   var series= data.yearMonth; 

							   var json = {};

							   json.title = title;
							   json.xAxis = xAxis;
							   json.yAxis = yAxis;
							   json.tooltip = tooltip;
							   json.legend = legend;
							   json.series = series;
					   
					   
					    $('#monthSaleChart').highcharts(json); 
					}
				}); 
			});
			
		});
		//비즈니스룸 매출 현황
		
		
		//콘서트 티켓 매출 현황
		$('.middle.ui.button.concertTicket').click(function(){
			$('#C_salesExhibitionViewBtn').off('click');
			$('#C_salesconcertHallViewBtn').off('click');
			$('#C_salesBusinessRoomViewBtn').off('click');
			$('#C_salesExhibitionTicketViewBtn').off('click');
			
			$('#C_salesViewBtn').attr('id', 'C_salesConcertTicketViewBtn');
			$('#C_salesExhibitionViewBtn').attr('id', 'C_salesConcertTicketViewBtn');
			$('#C_salesconcertHallViewBtn').attr('id', 'C_salesConcertTicketViewBtn');
			$('#C_salesBusinessRoomViewBtn').attr('id', 'C_salesConcertTicketViewBtn');
			$('#C_salesExhibitionTicketViewBtn').attr('id', 'C_salesConcertTicketViewBtn');
			
			$('#C_salesSelect').show();
			
			$('#salesDate').hide();
			$('#salesList').hide();
			
			$('#monthSaleChart').empty();
			
			$('#C_salesConcertTicketViewBtn').click(function(){
				$('#salesDate').show();
				$('#salesDate').html($('<h2>'+$('#year option:selected').text()+' '+$('#month option:selected').text()+'공연 티켓 매출'+'</h2>'));
				$.ajax({
					type: "POST",
					url: '/exhibition/customerService/C_salesConcertTicket.do',
					data: {'year':$('#year option:selected').val(), 'month': $('#month option:selected').val()},
					dataType: "json",
					success: function(data) {
						$('#salesList').show();
						$('#salesName').text('공연 이름');
						$('#salesList tr:gt(0)').remove();
						$.each(data.list, function(index, item){
							
							$('<tr/>').append($('<td/>',{
								align : 'center',
								text : item.imageName
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
						
						var title = {
							      text: '콘서트 티켓 별 연 매출'   
							   };
							
							   var xAxis = {
							      categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
							         'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
							   };
							   var yAxis = {
							      title: {
							         text: '매출액 (원)'
							      },
							      plotLines: [{
							         value: 0,
							         width: 1,
							         color: '#808080'
							      }]
							   };   

							   var tooltip = {
							      valueSuffix: '원'
							   }

							   var legend = {
							      layout: 'vertical',
							      align: 'right',
							      verticalAlign: 'middle',
							      borderWidth: 0
							   };

							   var series= data.yearMonth; 

							   var json = {};

							   json.title = title;
							   json.xAxis = xAxis;
							   json.yAxis = yAxis;
							   json.tooltip = tooltip;
							   json.legend = legend;
							   json.series = series;
					   
					   
					    $('#monthSaleChart').highcharts(json); 
					}
				}); 
			});
			
		});
		//콘서트 티켓 매출 현황
		
		//박람회 티켓 매출 현황
		$('.middle.ui.button.exhibitionTicket').click(function(){
			$('#C_salesExhibitionViewBtn').off('click');
			$('#C_salesconcertHallViewBtn').off('click');
			$('#C_salesBusinessRoomViewBtn').off('click');
			$('#C_salesConcertTicketViewBtn').off('click');
			
			$('#C_salesViewBtn').attr('id', 'C_salesExhibitionTicketViewBtn');
			$('#C_salesExhibitionViewBtn').attr('id', 'C_salesExhibitionTicketViewBtn');
			$('#C_salesconcertHallViewBtn').attr('id', 'C_salesExhibitionTicketViewBtn');
			$('#C_salesBusinessRoomViewBtn').attr('id', 'C_salesExhibitionTicketViewBtn');
			$('#C_salesConcertTicketViewBtn').attr('id', 'C_salesExhibitionTicketViewBtn');
			
			$('#C_salesSelect').show();
			
			$('#salesDate').hide();
			$('#salesList').hide();
			
			$('#monthSaleChart').empty();
			
			$('#C_salesExhibitionTicketViewBtn').click(function(){
				$('#salesDate').show();
				$('#salesDate').html($('<h2>'+$('#year option:selected').text()+' '+$('#month option:selected').text()+'박람회 티켓 매출'+'</h2>'));
				$.ajax({
					type: "POST",
					url: '/exhibition/customerService/C_salesExhibitionTicket.do',
					data: {'year':$('#year option:selected').val(), 'month': $('#month option:selected').val()},
					dataType: "json",
					success: function(data) {
						console.log(JSON.stringify(data.yearMonth));
						$('#salesList').show();
						$('#salesName').text('박람회 이름');
						$('#salesList tr:gt(0)').remove();
						$.each(data.list, function(index, item){
							
							$('<tr/>').append($('<td/>',{
								align : 'center',
								text : item.imageName
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
						
						var title = {
							      text: '박람회 티켓 별 연 매출'   
							   };
							
							   var xAxis = {
							      categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
							         'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
							   };
							   var yAxis = {
							      title: {
							         text: '매출액 (원)'
							      },
							      plotLines: [{
							         value: 0,
							         width: 1,
							         color: '#808080'
							      }]
							   };   

							   var tooltip = {
							      valueSuffix: '원'
							   }

							   var legend = {
							      layout: 'vertical',
							      align: 'right',
							      verticalAlign: 'middle',
							      borderWidth: 0
							   };

							   var series= data.yearMonth; 

							   var json = {};

							   json.title = title;
							   json.xAxis = xAxis;
							   json.yAxis = yAxis;
							   json.tooltip = tooltip;
							   json.legend = legend;
							   json.series = series;
					   
					   
					    $('#monthSaleChart').highcharts(json); 
					}
				});
				
			});
			
		});
		
		//박람회 티켓 매출 현황

		
		
	});
</script>
</body>
</html>