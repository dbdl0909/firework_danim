<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../../resources/css/slider.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="../../resources/js/transit.js"></script>
<script type="text/javascript" src="../../resources/js/touchswipe.js"></script>
<script type="text/javascript" src="../../resources/js/jquery.simpleslider.js"></script>
<script type="text/javascript" src="../../resources/js/backstretch.js"></script>
<script type="text/javascript" src="../../resources/js/option.js"></script>
</head>
<body>
<div id="header">
	<div id="headerNavWrap">
		<div id="searchWrap">
			
		</div>
		<ul id="headerNav">
			<li>
				<a href="/plan/mainPlan">플래너</a>
			</li>
			<li>
				<a href="/community/list">광장</a>
			</li>
			<li>
				<a href="">가이드북</a>
			</li>
			<li>
				<a href="">회원가입</a>
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
