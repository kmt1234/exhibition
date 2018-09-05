<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<link rel="stylesheet" href="../css/slode.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> -->


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
 
 	//이미지 슬라이드 ajax
 	/* $.ajax({
 		type : 'POST',
 		url : '/exhibition/main/I_body.do',
 		data : {'mainDefaultImage':$('#mainDefault-image').val()},
 		dataType : 'text',
 		success : function(data){
 			alert('dddd');
 			alert(JSON.stringify(data));
 		}//success
 	});//ajax */
 
</script>

</head>
<body>
<header>
	<%-- <jsp:include page="I_header.jsp"></jsp:include> --%>
</header>
<section>

	<!-- <input type="hidden" value="../storage/build.jpg" id="mainDefault-image"> -->
    
<div class="slide">
<ul>
   <c:forEach var="i"  begin="0" end="${listLength}" step="1">
		<li><img class="pic" src="../storage/${list[i].image1}" width="74%" height="40%"></li>
	</c:forEach>
</ul>	
  <%-- 	<c:forEach var="row" items="list">
		<c:forEach var="col" items="row">
			<li><img class="pic" src="../storage/${col .getImage1()}" width="74%" height="40%"></li>
		</c:forEach>  	
  	</c:forEach> --%>
</div>
	
</section>
<footer>
</footer>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>
</body>