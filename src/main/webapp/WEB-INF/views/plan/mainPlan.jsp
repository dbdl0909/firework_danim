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
	    	var startDateInit;
	    	//var dateCheckTemp = 0;
	    	
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
		    	document.getElementById('startDate').valueAsDate = new Date();
		    	startDateInit = new Date(document.getElementById('startDate').valueAsDate);
		    	
		    	var endDate = new Date();
	    		var stayDay = 0;
		    	$('body').bind('propertychange change click keyup input', function(){
			    	var startDate = new Date($('#startDate').val()),
			    		year = startDate.getFullYear(),
			    		month = startDate.getMonth()+1,
			    		date = startDate.getDate(),
			    		stayDay = parseInt($('#stayDay').val());
			    		endDate.setFullYear(year);
			    		endDate.setMonth(month-1);
			    		endDate.setDate(date+stayDay);
			    		//alert(endDate.getFullYear());
			    		document.getElementById('endDate').valueAsDate = endDate;
		    	});
		    	$('#planTabList li').click(function(){
		    		var idx = $(this).index();
		    		$('.hiddenPlan').removeClass('on');		    		
		    		if(!($(this).hasClass('on'))){
		    			$('.hiddenPlan').eq(idx).addClass('on');
		    		}

		    		var monthly = new Object(); 
		    		var plan = new Array();
		    		var routeArr = new Array();
		    		$('.leftMenuLi').each(function(i){
			    		var randomColor = '#'+Math.round(Math.random()*0xFFFFFF).toString(16);
		    			var planContent = new Object();
			    		planContent.id = i,
			    		planContent.name = $(this).find('.cityName').val(),
			    		planContent.startDate = $(this).find('.cityRouteStartDate').val(),
			    		planContent.endDate = $(this).find('.cityRouteEndDate').val(),
			    		planContent.startTime = $(this).find('.startTime').val(),
			    		planContent.endTime = $(this).find('.endTime').val(),
			    		planContent.color = randomColor,
			    		planContent.url = '';
			    		//var temp;
			    		$('.landmarkName').each(function(){
			    			routeArr.push($(this).text());
			    		});
			    		planContent.route = routeArr,
			    		//alert(planContent.route)
			    		//planContent.route = temp,
			    		plan.push(planContent); 
		    		});
		    		monthly.monthly = plan;
		    		var jsonInfo = JSON.stringify(monthly);
		    		localStorage.setItem('events',  JSON.stringify(monthly));
		    		document.getElementById("jsonContainer").innerHTML = localStorage.getItem('events');
		    	});
		    	$('#closeLandmarkInfoPop').click(function(){
		    		$('#landmarkInfoPopWrap').hide();		    		
		    	})
				$('#mycalendar').monthly({
					mode: 'event',
					jsonUrl: '/plan/mainPlan',
					dataType: 'json'
				});
				
			});
	    </script>
	    <script src="../../../resources/js/map.js"></script>
	    <style> 
	    	#logoWrap{height:80px;}
	    	#logoWrap img{margin-top:20px; margin-left:30px;}
	    	#tabWrapt{float:right;}
	    	#planTabList li{width:50%; color:#434343; font-size:18px; font-weight: bold;}
	    	#planTabList li:hover{background:#434343; color:#fff; text-align:center;}
	    	#calendarWrap{float:right; margin-top:-100px;}
	    	#calendarWrap ul li{float:left; padding:0 20px;}
	    	#calendarWrap label,
	    	#calendarWrap input{border:1px solid #ccc; height:30px; vertical-align: middle;}
	    	#calendarWrap label{width:90px; margin-top:4px; background:#434343;}
	    	#calendarWrap label span{margin-top:5.5px; color:#fff;}
	    	#calendarWrap input{margin-left:-5px;}
	    	.calendrDay{margin-left:6px;}
	    </style>
	</head>
	<body>
		<form id="mainPlanSubmit" method="post" action="/plan/planInfo">
		    <div id="mainPlanDivRoot" class="clearfix">
			    <div id="logoWrap">
					<a href="/"><img src="../../resources/images/logo.png" ></a>
					<input type="hidden" id="memberId" name="memberId" value="${memberId}"/>
				</div>
		    	<div id="mainPlanDivTop">
		    		<div id="tabWrap">
			    		<ul id="planTabList" class="clearfix">
			    			<li  id="planTabRoute">도시루트</li>
			    			<li id="planTabDiary">일정표</li>
			    		</ul>
		    		</div>
					<div id="calendarWrap">
						<ul>
							<li>
								<label for="startDate"><span class="glyphicon glyphicon-calendar"></span><span class="calendrDay">출발일</span></label>
								<input type="date" id="startDate" name="startDate"/>
							</li>
							<li>					
								<label for="endDate"><span class="glyphicon glyphicon-calendar"></span><span class="calendrDay">종료일</span></label>
								<input type="date" id="endDate" name="endDate"/>
							</li>
							<li>
								<label for="stayDay"><span class="glyphicon glyphicon-calendar"></span><span class="calendrDay">여행기간</span></label>
								<input type="text" id="stayDay" name="stayDay" value="0"/>
							</li>
							<li>
								<input type="button" id="planInfoSet" value="플래너 저장" class="btn btn-default" data-toggle="modal" data-target="#myModal"/>
							</li>
						</ul>
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
					<div id="myPlanCalendar">
						<div style="width:100%; max-width:600px; display:inline-block;">
							<div class="monthly" id="mycalendar"></div>
						</div>
						<div id="detailPlanWrap">
							<table id="detailPlanContent" class="table">
								<thead>
									<th>날짜</th>
									<th>도시</th>
									<th>교통</th>
									<th>일정</th>
									<th>숙소</th>
								</thead>
								<tbody>
									
								</tbody>
							</table>	
						</div>
					</div>
				</div>				
			</div>
			<div id="detailPlanWrap" class="container">
				<table id="detailPlanContent">
					<thead>
						<tr>
							<th>날짜</th>
							<th>도시</th>
							<th>교통</th>
							<th>일정</th>
							<th>숙소</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>2</td>
							<td>3</td>
							<td>4</td>
							<td>5</td>
						</tr>
					</tbody>
				</table>
			</div>
			<jsp:include page="../module/footer.jsp"></jsp:include>
			
			<div id="landmarkInfoPopWrap" style="width:100%; height:100%; display:none; position:absolute; top:0; background:#000; z-index:999999;">
				<span id="closeLandmarkInfoPop" style="color:#fff; font-size:28px; z-index:9999999; float:right; margin-top:30px; margin-right:50px; cursor:pointer;">X</span>
				<div id="landmarkInfoPopContent" class="container" style="height:100%; background:#fff; margin:0 auto; opacity:1;">
					
				</div>
			</div>
			<div id="jsonContainer">
			
			</div>
			<!-- 플래너 저장 버튼 누르면 나오는 Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">
	  
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">플래너 저장</h4>
						</div>
						<div class="modal-body">
							<div>
								<label>플랜명</label>
								<input type="text" id="planName" name="planName" />
								<label>인원수</label>
								<input type="text" id="planHeadcount" name="planHeadcount" />
							</div>
							<div>
								<label>여행종류</label>
								<select id="planType" name="planType">
									<option value="배낭">배낭</option>
									<option value="신혼">신혼</option>
									<option value="가족">가족</option>
									<option value="비즈니스">비즈니스</option>
									<option value="커플">커플</option>
									<option value="솔로">솔로</option>
									<option value="단체">단체</option>
								</select>
							</div>
		 				</div>
						<div class="modal-footer">
							<button type="button" id="planInfoSubmit" class="btn btn-default">저장</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						</div>
					</div>
	      
				</div>
			</div>
		</form>
	</body>
</html>
