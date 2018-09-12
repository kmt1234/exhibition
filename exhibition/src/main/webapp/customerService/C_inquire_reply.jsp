<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#subjectA:link{color:black; text-decoration: none;}
#subjectA:visited{color:black; text-decoration: none;}
#subjectA:hover{color:green; text-decoration: underline; font-weight: bold; cursor: pointer;}
#subjectA:active{color:black; text-decoration: none;}
</style>
</head>
<body>
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
   문의
   <span class="h-light">하기</span>
</h2>

<div style="width: 100%;" align="center">
   <table style="width: 100%; height: 40px; " align="center" border="1" bordercolor="#ec008c" cellpadding="4" frame="hsides" rules="rows"
   id="C_inquire_List" class="ui striped table" >
      <tr>
         <th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">번호</th>
         <th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">제목</th>
         <th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">작성자</th>
         <th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">이메일</th>
         <th style="width: 20%; height: 7%; padding-top: 10px; text-align: center;">등록일</th>
      </tr>
   </table>
   <br><br>
   <div id="C_inquire_PagingDiv"></div>
   <div style="width: 100%;">
      <div class="ui compact selection dropdown">
         <i class="dropdown icon"></i>
         <div class="text">선택하세요</div>
         <div class="menu">
            <div class="item">목록</div>
            <div class="item">내용</div>
         </div>
      </div>
      
      <div class="ui input" style="width: 40%;">
       <input type="text" >
      </div>
      
       <input type="button" class="middle ui button"  value="검색" id="C_inquireSearch">
   </div>
</div>
<script src="../semantic/semantic.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
$(document).ready(function(){
   $.ajax({
      type : 'POST',
      url : '/exhibition/customerService/getInquireList.do',
      dataType : 'json',
      success : function(data){
         $.each(data.list, function(index, item){
            $('<tr/>').append($('<td/>',{
               align : 'center',
               style: 'width: 20%; height: 9%; text-align: center;',
               text : item.seq,
               id : 'seqA'
            })).append($('<td/>',{
               align : 'center',
               id : 'subjectA',
               style: 'width: 20%; height: 9%; text-align: center;',
               class : item.seq+"",
               href : 'javascript:void(0)',
               text : item.subject
            })).append($('<td/>',{
               align : 'center',
               style: 'width: 20%; height: 9%; text-align: center;',
               text : item.name,
               id : 'nameA'
            })).append($('<td/>',{
               align : 'center',
               style: 'width: 20%; height: 9%; text-align: center;',
               text : item.email,
               id : 'emailA'
            })).append($('<td/>',{
               align : 'center',
               style: 'width: 20%; height: 9%; text-align: center;',
               text : item.logtime,
               id : 'logtime'
            })).appendTo($('#C_inquire_List'));
         });
      }
   });
   
   $('#C_inquire_List').on('click','#subjectA',function(){
      var seq = $(this).prev().text();
      location.href="/exhibition/customerService/C_inquire_View.do?seq="+seq;
   });
   $('.ui.compact.selection.dropdown').dropdown();   
});
</script>

</body>
</html>