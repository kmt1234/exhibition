<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"><!--달력 ui-->

<!--시간 ui-->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

<style>
.ui.inverted.divider {
    margin: 5px 0;
}
#textf {
	width: 40%;
	float: left;
}
.middle.ui.button{
	width: 19%;
}
</style>
</head>
<body style="height:100%;">
<div align="center" style="width: 100%;">
<form name="imageboardWriteForm" id="imageboardWriteForm" method="post"
	enctype="multipart/form-data">
	
	<!-- 맨위의 탭 -->
	<div align="left">
		<a class="middle ui button" class="active item" id="imageTap">
			메인
	  	</a>
	  	<a class="middle ui button" class="item" id="exhibitionTap">
	    	박람회
	 	</a>
	  	<a class="middle ui button" class="item" id="PlayTap">
	    	연극
	  	</a>
	  	<a class="middle ui button" class="item" id="HotelTap">
	    	숙박
	  	</a>	
	</div>
	<input type="hidden" name="postSelect" id="postSelect" value='0'>
	
	<!-- 메인창 -->
	<div class="" id="imageboardWrite" align="left" >
		<div>
			<div style="width: 100%">
			  	<div class="content" >
			    	<div class="description" align="left">
			    	<br>
				    	<div><jsp:include page="INCLUDE_imageboard.jsp"></jsp:include></div>
			    		
			    		<br><br>
						<div class="ui two buttons">
					    	<div class="middle ui button" id="checkImageboardWrite" style="width: 30%;">이미지등록</div>
					    	<div style="width: 5%;">&nbsp;</div>
					    	<button class="middle ui button" type="reset" id="writeReset" style="width: 30%;">다시작성</button>
					    	<div style="width: 5%;">&nbsp;</div>
					    	<div class="middle ui button" id="" style="width: 30%;">목록</div>
					    </div>	
			  		</div><!--class="description"  -->
				  	
				</div><!--class="content"  -->
			</div><!--class="ui card"-->
		</div><!--align="center"  -->
	</div><!--id="modify-Div"  -->
	
</form>
</div>

</body>
<link rel="stylesheet" type="text/css" href="../semantic/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="../semantic/semantic.min.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script><!--시간  -->
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script><!--달력-->
<script src="../js/boardAdd.js"></script>
</html>