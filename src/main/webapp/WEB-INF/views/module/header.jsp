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
<!-- 자동완성 기능 이용을 위해 필요한 jqueryUI -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var infoSearchCheck = /[가-힣]{2,}$/; // 검색조건 2자 이상의 한글만 가능
		var infoSearchInput = $('#infoSearchInput');
		
		$('.hiddenNavWrap').hover(function(){
			$(this).children('.hiddenNav').fadeIn(300);
		}, function(){
			$(this).children('.hiddenNav').hide();
		});
		
		/* '.searchCityNameSpan' 에 마우스를 가져가면 투명해지는 애니메이션 효과 */
		$(".searchCityNameSpan").mouseover(function(){
			$('.searchCityNameSpan').stop().animate({opacity:'0.3', marginLeft:'5px'});
			/* $('.searchCityNameSpan').stop().animate({marginLeft:'5px'}); */
		});
		
		/* '.searchCityNameSpan' 에 마우스가 벗어나면 다시 원래 투명도로 돌아가는 애니메이션 효과 */
		$(".searchCityNameSpan").mouseout(function(){
			$('.searchCityNameSpan').stop().animate({opacity:'0.8', marginLeft:'10px'});
			/* $('.searchCityNameSpan').stop().animate({marginLeft:'10px'}); */
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
		
		/* 엔터키 유효성 검사 */
	    $(infoSearchInput).keydown(function (key) {			    	 
	        if(key.keyCode == 13 && infoSearchCheck.test(infoSearchInput.val()) != true){ // 엔터키를 누르고 유효성검사를 통과하지 못했을 경우
	        	alert('도시이름을 제대로 입력해주세요');
	        	event.returnValue = false;
	        }			 
	    });	
		
		/* 자동완성 코드 진행중*/
		$(function(){
			var autoComplete = new Array();
			<c:forEach var="selectCityAll" items="${selectCityAll}">
			autoComplete.push("${selectCityAll}");
			</c:forEach>
			$('#infoSearchInput').autocomplete({
				source: autoComplete
			});
		}); 
		
	})
</script>
</head>
<body>
<!-- 헤더 -->
<div id="header">
	<div id="headerWrap" class="clearFix">
		<div id="searchWrap">
			<span class="glyphicon glyphicon-search"></span>
			<span class="searchCityNameSpan"> 
				가고싶은 도시를 검색해주세요!
			</span> 
		</div>
		<div id="headerLogo">
			<a href="/"><img src="../../resources/images/logo.png" ></a>
		</div>
		<div id="headerNavWrap">
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
					<a href="/search/infoSearch">추천여행</a>
				</li>
				<li class="hiddenNavWrap">
					<a href="/member/memberLoginForm">로그인</a>
				</li>
			</ul>
		</div>	
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
	</div>
</div>
<div id ="searchHeader">	
	<div class="searchInner">
	 	<span id="searchGlyphicon" class="glyphicon glyphicon-search"></span>
		<form id="infoSearch" action="/search/infoSearch" method="post">			
			<input id="infoSearchInput" name="search" placeholder="알고싶은 도시의 이름을 검색하세요!" type="text" style="z-index:9999;" />
		</form>
		<span id="closeSearchForm">X</span>
	</div>	
</div>
</body>
</html>