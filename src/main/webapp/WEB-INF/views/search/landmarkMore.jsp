<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="selectLandmarkInfoList" value="${searchMore.selectLandmarkInfoList}"/>
<c:forEach var="selectLandmarkInfoList" items="${selectLandmarkInfoList}" varStatus="status">
	<tr>
		<td>${selectLandmarkInfoList.cityInfoDoName} > ${selectLandmarkInfoList.cityInfoName} > ${selectLandmarkInfoList.landmarkInfoName}</td>
		<td><a class="landmarkInfo" href="landmarkInfo?landmarkInfoNo=${selectLandmarkInfoList.landmarkInfoNo}&cityInfoName=${selectLandmarkInfoList.cityInfoName}">가이드북</a></td>
	</tr>
</c:forEach>