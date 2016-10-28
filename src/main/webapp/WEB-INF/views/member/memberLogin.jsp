<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>DANIM JOIN</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<meta http-equiv="X-UA-Compatible" content="chrome=1"><!-- Optimistically rendering in Chrome Frame in IE. --> 
	<link rel="stylesheet" href="../../../resources/css/style.css" type="text/css">
	<style type="text/css">
	    .bs-example{
	    	margin: 20px;
	    }
		/* Fix alignment issue of label on extra small devices in Bootstrap 3.2 */
	    .form-horizontal .control-label{
	        padding-top: 7px;
	    }
	</style>
</head>
<body>
	<div id="twitter">
		<form class="memberLoginForm" action="/member/memberLoginSubmit" method="post">
			<div class='outerDiv'>
				<label for="memberLoginId">아이디</label>
				<input id="memberLoginId" name="memberLoginId" type="text" required />
			</div>
			<div class='clearfix'></div>
			<div class='outerDiv'>
				<label for="memberLoginPassword">비밀번호</label>
				<input id="memberLoginPassword" name="memberLoginPassword" type="password" required />
			</div>
			<div class='clearfix'></div>
			<div id='submit' class='outerDiv'>
				<input type="submit" value="로그인" /> 
			</div>
		</form>
	</div>
</body>
</html>