<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<c:set var="listLandmarkInfo" value="${totalInfo.listLandmarkInfo}" />

<c:forEach var="listLandmarkInfo" items="${listLandmarkInfo}" varStatus="status">
	<li class="clickLandmark">
		<img class="landmarkInfoImage" src="${listLandmarkInfo.landmarkInfoImage}"/>
		<span class="landmarkInfoName">${listLandmarkInfo.landmarkInfoName}</span>
		<input class="landmarkInfoNo" type="hidden" value="${listLandmarkInfo.landmarkInfoNo}"/>
		<input class="landmarkInfoLangitude" type="hidden" value="${listLandmarkInfo.landmarkInfoLangitude}"/>
		<input class="landmarkInfoLatitude" type="hidden" value="${listLandmarkInfo.landmarkInfoLatitude}"/>
	</li>
	<c:set var="listLandmarkCount" value="${status.count}" />
</c:forEach>
<input id="listLandmarkCount" type="hidden" value="${listLandmarkCount}"/>