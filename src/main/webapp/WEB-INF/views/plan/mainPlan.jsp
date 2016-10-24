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
    </style><!-- 구글에 등록된 기본 맵 스타일 -->
    <script>
    <%-- 구글 지도 (현재위치 설정) --%>
    
    var cityInfoList = new Array();
    
    /* javascript 에서 jstl 사용해 리스트에 담겨있는 도시 리스트를 가져온다. */
    <c:forEach var="listCityInfo" items="${listCityInfoByCityInfoDoName}">
    	var cityInfo = new Object();
    	cityInfo.name = "${listCityInfo.cityInfoName}";
    	cityInfo.langitude = "${listCityInfo.cityInfoLangitude}";
    	cityInfo.latitude = "${listCityInfo.cityInfoLatitude}";
    	cityInfo.summary = "${listCityInfo.cityInfoSummary}";
    	cityInfo.image = "${listCityInfo.cityInfoImage}";
    	/* 담은 정보들을 cityInfoList에 담는다. */
    	cityInfoList.push(cityInfo);
    </c:forEach>
		            
	function initMap() {
		var main = {lat: 36.337, lng: 127.402};
    	
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom: 7,
			center: main
		});//처음 지도 위치
		
		var markerArray = [];
		var marker;
		for (var i = 0; i < cityInfoList.length; i++) {
			marker = new google.maps.Marker({
				icon: "../../resources/images/placeholder.png",
				position: {lat: Number(cityInfoList[i].latitude), lng: Number(cityInfoList[i].langitude)},
			    				//위도와 경도를 Number 타입으로 바꾼다.
				map: map,
				title: cityInfoList[i].name,
				//zIndex: cityInfoList[i][3],
				index:i
				
			});//반복할때마다 마커를 찍어준다
			markerArray.push(marker);
		}
		
		for(var i = 0; i < markerArray.length; i++) {
			google.maps.event.addListener(markerArray[i], 'click', function() {
				//console.log(this.index);
				map.setZoom(11);
				map.setCenter(markerArray[this.index].getPosition());
			});
		}
		
		
	}
    </script>
</head>
<body>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB8BIEwXt8NNPFQrxBdrh3Eg4_awvKCUN8&callback=initMap" async defer></script>
    <div id="map">
	</div>
	${listCityInfoName}
	
	<c:forEach items="${listCityInfoName}" var="listCityInfoName">
	<span>${listCityInfoName.cityInfoName}</span>
	</c:forEach>
	</body>
</html>
