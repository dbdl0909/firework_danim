<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<title>Insert title here</title>
<style type="text/css">
	thead>tr>th{text-align: center;}
	tbody>tr>td:nth-child(1){width:80px; text-align: center;}
	tbody>tr>td:nth-child(3){width:110px; text-align: center;}
	tbody>tr>td:nth-child(4){width:130px; text-align: center;}
	tbody>tr>td:nth-child(5){width:70px; text-align: center;}
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
		<c:when test="${param.communityCategoryNo == 'community_category_05'}">
			<h2 class="sub-header">숙박시설</h2>
		</c:when>
		<c:when test="${param.communityCategoryNo == 'community_category_06'}">
			<h2 class="sub-header">교통편</h2>
		</c:when>
		<c:when test="${param.communityCategoryNo == 'community_category_07'}">
			<h2 class="sub-header">예약/결제</h2>
		</c:when>
		<c:when test="${param.communityCategoryNo == 'community_category_08'}">
			<h2 class="sub-header">취소/환불/변경</h2>
		</c:when>
		<c:when test="${param.communityCategoryNo == 'community_category_09'}">
			<h2 class="sub-header">회원/로그인</h2>
		</c:when>
		<c:when test="${param.communityCategoryNo == 'community_category_10'}">
			<h2 class="sub-header">여행관련</h2>
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
				</tr>
			</thead>
			<tbody>				
			<!-- 공지글만 출력하는 포이치문 -->	
			<c:forEach items="${communityNoticeList}" var="noticeList">	
				<tr>
					<td style="font-weight:bold;">[공지]</td>
					<td style="font-weight:bold;"><a href="/community/communityDetail?communityNo=${noticeList.communityNo}">${noticeList.communitySubject}</a><span style="padding-left:10px; color:#ccc">[${noticeList.communityReplyCount}]</span></td>
					<td style="font-weight:bold;">${noticeList.memberId}</td>
					<td style="font-weight:bold;">${noticeList.communityDate}</td>
					<td style="font-weight:bold;">${noticeList.communityReadcount}</td>	
				</tr>
			</c:forEach>
			<!-- 게시글 출력 포이치문 -->	
			<c:forEach varStatus="status" items="${communityList}" var="list">				
				<tr> 
					<td>${(totalCount-status.index)-((page-1)*10)}</td>					
					<td><a href="/community/communityDetail?communityNo=${list.communityNo}">${list.communitySubject}</a><span style="padding-left:10px; color:#ccc">[${list.communityReplyCount}]</span></td>
					<td>${list.memberId}</td>
					<td>${list.communityDate}</td>
					<td>${list.communityReadcount}</td>			
				</tr>
			</c:forEach>				
			</tbody>
		</table>
	</div>	
	<div class="menu-wrap">
		<button type="button" onclick="onWrite()" class="btn btn-primary">쓰기</button>
		<button type="button" onclick="onList()" class="btn btn-primary">목록</button>
	</div>
	<div >
		<ul class="pagination">
		<li>
			<c:if test="${page>1}">
				<a href="/community/list?communityCategoryNo=community_category_01&page=${page-1}">&laquo;</a>
			</c:if>
		</li>
		<c:forEach begin="${startPage}" end="${endPage}" var="i">
		<li>
			<c:choose>
				<c:when test="${page == i}">
					<a href="/community/list?communityCategoryNo=community_category_01&page=${i}" style="font-weigt:bold;">${i}</a>
				</c:when>
				<c:otherwise>
					<a href="/community/list?communityCategoryNo=community_category_01&page=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</li>
		</c:forEach>
		<li>
			<c:if test="${page<lastPage}">
				<a href="/community/list?communityCategoryNo=community_category_01&page=${page+1}">&raquo;</a>
			</c:if>
		</li>
		</ul>
	</div>
		<%-- <div class="search">
			<div class="col-lg-4">
				<div class="input-group">
					<span class="input-group-btn">
					<select name="searchOption" class="searchOption btn btn-default ">
						<option value="title">제목</option>
						<option value="contents">내용</option>
						<option value="author">작성자</option>
					</select>
					</span>
					<input type="hidden" class="searchOptionVal" value="${CommunityDto.searchOption}" />
					<input type="text" name="searchInput" class="form-control" value="${CommunityDto.searchInput}" />
					 <span class="input-group-btn">
						<button type="button" onclick="onSearch()" class="btn btn-"><span class="glyphicon glyphicon-search"></span> 검색</button>
					</span>
				</div>
			</div>	
		</div> --%>
</div>
<!-- 헤더 -->
<jsp:include page="../module/footer.jsp" />
</body>
<script type="text/javascript">
var onWrite = function(){
	location.href = '/community/write'; 
};
var onList = function(){
	location.href = location.href;
};
</script>
</html>
