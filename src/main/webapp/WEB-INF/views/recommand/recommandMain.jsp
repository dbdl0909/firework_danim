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
			google.charts.setOnLoadCallback(drawChart);
			google.charts.setOnLoadCallback(drawRegionsMap);
			
			function drawChart() {
				<c:set var="selectCityForFemale" value="${selectCityForGender.selectCityForFemale}" />
				
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
					title: '여성이 선호하는 지역 TOP 5'
				};
				
				var chart = new google.visualization.PieChart(document.getElementById('femaleChart'));
				
				chart.draw(data, options);
			}
			
			function drawRegionsMap() {
				
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
				console.log(cityRankName);
				
				data.addColumn('string', 'Country');
				data.addColumn('number', 'Value'); 
				data.addColumn({type:'string', role:'tooltip'});
				
			    for(var i = 0; i<cityRankName.length; i++){
			    	for(var j = 0; j<koreaRegion.length; j++) {
				    	if(koreaRegion[j].f == cityRankName[i]) {
					    	selectPopularityCity.push([koreaRegion[i], cityRankCount[i], 'ㅎㅎ']);	
					    	console.log(selectPopularityCity);
				    	}
			    	}
			    	
			      }
			    
			    data.addRows(selectPopularityCity);
			    
				/* data.addRows([[{v:'KR-11',f:'서울특별시'},1,'인기있는 지역 확인하기']]);
				data.addRows([[{v:'KR-26',f:'부산광역시'},2,'인기있는 지역 확인하기']]);
				data.addRows([[{v:'KR-27',f:'대구광역시'},3,'인기있는 지역 확인하기']]);
				data.addRows([[{v:'KR-28',f:'인천광역시'},4,'인기있는 지역 확인하기']]);
				data.addRows([[{v:'KR-29',f:'광주광역시'},5,'인기있는 지역 확인하기']]);
				data.addRows([[{v:'KR-30',f:'대전광역시'},6,'인기있는 지역 확인하기']]);
				data.addRows([[{v:'KR-31',f:'울산광역시'},7,'인기있는 지역 확인하기']]);
				data.addRows([[{v:'KR-41',f:'경기도'},8,'인기있는 지역 확인하기']]);
				data.addRows([[{v:'KR-42',f:'강원도'},9,'인기있는 지역 확인하기']]);		
				data.addRows([[{v:'KR-43',f:'충청북도'},10,'인기있는 지역 확인하기']]);
				data.addRows([[{v:'KR-44',f:'충청남도'},11,'인기있는 지역 확인하기']]);
				data.addRows([[{v:'KR-45',f:'전라북도'},12,'인기있는 지역 확인하기']]);
				data.addRows([[{v:'KR-46',f:'전라남도'},13,'인기있는 지역 확인하기']]);
				data.addRows([[{v:'KR-47',f:'경상북도'},14,'인기있는 지역 확인하기']]);
				data.addRows([[{v:'KR-48',f:'경상남도'},15,'인기있는 지역 확인하기']]);
				data.addRows([[{v:'KR-49',f:'제주도'},16,'인기있는 지역 확인하기']]); */ 
				
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
								colorAxis: {colors: ['#aff5ff', '#49b9ff', '#1c58ff']},
								keepAspectRatio: true,
								tooltip: {textStyle: {color: '#444444'}, trigger:'focus'}
								};
				
				var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));
				
				chart.draw(data, options);
			}
		});
		</script>		
		<title>Insert title here</title>
	</head>
	<jsp:include page="../module/header.jsp"></jsp:include>
	<body>
		<c:set var="selectCityForFemale" value="${selectCityForGender.selectCityForFemale}" />
			<c:forEach var="selectCityForFemale" items="${selectCityForFemale}" varStatus="status">
				['${selectCityForFemale.cityRankName}', ${selectCityForFemale.cityRankCount}],
				<c:if test="${status.last}">
					['${selectCityForFemale.cityRankName}', ${selectCityForFemale.cityRankCount}]
				</c:if>	
			</c:forEach>
		<div id="femaleChart" style="width: 900px; height: 500px;"></div>	
		 <div id="regions_div" style="width: 700px; height: 433px;"></div>	
	</body>
	<jsp:include page="../module/footer.jsp"></jsp:include>
</html>