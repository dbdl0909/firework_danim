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
		<title>다님 플래너</title>
		<link rel="shortcut icon" href="../../resources/images/favicon.ico">
		<link rel="stylesheet" href="../../../resources/css/style.css">
		<style type="text/css">
			thead>tr>th{text-align: center;}
			tbody>tr>td:nth-child(1){width:80px; text-align: center;}
			tbody>tr>td:nth-child(3){width:110px; text-align: center;}
			tbody>tr>td:nth-child(4){width:130px; text-align: center;}
			tbody>tr>td:nth-child(5){width:70px; text-align: center;}
			tbody>tr>td:nth-child(6){width:70px; text-align: center;}
			tbody>tr:HOVER{color:#da8c92;cursor: pointer;}
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
						<th> </th>
						<th>#</th>
						<th>신고자</th>
						<th>글번호</th>
						<th>리플번호</th>
						<th>사유</th>
						<th>신고날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach varStatus="status" items="${qnaListAll}" var="qnaListAll">				
						<tr>
							<td><input type="checkbox"></td>
							<td>${(totalCount-status.index)-((page-1)*10)}</td>					
							<td><a href="/community/communityDetail?communityCategoryNo=${qnaListAll.communityCategoryNo}&communityNo=${qnaListAll.communityNo}">${qnaListAll.communitySubject}</a><span style="padding-left:10px; color:#ccc">[${qnaListAll.communityReplyCount}]</span></td>
							<td>${qnaListAll.memberId}</td>
							<td>${qnaListAll.communityUpdate}</td>
							<td>${qnaListAll.communityReadcount}</td>	
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
			<!-- 페이징 -->
		<div id="paginationWrap">
			<ul class="pagination">
			<li>
				<c:if test="${page>1}">
					<a href="/community/qnaListAll?communityCategoryNo=${param.communityCategoryNo}&page=${page-1}&searchOption=${param.searchOption}&searchInput=${param.searchInput}">&laquo;</a>
				</c:if>
			</li>
			<c:forEach begin="${startPage}" end="${endPage}" var="i">
			<li>
				<c:choose>
					<c:when test="${page == i}">
						<a href="/community/qnaListAll?communityCategoryNo=${param.communityCategoryNo}&page=${i}&searchOption=${param.searchOption}&searchInput=${param.searchInput}" style="background:#434343; color:#fff;">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="/community/qnaListAll?communityCategoryNo=${param.communityCategoryNo}&page=${i}&searchOption=${param.searchOption}&searchInput=${param.searchInput}">${i}</a>
					</c:otherwise>
				</c:choose>
			</li>
			</c:forEach>
			<li>
				<c:if test="${page<lastPage}">
					<a href="/community/qnaListAll?communityCategoryNo=${param.communityCategoryNo}&page=${page+1}&searchOption=${param.searchOption}&searchInput=${param.searchInput}">&raquo;</a>
				</c:if>
			</li>
			</ul>
		</div>
	</body>
</html>