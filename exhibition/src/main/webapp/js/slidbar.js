$(function(){
	var currentPosition=parseInt($('#slidbar').css("top"));
	$(window).scroll(function(){
		var position=$(window).scrollTop();
		$("#slidbar").stop().animate({
			"top":position+currentPosition+"px"},500);
	});
});