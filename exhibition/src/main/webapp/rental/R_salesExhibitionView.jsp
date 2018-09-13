<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../semantic/semantic.min.css">
</head>
<body>
	<table>
		<tr>
			<td>해당연월 선택</td>
			<td>
				<select id="year" name="year">
					<option>- 연도 선택 -</option>
				</select> 
				<select id="month" name="month">
					<option>- 월 선택 -</option>
				</select> 
			</td>
		</tr>
	</table>
<br>
<br>
<input type="button" id="R_salesExhibitionViewBtn" value="매출보기">

<br><br>


<div id="salesDate"></div>
<table id="salesExhibitionList" border="1" style="width: auto; height: auto;">
	<tr>
		<th>부스명</th>
		<th>예약점유 일수</th>
		<th>총 매출액</th>
	</tr>
</table>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="../semantic/semantic.min.js"></script>
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
		
		$('#R_salesExhibitionViewBtn').click(function(){
			$('#salesDate').html($('<h2>'+$('#year option:selected').text()+' '+$('#month option:selected').text()+'</h2>'));
			$.ajax({
				type: "POST",
				url: '/exhibition/rental/R_salesExhibition.do',
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
		           
					$('<tr/>').append($('<th/>',{
						align : 'center',
						colspan : '2',
						text : '월 총 매출액'
					})).append($('<th/>',{
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