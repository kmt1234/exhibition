<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <table>
<tr>
<td>
	<jsp:include page="${display}"/>
</td>
</tr>

</table> --%>
<div>
	<div style=" margin-left:400px;margin-top: 20px; border: 1px solid;">
	<jsp:include page="I_header.jsp"/>
	</div>



	<div style=" margin-left:400px;margin-top: 20px; border: 1px solid;">
	 	<jsp:include page="${display}"/>
	</div>



	<div style=" margin-left:400px;margin-top: 20px; border: 1px solid;">
	<jsp:include page="I_footer.jsp"/>
	</div>
</div>
</body>
</html>
