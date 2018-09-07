<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	.box-container{
		display: inline-block;
		
	}

</style>

</head>
<body>
<div name="footer_main">
<br>
	<div>
		<img src="../img/logo.jpg" style="width: 150px; height: 50px;" align="left">
	</div>
	<div style="width: 380px; height: 50px; float: left" align="left" >
		<address>
			서울 특별시 강남구 영동대로 513 (삼성동,코엑스) 06164<br/>
			문의전화 : 02-6000-0114 팩스 : 02-1234-1111
			<p> bruno mars - When I wa your man</p>
		</address>
		
	</div>
	<div class="box-containe" style="width: 380px; height: 50px; float: right; " align="right">
	<!-- 주요연락처, 개인정보처리방침(1),이메이무단수집거부(2),사이트맵(3) (1,2,3)페이지를 만들어야한다.  -->
		<u1 >
			<il><a href="">주요연락처</a></il>
			<il><a href="">개인정보처리방침</a></il>
			<il><a href="">이메이무단수집거부</a></il>
			<il><a id="siteMap" href="javascript:void(0)" href="">사이트맵</a></il>
	</div>

<br>
</div>
<br>
<script>
	$(document).ready(function(){
		$('#siteMap').click(function(){
			window.open('/exhibition/main/map.jsp',"","top=150px, left=300px, width=900px, height=600px");
		});
	});	
	
</script>
</body>
</html>