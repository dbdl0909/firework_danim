<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>DANIM JOIN</title>
<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>-->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<meta http-equiv="X-UA-Compatible" content="chrome=1"><!-- Optimistically rendering in Chrome Frame in IE. --> 
	<link rel="stylesheet" href="../../../resources/css/style.css" type="text/css">
	<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="80503028481-21rlost0fsm884c0e6qm1ptd9ulj535m.apps.googleusercontent.com">	<!-- content : 키, 없으면 구글로그인 사용 X -->
    <style type="text/css">
	    .bs-example{
	    	margin: 20px;
	    }
		/* Fix alignment issue of label on extra small devices in Bootstrap 3.2 */
	    .form-horizontal .control-label{
	        padding-top: 7px;
	    }
	</style>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script type="text/javascript">
    <!-- 구글 연동 로그인 -->
    var memberId;
    var memberName;
    var check = false;
    	function onSignIn(googleUser) {
	        // Useful data for your client-side scripts:
	        var profile = googleUser.getBasicProfile();
	       	memberId = profile.getId();			//연동회원아이디
        	memberName = profile.getName();		//연동회원닉네임
        	
	        console.log("google ID: " + memberId); // Don't send this directly to your server!
	        console.log('google Full Name: ' + memberName);
	        //console.log('Given Name: ' + profile.getGivenName());
	        //console.log('Family Name: ' + profile.getFamilyName());
	        //console.log("Image URL: " + profile.getImageUrl());
	        //console.log("Email: " + profile.getEmail());
	
	        // The ID token you need to pass to your backend:
	        var id_token = googleUser.getAuthResponse().id_token;
	        //console.log("ID Token: " + id_token);
	
	        if(profile != null) {	//profile에 값이 있으면(null값이 아니면)
	        	$('#memberId').val(memberId);
	        	$('#memberName').val(memberName);
	        	console.log($('#memberId').val());
	        	console.log($('#memberName').val());
				//로그인을 한 순간 DB에 다녀와야 합니다(회원테이블에 등록이 되어있는지 확인!)
	        	$('#memberLinkLoginForm').submit();
	        } else {	//profile에 값이 없으면
	        	//로그인 안됨
	        	return false;
	        }
		};
		//페이스북 연동로그인
			function statusChangeCallback(response) {
			memberId = response.authResponse.userID;				//연동회원아이디
        	var accessToken = response.authResponse.accessToken;		//연동회원토큰
			console.log('facebook memberId: '+memberId);				//사용자 고유값
			console.log('facebook accessToken: '+accessToken);			//권한 체크를 위한 값 일정 기간 마다 변경 됨
			console.log('statusChangeCallback');
		    console.log(response);
		    if (response.status === 'connected') {
		      // 페이스북과 앱에 같이 로그인되어 있다.
				/* var uid = response.authResponse.userID;
				var accessToken = response.authResponse.accessToken;
				console.log('uid: '+uid);//사용자 고유값
				console.log('accessToken: '+accessToken);//권한 체크를 위한 값 일정 기간 마다 변경 됨 */
				testAPI();
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
		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
		    });
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
		  /* (function(d, s, id) {
		    var js, fjs = d.getElementsByTagName(s)[0];
		    if (d.getElementById(id)) return;
		    js = d.createElement(s); js.id = id;
		    js.src = "//connect.facebook.net/en_US/sdk.js";
		    fjs.parentNode.insertBefore(js, fjs);
		  }(document, 'script', 'facebook-jssdk')); */
		  (function(d, s, id) {
		    var js, fjs = d.getElementsByTagName(s)[0];
		    if (d.getElementById(id)) return;
		    js = d.createElement(s); js.id = id;
		    js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8";
		    fjs.parentNode.insertBefore(js, fjs);
		  }(document, 'script', 'facebook-jssdk'));
		  function testAPI() {
		    console.log('Welcome!  Fetching your information.... ');
		    FB.api('/me', function(response) {
		      console.log('Successful login for: ' + response.name);
		      memberName = response.name;								//연동회원닉네임
		      console.log('facebook memberId222: '+memberId);
			  console.log('facebook memberName222: '+memberName);
		      //document.getElementById('status').innerHTML = 'Thanks for logging in, ' + response.name + '! '+' id : '+response.id;
				if(memberId != null) {	//response에 값이 있으면(null값이 아니면)
		        	$('#memberId').val(memberId);
		        	$('#memberName').val(memberName);
		        	console.log($('#memberId').val());
		        	console.log($('#memberName').val());
					//로그인을 한 순간 DB에 다녀와야 합니다(회원테이블에 등록이 되어있는지 확인!)
					check = true;
					
				} else {	//profile에 값이 없으면
		        	//로그인 안됨
		        	return false;
		        }
		    });
		    
		    if(check == true) {
		    	$('#memberLinkLoginForm').submit();
		    }
		  };
    </script>
</head>
<body>
	<div id="twitter" class="loginFormCss" style="height:170px;">
		<form class="memberLoginForm" id="memberLoginForm" action="/member/memberLoginSubmit" method="post" style="height:170px;">
			<div class='outerDiv'>
				<label for="memberLoginId">아이디</label>
				<input id="memberLoginId" name="memberLoginId" type="text" value="user01" required />
			</div>
			<div class='clearfix'></div>
			<div class='outerDiv'>
				<label for="memberLoginPassword">비밀번호</label>
				<input id="memberLoginPassword" name="memberLoginPassword" type="password" value="0000" required />
			</div>
			<div class='clearfix'></div>
			<div id='submit' class='outerDiv' style="float:left;">
				<input type="submit" value="로그인" /> 
			</div>
			<div id='button' class='outerDiv' style="float:left;">
				<input type="button" value="회원가입" /> 
			</div>
		</form>
		<!-- 연동로그인 -->
		<form class="memberLinkLoginForm" id="memberLinkLoginForm" action="/member/memberLinkLoginSubmit" method="post">
			<input type="hidden" id="memberId" name="memberId"/>
			<input type="hidden" id="memberName" name="memberName"/>
			<div>
				<div id="google" style="float:left;">		<!-- 구글 연동로그인 -->
					<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
				</div>
				<div id="facebook" style="float:left;">		<!-- 페이스북 연동로그인 -->
					<!-- <fb:login-button scope="public_profile,email" onlogin="checkLoginState();" width="300px" height="75px;">
					</fb:login-button> -->
					<div class="fb-login-button" data-max-rows="1" data-size="large" data-show-faces="false" data-auto-logout-link="false"></div>
					<div id="status">
					</div>
				</div>
			</div>
		</form>
	</div>
	
</body>
</html>