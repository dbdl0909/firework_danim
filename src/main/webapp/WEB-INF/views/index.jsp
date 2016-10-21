<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../resources/css/style.css">
<link rel="stylesheet" href="../../resources/css/animatedHeader.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="../../resources/js/jquery-ui.js"></script>
<script src="../../resources/js/animatedHeader.js"></script>
<script>
	$(document).ready(function(){
		//이미지 지도에서 도별로 마우스를 올렸을때 발생하는 이벤트를 적용하기위한코드
		//해당 도의 g태그를 찾아 아래 자식태그의 css를 전환하여 처리한다.
		//자식태그 내에 dataRegion이란 속성을 주어 도별로 나누어 처리하고
		//하위의 디테일한 도 이미지 태그를 싼 li태그에 같이 dataRegion 속성을 같이주어
		//each문을 통해서 두개의 dataRegion값을 비교하여 해당하는 영역을 보여준다.	
		//영역 클릭 시 해당 dataRegion으로 분기하여 get방식으로 값을 넘긴다.
		$(window).load(function(){
			
			var a = $('#svgMapImage');
	        var svgDoc = a.contents(); 
	        var findG = svgDoc.find('g');
	        
	        $(findG).css('cursor', 'pointer')
			$(findG).hover(function(){
				
				$(this).children().css('fill', '#f00');
				var dataRegion = $(this).children().attr('dataRegion');
				
				$('.imgAlt').each(function(){
					var imgRegion = $(this).attr('dataRegion');
					if(imgRegion == dataRegion)	{					
						$(this).show();	
					}
					
				});
			},function(){	
				
				$(this).children().css('fill', '#B7B7B7');
				$('.imgAlt').hide();
				
			});
			$(findG).click(function() {	
				
				var dataRegion = $(this).children().attr('dataRegion');
				
				//alert(dataRegion);
				if(dataRegion == '서울/경기/인천') {
					$(location).attr('href', '/plan/mainPlan?do=경기도');	
				}else if(dataRegion == '강원도'){
					$(location).attr('href', '/plan/mainPlan?do=강원도');					
				}else if(dataRegion == '대구/경상북도') {					
					$(location).attr('href', '/plan/mainPlan?do=경상북도');	
				}else if(dataRegion == '부산/울산/경상남도') {					
					$(location).attr('href', '/plan/mainPlan?do=경상남도');	
				}else if(dataRegion == '대전/충청북도') {
					$(location).attr('href', '/plan/mainPlan?do=충청북도');
				}else if(dataRegion == '충청남도') {
					$(location).attr('href', '/plan/mainPlan?do=충청남도');
				}else if(dataRegion == '전라북도') {					
					$(location).attr('href', '/plan/mainPlan?do=전라북도');
				}else if(dataRegion == '광주/전라남도') {
					$(location).attr('href', '/plan/mainPlan?do=전라남도');
				}else if(dataRegion == '제주도') {					
					$(location).attr('href', '/plan/mainPlan?do=제주도');
				}
				
			});
		});
	});
</script>
</head>
<body>
<div id="svgMap">
<object id="svgMapImage" data="../../resources/images/map.svg" type="image/svg+xml"></object>
</div>
<div>
	<ul id="detailMap">
		<li class="imgAlt" style="display:none;" dataRegion="서울/경기/인천"><img src="../../resources/images/locale1.png" alt="서울/경기/인천" /></li>
		<li class="imgAlt" style="display:none;" dataRegion="강원도"><img src="../../resources/images/locale2.png" alt="서울/경기/인천" /></li>
		<li class="imgAlt" style="display:none;" dataRegion="충청남도"><img src="../../resources/images/locale3.png" alt="서울/경기/인천" /></li>
		<li class="imgAlt" style="display:none;" dataRegion="대전/충청북도"><img src="../../resources/images/locale4.png" alt="서울/경기/인천" /></li>
		<li class="imgAlt" style="display:none;" dataRegion="대구/경상북도"><img src="../../resources/images/locale5.png" alt="서울/경기/인천" /></li>
		<li class="imgAlt" style="display:none;" dataRegion="전라북도"><img src="../../resources/images/locale6.png" alt="서울/경기/인천" /></li>
		<li class="imgAlt" style="display:none;" dataRegion="부산/울산/경상남도"><img src="../../resources/images/locale7.png" alt="서울/경기/인천" /></li>
		<li class="imgAlt" style="display:none;" dataRegion="광주/전라남도"><img src="../../resources/images/locale8.png" alt="서울/경기/인천" /></li>
	</ul>
</div>
</body>
</html>