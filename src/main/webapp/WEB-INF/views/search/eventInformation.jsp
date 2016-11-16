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
		<!-- 자체 css -->
		<link href="../../../resources/css/style.css" rel="stylesheet" type="text/css">		
		<title>다님 플래너</title>
	</head>
	<jsp:include page="../module/header.jsp"></jsp:include>
	<body>
		<div class="container">
			<h1>${selectEventInfoOne.eventInfoName}</h1>
			<p>${cityInfoName} > 볼만한 것</p>
			<div class="infoImage">
				<p>
					<!-- <img src=""> --> 이미지 준비중입니다						
				</p>
			</div>				
			<div>	
				<p id="infoExplain">
					<strong>
						${selectEventInfoOne.eventInfoContent}
					</strong>
				</p>
				<hr>
				<p id ="infoContent">
					<ul>
						<li>축제명 : ${selectEventInfoOne.eventInfoName}</li>
						<li>개최장소 : ${selectEventInfoOne.eventInfoVenue}</li>
						<li>축제시작일 : ${selectEventInfoOne.eventInfoStart}</li>
						<li>축제종료일 : ${selectEventInfoOne.eventInfoEnd}</li>
						<li>주최기관 : ${selectEventInfoOne.eventInfoOrganizer}</li>
						<li>전화번호 : ${selectEventInfoOne.eventInfoContact}</li>
						<li>홈페이지 : <a href="${selectEventInfoOne.eventInfoHomepage}">${selectEventInfoOne.eventInfoHomepage}</a></li>
						<li>주소지 : ${selectEventInfoOne.eventInfoAddress}</li>
					</ul>
				</p>
				<p class="infoButton">
					<a href="/" role="button" class="btn btn-info">홈으로</a>
					<a href="" role="button" class="btn btn-info">버튼2</a>
					<a href="" role="button" class="btn btn-info">버튼3</a>
				</p>
			</div>
		</div>
	</body>
	<jsp:include page="../module/footer.jsp"></jsp:include>
</html>