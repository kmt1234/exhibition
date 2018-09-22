<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.out_wrap{
	width:100%;
	height:50%;
	text-align:center;
}
.in_wrap{
	margin-top:10%;
}

</style>

<header>
	<jsp:include page="../main/I_header.jsp"></jsp:include>
</header>
    <section class="out_wrap">
   		<div class="in_wrap">
	    	<div style="font-size:30px;">
		    	<label id="main_msg" style="color:red;">탈퇴</label>가 완료되었습니다.
		    </div><br>
		    
		    <div style="font-size:13px;">
		    	<label id="sub_msg" style="color:#828589;">보다 나은 서비스로 다시 만나뵐 수 있기를 바랍니다.</label>
		    </div><br>
		    
	    	<div>
	    		<button class="ui button" onclick="location.href='/exhibition/main/index.do'">메인으로 가기</button>
    		</div>
    	</div>
    </section>