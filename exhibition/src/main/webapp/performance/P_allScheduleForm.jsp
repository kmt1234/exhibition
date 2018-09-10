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
		<div class="ui compact menu" style="width: 20%; height: 980px; ">
			<a class="item" href="P_allScheduleForm.do">��ü����</a> 
			<a class="item" href="P_performanceScheduleForm.do">��������</a> 
			<a class="item" href="P_exhibitionScheduleForm.do">����ȸ����</a>
		</div>
		<!-- ���� ȭ�� -->
		<div class="ui compact menu" style="width: 80%; height: 980px;" >
			<!-- Ÿ��Ʋ -->
			<h2 class="box-container" style="float: center; width: 100%; text-align: left;">
				��ü
				<span class="h-light">����</span>
			</h2>
			<!-- ��ư -->
			<div>
				<input type="button" value="�޷����� ����" 
				style="width:150; height:35; background-color:#ffffff;
				 border:1 solid #f702e7; float: left">
				
				<input type="button" value="����Ʈ�� ����" 
				style="width:150; height:35; font-family:����; background-color:#ffffff;
				 border:1 solid #f702e7; float: left">
				
				
				 <span style="float: right;">
				 <img src="../img/Ex.png" style="width:25; height: 25; " align='absmiddle'> ����ȸ
				 </span>
				 
				 <span style="float: right;">
				 <img src="../img/Ev.png" style="width:25; height: 25;" align='absmiddle'> ����  &ensp;&ensp;
				 </span>
			</div>
			<br>
			<br>
			
			<jsp:include page="P_allCalendar.jsp" ></jsp:include>
			
		</div>
		<!-- footer -->
		<div class="ui compact menu" style="width: 100%; float: right; ">
			<jsp:include page="../main/I_footer.jsp" ></jsp:include>
		</div>
	</div>
</body>
</html>