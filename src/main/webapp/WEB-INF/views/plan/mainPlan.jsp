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
	    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
		    <div>
				<a href="/"><img src="../../resources/images/logo.png" ></a>
			</div>
	    	<div id="mainPlanDivTop">
				<div>
					출발일<input type="date"/>
					숙박일<input type="text"/>
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
				<!-- Modal  <inputy data-toggle='modal' data-target='#myModal'/>
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Modal Header</h4>
							</div>
							<div class="modal-body">
								<p>This is a small modal.</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div> -->
				<div id="map">
				</div>
			</div>
		</div>
		<jsp:include page="../module/footer.jsp"></jsp:include>
	</body>
</html>
