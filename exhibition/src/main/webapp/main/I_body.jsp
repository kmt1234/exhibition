<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<link rel="stylesheet" href="../css/slide.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<section id="mainSection">
	<div id="mainSlideDiv" class="slide">
		<ul id="mainSlideUl"></ul>
		<input type="hidden" id="code" value="${code }">	
	</div>
</section>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>
<script src="../js/mainSlide.js"></script>

</body>