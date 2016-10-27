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
			#detailInfo ul li{float: left;}
			.detailInfo li{float: left;}.
		</style>
		<title>Insert title here</title>
	</head>
	<body>
		<div class="container">
			<h1>${selectLandmarkInfoOne.landmarkInfoName}</h1>
			<p>${cityInfoName} > 갈만한곳</p>
			<div id="detailInfo">
				<ul>
					<li>
						<img src="${selectLandmarkInfoOne.landmarkInfoImage}">
					</li>
					<li>
						<img src="https://maps.googleapis.com/maps/api/staticmap?center=37.57,127&markers=color:blue%7Clabel:%7C37.57,127&zoom=13&size=500x301&key=AIzaSyCvHmVG5i9J5JtWxL6ifRbneHjjEEkF04w">					
					</li>
				</ul>
			</div>
			<div>	
				<p id="infoContent">
					<strong>
						${selectLandmarkInfoOne.landmarkInfoSummary}
					</strong>
				</p>
				<p>
					<a href="" role="button" class="btn btn-info">버튼1</a>
					<a href="" role="button" class="btn btn-info">버튼2</a>
					<a href="" role="button" class="btn btn-info">버튼3</a>
				</p>
			</div>
		</div>		
	</body>
</html>