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
   /* border: 1px solid; */
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
<div style="width: 350px; height: 500; float: left;display: inline-block; margin-top: 70px; margin-left: 10px">
   <h3  style="text-align: left;">
      <span id="timeListTitleSecond"></span>
   </h3>
   <form id="businessRoomForm" method="post" action="/exhibition/rental/rentalBusinessRoom.do">
      <table class="ui striped table" id="businessRoomTable">
        <thead>
          <tr align="center">
             <th><input type="checkbox" id="checkAll">선택</th>
             <th>이용일자</th>
             <th>금액</th>
             <th>예약현황</th>
          </tr>
          </thead>
           <tbody id="businessRoomTbody" align="center">

           </tbody>
       </table>
       <span id="timeListTitle">비즈니스룸 이용 일자를 선택하세요</span>
         <c:if test="${code == '1'}">
            <input type="hidden" name="M_Id" value="${homepageMember.getM_Id()}">
            <input type="hidden" name="M_Email" value="${homepageMember.getM_Email()}">
         </c:if>
         <input type="hidden" id="startDate" name="startDate" value="">
         <input type="hidden" name="roomName" value="${businessRoom}">
         <input type="hidden" id="rate" name="rate" value="${rate}">
         <input type="button" value="예약하기" id="rentalBusinessRoomBtn">

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

	//숫자 세자리 콤마찍기 함수
	function numberWithCommas(h) {
	    return h.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
 
	
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
   var rate = numberWithCommas($('#rate').val());

   $(document).ready(function(){
	   
      $('#rentalBusinessRoomBtn').hide();
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
                  $('#rentalBusinessRoomBtn').show();
                  $('#businessRoomTable tr:gt(0)').remove();
                  $('#timeListTitle').empty();
                  $('#timeListTitleSecond').html('<pre>'+startDate + ' 이용 시간 선택'+'</pre>');

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
                           text : rate
                        })).append($('<td/>',{
                           id: 'first',
                           html : "<font color='green'>예약가능<font/>"
                        })).appendTo('#businessRoomTbody');

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
                           text : rate
                        })).append($('<td/>',{
                           id: 'second',
                           html : "<font color='green'>예약가능<font/>"
                        })).appendTo('#businessRoomTbody');

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
                           text : rate
                        })).append($('<td/>',{
                           id: 'third',
                           html : "<font color='green'>예약가능<font/>"
                        })).appendTo('#businessRoomTbody');

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
                           text : rate
                        })).append($('<td/>',{
                           id: 'fourth',
                           html : "<font color='green'>예약가능<font/>"
                        })).appendTo('#businessRoomTbody');


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
				 
                  if($('#first').text()=='예약불가능' && $('#second').text()=='예약불가능' && $('#third').text()=='예약불가능' && $('#fourth').text()=='예약불가능'){
                  	$('#rentalBusinessRoomBtn').hide();
                 	 }
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
               /* $('#businessRoomTable tr:gt(0)').remove(); */
               /* $('#timeListTitle').empty(); */
               /* $('#timeListTitleSecond').html('<pre>'+startDate + ' 이용 시간 선택'+'</pre>'); */
               type : 'POST',
               url : '/exhibition/rental/searchBusinessRoom.do',
               data : {'roomName': '${businessRoom}',
                     'startDate' : startDate},
               async: false,
               dataType: 'json',
               success : function(data) {
                 $('#rentalBusinessRoomBtn').show();
                 $('#businessRoomTable tr:gt(0)').remove();
                 $('#timeListTitle').empty();
                 $('#timeListTitleSecond').html('<pre>'+startDate + ' 이용 시간 선택'+'</pre>');

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
                          text : rate
                       })).append($('<td/>',{
                          id: 'first',
                          html : "<font color='green'>예약가능<font/>"
                       })).appendTo('#businessRoomTbody');

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
                          text : rate
                       })).append($('<td/>',{
                          id: 'second',
                          html : "<font color='green'>예약가능<font/>"
                       })).appendTo('#businessRoomTbody');

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
                          text : rate
                       })).append($('<td/>',{
                          id: 'third',
                          html : "<font color='green'>예약가능<font/>"
                       })).appendTo('#businessRoomTbody');

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
                          text : rate
                       })).append($('<td/>',{
                          id: 'fourth',
                          html : "<font color='green'>예약가능<font/>"
                       })).appendTo('#businessRoomTbody');


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
