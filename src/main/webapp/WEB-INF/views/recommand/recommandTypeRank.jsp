<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript">
			$(document).ready(function(){
				google.charts.load('current', {'packages':['corechart']});
				google.charts.setOnLoadCallback(selectTypeRank);
				
				//플랜 타입별 인기 순위
				function selectTypeRank() {
					
				    var cityRankName = [];
				    var cityRankCount = [];
				    var recommandTypeRank = [];
				    
				    <c:forEach var="recommandTypeRank" items="${recommandTypeRank}">
					    cityRankName.push("${recommandTypeRank.cityRankName}");
						cityRankCount.push(${recommandTypeRank.cityRankCount});
					</c:forEach>
					
					console.log('name : ' + cityRankName, 'count : ' + cityRankCount);
					
					var data = new google.visualization.DataTable();
						data.addColumn('string', '도시이름');
						data.addColumn('number', '여행수');					
						
					    for(var i = 0; i<cityRankName.length; i++){
					    	recommandTypeRank.push([cityRankName[i], cityRankCount[i]]);
					      }
					    
					    data.addRows(recommandTypeRank);
					
					var options = {
						title: '플랜 타입 인기 순위',
						forceIFrame: false
					};
					
					var chart = new google.visualization.PieChart(document.getElementById('recommandTypeRank'));
					
					chart.draw(data, options);
				}
			});
		</script>
		<title>Insert title here</title>
	</head>
	<body>
		<div id="typeRankTitle">플랜 타입 인기 순위</div>
		<div id="recommandTypeRank" style="width: 700px; height: 400px; margin-top: 15px;"></div>
		<%-- <ul id="typeRank">
			<c:forEach var="recommandTypeRank" items="${recommandTypeRank}" varStatus="status">
				<li>${status.count}위 - ${recommandTypeRank.cityRankName}여행 ${recommandTypeRank.cityRankCount}번</li>
			</c:forEach>
		</ul> --%>
	</body>
</html>