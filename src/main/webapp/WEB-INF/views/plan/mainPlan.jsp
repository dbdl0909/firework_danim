<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Simple Map</title>
	    <meta name="viewport" content="initial-scale=1.0">
	    <link rel="stylesheet" href="../../../resources/css/style.css" type="text/css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	    <style>
			html, body {
				height: 100%;
				margin: 0;
				padding: 0;
			}
	    </style><!-- 구글에 등록된 기본 맵 스타일 -->
	    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB8BIEwXt8NNPFQrxBdrh3Eg4_awvKCUN8&callback=initMap" async defer></script>
	    <script>
		    var cityInfoList = new Array();
		    var markerArray = new Array();
		    var addButton;
		    var markerIndex;
		    
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
				for(i=73; i<=79; i++) {
					markerArray[i].setVisible(true);
				}
				
		 	    //광역시는 zoom 8 (city_no_74 ~ city_no_80)
			    //그 외는 zoom 9 (city_no_01 ~ city_no_73)
				google.maps.event.addListener(map, 'zoom_changed', function() {
					//zoom이 몇인지 담는다.
					zoom = map.getZoom();
					//console.log(zoom);
					
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
				
		 	    var infoNameArray = new Array();
				var infoSummaryArray = new Array();
				var infoImageArray = new Array();
				var prevInfowindow = false;
				for(var i = 0; i < markerArray.length; i++) {
					//infoArray 배열에 차례대로 각 도시의 name, summary, image들을 담는다.
					infoNameArray.push(cityInfoList[i].name);
					infoSummaryArray.push(cityInfoList[i].summary);
					infoImageArray.push(cityInfoList[i].image);
					
					//makrerArray의 i번째를 클릭했을때 실행할 함수
					google.maps.event.addListener(markerArray[i], 'click', function() {
						markerIndex = this.index;
						//console.log(markerIndex);
						
						//시 마커를 클릭했을때 보여줄 내용을 담은 함수
						var infowindow = new google.maps.InfoWindow({
							content: "<img id='mainPlanCityInfoImage' src=" + infoImageArray[markerIndex] + "/>" +
									 "<span id='mainPlanCityInfo'>" + infoSummaryArray[markerIndex] + "</span>" +
									 "<div id='mainPlanAddButton'>" +
									 	"<img id='addButton' src='../../resources/images/addButton.png'/>" +
									 "</div>"
						});
						//console.log(this.index);
						map.setZoom(11);
						map.setCenter(markerArray[markerIndex].getPosition());
						
						//prevInfowindow 변수를 사용해서 이전의 infowindow를 닫는다.
						if(prevInfowindow) {
							prevInfowindow.close();
						}
					    //prevInfowindow 변수에 infowindow를 담는다.
						prevInfowindow = infowindow;
					    //시 마커를 클릭했을때 infowindow를 오픈하여 내용을 보여준다. 
						infowindow.open(map, markerArray[markerIndex]);
						
						google.maps.event.addListener(infowindow, 'domready', function() {
					    	document.getElementById('addButton').addEventListener('click', function(event) {
					    		//alert('click : ' + markerIndex);
					    		$('#mainPlanDivLeft ul').append("<li class='leftMenuLi'>" + infoNameArray[markerIndex] + "<img class='removeButton' id='mainPlanRemoveButton' src='../../resources/images/removeButton.png'/>" + "</li>");
					    		lineFunction();
					    	});
						});
					});
				}	
			}
		</script>
		<script>
		var lineFunction =  function(){
			//console.log(markerIndex);
			//console.log(cityInfoList[markerIndex].latitude);
			//console.log(cityInfoList[markerIndex].langitude);
			var pathArray = new Array();
			
/*해야할것 클릭한 시만 리스트로 받아와서 경로를 추가해야한다!!
 * 
 *
 *
 */
			
			
			var pathLine = new google.maps.Polyline({
				path: [{lat: Number(cityInfoList[markerIndex].latitude), lng: Number(cityInfoList[markerIndex].langitude)}]
			});
		};
			
			$(document).ready(function(){
				//removeButton 이미지 태그를 클릭했을때 실행할 함수
				$('body').on('click', '.removeButton', function() {
					//클릭한 태그의 번호를 가져와서 그 번호에 해당하는 li 태그를 제거한다.
					var removeButtonIndex = $('.removeButton').index(this);
					//console.log('removeButtonIndex : ' + removeButtonIndex);
					$('.leftMenuLi').eq(removeButtonIndex).remove();
					
				});
			});
		</script>
	</head>
	<body>
	    <div id="mainPlanDivRoot">
	    	<div id="mainPlanDivTop">
				<h1>DANIM</h1>
				<div>
					출발일<input type="date"/>
					
				</div>
			</div>
			<div id="mainPlanDivLeft">
				<ul>
				</ul>
			</div>
			<div id="mainPlanDivContent">
				<div id="map">
				</div>
			</div>
		</div>
	</body>
</html>
