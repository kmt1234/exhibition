<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<header>
	<jsp:include page="I_header.jsp"></jsp:include>
</header>
<section>
	<div style="margin-top: 20px; height:500px;">
	<jsp:include page="${display }"/>
	</div>
</section>

<footer>
<div class="ui five column grid container">
	<div  style="width: 100%; float: right; ">
		<jsp:include page="../main/I_footer.jsp" ></jsp:include>
	</div>
</div>
</footer>
</body>
</html>
