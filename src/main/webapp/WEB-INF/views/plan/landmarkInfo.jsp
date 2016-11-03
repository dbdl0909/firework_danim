<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Landmark List</title>
	</head>
	<body>		
		<c:set var="listLandmarkInfo" value="${totalInfo.listLandmarkInfo}" />
		
		<ul id="mainPlanlandmarkUl">
			<c:forEach var="listLandmarkInfo" items="${listLandmarkInfo}" varStatus="status">
					<li><img class="landmarkInfoImage" src="${listLandmarkInfo.landmarkInfoImage}"/></li>
			</c:forEach>
		</ul>
	</body>
</html>