<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.day').click(function() {
		$('#planList').show();// div 숨기기		
	});
});
</script>

</head>
<body class="container">
<h1>
        <small><a href="/diary?dayYear=${dayYear}&dayMonth=${dayMonth}&dayPage=prev">[PREV]</a></small> 
        ${dayYear}년 ${dayMonth+1}월
        <small><a href="/diary?dayYear=${dayYear}&dayMonth=${dayMonth}&dayPage=next">[NEXT]</a></small> 
    </h1>
    <table id="diary" class="table table-bordered" style="table-layout:fixed" width="200" height="500">
        <thead>
            <tr>
                <th>일</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th>토</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <c:forEach     var="dayList" items="${dayList}" varStatus="i">
                        <td>
                            <c:if test="${dayList.cityRouteList == null}">
                                <div id="${dayList.day}" style="color:#BDBDBD">${dayList.day}</div>
                            </c:if>
                            <c:if test="${dayList.cityRouteList != null}">
                                    <c:if test="${dayList.cityRouteList.size() == 0}">
<%--                                         <a href="/diaryList?cityRouteDate=${dayList.year}-${dayList.month}-${dayList.day}">
 --%>                                            <c:if test="${i.count%7==1}">
                                                <div id="${dayList.day}" style="color:#FF0000">${dayList.day}</div>
                                            </c:if>
                                            <c:if test="${i.count%7==0}">
                                                <div id="${dayList.day}" style="color:#0000FF">${dayList.day}</div>
                                            </c:if>
                                            <c:if test="${i.count%7>1}">
                                                <div id="${dayList.day}" style="color:#000000">${dayList.day}</div>
                                            </c:if>
                                        </a>
                                    </c:if>
                                    <c:if test="${dayList.cityRouteList.size() > 0}">
<%--                                         <a href="/diaryList?cityRouteDate=${dayList.year}-${dayList.month}-${dayList.day}">
 --%>                                            <!-- 일요일 -->
                                            <c:if test="${i.count%7==1}">
                                                <div class="day" id="${dayList.day}" style="color:#FF0000;font-weight:bold;">${dayList.day}</div>
                                            </c:if>
                                            <!-- 토요일 -->
                                            <c:if test="${i.count%7==0}">
                                                <div class="day" id="${dayList.day}" style="color:#0000FF;font-weight:bold;">${dayList.day}</div>
                                            </c:if>
                                            <!-- 월,화,수,목,금 -->
                                            <c:if test="${i.count%7 > 1}">
                                                <div class="day" id="${dayList.day}" style="color:#000000;font-weight:bold;">${dayList.day}</div>
                                            </c:if>
                                            <c:forEach var="s" items="${dayList.cityRouteList}"> 
                                                <c:if test="${s.cityRouteDepartureCity.length()<6}">
                                                    <span id="${dayList.day}" >${s.cityRouteDepartureCity}-></span>
                                                </c:if>
                                            </div>
                                        </c:forEach>
                                        </a>    
                                    </c:if>
                            </c:if>
                        </td>
                        <c:if test="${i.count%7==0 }">
                            </tr><tr>
                        </c:if>
                </c:forEach>
            </tr>    
        </tbody>
    </table>
	<div class="planList" id="planList" style="display: none;">
		<c:forEach var="dayList" items="${dayList}" varStatus="i">
			<c:forEach var="i" items="${dayList.cityRouteList}">
	  			${i.cityRouteDepartureCity}
	  		</c:forEach>
		</c:forEach>

	</div>
</body>
</html>
