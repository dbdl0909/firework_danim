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
		<style type="text/css">
			#infoImage{text-align: center;}
			/* #infoContent ul, li{list-style-type: none; margin: 0; padding: 0;} */
			#infoButton{float: right;}
		</style>
		<title>Insert title here</title>
	</head>
	<body>
		<div class="container">
			<h1>${selectLandmarkInfoOne.landmarkInfoName}</h1>
			<p>${cityInfoName} > 갈만한곳</p>
			<div id="infoImage">
				<p>
					<img src="${selectLandmarkInfoOne.landmarkInfoImage}">						
					<img src="https://maps.googleapis.com/maps/api/staticmap?center=${selectLandmarkInfoOne.landmarkInfoLatitude},${selectLandmarkInfoOne.landmarkInfoLangitude}&markers=color:blue%7Clabel:%7C${selectLandmarkInfoOne.landmarkInfoLatitude},${selectLandmarkInfoOne.landmarkInfoLangitude}&zoom=17&size=500x301&key=AIzaSyCvHmVG5i9J5JtWxL6ifRbneHjjEEkF04w">					
				</p>
			</div>
			<div>	
				<p id="infoExplain">
					<strong>
						${selectLandmarkInfoOne.landmarkInfoSummary}
					</strong>
				</p>
				<hr>
				<p id ="infoContent">
					<ul>
						<li>장소명 : ${selectLandmarkInfoOne.landmarkInfoName}</li>
						<li>위치 : ${selectLandmarkInfoOne.landmarkInfoLocation}</li>
						<li>홈페이지 : ${selectLandmarkInfoOne.landmarkInfoHomepage}</li>
						<li>이용료 : ${selectLandmarkInfoOne.landmarkInfoFee} 원</li>
					</ul>
				</p>
				<p id="infoButton">
					<a href="" role="button" class="btn btn-info">버튼1</a>
					<a href="" role="button" class="btn btn-info">버튼2</a>
					<a href="" role="button" class="btn btn-info">버튼3</a>
				</p>
			</div>
		</div>		
	</body>
</html>