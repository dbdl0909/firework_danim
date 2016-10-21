<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
      }
    </style><!-- 구글에 등록된 기본 맵 스타일-->
    <script>
    <%-- 구글 지도 (현재위치 설정) --%>
    
    var metropolis = [ ['Seoul', 37.566678, 126.97843, 16],//서울특별시
		               ['Busan', 35.1795543, 129.0756416, 15],//부산광역시
		               ['Daegu', 35.8714354, 128.601445, 14],//대구광역시
		               ['Incheon', 37.4562557, 126.7052062, 13],//인천광역시
		               ['Gwangju', 35.1595454, 126.8526012, 12],//광주광역시
		               ['Daejeon', 36.3504119, 127.3845475, 11],//대전광역시
		               ['Ulsan', 35.539624, 129.3113596, 10],//울산광역시

		               ['Gyeonggido', 37.275051, 127.0094448, 9],//경기도
		               ['Gangwondo', 37.8855687, 127.7301849, 8],//강원도
		               ['Chungcheongnam', 36.659444, 126.6710533, 7],//충청남도
		               ['Chungcheongbukdo', 36.635684, 127.491389, 6],//충청북도
		               ['Gyeongsangnamdo', 35.2383, 128.692393, 5],//경상남도
		               ['Gyeongsangbukdo', 36.576098, 128.505732, 4],//경상북도
		               ['Jeollanamdo', 34.816219, 126.462912, 3],//전라남도
		               ['Jeollabukdo', 35.8197638, 127.1081298, 2],//전라북도
		               ['Jejuisland', 33.4888341, 126.4980797, 1]//제주도

		             ];// 지역 대분류
		             
		             var contentString = '<div id="content">'+
		             '<div id="siteNotice">'+
		             '</div>'+
		             '<h1 id="firstHeading" class="firstHeading">Uluru</h1>'+
		             '<div id="bodyContent">'+
		             '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
		             'sandstone rock formation in the southern part of the '+
		             'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) '+
		             'south west of the nearest large town, Alice Springs; 450&#160;km '+
		             '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major '+
		             'features of the Uluru - Kata Tjuta National Park. Uluru is '+
		             'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
		             'Aboriginal people of the area. It has many springs, waterholes, '+
		             'rock caves and ancient paintings. Uluru is listed as a World '+
		             'Heritage Site.</p>'+
		             '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
		             'https://en.wikipedia.org/w/index.php?title=Uluru</a> '+
		             '(last visited June 22, 2009).</p>'+
		             '</div>'+
		             '</div>';

    function itMap() {
    	var main = {lat: 36.337, lng: 127.402};
    	
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom: 7,
			center: main
		});//처음 지도 위치.
		
		var markerArray = [];
		var marker;
		for (var i = 0; i < metropolis.length; i++) {
			marker = new google.maps.Marker({
			      position: {lat: metropolis[i][1], lng: metropolis[i][2]},
			      map: map,
			      title: metropolis[i][0],
			      zIndex: metropolis[i][3],
			      index:i
			      
			});//반복할때마다 마커를 찍어준다
			markerArray.push(marker);
		}
		
		var infowindow = new google.maps.InfoWindow({
		    content: contentString,
		    maxWidth: 200
		  });
		
		for(var i = 0; i < markerArray.length; i++) {
			google.maps.event.addListener(markerArray[i], 'click', function() {
				//console.log(this.index);
				map.setZoom(11);
				map.setCenter(markerArray[this.index].getPosition());
				infowindow.open(map, markerArray[this.index]);
			});
		}
		
		
	}
    </script>
</head>
<body>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB8BIEwXt8NNPFQrxBdrh3Eg4_awvKCUN8&callback=itMap" async defer></script>
    <div id="map">
	</div>
</body>
</html>
