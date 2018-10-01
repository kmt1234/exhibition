<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<ul class="bxslider">

	<c:forEach items="${list1}" var="list1">
		 <li><img src="../storage/${list1.image1}" ></li>
	</c:forEach>

</ul>

</body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
$(document).ready(function(){
	
	//메인화면 연극 슬라이드
	$('.bxslider').bxSlider({
		autoHover: true,
		 auto: true,
	     speed: 500,
	     pause: 4000,
	     mode:'fade',
	     autoControls: false,
	     pager: true,
	     responsive: false,
	     controls: false,
	     
	});
});
</script>
</html>