<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript">
		$(document).ready(function(){
			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(popularityTypeChart);
			
			// 플랜 타입 별 많이 찾는 도시 순위
			function popularityTypeChart() {
				
			    var cityRankName = [];
			    var cityRankCount = [];
			    var selectCityByPlanType = [];
			    var planType = "<c:out value='${planType}' />";
			    
			    <c:forEach var="selectCityByPlanType" items="${selectCityByPlanType}">
				    cityRankName.push("${selectCityByPlanType.cityRankName}");
					cityRankCount.push(${selectCityByPlanType.cityRankCount});
				</c:forEach>
				
				console.log('name : ' + cityRankName, 'count : ' + cityRankCount);
				
				var data = new google.visualization.DataTable();
					data.addColumn('string', '도시이름');
					data.addColumn('number', '여행수');					
					
				    for(var i = 0; i<cityRankName.length; i++){
				    	selectCityByPlanType.push([cityRankName[i], cityRankCount[i]]);
				      }
				    
				    data.addRows(selectCityByPlanType);
				
				var chart = new google.visualization.BarChart(document.getElementById('popularityTypeChart'));
				
				chart.draw(data);
			}
			
		});		
		</script>		
		<title>다님 플래너</title>
	</head>
	<body>
		<div id="popularityTitle">다님 플래너 ${planType} 여행 순위</div>
		<div id="popularityTypeChart" style="width: 700px; height: 400px;"></div>
	</body>
</html>