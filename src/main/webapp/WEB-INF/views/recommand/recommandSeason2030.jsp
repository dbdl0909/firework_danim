<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript">
			$(document).ready(function(){
				google.charts.load('current', {'packages':['corechart']});
				google.charts.setOnLoadCallback(selectSeasonCityTwenty);
				
				//20대 계쩔별 여행 순위
				function selectSeasonCityTwenty() {
					<c:set var="selectSpringCityTwenty" value="${selectSeasonCityTwenty.selectSpringCityTwenty}" />
					<c:set var="selectSummerCityTwenty" value="${selectSeasonCityTwenty.selectSummerCityTwenty}" />				
					<c:set var="selectFallCityTwenty" value="${selectSeasonCityTwenty.selectFallCityTwenty}" />
					<c:set var="selectWinterCityTwenty" value="${selectSeasonCityTwenty.selectWinterCityTwenty}" />
					
					<c:set var="selectSpringCityThirty" value="${selectSeasonCityTwenty.selectSpringCityThirty}" />
					<c:set var="selectSummerCityThirty" value="${selectSeasonCityTwenty.selectSummerCityThirty}" />				
					<c:set var="selectFallCityThirty" value="${selectSeasonCityTwenty.selectFallCityThirty}" />
					<c:set var="selectWinterCityThirty" value="${selectSeasonCityTwenty.selectWinterCityThirty}" />					
					
			        var data = google.visualization.arrayToDataTable([
						['season', '20대', '30대'],
						['봄',  ${selectSpringCityTwenty}, ${selectSpringCityThirty}],
						['여름', ${selectSummerCityTwenty}, ${selectSummerCityThirty}],
						['가을', ${selectFallCityTwenty}, ${selectFallCityThirty}],
						['겨울', ${selectWinterCityTwenty}, ${selectWinterCityThirty}]
					]);
					
					var options = {
						title: '2030 여행 계절 순위',
						curveType: 'function',
						legend: { position: 'bottom' },
						vAxis: { title: '여행수'},
						hAxis: { title: '계절'},
					};
					
					var chart = new google.visualization.LineChart(document.getElementById('season2030Chart'));
					
					chart.draw(data, options);
					
				}
			});
		</script>
		<title>Insert title here</title>
	</head>
	<body>
		<div id="season2030Chart" style="width: 700px; height: 400px;"></div>
	</body>
</html>