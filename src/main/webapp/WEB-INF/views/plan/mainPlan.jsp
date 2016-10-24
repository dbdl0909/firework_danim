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
    <link rel="stylesheet" href="../../../resources/css/style.css" type="text/css">
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
	    var cityInfoList = new Array();
	    var markerArray = new Array();
	    
	    /* javascript 에서 jstl 사용해 리스트에 담겨있는 전체 도시 리스트를 가져온다. */
	    <c:forEach var="listCityInfo" items="${listCityInfo}">
	    	var cityInfo = new Object();
	    	cityInfo.no = "${listCityInfo.cityInfoNo}";
	    	cityInfo.name = "${listCityInfo.cityInfoName}";
	    	cityInfo.langitude = "${listCityInfo.cityInfoLangitude}";
	    	cityInfo.latitude = "${listCityInfo.cityInfoLatitude}";
	    	cityInfo.summary = "${listCityInfo.cityInfoSummary}";
	    	cityInfo.image = "${listCityInfo.cityInfoImage}";
	    	/* 담은 정보들을 cityInfoList에 담는다. */
	    	cityInfoList.push(cityInfo);
	    </c:forEach>
	    console.log("cityInfoList.length : " + cityInfoList.length);
	    
	    <%-- 구글 지도 (현재위치 설정) --%>
		function initMap() {
			//처음 지도 위치
			var main = {lat: 36.337, lng: 127.402};
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom: 7,
				center: main
			});
			
			//cityInfoList의 length만큼 마커를 찍어준다.
			for (var i=0; i<cityInfoList.length; i++) {
				//console.log(i);
				var marker = new google.maps.Marker({
					icon: "../../resources/images/placeholder.png",
					position: {lat: Number(cityInfoList[i].latitude), lng: Number(cityInfoList[i].langitude)},
				    				//위도와 경도를 Number 타입으로 바꾼다.
					map: map,
					title: cityInfoList[i].name,
					//zIndex: cityInfoList[i][3],
					index:i
				});
				marker.setVisible(false);
				markerArray.push(marker);
			}
			
			//현재 zoom 을 가져온다.
			var zoom = map.getZoom();
			console.log("current zoom : " + zoom);
			//광역시는 먼저 보여준다.
			for(i=73; i<79; i++) {
				markerArray[i].setVisible(true);
			}
			
	 	    //광역시는 zoom 8 (city_no_74 ~ city_no_80)
		    //그 외는 zoom 9 (city_no_01 ~ city_no_73)
			google.maps.event.addListener(map, 'zoom_changed', function() {
				//zoom이 몇인지 담는다.
				zoom = map.getZoom();
				console.log(zoom);
				
				//zoom이 10일때부터 다른 모든 시들도 보여준다.
				if(zoom >= 10) {
					for(i=0; i<72; i++) {
						markerArray[i].setVisible(true);
					}
				} else if(zoom == 8) {	//zoom이 8됬을때 다시 광역시만 보여준다.
					for(i=0; i<72; i++) {
						markerArray[i].setVisible(false);
					}
				}
			});
			
			var infoArray = new Array();
			var infoImageArray = new Array();
			var prevInfowindow = false;
			for(var i = 0; i < markerArray.length; i++) {
				//infoArray 배열에 차례대로 각 도시의 summary를 담는다.
				infoArray.push(cityInfoList[i].summary);
				infoImageArray.push(cityInfoList[i].image);
				google.maps.event.addListener(markerArray[i], 'click', function() {
					var infowindow = new google.maps.InfoWindow({
						content: "<img id='mainPlanCityInfoImage' src=" + infoImageArray[this.index] + ">" + "<span id='mainPlanCityInfo'>" + infoArray[this.index] + "</span>"
					});
					//console.log(this.index);
					map.setZoom(11);
					map.setCenter(markerArray[this.index].getPosition());
					
					//prevInfowindow 변수를 사용해서 이전의 infowindow를 닫는다.
					if(prevInfowindow) {
						prevInfowindow.close();
					}
					prevInfowindow = infowindow;
					infowindow.open(map, markerArray[this.index]);
				});
			}	
		}
	    </script>
	    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB8BIEwXt8NNPFQrxBdrh3Eg4_awvKCUN8&callback=initMap" async defer></script>
	</head>
	<body>
	    <div id="mainPlanDivRoot">
	    	<div id="mainPlanDivTop">
				메인메뉴
			</div>
			<div id="mainPlanDivLeft">
				<ul>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>
			<div id="mainPlanDivContent">
				<div id="map">
				</div>
			</div>
		</div>
	</body>
</html>
