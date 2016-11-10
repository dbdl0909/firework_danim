<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>DANIM JOIN</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
    <!-- 구글 연동 로그인 -->
    <script>
	      function onSignIn(googleUser) {
	        // Useful data for your client-side scripts:
	        var profile = googleUser.getBasicProfile();
	        
	        var memberId = profile.getId();		//연동회원아이디
        	var memberName = profile.getName();		//연동회원닉네임
        	
	        console.log("ID: " + memberId); // Don't send this directly to your server!
	        console.log('Full Name: ' + memberName);
	        //console.log('Given Name: ' + profile.getGivenName());
	        //console.log('Family Name: ' + profile.getFamilyName());
	        //console.log("Image URL: " + profile.getImageUrl());
	        //console.log("Email: " + profile.getEmail());
	
	        // The ID token you need to pass to your backend:
	        var id_token = googleUser.getAuthResponse().id_token;
	        //console.log("ID Token: " + id_token);
	
	        /* if(profile != null) {	//profile에 값이 있으면(null값이 아니면)
	        //로그인을 한 순간 DB에 다녀와야 합니다(회원테이블에 등록이 되어있는지!)
	        	//DB에 값이 있으면 그냥 로그인
        		$.ajax({
					url:'/member/memberLinkLoginSubmit',
					data:{memberId:memberId, memberName:memberName},
					type:'POST',
					success:function(data){
						 if(var i == 0) {
							//만약 data에 담겨있는 값이 0이면 회원가입 되어있지 않은 상태
							//DB에 값이 없으므로 회원가입(DB에 첫등록)
							
				       		return "/member/memberLinkJoinSubmit";
							
						} else {	//1이면 회원가입 되어있는 상태
							//메인 화면으로 페이지 이동
						} 
					}					
        		})
		        	
	        } else {	//profile에 값이 없으면
	        	//로그인 안됨
	        	return false;
	        } */
		};
    </script>
</head>
<body>
	<div id="twitter" class="loginFormCss" style="height:200px;">
		<form class="memberLoginForm" id="memberLoginForm" action="/member/memberLoginSubmit" method="post" style="height:200px;">
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
			<div id='submit' class='outerDiv'>
				<input type="submit" value="로그인" /> 
			</div>
		</form>
		<!-- 연동로그인 -->
		<form class ="memberLinkLoginForm" id="memberLinkLoginForm" action="/member/memberLinkLoginSubmit" method="post">
			<input type="hidden" id="memberLoginName" name="memberLoginName" type="text" />
			<div>		<!-- 구글 연동로그인 -->
				<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
			</div>
		</form>
	</div>
	
</body>
</html>