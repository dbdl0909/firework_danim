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
		    //console.log("cityInfoList.length : " + cityInfoList.length);
	    </script>
	    <script src="../../../resources/js/map.js"></script>
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
				<div id="mainPlanDivLeftCityList">
					<label>도시 목록</label>
				</div>
				<div id="leftMenuCityList">
					<ul id="mainPlanCityUl">
						<c:forEach var="listCityInfo" items="${listCityInfo}">
					    	<li class="cityInfoLi">${listCityInfo.cityInfoName}</li>
					    </c:forEach>
					</ul>
				</div>
			</div>
			<div id="mainPlanDivLeft2">
				<div id="mainPlanDivLeftLabel">
					<label>도시 루트</label>
				</div>
				<div id="leftMenuRouteList">
					<ul id="mainPlanUl">
					</ul>
				</div>
			</div>
			
			<div id="mainPlanDivContent">
				<div id="map">
				</div>
			</div>
		</div>
	</body>
</html>
