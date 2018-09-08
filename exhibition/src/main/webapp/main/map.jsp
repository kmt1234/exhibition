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
	height:600px;
	margin:0 auto;
	max-width:100%;
	width:900px;
}
</style>
</head>
<body>
<div id="map"></div>
<script src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=cpw9RMOfkmb0qIa7Vz23"></script>
<script>
var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(37.503915, 127.004703),
    zoom: 10
});

var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(37.503915, 127.004703),
    map: map
});

var contentString = [
    '<div class="iw_inner">',
    '   <h3>서울특별시청</h3>',
    '   <p>서울특별시 중구 태평로1가 31 | 서울특별시 중구 세종대로 110 서울특별시청<br />',
    '       02-120 | 공공,사회기관 &gt; 특별,광역시청<br />',
    '       <a href="http://www.seoul.go.kr" target="_blank">www.seoul.go.kr/</a>',
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

</script>
</body>
</html>