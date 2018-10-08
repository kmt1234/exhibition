<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#MOVE_TOP_BTN {
    position: fixed;
    right: 2%;
    bottom: 50px;
    display: none;
    z-index: 999;
    cursor: pointer;
}
.arrow.alternate.circle.up.icon {
    font-size: 3em;
   
}
#topFont{
	font-size: 13px;
    margin-left: 13px;
    margin-top: -12px;
}
</style>

<div id="footer_main" >
	<div style=" display: inline-block; float: left;">
		<img src="../img/ipecLogo.png" style="width: 90px; height: 80px; margin-bottom: 30px; " >
	</div>
	
	<div style="margin-top:25px; width: 380px; display: inline-block; float: left;"  >
		<address>
			서울 특별시 서초구 신반포로 176 (반포동)<br>
			문의전화 : 02-6000-0114 팩스 : 02-1234-1111
			<p> COPYRIGHT 2015-2017 IPEX.ALL RIGHTS RESERVED</p>
		</address>
	</div>
	
	<div style="margin-left:320px; margin-top:25px; min-width: 380px; float: left; display: inline-block;" >
		<a href="/exhibition/customerService/C_contactList.do">주요연락처</a>&nbsp;
		<a href="/exhibition/customerService/C_privacy.do">개인정보처리방침</a>&nbsp;
		<a href="/exhibition/customerService/C_emailRefuse.do">이메일무단수집거부</a>&nbsp;
		<a href="/exhibition/customerService/C_map.do">위치정보</a>&nbsp;
	</div>
</div>
<script>
$(function() {
    $(window).scroll(function() {
        if ($(this).scrollTop() > 300) {
            $('#MOVE_TOP_BTN').fadeIn();
        } else {
            $('#MOVE_TOP_BTN').fadeOut();
        }
    });
    
    $("#MOVE_TOP_BTN").click(function() {
        $('html, body').animate({
            scrollTop : 0
        }, 400);
        return false;
    });
});

</script>

<div id="MOVE_TOP_BTN">
<i class="arrow alternate circle up icon" ></i>
<div id="topFont">TOP</div>
</div>
<!-- <button class="circular ui icon button" id="MOVE_TOP_BTN">
  TOP
</button> -->




