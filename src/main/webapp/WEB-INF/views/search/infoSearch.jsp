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
		<script>
			$(document).ready(function(){
				$('#searchForm').hide();
				
				$(".searchCityNameSpan").mouseover(function(){
					$('#searchNotice').stop().animate({opacity:'0.3'});
				});
				
				$(".searchCityNameSpan").mouseout(function(){
					$('#searchNotice').stop().animate({opacity:'1'});
				});
				
				$('#searchNotice').click(function(){
					$('#searchNotice').hide();
					$('#searchForm').show();
				});
				
				$('#closeSearchForm').click(function(){
					$('#searchForm').hide();
					$('#searchNotice').show();
				})
				
				$('#searchButton').click(function(){
					if($('#infoSearchInput').val() < 2){
						alert('nope');					
					}else{
						$('#infoSearch').submit();
					}
				})
			});
		</script>
		<style type="text/css">
			#infoSearchInput{float:left; width:100%;}
			#closeSearchForm{float:right; color:black; font-size:20px; font-weight:bold; cursor:pointer;}
			#infoSearchButton{float:right;}
			#searchNotice{text-align:center; font-size: 32px; cursor: pointer;}
			#landmarkInfo{text-decoration: none; float: right;}
			#eateryInfo{text-decoration: none; float: right;}
			#eventInfo{text-decoration: none; float: right;}
			#stayInfo{text-decoration: none; float: right;}
		</style>
		<title>Insert title here</title>
	</head>
	<body>
		<div class="container">
			<div class="searchCityNameSpan">
				<br>
				<div id="searchNotice">
					알고싶은 도시의 이름을 검색하세요! <span class="glyphicon glyphicon-search"></span>
				</div>
				<div id="searchForm">
					<form id="infoSearch" action="/infoSearch" method="post">						
						<div id="closeSearchForm">X</div>
						<input id="infoSearchInput" name="search" class="form-control" placeholder="알고싶은 도시의 이름을 검색하세요!" type="text" />
						<div id="infoSearchButton" >
						    <button type="button" id="searchButton" class="btn btn-default">
						    	<span class="glyphicon glyphicon-search"></span> 검색
						    </button>
					    </div>
					</form>	
				</div>
			</div>
		</div>
		<div class="container">
			<div>
				<h2>${selectCityInfoName.cityInfoName}</h2>
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
									<td>${selectLandmarkInfo.cityInfoName} > ${selectLandmarkInfo.landmarkInfoName}</td>
									<td><a id="landmarkInfo" href="/landmarkInfo?landmarkInfoNo=${selectLandmarkInfo.landmarkInfoNo}">가이드북</a></td>
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
							<th>
							
							</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${selectEateryInfo != ''}">			
							<c:forEach var="selectEateryInfo" items="${selectEateryInfo}">
								<tr>
									<td>${selectEateryInfo.cityInfoName} > ${selectEateryInfo.eateryName}</td>
									<td><a id="eateryInfo" href="/eateryInfo?eateryInfoNo=${selectEateryInfo.eateryNo}">가이드북</a></td>
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
									<td>${selectEventInfo.cityInfoName} > ${selectEventInfo.eventInfoName}</td>
									<td><a id="eventInfo" href="/eventInfo?eventInfoName=${selectEventInfo.eventInfoName}">가이드북</a></td>
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
								<h3>잘만한 곳</h3>
							</th>
							<th>
							
							</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${selectStayInfo != ''}">			
							<c:forEach var="selectStayInfo" items="${selectStayInfo}">
								<tr>
									<td>${selectStayInfo.cityInfoName} > ${selectStayInfo.stayInfoName}</td>
									<td><a id="stayInfo" href="/stayInfo?stayInfoNo=${selectStayInfo.stayInfoNo}">가이드북</a></td>
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
</html>