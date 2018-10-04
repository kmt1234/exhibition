<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<link rel="stylesheet" href="../css/slide.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<section id="mainSection">
	<div id="mainSlideDiv" class="slide" >
		<ul id="mainSlideUl" >
			<c:forEach items="${list1}" var="list1">
				 <li style="display: inline-block;"><img class="pic" style="cursor:pointer; display:block; border:0;" src="../storage/${list1.image1}" ></li>
			</c:forEach>
		</ul>
	</div>
</section>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>
<script>
$(document).ready(function(){

	 var current = 0;
	 var max = 0;
	 var container;
	 var interval;
	 
	 function init(){
		 container = $('.slide ul');
		 max = container.children().length;
		 interval = setInterval(next,3000);
	 }
	 function prev(e){
		 current--;
		 if(current < 0 ) current = max-1;
		 animate();
	 }
	 function next(e){
		 current++;
		 if(current > max-1 ) current = 0;
		 animate();
	 }
	 
	 function animate(){
		 var moveX = current * 1150;
		 TweenMax.to(container,0.8,{marginLeft:-moveX, ease:Expo.easeOut });
		 clearInterval(interval);
		 interval = setInterval(next,3000);
	 }
	 
	 $(document).ready(init);	
});
</script>
</html>