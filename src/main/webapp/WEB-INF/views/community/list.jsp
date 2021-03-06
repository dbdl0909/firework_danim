<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html> 
	<head>
		<title>다님 플래너</title>
		<link rel="shortcut icon" href="../../resources/images/favicon.ico">
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
			tbody>tr:HOVER{color:#da8c92;cursor: pointer;}
			.menu-wrap{text-align: right;}
			.form-wrap{text-align: center;}
		</style>
	</head>
<body>
<!-- 헤더 -->
<jsp:include page="../module/header.jsp" />
<div class="container">
	<c:choose>
		<c:when test="${param.communityCategoryNo == 'community_category_01'}">
			<h2 class="sub-header">플랜</h2>
		</c:when>
		<c:when test="${param.communityCategoryNo == 'community_category_02'}">
			<h2 class="sub-header">후기</h2>
		</c:when>
		<c:when test="${param.communityCategoryNo == 'community_category_03'}">
			<h2 class="sub-header">자유게시판</h2>
		</c:when>
		<c:when test="${param.communityCategoryNo == 'community_category_04'}">
			<h2 class="sub-header">동행찾기</h2>
		</c:when>
		<c:otherwise>
			<h2 class="sub-header">플랜</h2>
		</c:otherwise>
	</c:choose>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>#</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>추천수</th>
				</tr>
			</thead>
			<tbody>				
			<!-- 공지글만 출력하는 포이치문 -->	
			<c:forEach items="${communityNoticeList}" var="noticeList">	
				<tr>
					<td style="font-weight:bold;">[공지]</td>
					<td style="font-weight:bold;"><a href="/community/communityDetail?communityCategoryNo=${noticeList.communityCategoryNo}&communityNo=${noticeList.communityNo}">${noticeList.communitySubject}</a><span style="padding-left:10px; color:#ccc">[${noticeList.communityReplyCount}]</span></td>
					<td style="font-weight:bold;">${noticeList.memberId}</td>
					<td style="font-weight:bold;">${noticeList.communityUpdate}</td>
					<td style="font-weight:bold;">${noticeList.communityReadcount}</td>	
					<td style="font-weight:bold;">${noticeList.communityRating}</td>	
				</tr>
			</c:forEach>
			<!-- 게시글 출력 포이치문 -->	
			<c:forEach varStatus="status" items="${communityList}" var="list">				
				<tr> 
					<td>${(totalCount-status.index)-((page-1)*10)}</td>					
					<td><a href="/community/communityDetail?communityCategoryNo=${list.communityCategoryNo}&communityNo=${list.communityNo}">${list.communitySubject}</a><span style="padding-left:10px; color:#ccc">[${list.communityReplyCount}]</span></td>
					<td>${list.memberId}</td>
					<td>${list.communityUpdate}</td>
					<td>${list.communityReadcount}</td>	
					<td>${list.communityRating}</td>		
				</tr>
			</c:forEach>				
			</tbody>
		</table>
	</div>	
	<div class="menu-wrap">
		<button type="button" onclick="onWrite()" class="btn btn-primary">쓰기</button>
		<button type="button" onclick="onList()" class="btn btn-primary">전체목록</button>
	</div>
	<c:if test="${param.searchOption != null and param.searchInput != null}">
		<div id="paginationWrap">
			<ul class="pagination">
			<li>
				<c:if test="${page>1}">
					<a href="/community/list?communityCategoryNo=${param.communityCategoryNo}&page=${page-1}&searchOption=${param.searchOption}&searchInput=${param.searchInput}">&laquo;</a>
				</c:if>
			</li>
			<c:forEach begin="${startPage}" end="${endPage}" var="i">
			<li>
				<c:choose>
					<c:when test="${page == i}">
						<a href="/community/list?communityCategoryNo=${param.communityCategoryNo}&page=${i}&searchOption=${param.searchOption}&searchInput=${param.searchInput}" style="background:#434343; color:#fff;">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="/community/list?communityCategoryNo=${param.communityCategoryNo}&page=${i}&searchOption=${param.searchOption}&searchInput=${param.searchInput}">${i}</a>
					</c:otherwise>
				</c:choose>
			</li>
			</c:forEach>
			<li>
				<c:if test="${page<lastPage}">
					<a href="/community/list?communityCategoryNo=${param.communityCategoryNo}&page=${page+1}&searchOption=${param.searchOption}&searchInput=${param.searchInput}">&raquo;</a>
				</c:if>
			</li>
			</ul>
		</div>
	</c:if>
	<c:if test="${param.searchOption == null and param.searchInput == null }">
		<div id="paginationWrap">
			<ul class="pagination">
			<li>
				<c:if test="${page>1}">
					<a href="/community/list?communityCategoryNo=${param.communityCategoryNo}&page=${page-1}">&laquo;</a>
				</c:if>
			</li>
			<c:forEach begin="${startPage}" end="${endPage}" var="i">
			<li>
				<c:choose>
					<c:when test="${page == i}">
						<a href="/community/list?communityCategoryNo=${param.communityCategoryNo}&page=${i}" style="background:#434343; color:#fff;">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="/community/list?communityCategoryNo=${param.communityCategoryNo}&page=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</li>
			</c:forEach>
			<li>
				<c:if test="${page<lastPage}">
					<a href="/community/list?communityCategoryNo=${param.communityCategoryNo}&page=${page+1}">&raquo;</a>
				</c:if>
			</li>
			</ul>
		</div>
	</c:if>
	<div id="searchWrap" class="clearfix">
		<div class="search clearfix">
			<div class="col-lg-4">
				<div class="input-group">
					<span class="input-group-btn">
					<select id="searchOption" name="searchOption" class="searchOption btn btn-default ">
						<option value="title">제목</option>
						<option value="contents">내용</option>
						<option value="author">작성자</option>
					</select>
					</span>
					<input type="text" id="searchInput" name="searchInput" class="form-control" value="${param.searchInput}" />
					<span class="input-group-btn">
						<button type="button" onclick="onSearch()" class="btn btn-"><span class="glyphicon glyphicon-search"></span> 검색</button>
					</span>
				</div>
			</div>	
		</div>
	</div>
</div>
<!-- 헤더 -->
<jsp:include page="../module/footer.jsp" />
</body>
<script type="text/javascript">
var onWrite = function(){
	var memberId = "<c:out value='${sessionScope.memberId}' />";
	if(memberId != "") {
		location.href = '/community/write?communityCategoryNo='+'${param.communityCategoryNo}'+'&'+'boardCheck=C'; 		
	}else if(memberId == "") {
		alert('로그인을 해주세요');
	}
};
var onList = function(){
	location.href = '/community/list?communityCategoryNo='+'${param.communityCategoryNo}';
};
var onSearch = function(){
	location.href= '/community/list?communityCategoryNo='+'${param.communityCategoryNo}'
			+'&searchOption='+document.getElementById('searchOption').value
			+'&searchInput='+document.getElementById('searchInput').value;
}
</script>
</html>
