<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<script>
	$(document).ready(function(){
		$('#replyFormSubmit').click(function() {
			if($('#memberId').val() == '' || $('#replyContent').val() == '' ){
				alert('작성자, 내용은 필수 입력사항입니다.');
			}else {
				$('#replyForm').submit();
			}
		});		
	});
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
				<span class="hit-wrap">
					<span>댓글수 : </span>${detailView.communityReplyCount}
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
			<table>
				<colgroup>
					<col width="25%">
					<col width="50%">
					<col width="25%">
				</colgroup>
				<c:forEach items="${detailViewReply}" var="replyList">				
					<tr>
						<td>${replyList.memberId}</td>
						<td>${replyList.replyContent}</td>
						<td>${replyList.replyDate}</td>
					</tr>
				</c:forEach>				
			</table>
			<table>
				<form id="replyForm" name="replyForm" action="/community/communityReply" method="post">
					<tr>
						<input type="hidden" name="communityNo" value="${detailView.communityNo}" />
						<input type="hidden" name="communityCategoryNo" value="${detailView.communityCategoryNo}" />									
						<td>작성자 : <input type="text" id="memberId" name="memberId" value="id003"/></td><td><textarea id="replyContent" name="replyContent"></textarea></td><td><span type="button" id="replyFormSubmit" class="btn btn-primary" >등록</span></td>
					</tr>
				</form>
			</table>
		</div>
	</div>	
</body>
</html>
