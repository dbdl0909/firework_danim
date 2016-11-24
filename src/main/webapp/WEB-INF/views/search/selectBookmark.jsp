<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<!-- 자동완성 기능 이용을 위해 필요한 jqueryUI -->
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<!-- 자체 css -->
		<link href="../../../resources/css/style.css" rel="stylesheet" type="text/css">
		<title>다님 플래너</title>
		<script type="text/javascript">
		$(document).ready(function(){
			
		    $(".bookmarkDelete").click(function(){
		    	var thisTest = $(".bookmarkDelete").index(this);
		    	var a = $(".bookmarkInfo").index(this);
		    	console.log(thisTest);
		    	console.log(a);
		        $('div.modal').modal();
		       
		        var bookmarkInfo = $('.bookmarkDelete').val();
		        $('#bookmarkModal').val(bookmarkInfo);
		    	console.log($('#bookmarkModal').val());
		    });	
		    
		    $('#deleteSubmit').click(function(){
		    	
		    });
		});
		</script>
	</head>
	<jsp:include page="../module/header.jsp"></jsp:include>
	<body>
		<div class="container">
			<div id="searchGuide">
				<h3 style="color: #e35e54">즐겨찾기</h3>
			</div>
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>
								<h3>갈만한 곳</h3>
							</th>
							<th>
							
							</th>
							<th>
							
							</th>
						</tr>
					</thead>
					<tbody id="landmarkTbody">
						<c:set var="landmarkBookmark" value="${selectBookmark.landmarkBookmark}"/>
						<c:if test="${!empty selectBookmark.landmarkBookmark}">			
							<c:forEach var="landmarkBookmark" items="${landmarkBookmark}">
								<tr class="bookmarkTr">
									<td>${landmarkBookmark.cityInfoDoName} > ${landmarkBookmark.cityInfoName} > ${landmarkBookmark.landmarkInfoName}</td>
									<td><a class="landmarkInfo" href="landmarkInfo?landmarkInfoNo=${landmarkBookmark.landmarkInfoNo}&cityInfoName=${landmarkBookmark.cityInfoName}">가이드북</a></td>
									<td id="deleteTd">
										<a class="bookmarkDelete">삭제<input class="bookmarkInfo" type="hidden" value="${landmarkBookmark.landmarkInfoNo}"/></a>
									</td>
								</tr>	
							</c:forEach>
						</c:if>
						<c:if test="${empty selectBookmark.landmarkBookmark}">
							<tr>
								<td>
									추가된 관심 리스트가 없습니다
								</td>
							</tr>
						</c:if>						
					</tbody>
				</table>
			</div>
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>
								<h3>먹을만한 곳</h3>
							</th>
							<th>
							
							</th>
							<th>
							
							</th>
						</tr>
					</thead>
					<tbody id="eateryTbody">
						<c:set var="eateryBookmark" value="${selectBookmark.eateryBookmark}"/>
						<c:if test="${!empty selectBookmark.eateryBookmark}">			
							<c:forEach var="eateryBookmark" items="${eateryBookmark}">
								<tr>
									<td>${eateryBookmark.cityInfoDoName} > ${eateryBookmark.cityInfoName} > ${eateryBookmark.eateryName}</td>
									<td><a class="eateryInfo" href="eateryInfo?eateryNo=${eateryBookmark.eateryNo}&cityInfoName=${eateryBookmark.cityInfoName}">가이드북</a></td>
									<td id="deleteTd"><a class="bookmarkDelete">삭제</a><input class="bookmarkInfo" type="hidden" value="${eateryBookmark.eateryNo}"/></td>
								</tr>	
							</c:forEach>
						</c:if>
						<c:if test="${empty selectBookmark.eateryBookmark}">
							<tr>
								<td>
									추가된 관심 리스트가 없습니다
								</td>
							</tr>
						</c:if>						
					</tbody>
				</table>
			</div>
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>
								<h3>볼만한 것</h3>
							</th>
							<th>
							
							</th>
							<th>
							
							</th>							
						</tr>
					</thead>
					<tbody id="eventTbody">
						<c:set var="eventBookmark" value="${selectBookmark.eventBookmark}"/>
						<c:if test="${!empty selectBookmark.eventBookmark}">			
							<c:forEach var="eventBookmark" items="${eventBookmark}">
								<tr>									
									<td>${eventBookmark.cityInfoDoName} > ${eventBookmark.cityInfoName} > ${eventBookmark.eventInfoName}</td>
									<td><a class="eventInfo" href="eventInfo?eventInfoName=${eventBookmark.eventInfoName}&cityInfoName=${eventBookmark.cityInfoName}">가이드북</a></td>
									<td id="deleteTd"><a class="bookmarkDelete" value="${eventBookmark.eventInfoName}">삭제</a></td>
								</tr>	
							</c:forEach>
						</c:if>
						<c:if test="${empty selectBookmark.eventBookmark}">
							<tr>
								<td>
									추가된 관심 리스트가 없습니다
								</td>
							</tr>
						</c:if>					
					</tbody>
				</table>
			</div>			
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>
								<h3>머물만한 곳</h3>
							</th>
							<th>
							
							</th>
							<th>
							
							</th>							
						</tr>
					</thead>
					<tbody id="stayTbody">
						<c:set var="stayBookmark" value="${selectBookmark.stayBookmark}"/>
						<c:if test="${!empty selectBookmark.stayBookmark}">			
							<c:forEach var="stayBookmark" items="${stayBookmark}">
								<tr>
									<td>${stayBookmark.cityInfoDoName} > ${stayBookmark.cityInfoName} > ${stayBookmark.stayInfoName}</td>
									<td><a class="stayInfo" href="stayInfo?stayInfoNo=${stayBookmark.stayInfoNo}&cityInfoName=${stayBookmark.cityInfoName}">가이드북</a></td>
									<td id="deleteTd"><a class="bookmarkDelete" value="${stayBookmark.stayInfoNo}">삭제</a></td>
								</tr>	
							</c:forEach>
						</c:if>
						<c:if test="${empty selectBookmark.stayBookmark}">
							<tr>
								<td>
									추가된 관심 리스트가 없습니다
								</td>
							</tr>
						</c:if>	
					</tbody>
				</table>
			</div>
			<div class="bookmarkModal">
				<div class="modal fade" id="bookmarkModal" role="dialog">
					<div class="modal-dialog">	
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">Close</button>
								<h4 class="modal-title">즐겨찾기 삭제</h4>
							</div>
							<div class="modal-body">
								해당 항목을 즐겨찾기에서 삭제 하시겠습니까?
								<input id="bookmarkModal" type="hidden" value="falval"/>
							</div>
							<div class="modal-footer">
								<a id="deleteSubmit" type="button" class="btn btn-default">삭제</a>
							</div>
						</div>			      
					</div>
				</div>
			</div>					
		</div>
	</body>
	<jsp:include page="../module/footer.jsp"></jsp:include>
</html>