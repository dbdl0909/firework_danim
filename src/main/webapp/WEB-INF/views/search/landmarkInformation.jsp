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
		<script type="text/javascript">
		$(document).ready(function(){
			$('#bookmarkButton').click(function() {
				console.log('왜안되지');
				console.log($('#a').val());
				$("#AllformSubmit").attr("action", "/search/insertBookmark");
				$('#AllformSubmit').submit();
			});			
		});
		</script>
	</head>
	<jsp:include page="../module/header.jsp"></jsp:include>
	<body>
		<form id="AllformSubmit" action="" method="post">
			<input id="a" name="bookmarkInfo" type="hidden" value="${selectLandmarkInfoOne.landmarkInfoNo}"/>
			<input name="memberId" type="hidden" value="${sessionScope.memberId}"/>
		</form>
		<div class="container">
			<p class="infoButton">
				<!-- <a href="/" role="button" class="btn btn-info">홈으로</a> -->
				<a id="bookmarkButton" class="btn btn-info">관심목록에 추가</a>
				<!-- <a id="addToPlan" role="button" class="btn btn-info">일정에 추가</a> -->
			</p>
			
			<h1>${selectLandmarkInfoOne.landmarkInfoName}</h1>
			<p>${cityInfoName} > 갈만한곳</p>
			<div class="infoImage">
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
						<li>홈페이지 : <a href="${selectLandmarkInfoOne.landmarkInfoHomepage}">${selectLandmarkInfoOne.landmarkInfoHomepage}</a></li>
						<li>이용료 : ${selectLandmarkInfoOne.landmarkInfoFee} 원</li>
					</ul>
				</p>
			</div>
		</div>		
	</body>
	<jsp:include page="../module/footer.jsp"></jsp:include>
</html>