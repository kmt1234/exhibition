<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<link rel="stylesheet" href="../css/slide.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> -->

</head>
<body>
<header>
	<%-- <jsp:include page="I_header.jsp"></jsp:include> --%>
</header>
<section>
	
	<c:if test="${listLength==null}">
		<img class="pic" src="../img/poster2gg.jpg" width="74%" height="40%">
    </c:if>
    
<c:if test="${listLength!=null}">
<div class="slide">
<ul>
   <c:forEach var="i"  begin="0" end="${listLength}" step="1">
		<li><img class="pic" src="../storage/${list[i].image1}" width="74%" height="40%"></li>
	</c:forEach>
</ul>	
</div>
</c:if>	

</section>
<footer>
</footer>
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
		 var moveX = current * 600;
		 TweenMax.to(container,0.8,{marginLeft:-moveX, ease:Expo.easeOut });
		 clearInterval(interval);
		 interval = setInterval(next,3000);
	 }
	 
	 $(document).ready(init);
 });
  
</script>
</body>