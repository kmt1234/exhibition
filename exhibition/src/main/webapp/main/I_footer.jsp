<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	.box-container{
		display: inline-block;
		
	}

</style>

</head>
<body>
<div name="footer_main">
<br>
	<div>
		<img src="../img/logo.jpg" style="width: 150px; height: 50px;" align="left">
	</div>
	<div style="width: 380px; height: 50px; float: left" align="left" >
		<address>
			���� Ư���� ������ ������� 513 (�Ｚ��,�ڿ���) 06164<br/>
			������ȭ : 02-6000-0114 �ѽ� : 02-1234-1111
			<p> bruno mars - When I wa your man</p>
		</address>
		
	</div>
	<div class="box-containe" style="width: 380px; height: 50px; float: right; " align="right">
	<!-- �ֿ俬��ó, ��������ó����ħ(1),�̸��̹��ܼ����ź�(2),����Ʈ��(3) (1,2,3)�������� �������Ѵ�.  -->
		<u1 >
			<il><a href="">�ֿ俬��ó</a></il>
			<il><a href="">��������ó����ħ</a></il>
			<il><a href="">�̸��̹��ܼ����ź�</a></il>
			<il><a id="siteMap" href="javascript:void(0)" href="">����Ʈ��</a></il>
	</div>

<br>
</div>
<br>
<script>
	$(document).ready(function(){
		$('#siteMap').click(function(){
			window.open('/exhibition/main/map.jsp',"","top=150px, left=300px, width=900px, height=600px");
		});
	});	
	
</script>
</body>
</html>