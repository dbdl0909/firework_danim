<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="cityRouteList" items="${cityRouteList}" varStatus="i">
		<table>
				<tr>
					<td>${cityRouteList}<input type="hidden" value="${cityRouteList.cityRouteNo}" name="cityRouteNo"><a href="/search/updateForm?cityRouteNo=${cityRouteList.cityRouteNo}">수정</a></td>
				</tr>
		</table>
	</c:forEach>
</body>
</html>