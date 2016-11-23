<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- google chrome CDN Jquery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<!-- 자체 css -->
		<link href="../../../resources/css/style.css" rel="stylesheet" type="text/css">		
		<title>다님 플래너</title>
		<script type="text/javascript">
		$(document).ready(function(){
			
			var bookmarkInfo = "${selectStayInfoOne.stayInfoNo}";
			var memberId = "${sessionScope.memberId}";
			
			function bookmarkAjax(){
				$.ajax({
					type:"POST",  
					url:"/search/insertBookmark",    
					data:{bookmarkInfo: bookmarkInfo, memberId: memberId},     
					success:function(data){
						alert(data.msg);
					}					
				});
			};
			
			$('#bookmarkButton').click(function() {
				if(memberId != "") {
					bookmarkAjax();
				}else if(memberId == "") {
					alert('로그인이 필요한 서비스입니다');
				}
			});
		});
		</script>		
	</head>
	<jsp:include page="../module/header.jsp"></jsp:include>
	<body>
		<div class="container">
			<p class="infoButton">
				<a id="bookmarkButton" class="btn btn-info">즐겨찾기에 추가</a>
			</p>		
		
			<h1>${selectStayInfoOne.stayInfoName}</h1>
			<p>${cityInfoName} > 머물만한 곳</p>
			<div class="infoImage">
				<p>
					<!-- <img src=""> --> 이미지 준비중입니다						
				</p>
			</div>				
			<div>	
				<p id="infoExplain">
					<strong>
						도저히 채워넣을게 없다
					</strong>
				</p>
				<hr>
				<p id ="infoContent">
					<ul>
						<li>호텔명 : ${selectStayInfoOne.stayInfoName}</li>
						<li>홈페이지 : <a href="${selectStayInfoOne.stayInfoHomepage}">${selectStayInfoOne.stayInfoHomepage}</a></li>
						<li>스탠다드 : ${selectStayInfoOne.stayInfoStandard} 원</li>
						<li>디럭스 : ${selectStayInfoOne.stayInfoDeluxe} 원</li>
						<li>스위트 : ${selectStayInfoOne.stayInfoSuite} 원</li>
					</ul>
				</p>
			</div>
		</div>
	</body>
	<jsp:include page="../module/footer.jsp"></jsp:include>
</html>