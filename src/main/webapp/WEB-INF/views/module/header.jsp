<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>다님 플래너</title>
<link rel="shortcut icon" href="../../resources/images/favicon.ico">
<link href="../../../resources/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('.hiddenNavWrap').hover(function(){
			$(this).children('.hiddenNav').fadeIn(300);
		}, function(){
			$(this).children('.hiddenNav').hide();
		});
		
		/* '.searchCityNameSpan' 에 마우스를 가져가면 투명해지는 애니메이션 효과 */
		$(".searchCityNameSpan").mouseover(function(){
			$('.searchCityNameSpan').stop().animate({opacity:'0.3'});
		});
		
		/* '.searchCityNameSpan' 에 마우스가 벗어나면 다시 원래 투명도로 돌아가는 애니메이션 효과 */
		$(".searchCityNameSpan").mouseout(function(){
			$('.searchCityNameSpan').stop().animate({opacity:'1'});
		});
		
		/* 'searchCityNameSpan' 클릭시 해당 글씨를 숨기고 검색바를 화면에 나타나게한 후 포커스 */
		$('.searchCityNameSpan').click(function(){
			$('#header').hide();
			$('#searchHeader').show();
			$('#infoSearchInput').focus();
		});
		
		/* 'closeSearchForm' 클릭시 검색바를 숨기고 다시 원래 글씨를 나타나게 한다 */
		$('#closeSearchForm').click(function(){
			$('#searchHeader').hide();
			$('#header').show();
		});
		
	})
</script>
<style type="text/css">
#header #headerNavWrap #headerNav .hiddenNavWrap span{font-size:16px; color:black; font-weight: 400; line-height:3em;}
#header .searchCityNameSpan{cursor: pointer;}
#infoSearchInput{border: 0px; width: 1100px; height: 115px; font-size: 24px;}
#infoSearch{margin: 0px auto; text-align: center; height: 116px; float: left;}
#searchHeader{width:100%; height:116px; border-bottom:1px solid #ccc; display: none;}
#searchGlyphicon{font-size: 25px; float:left; margin-right: 20px; margin-top: 44px;}
#closeSearchForm{cursor: pointer; font-size: 38px;  padding: 30px; float: right;}
.searchInner{margin: 0 auto; width: 1200px; height: 116px;}
#searchLi{float: left; padding: 0px;}
#searchWrap{color: #687074; float:right; font-size: 26px; margin-top: 6px;}
</style>
</head>
<body>
<!-- 헤더 -->
<div id="header">
	<div id="headerNavWrap" class="clearFix">
		<div id="searchWrap">
			<div class="hiddenNavWrap">
				<span class="glyphicon glyphicon-search"></span>
				<span class="searchCityNameSpan"> 
					Search City!
				</span> 
			</div>	
		</div>
		<div id="headerLogo">
			<a href="/"><img src="../../resources/images/logo.png" ></a>
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
				<a href="/search/infoSearch">추천여행</a>
			</li>
		</ul>	
		<!-- <ul>	
			<li class="hiddenNavWrap">
				<a style="text-decoration: none; color: black; float:right;" class="searchCityNameSpan"> 
					알고싶은 도시의 이름을 검색 해보세요
				</a> 
			</li>
			<li class="hiddenNavWrap">
				<span class="searchCityNameSpan"> 
					알고싶은 도시의 이름을 검색하세요!
					<span class="glyphicon glyphicon-search"></span>
				</span> 
			</li>
		</ul> -->
		<ul id="loginNav">
			<li>
				<span><a href="">로그인</a></span>
				<span><a href="">회원가입</a></span>
			</li>
		</ul>
	</div>
</div>
<div id ="searchHeader">	
	<div class="searchInner">
 	<span id="searchGlyphicon" class="glyphicon glyphicon-search"></span>
	<form id="infoSearch" action="/search/infoSearch" method="post">			
		<input id="infoSearchInput" name="search" placeholder="알고싶은 도시의 이름을 검색하세요!" type="text">
	</form>
	<span id="closeSearchForm">X</span>
	</div>	
</div>
</body>
</html>