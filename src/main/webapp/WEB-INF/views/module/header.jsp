<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		//회원가입 정규표현식 시작
		var reMemberId = /^[a-z]{1}[a-z0-9_-]{3,16}$/;
		//패스워드 검사
			   	//6~16자, 영문, 숫자, 특수문자 조합
			//숫자만으로는 사용불가
			//대문자, 소문자 구분
		var reMemberPassword = /^.*(?=.{6,16})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
		//닉네임 검사
			//2~10자의 영문, 한글, 숫자만 가능
		var reMemberName = /[a-zA-Z0-9가-힝]{2,10}$/
		//생년월일 검사
			//1916~2016
		var reMemberBirth = /[12][0-9]{3}-[0-9]{2}-[0-9]{2}/;
					//1000~2000, *000~*999(년) / 00~99(월) / 00~99(일)
		//이메일 검사
			//발송 후 인증
			// + 이메일 중복검사
		var reMemberEmail = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/;
		
		// 선택할 요소를 변수에 할당
		var
			memberJoinForm = $('.memberJoinForm'),
			memberId = $('#memberId'),
			memberPassword1 = $('#memberInfoPassword1'),
			memberPassword2 = $('#memberInfoPassword2'),
			memberName = $('#memberName'),
			memberBirth = $('#memberInfoBirth'),
			memberEmail = $('#memberInfoEmail');
		
		memberJoinForm.submit(function() {
			if(reMemberId.test(memberId.val()) != true) {						//아이디검사
				alert('아이디를 확인 후 입력하세요');
				memberId.focus();
				return false;
			} else if(reMemberPassword.test(memberPassword1.val()) != true) {	//비밀번호 검사
				alert('비밀번호를 확인 후 입력하세요');
				memberPassword1.focus();
				return false;
			} else if(memberPassword1.val() != memberPassword2.val()) {			//비밀번호 동일한지 검사
				alert('비밀번호를 동일하게 입력하세요');
				memberPassword2.focus();
				return false;
			} else if(reMemberName.test(memberName.val()) != true) {			//닉네임 검사
				alert('닉네임을 확인 후 입력하세요');
				memberName.focus();
				return false;
			} else if(reMemberBirth.test(memberBirth.val()) != true) {			//생년월일 검사
				alert('생년월일을 확인 후 입력하세요');
				memberBirth.focus();
				return false;
			} else if(reMemberEmail.test(memberEmail.val()) != true) {			//이메일 검사
				alert('이메일을 확인 후 입력하세요');
				memberEmail.focus();
				return false;
			} else {
				return true;
			}
		});
		//회원가입 정규표현식 끝
					
		var infoSearchCheck = /[가-힣]{2,}$/; // 검색조건 2자 이상의 한글만 가능
		var infoSearchInput = $('#infoSearchInput');
		var autoComplete = new Array();	// 자동완성을 하기 위해 필요한 도시 이름 배열
		<c:forEach var="selectCityAll" items="${selectCityAll}">
		autoComplete.push("${selectCityAll}");
		</c:forEach>
		
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
		
		/* 자동완성 */
		$(function(){
			$('#infoSearchInput').autocomplete({
				source: autoComplete
			});
		});
		$('#openIntroWrap').click(function(){
			$('#introWrap').slideDown();
		});
		$('#introWrap').click(function(){			
			$(this).slideUp();
		});
		
		//로그인 슬라이드
		var slideCheck = false;
		$("#loginButton").click(function(){
			if(slideCheck == false) {
				$("#loginHiddenNav").show();
				slideCheck = true;
			} else if (slideCheck ==true) {
				$("#loginHiddenNav").hide();
				slideCheck = false;
			}
	    });
		//페이스북 로그아웃
		function statusChangeCallback(response) {
			var accessToken = response.authResponse.accessToken;		//연동회원토큰
        	//memberId = response.authResponse.userID;					//연동회원아이디
			//console.log('facebook memberId: '+memberId);				//사용자 고유값
			//console.log('facebook accessToken: '+accessToken);		//권한 체크를 위한 값 일정 기간 마다 변경 됨
		    //console.log(response);
        	
		    if (response.status === 'connected') {
				//페이스북과 앱에 같이 로그인되어 있다.
				//var uid = response.authResponse.userID;
				//var accessToken = response.authResponse.accessToken;
				//console.log('uid: '+uid);//사용자 고유값
				//console.log('accessToken: '+accessToken);//권한 체크를 위한 값 일정 기간 마다 변경 됨
				//testAPI();
		    } else if (response.status === 'not_authorized') {
				//페이스북에는 로그인 되어있으나, 앱에는 로그인 되어있지 않다.
				document.getElementById('status').innerHTML = 'Please log ' + 'into this app.';
				//로그인을 한 순간 DB에 다녀와야 합니다(회원테이블에 등록이 되어있는지 확인!)
				$('#memberLinkLoginForm').submit();
		    } else {
				//페이스북에 로그인이 되어있지 않아서, 앱에 로그인 되어있는지 불명확하다.
				document.getElementById('status').innerHTML = 'Please log ' + 'into Facebook.';
				//로그인 안됨
				return false;
		    }
		}
		window.fbAsyncInit = function() {
			FB.init({
				appId      : '1698844840441321',
				cookie     : true,  // enable cookies to allow the server to access 
			                        // the session
			    xfbml      : true,  // parse social plugins on this page
			    version    : 'v2.5' // use graph api version 2.5
			});
			FB.getLoginStatus(function(response) {
			    statusChangeCallback(response);
			});
		};
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) return;
			js = d.createElement(s); js.id = id;
			js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		
		var facebookCheck = "<c:out value='${sessionScope.facebookCheck}'/>";
		
		$('#logoutButton').click(function(){
			//console.log('로그아웃');
			//console.log('페북체크값 : '+ facebookCheck);
			if(facebookCheck == "true") {
				//console.log('페북로그아웃');
				FB.logout(function(response) {
			        // 사용자 로그아웃
					FB.Auth.setAuthResponse(null, 'unknown');
			    });
			}
			location.href="/member/memberLogout";
		});		
		
		//플래너
		$('#memberIdCheckForPlan').click(function() {
			$("#AllformSubmit").attr("action", "/plan/mainPlan");
			if($('#sessionMemberId').val() != '') {
				$('#AllformSubmit').submit();
			} else {
				alert('로그인을 해주세요');
			}
		});
		
		//추천여행
		$('#recommandMainMemberIdCheck').click(function() {
			$("#AllformSubmit").attr("action", "/recommand/recommandMain");
			$('#AllformSubmit').submit();
		});
		
		//내정보
		$('#memberInfoMemberIdCheck').click(function() {
			$("#AllformSubmit").attr("action", "/member/memberInfo");
			$('#AllformSubmit').submit();
		});
		
		//내여행
		$('#planListMemberIdCheck').click(function() {
			$("#AllformSubmit").attr("action", "/plan/planList");
			$('#AllformSubmit').submit();
		});
		
		//Q&A
		$('#myQnaListMemberIdCheck').click(function() {
			$("#AllformSubmit").attr("action", "/community/myQnaList");
			$('#AllformSubmit').submit();
		});
		
		//즐겨찾기
		$('#bookmark').click(function() {
			$("#AllformSubmit").attr("action", "/search/selectBookmark");
			$('#AllformSubmit').submit();
		});
	});

