<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SiteMap</title>
<style type="text/css">

/* 지도를 생성할 div 요소에 스타일을 설정합니다 */
#map {
	height:580px;
	margin:0 auto;
	max-width:100%;
	width:925px;
}
</style>
</head>
<body>
<div id="map"></div>
<script src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=cpw9RMOfkmb0qIa7Vz23"></script>
<script>

/* var position = new naver.maps.LatLng(37.511964, 127.057988);

var map = new naver.maps.Map('map', {
    center: position,
    zoom: 10
});

var markerOptions = {
	position: position,
	map: map,
	icon: '../img/logo.jpg'
}

var marker = new naver.maps.Marker(markerOptions); */


var coex = new naver.maps.LatLng(37.511964, 127.057988),
    map = new naver.maps.Map('map', {
        center: coex,
        zoom: 10
    }),
    marker = new naver.maps.Marker({
        map: map,
        position: coex
    });


var contentString = [
	    '<div class="iw_inner">',
	    '   <h3>코엑스</h3>',
	    '   <p>서울 특별시 강남구 영동대로 513 (삼성동,코엑스) 06164 <br />',
	    '       <img src="../img/logo.jpg" width="55" height="55" alt="코엑스" class="thumb" /><br />',
	    '       02-120 | 공공,사회기관 &gt; 특별,광역시청<br />',
	    '       <a href="/exhibition/main/index.do" target="_blank">메인화면</a>',
	    '   </p>',
	    '</div>'
	].join('');

var infowindow = new naver.maps.InfoWindow({
	content: contentString,
	maxWidth: 140,
	backgroundColor: "#eee",
	borderColor: "#2db400",
	borderWidth: 5,
	anchorSize: new naver.maps.Size(30, 30),
	anchorSkew: true,
	anchorColor: "#eee",
	pixelOffset: new naver.maps.Point(20, -20)
});

infowindow.open(map, marker);

</script>
</body>
</html>