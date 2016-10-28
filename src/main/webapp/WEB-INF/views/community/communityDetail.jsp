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
<style>
#communityContent{width:100%; border-top:1px solid #ccc; background:#fafafa;}
#communityContent dl{float:left; padding-left:20px}
#communityContent dl dt,
#communityContent dl dd{float:left;}
#communityContent dl dt{color:#8b8b8b; font-size:12px;}
#communityContent dl dd{color:#3c3c3c; font-size:13px; margin-left:5px;}
#communityContent #communityContentSubject{width:100%; padding-top:18px;}
#communityContent .communityContentInfo{margin-right:10px;}
#communityContent .communityContentInfo dd{}
#communityContentContain{width:100%; margin:20px auto;}

#communityContentButtonWrap #communityContentButton li{float:left; list-style: none; padding:0 10px;]}
#replyWrap{width:100%; margin:20px auto; background:#fafafa; padding:13px 0;}
#replyWrap .replyTalbe{width:100%; text-align:left;}
#replyWrap .replyTalbe tr{border-bottom:1px dotted #ccc;}
#replyWrap .replyTalbe td{float:left; line-height:3em; font-size:12px; color:#3c3c3c;}
#replyWrap .replyTalbe #replyWriter{padding:0 20px;}
#replyWrap .replyTalbe #replyDate{float:right; padding-right:20px;}
.replyinsertTable{width:100%; margin:28px 0; vertical-align:middle;}
.replyinsertTable #replyAuthor{width:20%; padding-left:20px; font-size:12px;}
.replyinsertTable #replyAuthor input{width:130px;}
.replyinsertTable #replyTextArea{width:70%;}
.replyinsertTable #replyTextArea textarea{width:100%; height:60px;}
.replyinsertTable #replyFormSubmitArea{float:right; padding-right:20px;}
#communityContentButtonWrap{width:100%; padding-top:20px;}
#communityContentButtonWrap #communityContentButton{float:right; }
</style>
</head>
<body>
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
		
		<%-- <table class="communityContentTable">
			<thead>
				<tr>
					<td><span class="communityTitleText">글 제목 : </span>${detailView.communitySubject}</td>
				</tr>
				<tr>
					<td>
						<span class="communityTitleText">작성자 : </span><span class="communityTitleContent"> ${detailView.memberId} | </span>
						<span class="communityTitleText">조회수 : </span><span class="communityTitleContent"> ${detailView.communityReadcount} | </span>
						<span class="communityTitleText">댓글수 : </span><span class="communityTitleContent"> ${detailView.communityReplyCount} </span>
					</td>
				</tr>
			</thead>		
			<tbody>
				<tr>
					<td colspan="5">${detailView.communityContent}</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td>
						<a href="/community/communityModify?communityNo=${detailView.communityNo}"><span type="button" class="btn btn-primary">수정</span></a>
					</td>
					<td>
						<a href="/community/list?communityCategoryNo=${detailView.communityCategoryNo}"><span type="button" class="btn btn-primary">목록</span></a>
					</td>
				</tr>
			</tfoot>			
		</table> --%>
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
</body>
</html>