</script>
</head>
<body>
<!-- 헤더 -->
<div id="openIntroWrap">
	<div id="openIntroContent">
		<span>프로젝트 소개 ▼</span>
	</div>
</div>
<div id="introWrap">
	<span id="closeIntro">이 창 닫기</span>
	<div id="introContent">
		<img src="../../resources/images/intro1.jpg" />
	</div>
</div>
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
				<li id="memberIdFromCheck">
					<form id="AllformSubmit" action="" method="post">
						<input id="sessionMemberId" name="memberId" type="hidden" value="${sessionScope.memberId}"/>
					</form>
				</li>
				<li class="hiddenNavWrap">
					<a id="memberIdCheckForPlan">플래너</a>
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
						</dl>
					</div>
				</li>
				<li class="hiddenNavWrap">
					<a id="recommandMainMemberIdCheck">추천여행</a>
				</li>
				<li class="hiddenNavWrap">
					<c:if test="${empty sessionScope.memberId}">
						<!-- <a href="/member/memberLoginForm">로그인</a> -->
						<div id="loginButton"><a>로그인</a></div>
						<div id="loginHiddenNav" style="width:320px; height:290px; background:#fff; position:absolute; z-index:99999;
							-webkit-box-shadow: 10px 10px 116px -31px rgba(67,67,67,1); -moz-box-shadow: 10px 10px 116px -31px rgba(67,67,67,1); box-shadow: 10px 10px 116px -31px rgba(67,67,67,1); 
							display:none; margin-left:-130px; top:130px;">
							<jsp:include page="../member/memberLoginForm.jsp" />
						</div>
					</c:if>
					<c:if test="${not empty sessionScope.memberId}">
						<a>${sessionScope.memberName} ▼</a>
						<div class="hiddenNav">
							<dl>
								<dt>회원정보</dt>
								<dd><a id="memberInfoMemberIdCheck">내 정보</a></dd>
								<c:if test="${sessionScope.memberLevel=='관리자'}">
									<dd><a href="/member/memberListAll">회원리스트</a></dd>
									<dd><a href="/community/reportList">신고리스트</a></dd>
									<dd><a href="/community/qnaListAll">Q&A</a></dd>
								</c:if>
								<c:if test="${sessionScope.memberLevel=='유저'}">
									<dd><a id="planListMemberIdCheck">내 여행</a></dd>
									<dd><a id="myQnaListMemberIdCheck">Q&A</a></dd>
									<dd><a id="bookmark">즐겨찾기</a></dd>
								</c:if>		
								<dd><a id="logoutButton">로그아웃</a></dd>
							</dl>
						</div>
					</c:if>
					<input type="hidden" id="facebookCheck" value="${facebookCheck}"/>			
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