<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="selectStayInfoList" value="${searchMore.selectStayInfoList}"/>
<c:forEach var="selectStayInfoList" items="${selectStayInfoList}" varStatus="status">
	<tr>
		<td>${selectStayInfoList.cityInfoDoName} > ${selectStayInfoList.cityInfoName} > ${selectStayInfoList.stayInfoName}</td>
		<td><a class="stayInfo" href="stayInfo?stayInfoNo=${selectStayInfoList.stayInfoNo}&cityInfoName=${selectStayInfoList.cityInfoName}">가이드북</a></td>
	</tr>
</c:forEach>