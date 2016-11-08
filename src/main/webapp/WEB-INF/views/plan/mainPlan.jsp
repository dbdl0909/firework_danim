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
			#planTabList{padding-top:10px;}
			#planTabList li{width:150px; float:left; line-height:2em; cursor:pointer; list-style:none;}
			.hiddenPlan{display:none;}
			.hiddenPlan.on{display:block;}
	    </style><!-- 구글에 등록된 기본 맵 스타일 -->
	    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB8BIEwXt8NNPFQrxBdrh3Eg4_awvKCUN8&callback=initMap" async defer></script>
   		<script src="../../resources/js/monthly.js"></script>
	    <script>
	    	var cityInfoList = [];
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
		    $(document).ready(function() {
		    	$('#planTabList li').click(function(){
		    		var idx = $(this).index();
		    		$('.hiddenPlan').removeClass('on');		    		
		    		if(!($(this).hasClass('on'))){
		    			$('.hiddenPlan').eq(idx).addClass('on');
		    		}
		    		if (!($('#myPlanWrap').is(':hidden'))) {
						$('.leftMenuLi').each(function(){
							var fullstartDate = $(document).find('#startDate').val(),
								startArr = fullstartDate.split("-"),
								startYear = startArr[0],
								startMonth = parseInt(startArr[1], 10),
								startDay = parseInt(startArr[2], 10),
								//fullendDate = $(this).find('enddate').text(),
								thisRoute = $(this).find('.cityName').text(),
								startTime = $(this).find('.startTime').val(),								
								endTime = $(this).find('.endTime').val(),
								eventColor = '#cccccc',
								eventTitle = $(this).find('.cityName').text();
								
								//alert(startTime);
								//console.log('123123');
								if(parseInt(startSplit[0]) >= 12) {
									var startTime = (startSplit[0] - 12)+':'+startSplit[1]+'';
									var startPeriod = 'PM'
								}								
		
								if(parseInt(startTime) == 0) {
									var startTime = '12:'+startSplit[1]+'';
								}
		
								if(parseInt(endSplit[0]) >= 12) {
									var endTime = (endSplit[0] - 12)+':'+endSplit[1]+'';
									var endPeriod = 'PM'
								}
								if(parseInt(endTime) == 0) {
									var endTime = '12:'+endSplit[1]+'';
								}
								function multidaylist(){
									$('.monthly-list-item[data-number="'+i+'"]').addClass('item-has-event').append('<a href="" class="listed-event"  " style="background:'+eventColor+'" title="'+eventTitle+'">'+eventTitle+'<div><div class="monthly-list-time-start">'+startTime+' '+startPeriod+'</div><div class="monthly-list-time-end">'+endTime+' '+endPeriod+'</div></div></a>');
								}
						});
		    		}
		    		
		    	});
				$('#mycalendar').monthly({
					mode: 'event',
					xmlUrl: '/events.xml'
				});
			
				switch(window.location.protocol) {
				case 'http:':
				case 'https:':
				// running on a server, should be good.
				break;
				case 'file:':
				alert('Just a heads-up, events will not work when run locally.');
				}
		
			});
	    </script>
	    <script src="../../../resources/js/map.js"></script>
	</head>
	<body>
	    <div id="mainPlanDivRoot">
		    <div>
				<a href="/"><img src="../../resources/images/logo.png" ></a>
			</div>
	    	<div id="mainPlanDivTop">
	    		<div style="float:left;">
		    		<ul id="planTabList">
		    			<li>도시루트</li>
		    			<li id="planTabDiary">일정표</li>
		    		</ul>
	    		</div>
				<div style="float:left;">
					출발일<input type="date" id="startDate"/>
					숙박일<input type="text" id="stayDay"/>
				</div>
			</div>
			<div class="hiddenPlan on">
				<div id="mainPlanWrap">
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
				</div>
				<div id="mainPlanDivLeft3">
					<div id="mainPlanDivLeftLabel2">
						<label id="clickCityName"></label>
						<img id="mainPlanDivLeft3Close" src="../../resources/images/planIcon/closeArrow.png"/>
					</div>
					
					<div id="mainPlanDivLeftTab">
						<div style="background-color:#E9F5FF;">
							<!-- <label>명소</label> -->
							<p id="mainPlanlandmarkIcon" class="iconImg onIcon"></p>
							<!-- <img id="mainPlanlandmarkIcon" class="iconImg" src="../../resources/images/planIcon/landmarkIcon.png"/> -->
						</div>
						<div style="background-color:#E9F5FF;">
							<!-- <label>식당</label> -->
							<p id="mainPlanEateryIcon" class="iconImg"></p>
							<!-- <img id="mainPlanEateryIcon" class="iconImg" src="../../resources/images/planIcon/eateryIcon.png"/> -->
						</div>
						<div style="background-color:#E9F5FF;">
							<p id="mainPlanStayIcon" class="iconImg"></p>
							<!-- <label>숙소</label> -->
							<!-- <img id="mainPlanStayIcon" class="iconImg" src="../../resources/images/planIcon/stayIcon.png"/> -->
						</div>
						<div style="background-color:#E9F5FF;">
							<p id="mainPlanEventIcon" class="iconImg"></p>
							<!-- <label>축제</label> -->
							<!-- <img id="mainPlanEventIcon" class="iconImg" src="../../resources/images/planIcon/eventIcon.png"/> -->
						</div>
					</div>
					<div id="mainPlanDivLeftTabMenu">
						<div id="leftMenuList">
							<ul id="mainPlanTotalInfoUl" style="margin-bottom: 0px;">
							</ul>
						</div>
					</div>
				</div>
				
				<div id="mainPlanDivContent">
					<div id="map">
					</div>
				</div>
			</div>
		</div>
		<div id="myPlanWrap"  class="hiddenPlan">
			<div class="container">
				<div id="myPlanCalendar" style="width:52.5%; float:left; z-index:2; postion:absolute;">
					<div class="monthly" id="mycalendar"></div>
				</div>
			</div>				
		</div>
		
		<jsp:include page="../module/footer.jsp"></jsp:include>
		
		<div id="landmarkInfoPopWrap" style="width:100%; height:100%; display:none; position:absolute; top:0; background:#000; z-index:999999;">
			<div id="landmarkInfoPopContent" class="container" style="height:100%; background:#fff; margin:0 auto; opacity:1;">
				
			</div>
		</div>
	</body>
</html>
