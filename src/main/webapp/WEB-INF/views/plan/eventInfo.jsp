<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="listEventInfo" value="${totalInfo.listEventInfo}" />

<c:forEach var="listEventInfo" items="${listEventInfo}" varStatus="status">
	<li style="line-height: 3em; margin-left:15px;">${listEventInfo.eventInfoName}</li>
</c:forEach>