<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<form id="C_contactList_checkWrite" method="post" action="/exhibition/customerService/C_contactList_checkWrite.do">
<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
   주요시설
   <span class="h-light">연락처 작성</span>
</h2>
<table style="width:100%;" >
   <tr>
      <td  align="center" style="width:8%; height:40px; background-color: #f7f6e6; font-size: 15px" >분 류</td>
      <td style="width:20%;">
         <div>
            <input type="text" name="classify" id="classify" style="float: left; width:98%; height:40px;">
            <div id="classifyDiv"></div>
         </div>
      </td>
   </tr>
   <tr>
      <td  align="center" style="width:8%; background-color: #f7f6e6; font-size: 15px;">기관 & 시설</td>
      
      <td style="width:20%; height: 15%">
         <div>
            <input type="text" name="facility" id="facility" style="float: left; width:98%; height:40px;">
            <div id="facilityDiv"></div>
         </div>
      </td>
   </tr>
   <tr>
      <td  align="center" style="width:8%; background-color: #f7f6e6; font-size: 15px;">명 칭</td>
      
      <td style="width:20%; height: 15%">
         <div>
            <input type="text" name="title" id="title" style="float: left; width:98%; height:40px;">
            <div id="titleDiv"></div>
         </div>
      </td>
   </tr>
   <tr>
      <td  align="center" style="width:8%; background-color: #f7f6e6; font-size: 15px;">담 당 자</td>
      
      <td style="width:20%; height: 15%">
         <div>
            <input type="text" name="name" id="name" style="float: left; width:98%; height:40px;">
            <div id="nameDiv"></div>
         </div>
      </td>
   </tr>
   <tr>
      <td  align="center" style="width:8%; background-color: #f7f6e6; font-size: 15px;">연 락 처</td>
      
      <td style="width:20%; height: 15%">
         <div>
            <input type="text" name="phone" id="phone" style="float: left; width:98%; height:40px;">
            <div id="phoneDiv"></div>
         </div>
      </td>
   </tr>
</table>
<input type="button" id="C_contactList_checkWriteBtn" class="middle ui button" value="등록">
</form>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/customerService.js"></script>
</body>
</html>