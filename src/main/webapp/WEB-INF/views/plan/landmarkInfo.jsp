<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Landmark List</title>
	</head>
	<body>
		
		<ul id="mainPlanlandmarkUl">
			<c:forEach var="listLandmark" items="${listLandmarkInfo}">
				<li>
					<img class="landmarkInfoImage" src="${listLandmark.landmarkInfoImage}"/>
					<span>${listLandmark.landmarkInfoName}</span>
				</li>
				<%-- <li>${listLandmark.landmarkInfoNo}</li>
				<li>${listLandmark.landmarkInfoLocation}</li>
				<li>${listLandmark.landmarkInfoHomepage}</li>
				<li>${listLandmark.landmarkInfoSummary}</li>
				<li>${listLandmark.landmarkInfoLangitude}</li>
				<li>${listLandmark.landmarkInfoLatitude}</li>
				<li>${listLandmark.landmarkInfoFee}</li>
				<li>---------------------------------</li> --%>
			</c:forEach>
		</ul>
	</body>
</html>