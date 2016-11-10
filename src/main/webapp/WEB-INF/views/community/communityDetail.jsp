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
				
				$(".votecard em").clone().appendTo(".votecard div");
				/* increment that by 1 */
				var node = $(".votecard em:last strong")
				node.text(parseInt(node.text())+1);	
				
				function flip(obj) {			
					obj.prev().find("em").animate({
						top: '-=45'
					}, 200);
					obj.toggleClass("voted",true);
					
				}
		
				$('.voteaction').bind({
				  click: function(event) {
				    event.preventDefault()
				    setTimeout("$('#voteForm').submit()", 140);
				  },
				  mouseup: function() {
				    var moved = flip($(this));
					$(this).unbind('mouseup');
					 
				  }
				});
				
			    $("#reportButton").click(function(){
			        $('div.modal').modal();
			    })
			    
			    $('#reportSubmit').click(function(){
			    	$('#reportForm').submit();
			    });
			    
			});
		</script>
		<style type="text/css">
			.modal-dialog{z-index: 3000;}
			.modal-content{margin-top: 200px;}
			#reportForm{height: 180px;}
			#reportReason{height: 200px; width: 568px;}
		</style>
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
					<input type="hidden" name="votedId" value="${sessionScope.memberId}">
				</form>
				<c:if test="${param.votedCheck != null}" >
					<c:if test="${param.votedCheck == 'failed'}">
						<script>
							alert('추천은 한 번만 가능합니다.');
						</script>
						<c:set var="votedCheck" />
					</c:if>
					<c:if test="${param.votedCheck == 'voted'}">
						<script>
							alert('추천되었습니다.');
						</script>
						<c:set var="votedCheck" />
					</c:if>
				</c:if>
			</div>
		</div>
		<div id="reportWrap" style="float:right;">
			<button id="reportButton" type="button" class="btn btn-danger btn-xs">게시글 신고</button>
			<div class="modal fade" id="reportModal" role="dialog">
				<div class="modal-dialog">	
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">Close</button>
							<h4 class="modal-title">게시글 신고</h4>
						</div>
						<div class="modal-body">
							<form id="reportForm" action="/community/communityReport" method="post">
								<textarea id="reportReason" name="reportReason" placeholder="신고사유를 적어주세요"></textarea>
								<input name="memberId" type="hidden" value="${sessionScope.memberId}">
								<input name="communityNo" type="hidden" value="${detailView.communityNo}">
							</form>
						</div>
						<div class="modal-footer">
							<button id="reportSubmit" type="button" class="btn btn-default">신고</button>
						</div>
					</div>			      
				</div>
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
					<a href="/community/communityModify?communityCategoryNo=${detailView.communityCategoryNo}&communityNo=${detailView.communityNo}&boardCheck=C"><span type="button" class="btn btn-primary">수정</span></a>
				</li>
				<li>
					<a href="/community/communityDelete?communityCategoryNo=${detailView.communityCategoryNo}&communityNo=${detailView.communityNo}&memberId=${sessionScope.memberId}"><span type="button" class="btn btn-primary">삭제</span></a>
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
