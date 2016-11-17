<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript">
		$(document).ready(function(){
			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(popularityProvinceChart);
			
			// 도에서 많이 찾은 시 순위
			function popularityProvinceChart() {
				
			    var cityRankName = [];
			    var cityRankCount = [];
			    var selectCityByProvince = [];
			    var province = "<c:out value='${province}' />";
			    var src = "../../resources/images/map/"+province+".jpg";
			    
			    <c:forEach var="selectCityByProvince" items="${selectCityByProvince}">
				    cityRankName.push("${selectCityByProvince.cityRankName}");
					cityRankCount.push(${selectCityByProvince.cityRankCount});
				</c:forEach>
				
				console.log('name : ' + cityRankName, 'count : ' + cityRankCount);
				
				var data = new google.visualization.DataTable();
					data.addColumn('string', '도시이름');
					data.addColumn('number', '여행수');					
					
				    for(var i = 0; i<cityRankName.length; i++){
				    	selectCityByProvince.push([cityRankName[i], cityRankCount[i]]);
				      }
				    
				    data.addRows(selectCityByProvince);
				
				var chart = new google.visualization.BarChart(document.getElementById('popularityProvinceChart'));
				
				chart.draw(data);
			}
			
		});		
		</script>		
		<title>다님 플래너</title>
	</head>
	<body>
		<div id="popularityTitle">다님 플래너 ${province} 여행 순위</div>
		<div id="popularityProvinceImage"><img src="../../resources/images/map/${province}.png" /></div>
		<div id="popularityProvinceChart" style="width: 700px; height: 400px;"></div>
	</body>
</html>