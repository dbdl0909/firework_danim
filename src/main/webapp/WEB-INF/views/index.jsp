<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../../resources/css/slider.css" rel="stylesheet" type="text/css">
<link href="../../resources/css/style.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="../../resources/js/transit.js"></script>
<script type="text/javascript" src="../../resources/js/touchswipe.js"></script>
<script type="text/javascript" src="../../resources/js/jquery.simpleslider.js"></script>
<script type="text/javascript" src="../../resources/js/backstretch.js"></script>
<script type="text/javascript" src="../../resources/js/option.js"></script>
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
						<dd>플랜</dd>
						<dd>후기</dd>
						<dd>자유게시판</dd>
						<dd>동행찾기</dd>
						<dt>Q&A</dt>
						<dd>숙박시설</dd>
						<dd>교통편</dd>
						<dd>예약/결제</dd>
						<dd>취소/환불/변경</dd>
						<dd>회원/로그인</dd>
						<dd>여행관련</dd>
					</dl>
				</div>
			</li>
			<li class="hiddenNavWrap">
				<a href="">가이드북</a>
			</li>
			<li class="hiddenNavWrap">
				<a href="">회원가입</a>
				<div class="hiddenNav">
					<dl>
						<dt>회원가입</dt>
						<dd>일반가입</dd>
						<dd>페이스북/구글 로그인</dd>			
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
<div class='pageblock' id='fullscreen'>
	<div class='slider'>
		<div class='slide' id="first">
			<div class='slidecontent'>
				<span class="headersur">전라북도 전주</span>
				<h1>한옥마을 한복체험!</h1>
				<div class="button" onclick="movePlan()">플래너 시작하기</div>
			</div>
		</div>	
		<div class='slide' id="sec">
			<div class='slidecontent'>
				<span class="headersur">전라남도 담양</span>
				<h1>담양 죽림원</h1>
				<div class="button" onclick="movePlan()">플래너 시작하기</div>
			</div>
		</div>	
	</div>
</div>
<script>
	var movePlan = function(){
		location.href = '/plan/mainPlan'
	}
</script>
</body>
</html>
