<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript">
			$(document).ready(function(){
				google.charts.load('current', {'packages':['corechart']});
				google.charts.setOnLoadCallback(recommandSeasonYear);
				
				//20대 계쩔별 여행 순위
				function recommandSeasonYear() {			
					
				    var cityRankName = [];
				    var cityRankCount = [];
				    var selectSeasonCityByYear = [];
				    var season = "<c:out value='${season}' />";
				    if(season == 'spring') {
				    	season = '봄';
				    }else if(season == 'summer') {
				    	season = '여름';
				    }else if(season == 'fall') {
				    	season = '가을';
				    }else if(season == 'winter') {
				    	season = '겨울';
				    }
				    var year = "<c:out value='${year}'/>";
				    
				    <c:forEach var="recommandSeasonYear" items="${recommandSeasonYear}">
					    cityRankName.push("${recommandSeasonYear.cityRankName}");
						cityRankCount.push(${recommandSeasonYear.cityRankCount});
					</c:forEach>
					
					var data = new google.visualization.DataTable();
					data.addColumn('string', '도시이름');
					data.addColumn('number', '여행수');
					
				    for(var i = 0; i<cityRankName.length; i++){
				    	selectSeasonCityByYear.push([cityRankName[i], cityRankCount[i]]);
				      }
				    
				    data.addRows(selectSeasonCityByYear);			    
					
					var options = {
						title: year + '년도 ' + season + '에 인기있는 도시 순위',
						forceIFrame: false,
				        width: 800,
				        height: 400,
				        bar: {groupWidth: "95%"},
				        legend: { position: "out" },
					};
					
					var chart = new google.visualization.ColumnChart(document.getElementById('seasonChart'));
					
					chart.draw(data, options);	
					
				}
			});
		</script>
		<title>Insert title here</title>
	</head>
	<body>
		<div id="seasonChart" style="width: 700px; height: 400px;"></div>
	</body>
</html>