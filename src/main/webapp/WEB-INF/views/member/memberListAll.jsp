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
	<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
	<title>다님플래너 :: 회원리스트</title>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../module/header.jsp" />
	<h3 align="center">전체회원 리스트</h3>
	<!-- <form class="memberList" action="" method="post"> -->
		<table class="table table-hover">
			<thead>
				<ul>
					<tr>
						<th>아이디</th>
						<th>권한</th>
						<th>
							<li class="w3-dropdown-hover">
								연동여부 <i class="fa fa-caret-down"></i>
								<div class="w3-dropdown-content w3-white w3-card-4">
							       <a href="/member/memberListAll">전체회원</a>
							       <a href="/member/memberListAll?memberIdCheck=T">내부회원</a>
							       <a href="/member/memberListAll?memberIdCheck=F">연동회원</a>
							     </div>
						    </li>
						</th>
						<th>이름</th>
						<th>생년월일</th>
						<th>성별</th>
						<th>이메일</th>
						<th>
							<li class="w3-dropdown-hover">
								회원상태 <i class="fa fa-caret-down"></i>
								<div class="w3-dropdown-content w3-white w3-card-4">
									<a href="/member/memberListAll">전체회원</a>
									<a href="/member/memberListAll?memberStatus=normalMember">정상회원</a>
									<a href="/member/memberListAll?memberStatus=stopMember">정지회원</a>
									<a href="/member/memberListAll?memberStatus=leave">탈퇴회원</a>
							     </div>
						    </li>
						</th>
						<th>가입날짜</th>
						<th>수정날짜</th>
					</tr>
				</ul>
			</thead>
			<tbody>
				<!-- 멤버목록 출력 -->
				<c:forEach items="${selectMemberAll}" var="memberAll">
					<tr>
						<td>${memberAll.memberId}</td>
						<td>${memberAll.memberLevel}</td>
						<td>${memberAll.memberIdCheck}</td>
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
		<!-- 페이징 -->
		<div id="paginationWrap" align="center">
			<ul class="pagination">
				<li>
					<c:if test="${page>1}">
						<a href="/member/memberListAll?page=${page-1}">&laquo;</a>
					</c:if>
				</li>
				<c:forEach begin="${startPage}" end="${endPage}" var="i">
				<li>
					<c:choose>
						<c:when test="${page == i}">
							<a href="/member/memberListAll?page=${i}" style="background:#434343; color:#fff;">${i}</a>
						</c:when>
						<c:otherwise>
							<a href="/member/memberListAll?page=${i}">${i}</a>
						</c:otherwise>
					</c:choose>
				</li>
				</c:forEach>
				<li>
					<c:if test="${page<lastPage}">
						<a href="/member/memberListAll?page=${page+1}">&raquo;</a>
					</c:if>
				</li>
			</ul>
		</div>
	<!-- </form> -->
	<!-- 풋터 -->
	<jsp:include page="../module/footer.jsp" />
</body>
</html>