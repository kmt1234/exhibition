<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script>
$(document).ready(function(){
    $('.bxslider').bxSlider({
    	autoHover: true,
    	 auto: true,
         speed: 500,
         pause: 4000,
         mode:'fade',
         autoControls: false,
         pager: true,
         responsive: false
    });
});

</script>
<style>
.bx-pager.bx-default-pager{
	top:166px;
}
</style>
</head>
<body>
<ul class="bxslider">
    <li><img src="../storage/lier.jpg" height="200px" width="280px"/></li>
    <li><img src="../storage/summer.jpg" height="200px" width="280px"/></li>
    <li><img src="../storage/elephant.jpg" height="200px" width="280px"/></li>
    <li><img src="../storage/moon.jpg" height="200px" width="280px"/></li>
</ul>
</body>
</html>