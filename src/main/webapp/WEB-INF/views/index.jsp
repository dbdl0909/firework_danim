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
<link href="../../resources/css/owl.carousel.css" rel="stylesheet">
<link href="../../resources/css/owl.theme.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="../../resources/js/transit.js"></script>
<script type="text/javascript" src="../../resources/js/touchswipe.js"></script>
<script type="text/javascript" src="../../resources/js/jquery.simpleslider.js"></script>
<script type="text/javascript" src="../../resources/js/backstretch.js"></script>
<script type="text/javascript" src="../../resources/js/option.js"></script>
<script src="../../resources/js/jquery.picEyes.js"></script>
<script src="../../resources/js/owl.carousel.js"></script>
</head>
<script>
	$(document).ready(function(){
		$('.galleryList li:first-child').addClass('galleryTitleImage');
		$('.goPlan').click(function(){
			if($('#sessionMemberId').val() != '') {
				$('#plannerSubmit').submit();
				//var memberId = $('#sessionMemberId').val();
				//$('#memberIdCheckForPlan').attr('href', '/plan/mainPlan?memberId=' + memberId);
			} else {
				alert('로그인을 해주세요');
			}
		});
		 
		$(function(){
			$('.galleryTitleImage').click(function(){
				$(this).parents('ul').find('li').picEyes();
			});
		});
		 $('#owl-demo').owlCarousel({
	        autoPlay: 3000,
	        items : 4,
	       	itemsDesktop : [1199,3],
	        itemsDesktopSmall : [979,3]
	      });
 
	});
</script>
<body>
<!-- 헤더 -->
<jsp:include page="./module/header.jsp" />
<!-- 슬라이더  -->	
<div class='pageblock clearfix' id='fullscreen'>
	<div class='slider'>
		<div class='slide' id="first">
			<div class='slidecontent'>
				<span class="headersur">전라북도 전주</span>
				<h1>한옥마을 한복체험!</h1>
				<div class="button goPlan">플래너 시작하기</div>
			</div>
		</div>	
		<div class='slide' id="sec">
			<div class='slidecontent'>
				<span class="headersur">전라남도 담양</span>
				<h1>담양 죽림원</h1>
				<div class="button goPlan">플래너 시작하기</div>
			</div>
		</div>	
	</div>
</div>
<!-- 컨텐츠 -->

<div class="container clearfix">
	<div id="mainGallerySilderWrap">
		<h2>======================= 전국 명소 =======================</h2> 
		<div id="owl-demo" class="owl-carousel">
			<div class="mainGallery item">
				<ul class="galleryList">
					<c:forEach var="selectLandmarkImageForIndex" items="${selectLandmarkImageForIndex}" varStatus="index">
				 		<c:choose>
							<c:when test="${selectLandmarkImageForIndex.cityInfoNo eq 'city_no_29'}">
									<li>
										<img src="${selectLandmarkImageForIndex.landmarkInfoImage}">
									</li>							
							</c:when>
						</c:choose>
					</c:forEach>		
				</ul>
			</div>		
			<div class="mainGallery item">
				<ul class="galleryList">
					<c:forEach var="selectLandmarkImageForIndex" items="${selectLandmarkImageForIndex}" varStatus="index">
				 		<c:choose>
							<c:when test="${selectLandmarkImageForIndex.cityInfoNo eq 'city_no_49'}">
									<li>
										<img src="${selectLandmarkImageForIndex.landmarkInfoImage}">
									</li>							
							</c:when>
						</c:choose>
					</c:forEach>		
				</ul>
			</div>
			<div class="mainGallery item">
				<ul class="galleryList">
					<c:forEach var="selectLandmarkImageForIndex" items="${selectLandmarkImageForIndex}" varStatus="index">
				 		<c:choose>
							<c:when test="${selectLandmarkImageForIndex.cityInfoNo eq 'city_no_72'}">
									<li>
										<img src="${selectLandmarkImageForIndex.landmarkInfoImage}">
									</li>							
							</c:when>
						</c:choose>
					</c:forEach>		
				</ul>
			</div>
			<div class="mainGallery item">
				<ul class="galleryList">
					<c:forEach var="selectLandmarkImageForIndex" items="${selectLandmarkImageForIndex}" varStatus="index">
				 		<c:choose>
							<c:when test="${selectLandmarkImageForIndex.cityInfoNo eq 'city_no_73'}">
									<li>
										<img src="${selectLandmarkImageForIndex.landmarkInfoImage}">
									</li>							
							</c:when>
						</c:choose>
					</c:forEach>		
				</ul>
			</div>
			<div class="mainGallery item">
				<ul class="galleryList">
					<c:forEach var="selectLandmarkImageForIndex" items="${selectLandmarkImageForIndex}" varStatus="index">
				 		<c:choose>
							<c:when test="${selectLandmarkImageForIndex.cityInfoNo eq 'city_no_74'}">
									<li>
										<img src="${selectLandmarkImageForIndex.landmarkInfoImage}">
									</li>							
							</c:when>
						</c:choose>
					</c:forEach>		
				</ul>
			</div>
			<div class="mainGallery item">
				<ul class="galleryList">
					<c:forEach var="selectLandmarkImageForIndex" items="${selectLandmarkImageForIndex}" varStatus="index">
				 		<c:choose>
							<c:when test="${selectLandmarkImageForIndex.cityInfoNo eq 'city_no_75'}">
									<li>
										<img src="${selectLandmarkImageForIndex.landmarkInfoImage}">
									</li>							
							</c:when>
						</c:choose>
					</c:forEach>		
				</ul>
			</div>
			<div class="mainGallery item">
				<ul class="galleryList">
					<c:forEach var="selectLandmarkImageForIndex" items="${selectLandmarkImageForIndex}" varStatus="index">
				 		<c:choose>
							<c:when test="${selectLandmarkImageForIndex.cityInfoNo eq 'city_no_76'}">
									<li>
										<img src="${selectLandmarkImageForIndex.landmarkInfoImage}">
									</li>							
							</c:when>
						</c:choose>
					</c:forEach>		
				</ul>
			</div>
		</div>
	</div>				
</div>
<!-- 풋터 -->
<jsp:include page="./module/footer.jsp" />
</body>
</html>
