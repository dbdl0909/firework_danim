<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="selectEventInfoList" value="${searchMore.selectEventInfoList}"/>
<c:forEach var="selectEventInfoList" items="${selectEventInfoList}" varStatus="status">
	<tr>
		<td>${selectEventInfoList.cityInfoDoName} > ${selectEventInfoList.cityInfoName} > ${selectEventInfoList.eventInfoName}</td>
		<td><a class="eventInfo" href="eventInfo?eventInfoName=${selectEventInfoList.eventInfoName}&cityInfoName=${selectEventInfoList.cityInfoName}">가이드북</a></td>
	</tr>
</c:forEach>