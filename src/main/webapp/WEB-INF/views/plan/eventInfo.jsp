<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="listEventInfo" value="${totalInfo.listEventInfo}" />

<c:forEach var="listEventInfo" items="${listEventInfo}" varStatus="status">
	<li>${listEventInfo.eventInfoName}</li>
</c:forEach>