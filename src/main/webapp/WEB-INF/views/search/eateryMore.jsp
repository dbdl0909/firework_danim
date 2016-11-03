<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- google chrome CDN Jquery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<!-- 자체 css -->
		<link href="../../../resources/css/style.css" rel="stylesheet" type="text/css">
		<title>Insert title here</title>
	</head>
	<body>
	<div class="table-responsive">
		<table class="table">
			<c:forEach var="searchMore" items="${searchMore}" varStatus="status">
				<tr>
					<td>${searchMore.cityInfoDoName} > ${searchMore.cityInfoName} > ${searchMore.eateryName}</td>
					<td><a class="eateryInfo" href="eateryInfo?eateryNo=${searchMore.eateryNo}&cityInfoName=${searchMore.cityInfoName}">가이드북</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	</body>
</html>