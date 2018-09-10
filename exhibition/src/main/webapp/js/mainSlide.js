 $(document).ready(function(){
	 //슬라이더 이미지 불러오기
	 $.ajax({
		type : 'GET',
		url : '/exhibition/customerService/getImageboardSlide.do',
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data)); 데이터 확인
			if(data.list.length==0) alert('메인 이미지 없습니다. 관리자에게 문의하십시오');
			else{
				$.each(data.list, function(index,item){
					//alert(data.list.length); 이미지 개수
					
					$('#mainSlideUl').append($('<li/>',{
												style : 'display: inline-block'
												})
							   					.append($('<img>',{
																	src : '../storage/'+item.image1+'',
																	style : 'cursor:pointer; display:block; border:0; width:600px; heigth:300px',

																	class : 'pic',
																	id : 'image1'
								}))).appendTo('.slide',{
									style : 'width : 2400px; list-style: none; font-size: 0'
								});
					
					
					
					
				//	$('#imageSlide').attr('src','../storage/'+item.image1+'');
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
					 var moveX = current * 600;
					 TweenMax.to(container,0.8,{marginLeft:-moveX, ease:Expo.easeOut });
					 clearInterval(interval);
					 interval = setInterval(next,3000);
				 }
				 
				 $(document).ready(init);
				
			}//else
		}//success
	 });//ajax
 });