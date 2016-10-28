<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>다님 플래너</title>
<link rel="shortcut icon" href="../../resources/images/favicon.ico">
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
<!-- 헤더 -->
<jsp:include page="./module/header.jsp" />
<!-- 슬라이더  -->	
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
<!-- 컨텐츠 -->
<div>
	
</div>
<!-- 풋터 -->
<jsp:include page="./module/footer.jsp" />
</body>
</html>
