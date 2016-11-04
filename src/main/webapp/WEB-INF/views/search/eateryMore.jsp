<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="selectEateryInfoList" value="${searchMore.selectEateryInfoList}"/>
<c:forEach var="selectEateryInfoList" items="${selectEateryInfoList}" varStatus="status">
	<tr>
		<td>${selectEateryInfoList.cityInfoDoName} > ${selectEateryInfoList.cityInfoName} > ${selectEateryInfoList.eateryName}</td>
		<td><a class="eateryInfo" href="eateryInfo?eateryNo=${selectEateryInfoList.eateryNo}&cityInfoName=${selectEateryInfoList.cityInfoName}">가이드북</a></td>
	</tr>
</c:forEach>