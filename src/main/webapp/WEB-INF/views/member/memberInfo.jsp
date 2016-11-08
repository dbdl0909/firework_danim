<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<title>다님플래너 :: 회원정보수정</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	<body>
		<h3>회원정보보기</h3>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td>아이디</td>
					<td>${memberAll.memberId}</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="button" value="비밀번호변경"></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>${memberAll.memberName}</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>${memberAll.memberInfoBirth}</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>${memberAll.memberInfoGender}</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><${memberAll.memberInfoEmail}</td>
				</tr>
			</tbody>
		</table>
		<input type="button" value="내정보수정">
	</body>
</html>