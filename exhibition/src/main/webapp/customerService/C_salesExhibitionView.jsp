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
				<button class="middle ui button" style="width: 100%;" >
					박람회 부스매출
				</button> 
			</td>
			<td>
				<button class="middle ui button" style="width: 100%;" >
					박람회 티켓매출
				</button> 
			</td>
			<td>
				<button class="middle ui button" style="width: 100%;" >
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
	<div style="float:left; display: inline-block;" >	
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
			<input type="button" id="C_salesExhibitionViewBtn" value="매출보기">
		</div>
	</div>
</div>
<br><br>
	<table border="1" id="salesExhibitionList">
		<tr>
			<th>부스명</th>
			<th>예약점유 일수</th>
			<th>총 매출액</th>
		</tr>
	</table>
<script>
	$(document).ready(function(){
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
		
		$('#C_salesExhibitionViewBtn').click(function(){
			$('#salesDate').html($('<h2>'+$('#year option:selected').text()+' '+$('#month option:selected').text()+'</h2>'));
			$.ajax({
				type: "POST",
				url: '/exhibition/customerService/C_salesExhibition.do',
				data: {'year':$('#year option:selected').val(), 'month': $('#month option:selected').val()},
				dataType: "json",
				success: function(data) {
					alert(JSON.stringify(data));
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
</script>
</body>
</html>