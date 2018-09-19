<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
</head>
<body>
<div style="min-width:1170px; position: relative;">
<header>
<div style="margin-top: 20px; position: relative;  ">
	<jsp:include page="I_header.jsp"></jsp:include>
</div>
</header>
<section>
<!--메인화면  -->
	<div style="margin-top: 20px;  min-width:1170px;   ">
		<jsp:include page="${display }"/>
	</div>
<!--메인화면 아래 부분(일정)  -->
	<div style="margin-top: 20px; margin-left:auto; min-width:1170px; height:200px; position: relative; ">
			<div style=" margin-left:15px; width:270px; height:200px;  display: inline-block; float: left;" >
				<img style="min-width:270; height: 200px " src='../img/B1.jpg'></img>
			</div>
			<div style=" margin-left:20px; width:270px; height:200px;  display: inline-block; float: left;" >
				<img style="min-width:270; height: 200px " src='../img/B1.jpg'></img>
			</div>
			<div style=" margin-left:20px; width:270px; height:200px;  display: inline-block; float: left;" >
				<img style="min-width:270; height: 200px " src='../img/B1.jpg'></img>
			</div>
			<div style=" margin-left:20px; width:270px; height:200px;  display: inline-block; float: left;" >
				<img style="min-width:270; height: 200px " src='../img/B1.jpg'></img>
			</div>
	</div>
</section>
	
<footer>
	<div style="margin-top: 20px;  min-width:1170px; position: relative; ">
		<jsp:include page="../main/I_footer.jsp" ></jsp:include>
	</div>
</footer>
</div>
</body>
</html>
