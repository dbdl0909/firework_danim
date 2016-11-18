<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html> 
	<head>
		<title>다님 플래너</title>
		<!-- <link rel="shortcut icon" href="../../resources/images/favicon.ico"> -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		  <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        width:50%;
                height: 50%;
        
      }
      
      
    </style><!-- 구글에 등록된 기본 맵 스타일-->
 
    <script>
    <%-- 구글 지도 (현재위치 설정) --%>
    
    //console.log("cityInfoList.length : " + cityInfoList.length);
     function itMap() {
    	 var cityInfoList = [];
    		var dateCheckTemp = 0;
    		
    	    /* javascript 에서 jstl 사용해 리스트에 담겨있는 전체 도시 리스트를 가져온다. */
    	    <c:forEach var="PlanGpsList" items="${PlanGpsList}">
    	    	var PlanGps = new Object();
    	    	PlanGps.cityInfoLangitude = "${PlanGpsList.cityInfoLangitude}";
    	    	PlanGps.cityInfoLatitude = "${PlanGpsList.cityInfoLatitude}";
    	    	
    	    	/* 담은 정보들을 cityInfoList에 담는다. */
    	    	cityInfoList.push(PlanGps);
    	    </c:forEach>
    	var main = {lat: 36.337, lng: 127.402};
    	
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom: 7,
			center: main
		});//처음 지도 위치.
		
		var markerArray = [];
		var marker;
		for (var i = 0; i < cityInfoList.length; i++) {
			marker = new google.maps.Marker({
			      position: {lat: cityInfoList[i][0], lng: cityInfoList[i][1]},
			      map: map,
			      index:i
			      
			});//반복할때마다 마커를 찍어준다
			markerArray.push(marker);
		}
     }
		
    </script>
    
    
    
		<!-- google chrome CDN Jquery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="../../../resources/css/style.css">
		<style type="text/css">
			thead>tr>th{text-align: center;}
			tbody>tr>td:nth-child(1){width:80px; text-align: center;}
			tbody>tr>td:nth-child(3){width:110px; text-align: center;}
			tbody>tr>td:nth-child(4){width:130px; text-align: center;}
			tbody>tr>td:nth-child(5){width:70px; text-align: center;}
			tbody>tr>td:nth-child(6){width:70px; text-align: center;}
			/* tbody>tr:HOVER{color:#da8c92;cursor: pointer;} */
			.menu-wrap{text-align: right;}
			.form-wrap{text-align: center;}
		</style>
	</head>
<body>

<jsp:include page="../module/header.jsp" />
	<div class="table-responsive"></div>
		<table class="table table-striped">
			<thead>
				<c:forEach end="0" items="${PlanDetailList}" var="PlanDetailList">
					<h1>${PlanDetailList.planName}</h1>
				</c:forEach>
					<div id="map" style="float:left;width:200;"></div> 

				<c:forEach end="0" items="${PlanDetailList}" var="PlanDetailList"
					varStatus="PlanDetail">
					
					<dl>
						<dt>${PlanDetailList.cityRouteDepartureCity}(${PlanDetailList.cityRouteArrivalCity})</dt>
						<dd>날짜:${PlanDetailList.cityRouteDate}</dd>
						<dd>시간:${PlanDetailList.cityRouteDepartureTime}~${PlanDetailList.cityRouteArrivalTime}</dd>
						<dd>메모:${PlanDetailList.cityRouteMemo}</dd>
						<dt>랜드마크:${PlanDetailList.landmarkPlanNo}(${PlanDetailList.landmarkInfoNo})</dt>
						<dt>숙박정보:${PlanDetailList.stayPlanNo}(${PlanDetailList.stayInfoNo})</dt>
						<dd>체크인:${PlanDetailList.stayPlanTime}</dd>
						<dd>메모:${PlanDetailList.stayPlanMemo}</dd>
						
					</dl>
					
				</c:forEach>
			</thead>
			
			<tbody >
			
			</tbody>
					

		</table>
		
	<jsp:include page="../module/footer.jsp" />
       <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB8BIEwXt8NNPFQrxBdrh3Eg4_awvKCUN8&callback=itMap" async defer></script>
   
</body>
</html>