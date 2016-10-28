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
		<title>Insert title here</title>
		<style type="text/css">
			#infoButton{float: right;}
		</style>		
	</head>
	<body>
		<div class="container">
			<h1>${selectEateryInfoOne.eateryName}</h1>
			<p>${cityInfoName} > 먹을만한 곳</p>
			<div>	
				<p id="infoExplain">
					<strong>
						//<img src="https://maps.googleapis.com/maps/api/staticmap?center=${selectEateryInfoOne.eateryName}&zoom=17&size=500x301&key=AIzaSyCvHmVG5i9J5JtWxL6ifRbneHjjEEkF04w">
						${selectEateryInfoOne.eaterySummary}
					</strong>
				</p>
				<hr>
				<p id ="infoContent">
					<ul>
						<li>음식점명 : ${selectEateryInfoOne.eateryName}</li>
						<li>분류 : ${selectEateryInfoOne.eateryCategory}</li>
					</ul>
				</p>
				<p id="infoButton">
					<a href="/" role="button" class="btn btn-info">홈으로</a>
					<a href="" role="button" class="btn btn-info">버튼2</a>
					<a href="" role="button" class="btn btn-info">버튼3</a>
				</p>
			</div>
		</div>
	</body>
</html>