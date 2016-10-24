<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body class="container">
    <h1>
        <small><a href="/diary?SendYear=${SendYear}&SandMonth=${SandMonth}&SandPage=prev">[PREV]</a></small> 
        ${ddayYear}년 ${ddayMonth+1}월
        <small><a href="/diary?SendYear=${SendYear}&ddayMonth=${SandMonth}&SandPage=next">[NEXT]</a></small> 
    </h1>
    <table class="table table-bordered">
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
                <c:forEach     var="oneDay" items="${oneDayList}" varStatus="i">
                        <td>
                            <c:if test="${oneDay.scheduleList == null}">
                                <div style="color:#BDBDBD">${oneDay.day}</div>
                            </c:if>
                            <c:if test="${oneDay.scheduleList != null}">
                                    <c:if test="${oneDay.scheduleList.size() == 0}">
                                        <a href="/diary/scheduleList?srcScheduleDate=${oneDay.year}-${oneDay.month}-${oneDay.day}">
                                            <c:if test="${i.count%7==1}">
                                                <div style="color:#FF0000">${oneDay.day}</div>
                                            </c:if>
                                            <c:if test="${i.count%7==0}">
                                                <div style="color:#0000FF">${oneDay.day}</div>
                                            </c:if>
                                            <c:if test="${i.count%7>1}">
                                                <div style="color:#000000">${oneDay.day}</div>
                                            </c:if>
                                        </a>
                                    </c:if>
                                    <c:if test="${oneDay.scheduleList.size() > 0}">
                                        <a href="/diary/scheduleList?srcScheduleDate=${oneDay.year}-${oneDay.month}-${oneDay.day}">
                                            <!-- 일요일 -->
                                            <c:if test="${i.count%7==1}">
                                                <div style="color:#FF0000;font-weight:bold;">${oneDay.day}</div>
                                            </c:if>
                                            <!-- 토요일 -->
                                            <c:if test="${i.count%7==0}">
                                                <div style="color:#0000FF;font-weight:bold;">${oneDay.day}</div>
                                            </c:if>
                                            <!-- 월,화,수,목,금 -->
                                            <c:if test="${i.count%7 > 1}">
                                                <div style="color:#000000;font-weight:bold;">${oneDay.day}</div>
                                            </c:if>
                                        </a>    
                                        <c:forEach var="s" items="${oneDay.scheduleList}"> 
                                            <div style="color:${s.scheduleFontColor}">
                                                <c:if test="${s.repeat == 'repeat'}">
                                                    <span><img src="/resources/imgs/repeat.png"/></span>
                                                </c:if>
                                                <c:if test="${s.scheduleTitle.length()<6}">
                                                    <span>${s.scheduleTitle}...</span>
                                                </c:if>
                                                <c:if test="${s.scheduleTitle.length()>5}">
                                                    <span>${s.scheduleTitle.substring(0, 5)}...</span>
                                                </c:if>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                            </c:if>
                        </td>
                            
                        <c:if test="${i.count%7==0 && i.count<oneDayList.size()}">
                            </tr><tr>
                        </c:if>
                </c:forEach>
            </tr>    
        </tbody>
    </table>
    
</body>
</html>