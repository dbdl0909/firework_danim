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
		<!-- 자동완성 기능 이용을 위해 필요한 jqueryUI -->
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>		
		<!-- 구글차트 -->
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>		
		<title>Insert title here</title>
		<script type="text/javascript">
			$(document).ready(function(){
				
				var url = "";
				var data = "";
				var memberId = "${sessionScope.memberId}";
				
				function loadRecommand(){
					$.ajax({
						type:"POST",
						url:url,
						data:data,
						success:function(data){
							console.log('성공');
							//var $genderChart = $(data).filter('#genderChart');
							$('#recommandView').html(data);
						}
					});
				}
				
				// 로그인 사용자의 정보를 받아서 추천 통계 출력
				url = "/recommand/recommandMember"
				data = {gender: , age:}
				loadRecommand();
				
				// 성별 탭
				$('#male').click(function(){
					url = "/recommand/recommandGender";
					data = {gender: "M"};
					loadRecommand();
				});
				
				$('#female').click(function(){
					url = "/recommand/recommandGender";
					data = {gender: "F"};
					loadRecommand();
				});
				
				// 지역 탭
				$('#popularity').click(function(){
					url = "/recommand/recommandPopularity";
					loadRecommand();
				});
				
				$('#kyungki').click(function(){
					url = "/recommand/recommandProvince";
					data = {province: "경기도"};
					loadRecommand();
				});
				
				$('#kangwon').click(function(){
					url = "/recommand/recommandProvince";
					data = {province: "강원도"};
					loadRecommand();
				});
				
				$('#chungbuk').click(function(){
					url = "/recommand/recommandProvince";
					data = {province: "충청북도"};
					loadRecommand();
				});
				
				$('#chungnam').click(function(){
					url = "/recommand/recommandProvince";
					data = {province: "충청남도"};
					loadRecommand();
				});
				
				$('#junbuk').click(function(){
					url = "/recommand/recommandProvince";
					data = {province: "전라북도"};
					loadRecommand();
				});
				
				$('#junnam').click(function(){
					url = "/recommand/recommandProvince";
					data = {province: "전라남도"};
					loadRecommand();
				});
				
				$('#kyungbuk').click(function(){
					url = "/recommand/recommandProvince";
					data = {province: "경상북도"};
					loadRecommand();
				});
				
				$('#kyungnam').click(function(){
					url = "/recommand/recommandProvince";
					data = {province: "경상남도"};
					loadRecommand();
				});
				
				$('#jeju').click(function(){
					url = "/recommand/recommandProvince";
					data = {province: "제주도"};
					loadRecommand();
				});
				
				// 타입별
				
				$('#type').click(function(){
					url = "/recommand/recommandTypeRank"
					loadRecommand();
				});
				
				$('#backpacking').click(function(){
					url = "/recommand/recommandType";
					data = {planType: "배낭"};
					loadRecommand();
				});
				
				$('#honeymoon').click(function(){
					url = "/recommand/recommandType";
					data = {planType: "신혼"};
					loadRecommand();
				});	
				
				$('#family').click(function(){
					url = "/recommand/recommandType";
					data = {planType: "가족"};
					loadRecommand();
				});	
				
				$('#business').click(function(){
					url = "/recommand/recommandType";
					data = {planType: "비즈니스"};
					loadRecommand();
				});	
				
				$('#couple').click(function(){
					url = "/recommand/recommandType";
					data = {planType: "커플"};
					loadRecommand();
				});	
				
				$('#solo').click(function(){
					url = "/recommand/recommandType";
					data = {planType: "솔로"};
					loadRecommand();
				});	
				
				$('#group').click(function(){
					url = "/recommand/recommandType";
					data = {planType: "단체"};
					loadRecommand();
				});
				
				// 계절탭
				
				$('#season').click(function(){
					url = "/recommand/recommandSeason2030";
					loadRecommand();
				});
				
				$('#spring').click(function(){
					url = "/recommand/recommandSeasonYear";
					data = {season: "spring"};
					loadRecommand();
				});
				
				$('#summer').click(function(){
					url = "/recommand/recommandSeasonYear";
					data = {season: "summer"};
					loadRecommand();
				});	
				
				$('#fall').click(function(){
					url = "/recommand/recommandSeasonYear";
					data = {season: "fall"};
					loadRecommand();
				});	
				
				$('#winter').click(function(){
					url = "/recommand/recommandSeasonYear";
					data = {season: "winter"};
					loadRecommand();
				});	
				
				$('#genderUl').hide();
				$('#popularityUl').hide();
				$('#seasonUl').hide();
				$('#typeUl').hide();
				
				$('#gender').click(function(){
					$('#genderUl').toggle();
					$('#popularityUl').hide();
					$('#seasonUl').hide();
					$('#typeUl').hide();
				});
				
				$('#popularity').click(function(){
					$('#popularityUl').toggle();
					$('#genderUl').hide();
					$('#seasonUl').hide();
					$('#typeUl').hide();
				});
				
				$('#season').click(function(){
					$('#seasonUl').toggle();
					$('#popularityUl').hide();
					$('#genderUl').hide();
					$('#typeUl').hide();
				});
				
				$('#type').click(function(){
					$('#typeUl').toggle();
					$('#popularityUl').hide();
					$('#seasonUl').hide();
					$('#genderUl').hide();
				});
				
			});
		</script>
		<style type="text/css">
			.container #recommandTab{float:left; width: 20%; height: 700px; border-right: 1px #CCC solid; text-align: center;}
			.container #recommandView{float: right; width: 70%;}
			.container #recommandTab div{cursor: pointer; font-size: 26px; margin: 18px;}
			.container #recommandTab li{font-size: 18px; cursor: pointer; margin: 7px;}
			.container #recommandView #popularityTitle{margin-left: 160px; margin-bottom: 30px; font-size: 26px;}	
			.container #recommandView #popularityProvinceImage img{margin-left: 215px;}	
			.container #recommandView #typeRank li{text-align: center; font-size: 20px; margin-top: 8px; border-bottom: 1px;}	
			.container #recommandView #typeRankTitle{text-align: center; font-size: 26px;}
		</style>
	</head>
	<jsp:include page="../module/header.jsp"></jsp:include>
	<body>
		<div class="container">
			<div id = "recommandTab">
				<div id="gender">성별</div>
				<ul id="genderUl">
					<li id="male">남자</li>
					<li id="female">여자</li>
				</ul>
				<div id="popularity">지역</div>	
				<ul id="popularityUl">
					<li id="kyungki">경기도</li>
					<li id="kangwon">강원도</li>
					<li id="chungbuk">충청북도</li>
					<li id="chungnam">충청남도</li>
					<li id="junbuk">전라북도</li>
					<li id="junnam">전라남도</li>
					<li id="kyungbuk">경상북도</li>
					<li id="kyungnam">경상남도</li>
					<li id="jeju">제주도</li>											
				</ul>
				<div id="season">계절</div>
				<ul id="seasonUl">
					<li id="spring">봄</li>
					<li id="summer">여름</li>
					<li id="fall">가을</li>
					<li id="winter">겨울</li>
				</ul>
				<div id="type">타입</div>
				<ul id="typeUl">
					<li id="backpacking">배낭</li>
					<li id="honeymoon">신혼</li>
					<li id="family">가족</li>
					<li id="business">비즈니스</li>
					<li id="couple">커플</li>
					<li id="solo">솔로</li>
					<li id="group">단체</li>
				</ul>
			</div>
			<div id="recommandView">
				
			</div>
		</div>
	</body>
	<jsp:include page="../module/footer.jsp"></jsp:include>
</html>