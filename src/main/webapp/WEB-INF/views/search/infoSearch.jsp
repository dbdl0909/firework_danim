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
				
				/* 유효성 검사 */
				var search = "<c:out value="${search}"/>";
				var infoSearchCheck = /[가-힣]{2,}$/; // 검색조건 2자 이상의 한글만 가능
				var infoSearchInput = $('#infoSearchInput');
				var moreView = 10;
				
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
				

				
				$(function(){
					var autoComplete = new Array();
					<c:forEach var="selectCityAll" items="${selectCityAll}">
					autoComplete.push("${selectCityAll}");
					</c:forEach>
					$('#infoSearchInput').autocomplete({
						source: autoComplete
					});
				});
				
				$('.moreView').click(function(){
					alert('click!');
				    $.ajax({      
				        type:"POST",  
				        url:"/search/searchMore",    
				        data:{search: search, moreView: moreView},     
				        success:function(data){
							moreView += 10;
				        	$('#eateryTbody').append(data)
				        }
				    }); 
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
							<th>
								
							</th>
						</tr>
					</thead>
					<tbody>	
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
							<th class="moreView" style="text-align: right;">
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
							<th>
							
							</th>
						</tr>
					</thead>
					<tbody>
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
							<th>
							
							</th>
						</tr>
					</thead>
					<tbody>
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