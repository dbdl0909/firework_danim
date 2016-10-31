<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>다님 플래너</title>
<link rel="shortcut icon" href="../../resources/images/favicon.ico">
<link href="../../../resources/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	$(document).ready(function(){
		$('.hiddenNavWrap').hover(function(){
			$(this).children('.hiddenNav').fadeIn(300);
		}, function(){
			$(this).children('.hiddenNav').hide();
		})		
	})
</script>
</head>
<body>
<!-- 헤더 -->
<div id="header">
	<div id="headerNavWrap" class="clearFix">
		<div id="headerLogo">
			<a href="/"><img src="../../resources/images/logo.png" ></a>
		</div>
		<div id="searchWrap">
			
		</div>
		<ul id="headerNav">
			<li class="hiddenNavWrap">
				<a href="/plan/mainPlan">플래너</a>							
			</li>
			<li class="hiddenNavWrap">
				<a href="/community/list">광장</a>
				<div class="hiddenNav">
					<dl>
						<dt>커뮤니티</dt>
						<dd><a href="/community/list?communityCategoryNo=community_category_01">플랜</a></dd>
						<dd><a href="/community/list?communityCategoryNo=community_category_02">후기</a></dd>
						<dd><a href="/community/list?communityCategoryNo=community_category_03">자유게시판</a></dd>
						<dd><a href="/community/list?communityCategoryNo=community_category_04">동행찾기</a></dd>
						<dt>Q&A</dt>
						<dd><a href="/community/list?communityCategoryNo=community_category_05">숙박시설</a></dd>
						<dd><a href="/community/list?communityCategoryNo=community_category_06">교통편</a></dd>
						<dd><a href="/community/list?communityCategoryNo=community_category_07">예약/결제</a></dd>
						<dd><a href="/community/list?communityCategoryNo=community_category_08">취소/환불/변경</a></dd>
						<dd><a href="/community/list?communityCategoryNo=community_category_09">회원/로그인</a></dd>
						<dd><a href="/community/list?communityCategoryNo=community_category_10">여행관련</a></dd>
					</dl>
				</div>
			</li>
			<li class="hiddenNavWrap">
				<a href="/search/infoSearch">가이드북</a>
			</li>
			<li class="hiddenNavWrap">
				<a href="">회원가입</a>
				<div class="hiddenNav">
					<dl>
						<dt>회원가입</dt>
						<dd>일반가입</dd>
						<dd>페이스북/구글 로그인</dd>
						<dd>로그인</dd>			
					</dl>
				</div>
			</li>
			<li class="hiddenNavWrap">
				<a href="">여기맛집</a>				
			</li>
			<li class="hiddenNavWrap">
				<a href="">추천숙소</a>				
			</li>
			<li class="hiddenNavWrap">
				<a href="">여행검색</a>				
			</li>
		</ul>
	</div>
</div>
</body>
</html>