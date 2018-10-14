 $(document).ready(function(){
	 var code = $('#code').val()
	 if(code == '1'){
		 
	 var link; 
	 //슬라이더 이미지 불러오기
	 $.ajax({
		type : 'GET',
		url : '/exhibition/customerService/getImageboardSlide.do?code='+$("#code").val(),
		dataType : 'json',
		success : function(data){
			if(data.list.length==0) alert('메인 이미지 없습니다. 관리자에게 문의하십시오');
			else{
				$.each(data.list, function(index,item){
					$('#mainSlideUl').append($('<li/>',{
												style : 'display: inline-block'
												})
							   					.append($('<a/>',{
							   						href : item.eventLink,
							   						class : 'a_Link',
							   						target : '_blank'
							   					}).append($('<img>',{
																	src : '../storage/'+item.image1+'',
																	style : 'display:block; border:0;',
																	class : 'pic',
																	value : item.image1,
																	id : 'image1'
								})))).appendTo('.slide',{
									style : 'width : 6000px; list-style: none; font-size: 0'
								});
					link = item.eventLink;
					
					//메인 이미지의 링크가 없으면 클릭 사라짐
					if(link=="http://localhost:8080/exhibition/main/index.do"){
						$('.a_Link').removeAttr('href');						
					}
					
				});//each
				
				
				
				
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
					 var moveX = current * 1150;
					 TweenMax.to(container,0.8,{marginLeft:-moveX, ease:Expo.easeOut });
					 clearInterval(interval);
					 interval = setInterval(next,3000);
				 }
				 
				 $(document).ready(init);
				
			}//else
		}//success
	 });//ajax
	 }else if(code == '6'){
		 $.ajax({
		type : 'POST',
		url : '/exhibition/customerService/getImageboardSlide1.do',
		data : {'list':$('#list').val(), 'list1' : $('#list1').val()},
		dataType : 'json',
		success : function(data){
			if(data.list.length==0) alert('메인 이미지 없습니다. 관리자에게 문의하십시오');
			else{
				$.each(data.list, function(index,item){
					$('#mainSlideUl').append($('<li/>',{
												style : 'display: inline-block'
												})
							   					.append($('<img>',{
																	src : '../storage/'+item.image1+'',
																	style : 'cursor:pointer; display:block; border:0; width:600px; heigth:300px',

																	class : 'pic',
																	id : 'image1'
								}))).appendTo('.slide',{
									style : 'width : 100%; list-style: none; font-size: 0'
								});
				});
				
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
				
			}//else
		}//success
	 });//ajax
	 }
	 	 
 });