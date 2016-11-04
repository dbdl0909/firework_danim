<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<c:set var="listLandmarkInfo" value="${totalInfo.listLandmarkInfo}" />

<c:forEach var="listLandmarkInfo" items="${listLandmarkInfo}" varStatus="status">
	<li class="clickLandmark">
		<img class="landmarkInfoImage" src="${listLandmarkInfo.landmarkInfoImage}"/>
		${listLandmarkInfo.landmarkInfoName}
	</li>
</c:forEach>