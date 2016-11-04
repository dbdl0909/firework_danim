<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="listStayInfo" value="${totalInfo.listStayInfo}" />

<c:forEach var="listStayInfo" items="${listStayInfo}" varStatus="status">
	<li style="line-height: 3em; margin-left:15px;">${listStayInfo.stayInfoName}</li>
</c:forEach>