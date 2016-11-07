<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- google chrome CDN Jquery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<!-- 자동완성 기능 이용을 위해 필요한 jqueryUI -->
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<!-- 자체 css -->
		<link href="../../../resources/css/style.css" rel="stylesheet" type="text/css">
		<script>
			$(document).ready(function(){
				
				/* 검색어 확인  */
				var search = "<c:out value="${search}"/>";
				
				// 더보기에 사용되는 변수
				var moreView = 10; 			// 더보기 눌렀을 때 한 페이지에서 보여줄 리스트 수
				var beforeMoreView = -1;	// 내가 이전에 눌렀던 더보기의 인덱스 (0:명소, 1:음식점, 2:축제, 3:숙소)
				var clickMoreView = -1;		// 내가 현재 클릭한 더보기의 인덱스 (0:명소, 1:음식점, 2:축제, 3:숙소)
				var saveLandmark = 10;		// 명소 더보기 이외의 버튼을 누르기 전까지 보여주던 명소 페이지의 리스트 수
				var saveEatery = 10;		// 음식점 더보기 이외의 버튼을 누르기 전까지 보여주던 음식점 페이지의 리스트 수
				var saveEvent = 10;			// 축제 더보기 이외의 버튼을 누르기 전까지 보여주던 축제 페이지의 리스트 수
				var saveStay = 10;			// 숙소 더보기 이외의 버튼을 누르기 전까지 보여주던 숙소 페이지의 리스트 수
				
				/* 페이지가 로딩되고 나면 검색바를 숨김 */
				$('#searchForm').hide();
				
				/* 'search'로 검색한 결과입니다 라는 문구를 숨김*/
				if(search == ''){					
					$('#searchGuide').hide();
				}			
				
				/* '.searchCityNameSpan' 에 마우스를 가져가면 투명해지는 애니메이션 효과 */
				$(".searchCityNameSpan").mouseover(function(){
					$('#searchNotice').stop().animate({opacity:'0.3'});
				});
				
				/* '.searchCityNameSpan' 에 마우스가 벗어나면 다시 원래 투명도로 돌아가는 애니메이션 효과 */
				$(".searchCityNameSpan").mouseout(function(){
					$('#searchNotice').stop().animate({opacity:'1'});
				});
				
				/* 'searchNotice' 클릭시 해당 글씨를 숨기고 검색바를 화면에 나타나게한 후 포커스 */
				$('#searchNotice').click(function(){
					$('#searchNotice').hide();
					$('#searchForm').show();
					$('#infoSearchInput').focus();
				});
				
				/* 'closeSearchForm' 클릭시 검색바를 숨기고 다시 원래 글씨를 나타나게 한다 */
				$('#closeSearchForm').click(function(){
					$('#searchForm').hide();
					$('#searchNotice').show();
				});				
				
				// 더보기 버튼을 눌렀을 때 조건 검사 후 실행되는 ajax 코드
				function moreViewAjax(){
					$.ajax({
						type:"POST",  
						url:"/search/searchMore",    
						data:{search: search, moreView: moreView, clickMoreView: clickMoreView},     
						success:function(data){
							if(clickMoreView == '0') {
								$('#landmarkTbody').append(data)
							}else if(clickMoreView == '1') {
								$('#eateryTbody').append(data)
							}else if(clickMoreView == '2') {
								$('#eventTbody').append(data)
							}else if(clickMoreView == '3') {
								$('#stayTbody').append(data)
							}
							moreView += 10;	        		
						 }														
					});
				}
				
				// 더보기 버튼을 눌렀을 때 분기문
				$('.moreView').click(function(){
					clickMoreView = $('.moreView').index(this);	// 현재 누른 더보기 버튼의 인덱스를 clickMoreview에 할당해준다 (0:명소, 1:음식점, 2:축제, 3:숙소)
					console.log(clickMoreView);
					
					if(beforeMoreView != clickMoreView) {		// 이전에 누른 더보기 버튼의 인덱스와 현재 누른 더보기 버튼의 인덱스가 같지 않을 때 (다른 더보기 버튼을 눌렀을 때)
						if(beforeMoreView == '0') {				// 그 전에 눌렀던 더보기에 해당하는 인덱스의 moreView를 각각의 변수에 저장해준다
							saveLandmark = moreView;
							console.log('saveLandmark : ' + saveLandmark);
						}else if(beforeMoreView == '1') {
							saveEatery = moreView;
							console.log('saveEatery : ' + saveEatery);						
						}else if(beforeMoreView == '2') {
							saveEvent = moreView;
							console.log('saveEvent : ' + saveEvent);
						}else if(beforeMoreView == '3') {
							saveStay = moreView;
							console.log('saveStay : ' + saveStay);
						}
						
						if(clickMoreView == '0') {				// 현재 누른 더보기 버튼의 인덱스에 해당하는 값에 따라 위에서 저장해뒀던 이전까지 보고 있던 페이지의 moreView를 불러와서 현재 moreView에 할당해준다
							moreView = saveLandmark;
						}else if(clickMoreView == '1') {
							moreView = saveEatery;							
						}else if(clickMoreView == '2') {
							moreView = saveEvent;
						}else if(clickMoreView == '3') {
							moreView = saveStay;
						}
						
						beforeMoreView = clickMoreView;			// 현재 누른 더보기 버튼의 인덱스를 직전까지 누르고 있던 더보기 버튼의 인덱스에 할당해준다
						
						console.log('clickMoreView : ' + clickMoreView);
						
						moreViewAjax();							//	ajax 실행
						
					}else if(beforeMoreView == clickMoreView) {	//	이전에 누른 더보기 버튼의 인덱스와 현재 누른 더보기 버튼의 인덱스가 같다면 (하나의 더보기 버튼을 연속해서 눌렀을 때) 바로 ajax 실행					
						moreViewAjax();						
					}			    
				});
				
			});
		</script>
		<title>Insert title here</title>
	</head>
	<jsp:include page="../module/header.jsp"></jsp:include>
	<body>
		<div class="container">
			<!-- <div class="searchCityNameSpan">
				<br>
				<div id="searchNotice">
					알고싶은 도시의 이름을 검색하세요! <span class="glyphicon glyphicon-search"></span>
				</div>
				<div id="searchForm">
					<form id="infoSearch" action="/search/infoSearch" method="post">						
						<div id="closeSearchForm">X</div>
						<input id="infoSearchInput" name="search" class="form-control" placeholder="알고싶은 도시의 이름을 검색하세요!" type="text" />
						<div id="infoSearchButton" >
						    <button type="button" id="searchButton" class="btn btn-default">
						    	<span class="glyphicon glyphicon-search"></span> 검색
						    </button>
					    </div>
					</form>	
				</div>
			</div> -->
			<div id="searchGuide">
				<h3>"<span id="searchSpan">${search}</span>" (으)로 검색한 결과입니다</h3>
				<%-- <c:forEach var="selectCityInfoName" items="${selectCityInfoName}">
					<h2>
						<a id="cityName" href="infoSearch?search=${selectCityInfoName.cityInfoName}">${selectCityInfoName.cityInfoName}</a>
					</h2>
				</c:forEach> --%>
			</div>
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>
								<h3>갈만한 곳</h3>
							</th>
							<th class="moreView">
								더보기
							</th>
						</tr>
					</thead>
					<tbody id="landmarkTbody">	
						<c:if test="${selectLandmarkInfo != ''}">			
							<c:forEach var="selectLandmarkInfo" items="${selectLandmarkInfo}">
								<tr>
									<td>${selectLandmarkInfo.cityInfoDoName} > ${selectLandmarkInfo.cityInfoName} > ${selectLandmarkInfo.landmarkInfoName}</td>
									<td><a class="landmarkInfo" href="landmarkInfo?landmarkInfoNo=${selectLandmarkInfo.landmarkInfoNo}&cityInfoName=${selectLandmarkInfo.cityInfoName}">가이드북</a></td>
								</tr>	
							</c:forEach>
						</c:if>
						<c:if test="${empty selectLandmarkInfo}">
							<tr>
								<td>
									검색된 결과가 없습니다
								</td>
							</tr>
						</c:if>						
					</tbody>
				</table>
			</div>
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>
								<h3>먹을만한 곳</h3>
							</th>
							<th class="moreView">
								더보기
							</th>
						</tr>
					</thead>
					<tbody id="eateryTbody">
						<c:if test="${selectEateryInfo != ''}">			
							<c:forEach var="selectEateryInfo" items="${selectEateryInfo}">
								<tr>
									<td>${selectEateryInfo.cityInfoDoName} > ${selectEateryInfo.cityInfoName} > ${selectEateryInfo.eateryName}</td>
									<td><a class="eateryInfo" href="eateryInfo?eateryNo=${selectEateryInfo.eateryNo}&cityInfoName=${selectEateryInfo.cityInfoName}">가이드북</a></td>
								</tr>															
							</c:forEach>
						</c:if>
						<c:if test="${empty selectEateryInfo}">
							<tr>
								<td>
									검색된 결과가 없습니다
								</td>
							</tr>
						</c:if>						
					</tbody>
				</table>
			</div>
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>
								<h3>볼만한 것</h3>
							</th>
							<th class="moreView">
								더보기
							</th>
						</tr>
					</thead>
					<tbody id="eventTbody">
						<c:if test="${selectEventInfo != ''}">			
							<c:forEach var="selectEventInfo" items="${selectEventInfo}">
								<tr>
									<td>${selectEventInfo.cityInfoDoName} > ${selectEventInfo.cityInfoName} > ${selectEventInfo.eventInfoName}</td>
									<td><a class="eventInfo" href="eventInfo?eventInfoName=${selectEventInfo.eventInfoName}&cityInfoName=${selectEventInfo.cityInfoName}">가이드북</a></td>
								</tr>															
							</c:forEach>
						</c:if>
						<c:if test="${empty selectEventInfo}">
							<tr>
								<td>
									검색된 결과가 없습니다
								</td>
							</tr>
						</c:if>						
					</tbody>
				</table>
			</div>			
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>
								<h3>머물만한 곳</h3>
							</th>
							<th class="moreView">
								더보기
							</th>
						</tr>
					</thead>
					<tbody id="stayTbody">
						<c:if test="${selectStayInfo != ''}">			
							<c:forEach var="selectStayInfo" items="${selectStayInfo}">
								<tr>
									<td>${selectStayInfo.cityInfoDoName} > ${selectStayInfo.cityInfoName} > ${selectStayInfo.stayInfoName}</td>
									<td><a class="stayInfo" href="stayInfo?stayInfoNo=${selectStayInfo.stayInfoNo}&cityInfoName=${selectStayInfo.cityInfoName}">가이드북</a></td>
								</tr>															
							</c:forEach>
						</c:if>
						<c:if test="${empty selectStayInfo}">
							<tr>
								<td>
									검색된 결과가 없습니다
								</td>
							</tr>
						</c:if>	
					</tbody>
				</table>
			</div>									
		</div>
	</body>
	<jsp:include page="../module/footer.jsp"></jsp:include>
</html>