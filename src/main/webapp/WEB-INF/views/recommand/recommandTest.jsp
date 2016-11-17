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
		<title>Insert title here</title>
		<script type="text/javascript">
			$(document).ready(function(){
				
				var url = "";
				var data = "";
				
				function loadRecommand(){
					$.ajax({
						type:"POST",
						url:url,
						data:data,
						success:function(data){
							console.log('성공');
							//var $genderChart = $(data).filter('#genderChart');
							$('#recommandView').html(data);
						}
					});
				}
				
				$('#male').click(function(){
					url = "/recommand/recommandGender"
					data = {gender: "M"};
					loadRecommand();
				});
				
				$('#female').click(function(){
					url = "/recommand/recommandGender"
					data = {gender: "F"};
					loadRecommand();
				});
				
				$('#genderUl').hide();
				$('#p').hide();
				$('#s').hide();
				$('#t').hide();
				$('#gender').click(function(){
					$('#genderUl').show();
				});
				
			});
		</script>
		<style type="text/css">
			.container #recommandTab{float:left; width: 20%; height: 700px; border-right: 1px #CCC solid; text-align: center;}
			.container #recommandView{float: right; width: 70%;}
			.container #recommandTab div{cursor: pointer; border-bottom: 1px #CCC solid; font-size: 26px; margin: 7px;}
			.container #recommandTab li{font-size: 20px; cursor: pointer;}			
		</style>
	</head>
	<jsp:include page="../module/header.jsp"></jsp:include>
	<body>
		<div class="container">
			<div id = "recommandTab">
				<div id="gender">성별</div>
				<ul id="genderUl">
					<li id="male">남자</li>
					<li id="female">여자</li>
				</ul>
				<div>인기</div>	
				<ul id="p"></ul>
				<div>계절</div>
				<ul id="s"></ul>
				<div>타입</div>
				<ul id="t"></ul>
			</div>
			<div id="recommandView">
			
			</div>
		</div>
	</body>
	<jsp:include page="../module/footer.jsp"></jsp:include>
</html>