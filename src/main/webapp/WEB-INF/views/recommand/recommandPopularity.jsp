<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript">
		$(document).ready(function(){
			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(popularityCityChart);
			
			// 가장 많이 여행한 도시 순
			function popularityCityChart() {
				
				var data = new google.visualization.DataTable();
				var ivalue = [];
			    var cityRankName = [];
			    var cityRankCount = [];
			    var selectPopularityCity = [];
				var koreaRegion = [{v:'KR-11',f:'서울특별시'},
									{v:'KR-26',f:'부산광역시'},
									{v:'KR-27',f:'대구광역시'},
									{v:'KR-28',f:'인천광역시'},
									{v:'KR-29',f:'광주광역시'},
									{v:'KR-30',f:'대전광역시'},
									{v:'KR-31',f:'울산광역시'},
									{v:'KR-41',f:'경기도'},
									{v:'KR-42',f:'강원도'},
									{v:'KR-43',f:'충청북도'},
									{v:'KR-44',f:'충청남도'},
									{v:'KR-45',f:'전라북도'},
									{v:'KR-46',f:'전라남도'},
									{v:'KR-47',f:'경상북도'},
									{v:'KR-48',f:'경상남도'},
									{v:'KR-49',f:'제주도'}];
				
				
				
			    <c:forEach var="selectPopularityCity" items="${selectPopularityCity}">
			    	cityRankName.push("${selectPopularityCity.cityRankName}");
					cityRankCount.push(${selectPopularityCity.cityRankCount});
				</c:forEach>
				
				console.log(koreaRegion[0]);
				console.log(cityRankName[0]);
				
				data.addColumn('string', 'Country');
				data.addColumn('number', 'Value'); 
				data.addColumn({type:'string', role:'tooltip'});
				
			    for(var i = 0; i<cityRankName.length; i++){
			    	for(var j = 0; j<koreaRegion.length; j++) {
				    	if(koreaRegion[j].f == cityRankName[i]) {
					    	selectPopularityCity.push([koreaRegion[j], 16 - i, (i + 1) + '위']);
					    	console.log(koreaRegion[j]);
					    	console.log(16 - i);
				    	}
			    	}
			    	
			    }
			    
			    data.addRows(selectPopularityCity);
				
				var options = {
								region: 'KR', // 지역코드
								backgroundColor: {fill:'#FFFFFF',stroke:'#FFFFFF' ,strokeWidth:0 },
								legend: 'none',	
								backgroundColor: {fill:'#FFFFFF',stroke:'#FFFFFF' ,strokeWidth:0 },	
								datalessRegionColor: '#f5f5f5',
								displayMode: 'regions', 
								enableRegionInteractivity: 'true', 
								resolution: 'provinces',
								//sizeAxis: {minValue: 1, maxValue:16,minSize:1,  maxSize: 16},
								//colorAxis: {colors: ['#aff5ff', '#49b9ff', '#1c58ff']},
								colorAxis: {colors: ['#81DAF5', '#2E9AFE', '#0040FF']},
								keepAspectRatio: true,
								tooltip: {textStyle: {color: '#444444'}, trigger:'focus'},
								forceIFrame: false
								};
				
				var chart = new google.visualization.GeoChart(document.getElementById('popularityChart'));
				
				chart.draw(data, options);
			}
		});		
		</script>		
		<title>다님 플래너</title>
	</head>
	<body>
		<div id="popularityTitle">다님 플래너 전국 여행 순위</div>
		<div id="popularityChart" style="width: 700px; height: 400px;"></div>
	</body>
</html>