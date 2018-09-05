<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style>
	.box-container{
		display: inline-block;
		padding-bottom: 40px;
		padding-left: 20px;
		padding-right: 20px;
		padding-top: 20px;
		font-weight:normal;
		font-size: 50px;
	}
	.h-light{
		color: #ec008c;
	
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="../main/I_header.jsp"></jsp:include>
	</header>
	<br>
	<br>
	<div class="ui five column grid container">
		<!-- ���̵�� �޴� -->
		<div class="ui compact menu" style="width: 20%; height: 977px; ">
			<a class="item" href="P_allScheduleForm.jsp">��ü����</a> 
			<a class="item" href="P_performanceScheduleForm.jsp">��������</a> 
			<a class="item" href="P_exhibitionScheduleForm.jsp">����ȸ����</a>
		</div>
		<!-- ���� ȭ�� -->
		<div class="ui compact menu" style="width: 80%; height: 900px;" >
			<!-- Ÿ��Ʋ -->
			<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
				�̹���
				<span class="h-light">���ε�</span>
			</h2>
			<!-- ��ư -->
			<!-- <div>
				<input type="button" value="�޷����� ����" 
				style="width:150; height:35; background-color:#ffffff;
				 border:1 solid #f702e7; float: left">
				
				<input type="button" value="����Ʈ�� ����" 
				style="width:150; height:35; font-family:����; background-color:#ffffff;
				 border:1 solid #f702e7; float: left">
			</div> -->
			<br>
			<br>
			
			<jsp:include page="C_imageboardWriteForm.jsp" ></jsp:include>
			
		</div>
		<!-- footer -->
		<div class="ui compact menu" style="width: 100%; float: right; ">
			<jsp:include page="../main/I_footer.jsp" ></jsp:include>
		</div>
	</div>
</body>
</html>