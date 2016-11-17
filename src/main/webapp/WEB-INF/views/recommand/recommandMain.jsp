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
		<!-- 구글차트 -->
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(cityForFemaleChart);
			google.charts.setOnLoadCallback(cityForMaleChart);
			google.charts.setOnLoadCallback(popularityCityChart);
			google.charts.setOnLoadCallback(selectSeasonCityTwenty);
			
			//남성이 많이 방문한 도시 top5
			function cityForMaleChart() {
				<c:set var="selectCityForMale" value="${selectCityForGender.selectCityForMale}" />
				
			    var cityRankName = [];
			    var cityRankCount = [];
			    var selectCityForMale = [];
			    
			    <c:forEach var="selectCityForMale" items="${selectCityForMale}">
				    cityRankName.push("${selectCityForMale.cityRankName}");
					cityRankCount.push(${selectCityForMale.cityRankCount});
				</c:forEach>
				
				console.log('name : ' + cityRankName, 'count : ' + cityRankCount);
				
				var data = new google.visualization.DataTable();
					data.addColumn('string', '도시이름');
					data.addColumn('number', '여행수');					
					
				    for(var i = 0; i<cityRankName.length; i++){
				    	selectCityForMale.push([cityRankName[i], cityRankCount[i]]);
				      }
				    
				    data.addRows(selectCityForMale);
				
				var options = {
					title: '남성이 선호하는 지역 TOP 5',
					forceIFrame: false
				};
				
				var chart = new google.visualization.PieChart(document.getElementById('maleChart'));
				
				chart.draw(data, options);
			}
			
			// 여성이 많이 방문한 도시 top5
			function cityForFemaleChart() {
				<c:set var="selectCityForFemale" value="${selectCityForGender.selectCityForFemale}" />
				<c:set var="selectCityForMale" value="${selectCityForGender.selectCityForMale}" />
				
			    var cityRankName = [];
			    var cityRankCount = [];
			    var selectCityForFemale = [];
			    
			    <c:forEach var="selectCityForFemale" items="${selectCityForFemale}">
				    cityRankName.push("${selectCityForFemale.cityRankName}");
					cityRankCount.push(${selectCityForFemale.cityRankCount});
				</c:forEach>
				
				console.log('name : ' + cityRankName, 'count : ' + cityRankCount);
				
				var data = new google.visualization.DataTable();
					data.addColumn('string', '도시이름');
					data.addColumn('number', '여행수');					
					
				    for(var i = 0; i<cityRankName.length; i++){
				    	selectCityForFemale.push([cityRankName[i], cityRankCount[i]]);
				      }
				    
				    data.addRows(selectCityForFemale);
				
				var options = {
					title: '여성이 선호하는 지역 TOP 5',
					forceIFrame: false,			
				};
				
				var chart = new google.visualization.PieChart(document.getElementById('femaleChart'));
				
				chart.draw(data, options);
			}
			
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
			
			function selectSeasonCityTwenty() {
				<c:set var="selectSpringCityTwenty" value="${selectSeasonCityTwenty.selectSpringCityTwenty}" />
				<c:set var="selectSummerCityTwenty" value="${selectSeasonCityTwenty.selectSummerCityTwenty}" />				
				<c:set var="selectFallCityTwenty" value="${selectSeasonCityTwenty.selectFallCityTwenty}" />
				<c:set var="selectWinterCityTwenty" value="${selectSeasonCityTwenty.selectWinterCityTwenty}" />
				
		        var data = google.visualization.arrayToDataTable([
					['season', '20대', '30대'],
					['봄',  ${selectSpringCityTwenty}, 23],
					['여름', ${selectSummerCityTwenty}, 13],
					['가을', ${selectFallCityTwenty}, 7],
					['겨울', ${selectWinterCityTwenty}, 38]
				]);
				
				var options = {
					title: '계절별 20대 여행 순위',
					curveType: 'function',
					legend: { position: 'bottom' }
				};
				
				var chart = new google.visualization.LineChart(document.getElementById('seasonTwentyChart'));
				
				chart.draw(data, options);
				
				}
			
			$('#maleChart').hide();
			$('#femaleChart').hide();
			
			
			$('#female').click(function(){
				$('#femaleChart').show();
				$('#maleChart').hide();
			});
			
			$('#male').click(function(){
				$('#maleChart').show();
				$('#femaleChart').hide();
			});
			
		});
		</script>		
		<title>다님 플래너</title>
	</head>
	<jsp:include page="../module/header.jsp"></jsp:include>
	<body>
		<div id = "genderChart">
			<div class="btn-group">
				<button id="female" type="button" class="btn btn-primary">여자</button>
				<button id="male" type="button" class="btn btn-primary">남자</button>
			</div> 
			<div id="femaleChart" style="width: 700px; height: 400px;"></div>
			<div id="maleChart" style="width: 700px; height: 400px;"></div>
		</div>
 		<div>
			<div id="popularityChart" style="width: 700px; height: 433px;"></div>
		</div>
		<div>
			<div id="seasonTwentyChart" style="width: 750px; height: 400px;"></div>
		</div>
	</body>
	<jsp:include page="../module/footer.jsp"></jsp:include>
</html>