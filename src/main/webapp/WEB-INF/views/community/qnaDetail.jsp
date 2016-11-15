<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<html> 
	<head>
		<title>다님 플래너</title>
		<link rel="shortcut icon" href="../../resources/images/favicon.ico">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="../../resources/se/js/HuskyEZCreator.js" charset="utf-8" ></script>
		<script type="text/javascript" src="../../resources/se/js/jindo.min.js" charset="utf-8" ></script>
		<!-- google chrome CDN Jquery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="../../../resources/css/style.css">
		<script>
			$(document).ready(function(){
				$('#replyFormSubmit').click(function() {
					if($('#memberId').val() == '' || $('#replyContent').val() == '' ){
						alert('작성자, 내용은 필수 입력사항입니다.');
					}else {
						$('#replyForm').submit();
					}
				});
				
				$('#modifyButton').click(function() {
					var sessionId = "<c:out value='${sessionScope.memberId}'/>";
					var communityId = "<c:out value='${detailView.memberId}'/>";
					var communityCategoryNo = "<c:out value='${detailView.communityCategoryNo}'/>";
					var communityNo = "<c:out value='${detailView.communityNo}'/>";
									
					if(sessionId == communityId) {
						$('#memberIdCheckForPlan').attr('href', '/plan/mainPlan?memberId=' + memberId);
						$('#modifyA').attr('href', '/community/communityModify?communityCategoryNo=' + communityCategoryNo + '&communityNo=' + communityNo + '&boardCheck=C');
					}else if(sessionId != communityId){
						alert('게시글을 수정할 권한이 없습니다');
					}
				})
				
				/* $('#deleteButton').click(function(){
					if(${sessionScope.memberId} != ${detailView.memberId}) {
						alert('남의 게시글을 삭제하지마라 이놈');
						return
					}
				}); */
			});
		</script>
	</head>
<body>
<!-- 헤더 -->
<jsp:include page="../module/header.jsp" />
	<div class="container">
		<div id="communityContent" class="clearFix">
			<dl id="communityContentSubject">
				<dt>
					글 제목
				</dt>
				<dd>
					${detailView.communitySubject}
				</dd>
			</dl>
			<dl class="communityContentInfo">	
				<dt>
					작성자
				</dt>
				<dd>
					${detailView.memberId}
				</dd>
			</dl>
			<dl class="communityContentInfo">	
				<dt>
					조회수
				</dt>
				<dd>
					${detailView.communityReadcount}
				</dd>
			</dl>
			<dl class="communityContentInfo">	
				<dt>
					댓글수
				</dt>
				<dd>
					${detailView.communityReplyCount}
				</dd>
			</dl>
		</div>
		<div id="communityContentContain">
			${detailView.communityContent}			
		</div>
		<div id="replyWrap">
			<table class="replyTalbe">
				<c:forEach items="${detailViewReply}" var="replyList">				
					<tr>
						<td id="replyWriter">${replyList.memberId}</td>
						<td id="replyContentView">${replyList.replyContent}</td>
						<td id="replyDate">${replyList.replyDate}</td>
					</tr>
				</c:forEach>				
			</table>
			<table class="replyinsertTable">
				<form id="replyForm" name="replyForm" action="/community/communityReply" method="post">
					<tr>
						<input type="hidden" name="communityNo" value="${detailView.communityNo}" />
						<input type="hidden" name="communityCategoryNo" value="${detailView.communityCategoryNo}" />									
						<td id="replyAuthor">작성자 : <input type="text" id="memberId" name="memberId" value="${sessionScope.memberId}" readonly="readonly" style="border: 0"/></td>
						<td id="replyTextArea"><textarea id="replyContent" name="replyContent"></textarea></td>
						<td id="replyFormSubmitArea"><span type="button" id="replyFormSubmit" class="btn btn-primary" >등록</span></td>
					</tr>
				</form>
			</table>
		</div>
		<div id="communityContentButtonWrap" class="clearfix">
			<ul id="communityContentButton">
				<li>
					<a id="modifyA">
						<span id="modifyButton" type="button" class="btn btn-primary">수정</span>
					</a>
				</li>
				<li>
					<c:if test="${sessionScope.memberLevel == '관리자'}">
						<a href="/community/communityDelete?communityCategoryNo=${detailView.communityCategoryNo}&communityNo=${detailView.communityNo}"><span type="button" id="deleteButton" class="btn btn-primary">삭제</span></a>
					</c:if>
					<c:if test="${sessionScope.memberLevel == '유저'}">
						<a href="/community/communityDelete?communityCategoryNo=${detailView.communityCategoryNo}&communityNo=${detailView.communityNo}&memberId=${sessionScope.memberId}"><span type="button" id="deleteButton" class="btn btn-primary">삭제</span></a>
					</c:if>					
					
				</li>				
				<li>
					<c:if test="${sessionScope.memberLevel == '관리자'}">
						<a href="/community/qnaListAll?communityCategoryNo=${detailView.communityCategoryNo}"><span type="button" class="btn btn-primary">목록</span></a>
					</c:if>
					<c:if test="${sessionScope.memberLevel == '유저'}">
						<a href="/community/myQnaList?memberId=${sessionScope.memberId}&communityCategoryNo=${detailView.communityCategoryNo}"><span type="button" class="btn btn-primary">목록</span></a>
					</c:if>				
				</li>
			</ul>
		</div>
	</div>
<!-- 헤더 -->
<jsp:include page="../module/footer.jsp" />		
</body>
</html>
