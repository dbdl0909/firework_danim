<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<html>
<head>
<title>다님 플래너</title>
<link rel="shortcut icon" href="../../resources/images/favicon.ico">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
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
		
		$(".votecard em").clone().appendTo(".votecard div");
		/* increment that by 1 */
		var node = $(".votecard em:last strong")
		node.text(parseInt(node.text())+1);
		
		
		function flip(obj) {
			$('#voteForm').submit();
			obj.prev().find("em").animate({
				top: '-=45'
			}, 200);
			obj.toggleClass("voted",true);			
		}
		
		$('.voteaction').bind({
		  click: function(event) {
		    event.preventDefault()
		  },
		  mouseup: function() {
		    flip($(this));
			$(this).unbind('mouseup');
		  }
		});
	});
</script>

</head>
<body>
<c:if test="${param.votedCheck != null}" >
	<c:if test="${param.votedCheck == 'failed'}">
		<script>
			alert('추천은 한번만 가능합니다.');
		</script>
	</c:if>
	<c:if test="${param.votedCheck == 'voted'}">
		<script>
			alert('추천되었습니다.');
		</script>
	</c:if>
</c:if>
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
		<div id="voteArea">
			<div id="voteWrap">
				<div class="votecard">
					<div>
						<em><strong>${detailView.communityRating}</strong><span>추천</span></em>
					</div>
				</div>			
				<a class="voteaction" href="">Flippit</a>
				<form id="voteForm" action="/community/communityDetail" method="post">
					<input type="hidden" name="communityNo" value="${detailView.communityNo}">
					<input type="hidden" name="communityCategoryNo" value="${detailView.communityCategoryNo}">
					<input type="hidden" name="votedId" value="id001">
				</form>
			</div>
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
						<td id="replyAuthor">작성자 : <input type="text" id="memberId" name="memberId" value="id003"/></td>
						<td id="replyTextArea"><textarea id="replyContent" name="replyContent"></textarea></td>
						<td id="replyFormSubmitArea"><span type="button" id="replyFormSubmit" class="btn btn-primary" >등록</span></td>
					</tr>
				</form>
			</table>
		</div>
		<div id="communityContentButtonWrap" class="clearfix">
			<ul id="communityContentButton">
				<li>
					<a href="/community/communityModify?communityNo=${detailView.communityNo}"><span type="button" class="btn btn-primary">수정</span></a>
				</li>
				<li>
					<a href="/community/list?communityCategoryNo=${detailView.communityCategoryNo}"><span type="button" class="btn btn-primary">목록</span></a>
				</li>
			</ul>
		</div>
	</div>
<!-- 헤더 -->
<jsp:include page="../module/footer.jsp" />		
</body>
</html>
