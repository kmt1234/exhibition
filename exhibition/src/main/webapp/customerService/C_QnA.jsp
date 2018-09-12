<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#seqA{
   margin-left :100px;
}
#subjectA{
   margin-left:500px;
}
selector    : {
  accordion : '.accordion',
  title     : '.title',
  trigger   : '.title',
  content   : '.content'
}


</style>
</head>
<body>
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
   자주묻는
   <span class="h-light">질문</span>
</h2>
<div >
   <input type="button" value="위치/교통" id="C_QnA_location"
   style="width:16%; height:35; background-color:#ffffff;
    border:1 solid #f702e7;" class="QnA">
   
   <input type="button" value="주차" id="C_QnA_parking"
   style="width:16%; height:35; font-family:돋움; background-color:#ffffff;
    border:1 solid #f702e7; " class="QnA">
    
    <input type="button" value="전시&공연" id="C_QnA_exhibition"
   style="width:16%; height:35; font-family:돋움; background-color:#ffffff;
    border:1 solid #f702e7; " class="QnA">
    
    <input type="button" value="임대" id="C_QnA_rent"
   style="width:16%; height:35; font-family:돋움; background-color:#ffffff;
    border:1 solid #f702e7; " class="QnA">
    
    <input type="button" value="시설" id="C_QnA_facility"
   style="width:16%; height:35; font-family:돋움; background-color:#ffffff;
    border:1 solid #f702e7; " class="QnA">
    
    <input type="button" value="기타" id="C_QnA_etc"
   style="width:16%; height:35; font-family:돋움; background-color:#ffffff;
    border:1 solid #f702e7; " class="QnA">
</div>
<div style="padding-top: 15px;">
   <table style="width: 100%; height: 40px; " align="center" border="1" bordercolor="#ec008c" cellpadding="2" frame="hsides" rules="rows">
      <tr>
         <!-- <th style="width: 10%; height: 7%; text-align:center;" id="seqA" >번호</th> -->
         <th style=" height: 7%; " id="subjectA">제목</th>
      </tr>
   </table>
</div>
<table id="C_QnA_List" class="accordion"></table>
<div align="left">
   <input class="middle ui button" type="button" value="작성" id="C_QnA_writeBtn">
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/customerService.js"></script>
<script>
$(document).ready(function(){
   var classify = "위치/교통";
   $.ajax({
      type : 'POST',
      url : '/exhibition/customerService/getQnA_Classify.do',
      data : {'classify' : classify },
      dataType : 'json',
      success : function(data){
         $.each(data.list, function(index, item){
            $('<tr/>',{
               class : 'title'
            }).append($('<td/>',{
               align : 'center',
               id : 'subjectA',
               href : 'javascript:void(0)',
               text : item.subject
            })).appendTo($('#C_QnA_List'));
            
            $('<tr/>',{
               class : 'content'
            }).append($('<td/>',{
               align : 'center',
               id : 'contentA',
               text : item.content
            })).appendTo($('#C_QnA_List'));
         });
      }
   });
   
   $('.QnA').click(function(){
      var child = $('#C_QnA_List').empty();
      var classify = $(this).val();
      $.ajax({
         type : 'POST',
         url : '/exhibition/customerService/getQnA_Classify.do',
         data : {'classify' : classify },
         dataType : 'json',
         success : function(data){
            $.each(data.list, function(index, item){
               $('<tr/>',{
                  class : 'title'
               }).append($('<td/>',{
                  align : 'center',
                  id : 'subjectA',
                  href : 'javascript:void(0)',
                  text : item.subject
               })).appendTo($('#C_QnA_List'));
               
               $('<tr/>',{
                  class : 'content'
               }).append($('<td/>',{
                  align : 'center',
                  id : 'contentA',
                  text : item.content
               })).appendTo($('#C_QnA_List'));
            });
         }
      });
   });
   
   $('.accordion').accordion({
      selector: {
         trigger: '.title'
      }
   });
});
</script>

</body>
</html>