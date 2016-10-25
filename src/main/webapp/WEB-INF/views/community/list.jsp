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
<div class="container">
	<h2 class="sub-header">Section title</h2>
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
			<c:forEach items="${communityList}" var="list">	
				<c:if test="${list.communityNotice == 'T'}">
					<tr>
						<td style="font-weight:bold;">${list.communityNo}</td>
						<td style="font-weight:bold;"><a href="/community/communityDetail?communityNo=${list.communityNo}">[공지]${list.communitySubject}</a></td>
						<td style="font-weight:bold;">${list.memberId}</td>
						<td style="font-weight:bold;">${list.communityDate}</td>
						<td style="font-weight:bold;">${list.communityReadcount}</td>	
					</tr>
				</c:if>	
			</c:forEach>	
			<c:forEach items="${communityList}" var="list">				
				<tr> 							
					<td>${list.communityNo}</td>
					<td><a href="/community/communityDetail?communityNo=${list.communityNo}">${list.communitySubject}</a></td>
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
	<form class="form-wrap" method="post">
		<div>
			<c:if test="${page == startPage}">
				이전
			</c:if>
			<c:if test="${page>1}">
				<a href="/community/list?communityCategoryNo=community_category_01&page=${page-1}">이전</a>
			</c:if>
			<c:forEach begin="${startPage}" end="${endPage}" var="i">
				<a href="/community/list?communityCategoryNo=community_category_01&page=${i}">${i}</a>
			</c:forEach>
			<c:if test="${page == lastPage}">
				다음
			</c:if>	
			<c:if test="${page<lastPage}">
				<a href="/community/list?communityCategoryNo=community_category_01&page=${page+1}">다음</a>
			</c:if>
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
	</form>
</div>
</body>
<script type="text/javascript">

$('.searchOption').val($('.searchOptionVal').val());
var onWrite = function(){
	location.href = 'write'; 
};
var onList = function(){
	location.href = location.href;
};
var goPage = function(page){
	var form = $('.form-wrap')[0];
	$('.page').val(page);
	form.submit();
};

var onSearch = function(){
	var form = $('.form-wrap')[0];
	form.submit();
};

var onView = function(seq){
	location.href='view?seq='+seq;
};
</script>
</html>
