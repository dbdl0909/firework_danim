<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html> 
	<head>
		<title>다님 플래너</title>
		<link rel="shortcut icon" href="../../resources/images/favicon.ico">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- google chrome CDN Jquery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="../../resources/css/style.css">
		<script src="../../resources/js/monthly.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
		
				$('#mycalendar').monthly({
					mode: 'event',
					xmlUrl: '/events.xml'
				});
			
			switch(window.location.protocol) {
			case 'http:':
			case 'https:':
			// running on a server, should be good.
			break;
			case 'file:':
			alert('Just a heads-up, events will not work when run locally.');
			}
		
			});
		</script>
	</head>
	<body>
		<jsp:include page="../module/header.jsp" />
		<div class="container">
			<div id="myPlanWrap">
				<div id="myPlanCalendar" style="width:60%; float:left;">
					<div class="monthly" id="mycalendar"></div>
				</div>
				<div id="myPlanDayMemo" style="float:right; border:1px solid #ccc; width:38%; padding-left:1%">
					123123
				</div>
			</div>
		</div>
		<jsp:include page="../module/footer.jsp" />
	</body>
</html>