<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript">
		$(document).ready(function(){
			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(genderChart);
			google.charts.setOnLoadCallback(genderChartAll);
			
			//성별 별 많이 방문한 도시 top5
			function genderChart() {
				
			    var cityRankName = [];
			    var cityRankCount = [];
			    var selectCityForGender = [];
			    var gender = "<c:out value='${gender}' />";
		    	if(gender == "F") {
		    		var gender = "여성"
		    	}else if(gender == "M") {
		    		var gender = "남성"
		    	}
			    
			    <c:forEach var="selectCityForGender" items="${selectCityForGender}">
				    cityRankName.push("${selectCityForGender.cityRankName}");
					cityRankCount.push(${selectCityForGender.cityRankCount});
				</c:forEach>
				
				console.log('name : ' + cityRankName, 'count : ' + cityRankCount);
				
				var data = new google.visualization.DataTable();
					data.addColumn('string', '도시이름');
					data.addColumn('number', '여행수');					
					
				    for(var i = 0; i<cityRankName.length; i++){
				    	selectCityForGender.push([cityRankName[i], cityRankCount[i]]);
				      }
				    
				    data.addRows(selectCityForGender);
				
				var options = {
					title: gender + '이 선호하는 지역 TOP 5',
					forceIFrame: false
				};
				
				var chart = new google.visualization.PieChart(document.getElementById('genderChart'));
				
				chart.draw(data, options);
			}
			
			//성별 별 많이 방문한 도/ 특별광역시 전체
			function genderChartAll() {
				
			    var cityRankName = [];
			    var cityRankCount = [];
			    var selectCityForGender = [];
			    var gender = "<c:out value='${gender}' />";
		    	if(gender == "F") {
		    		var gender = "여성"
		    	}else if(gender == "M") {
		    		var gender = "남성"
		    	}
			    
			    <c:forEach var="selectCityAllByGender" items="${selectCityAllByGender}">
				    cityRankName.push("${selectCityAllByGender.cityRankName}");
					cityRankCount.push(${selectCityAllByGender.cityRankCount});
				</c:forEach>
				
				var data = new google.visualization.DataTable();
				data.addColumn('string', '도시이름');
				data.addColumn('number', '여행수');					
				
			    for(var i = 0; i<cityRankName.length; i++){
			    	selectCityForGender.push([cityRankName[i], cityRankCount[i]]);
			      }
			    
			    data.addRows(selectCityForGender);			    
				
				var options = {
					title: gender + '이 선호하는 지역',
					forceIFrame: false,
			        width: 800,
			        height: 400,
			        bar: {groupWidth: "95%"},
			        legend: { position: "out" },
				};
				
				var chart = new google.visualization.ColumnChart(document.getElementById('genderChartAll'));
				
				chart.draw(data, options);			
			}
		});		
		</script>		
		<title>다님 플래너</title>
	</head>
	<body>
		<div id="genderChart" style="width: 700px; height: 400px;"></div>
		<div id="genderChartAll" style="width: 700px; height: 400px;"></div>
	</body>
</html>