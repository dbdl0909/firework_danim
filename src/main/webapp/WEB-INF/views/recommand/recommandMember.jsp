<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript">
		$(document).ready(function(){
			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(memberChart);
			google.charts.setOnLoadCallback(memberChartAll);
			
			//당신에게 추천하는 지역
			function memberChart() {
				
			    var cityRankName = [];
			    var cityRankCount = [];
			    var selectCityForMember = [];
			    var age = <c:out value="${age}"/>;
			    var gender = "<c:out value='${gender}'/>";
		    	if(gender == "F") {
		    		var gender = "여성"
		    	}else if(gender == "M") {
		    		var gender = "남성"
		    	}
			    
			    <c:forEach var="selectCityForMember" items="${selectCityForMember}">
				    cityRankName.push("${selectCityForMember.cityRankName}");
					cityRankCount.push(${selectCityForMember.cityRankCount});
				</c:forEach>
				
				console.log('name : ' + cityRankName, 'count : ' + cityRankCount);
				
				var data = new google.visualization.DataTable();
					data.addColumn('string', '도시이름');
					data.addColumn('number', '여행수');					
					
				    for(var i = 0; i<cityRankName.length; i++){
				    	selectCityForMember.push([cityRankName[i], cityRankCount[i]]);
				      }
				    
				    data.addRows(selectCityForMember);
				
				var options = {
					title: age + '세 ' + gender + '이신 당신에게 추천하는 지역 TOP 5',
					forceIFrame: false
				};
				
				var chart = new google.visualization.PieChart(document.getElementById('memberChart'));
				
				chart.draw(data, options);
			}
			
			
			/* function memberChartAll() {
				
			    var cityRankName = [];
			    var cityRankCount = [];
			    var selectCityForMember = [];
			    
			    <c:forEach var="selectCityForMember" items="${selectCityForMember}">
				    cityRankName.push("${selectCityForMember.cityRankName}");
					cityRankCount.push(${selectCityForMember.cityRankCount});
				</c:forEach>
				
				var data = new google.visualization.DataTable();
				data.addColumn('string', '도시이름');
				data.addColumn('number', '여행수');					
				
			    for(var i = 0; i<cityRankName.length; i++){
			    	selectCityForMember.push([cityRankName[i], cityRankCount[i]]);
			      }
			    
			    data.addRows(selectCityForMember);			    
				
				var options = {
					title: '당신에게 추천하는 지역',
					forceIFrame: false,
			        width: 800,
			        height: 400,
			        bar: {groupWidth: "95%"},
			        legend: { position: "out" },
				};
				
				var chart = new google.visualization.ColumnChart(document.getElementById('memberChartAll'));
				
				chart.draw(data, options);			
			} */
		});		
		</script>		
		<title>다님 플래너</title>
	</head>
	<body>
		<div id="memberChart" style="width: 700px; height: 400px;"></div>
		<div id="memberChartAll" style="width: 700px; height: 400px;"></div>
	</body>
</html>