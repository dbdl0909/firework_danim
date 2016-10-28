<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h2 align="center">전체회원 리스트</h2>
	<form class="memberList" action="" method="post">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>아이디</th>
					<th>권한</th>
					<th>연동여부</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>이메일</th>
					<th>회원상태</th>
					<th>가입날짜</th>
					<th>수정날짜</th>
				</tr>
			</thead>
			<tbody>
				<!-- 멤버목록 출력 -->
				<c:forEach items="${selectMemberAll}" var="memberAll">
					<tr>
						<td>${memberAll.memberId}</td>
						<td>${memberAll.memberLevel}</td>
						<td>${memberAll.memberLoginCheck}</td>
						<td>${memberAll.memberName}</td>
						<td>${memberAll.memberInfoBirth}</td>
						<td>${memberAll.memberInfoGender}</td>
						<td>${memberAll.memberInfoEmail}</td>
						<td>${memberAll.memberStatus}</td>
						<td>${memberAll.memberDate}</td>
						<td>${memberAll.memberUpdate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
</body>
</html>