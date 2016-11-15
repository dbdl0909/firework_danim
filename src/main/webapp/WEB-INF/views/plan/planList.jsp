<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html> 
	<head>
		<title>다님 플래너</title>
		<!-- <link rel="shortcut icon" href="../../resources/images/favicon.ico"> -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- google chrome CDN Jquery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="../../../resources/css/style.css">
		<style type="text/css">
			thead>tr>th{text-align: center;}
			tbody>tr>td:nth-child(1){width:80px; text-align: center;}
			tbody>tr>td:nth-child(3){width:110px; text-align: center;}
			tbody>tr>td:nth-child(4){width:130px; text-align: center;}
			tbody>tr>td:nth-child(5){width:70px; text-align: center;}
			tbody>tr>td:nth-child(6){width:70px; text-align: center;}
			/* tbody>tr:HOVER{color:#da8c92;cursor: pointer;} */
			.menu-wrap{text-align: right;}
			.form-wrap{text-align: center;}
		</style>
	</head>
<body>
<!-- 헤더 -->
<jsp:include page="../module/header.jsp" />

	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>No</th>
					<th>여행이름</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>				
			
			<c:forEach items="${planList}" var="planList">
				<tr> 
					<td>${planList.planNo}</td>					
					<td><a href="/plan/planDetailList?planNo=${planList.planNo}&planList=${planList}">${planList.planName}</a></td>
					<td>${planList.memberId}</td>
					<td>${planList.planDate}</td>
						
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>	
<jsp:include page="../module/footer.jsp" />

</body>
</html>