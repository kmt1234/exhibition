<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
</style>
</head>
<body>
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
   주요시설
   <span class="h-light">연락처</span>
</h2>
<div style="width: 100%;" align="center">
   <table style="width: 100%; height: 40px; " align="center" border="1" bordercolor="#ec008c" cellpadding="4" frame="hsides" rules="rows"
      id="C_contactList_List" class="ui striped table" >
         <tr>
            <th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">분류</th>
            <th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">기관 & 시설</th>
            <th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">명칭</th>
            <th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">담당자</th>
            <th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">연락처</th>
         </tr>
   </table>
   <br><br>
   <div id="C_contactList_list"></div>
      <div class="ui compact selection dropdown">
         <i class="dropdown icon"></i>
         <div class="text">선택하세요</div>
         <div class="menu">
            <div class="item">번호</div>
            <div class="item">제목</div>
         </div>
      </div>
   <div class="ui input" style="width: 40%;">
      <input type="text" id="keyword">
   </div>
   <input class="middle ui button" type="button" value="검색" id="C_contactList_Search">
   </div>
      <div align="left" style="padding-left: 125px; padding-top: 15px;">
         <input class="middle ui button" type="button" id="C_contactList_WriteBtn" value="관리자 작성">
      </div>
   <div>
</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/customerService.js?ver=1"></script>
<script>
$(document).ready(function(){
   $.ajax({
      type : 'POST',
      url : '/exhibition/customerService/getContactList.do',
      dataType : 'json',
      success : function(data){
         $.each(data.list, function(index, item){
            $('<tr/>').append($('<td/>',{
               align : 'center',
               style: 'width: 20%; height: 9%; text-align: center;',
               text : item.classify,
               id : 'classifyA'
            })).append($('<td/>',{
               align : 'center',
               style: 'width: 20%; height: 9%; text-align: center;',
               text : item.facility,
               id : 'facilityA'
            })).append($('<td/>',{
               align : 'center',
               style: 'width: 20%; height: 9%; text-align: center;',
               text : item.title,
               id : 'titleA'
            })).append($('<td/>',{
               align : 'center',
               style: 'width: 20%; height: 9%; text-align: center;',
               text : item.phone,
               id : 'phoneA'
            })).append($('<td/>',{
               align : 'center',
               style: 'width: 20%; height: 9%; text-align: center;',
               text : item.name,
               id : 'nameA'
            })).appendTo($('#C_contactList_List'));
         });
      }
   });
   $('.ui.compact.selection.dropdown').dropdown();   
});
</script>
</body>
</html>