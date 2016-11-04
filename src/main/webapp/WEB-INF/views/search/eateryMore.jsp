<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:forEach var="searchMore" items="${searchMore}" varStatus="status">
		<tr>
			<td>${searchMore.cityInfoDoName} > ${searchMore.cityInfoName} > ${searchMore.eateryName}</td>
			<td><a class="eateryInfo" href="eateryInfo?eateryNo=${searchMore.eateryNo}&cityInfoName=${searchMore.cityInfoName}">가이드북</a></td>
		</tr>
	</c:forEach>