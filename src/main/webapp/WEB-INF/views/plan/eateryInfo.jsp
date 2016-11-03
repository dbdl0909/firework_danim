<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Landmark List</title>
	</head>
	<body>		
		<c:set var="listEateryInfo" value="${totalInfo.listEateryInfo}" />
		
		<ul id="mainPlanEateryUl">
			<c:forEach var="listEateryInfo" items="${listEateryInfo}" varStatus="status">
				<li>${listEateryInfo.eateryName}</li>
			</c:forEach>
		</ul>
	</body>
</html>