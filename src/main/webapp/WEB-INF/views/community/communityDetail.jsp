<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<script src="../../../resources/js/jquery.raty.min.js"></script>
<script>
$(document).ready(function(){
	$('#star').raty();	
})
</script>
</head>

<body>
	<div class="container">
		<div class="contents">
			<div class="title-wrap panel-heading">
				글 제목 : ${detailView.communitySubject}
			</div>	
			<div class="panel-body">
				<span class="recode-wrap">
					작성자 : ${detailView.memberId}				
				</span>
				<span class="hit-wrap">
					<span>조회수 : </span>${detailView.communityReadcount}
				</span>
				<div class="contents-wrap">
					${detailView.communityContent}
				</div>	
			</div>
		</div>
		<form class="viewForm" method="post">
			<a href="/community/communityModify?communityNo=${detailView.communityNo}"><span type="button" class="btn btn-primary">수정</span></a>
			<a href="/community/list?communityCategoryNo=${detailView.communityCategoryNo}"><span type="button" class="btn btn-primary">목록</span></a>
		</form>	
		<div id="replyWrap">
			<form name="replyForm" action="/community/communityReply" method="post">
				작성자 : <input type="text" name=""/>
				내용 : <input type="text" />
				별점 : <div id="star"></div>
			</form>
		</div>
	</div>	
</body>
</html>


