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
		<title>다님 플래너</title>
		<link rel="shortcut icon" href="../../resources/images/favicon.ico">
		<link rel="stylesheet" href="../../../resources/css/style.css">
		<script type="text/javascript">
			$(document).ready(function(){
				//전체선택, 전체선택해제
			    //최상단 체크박스 클릭
			    $("#checkAll").click(function(){
			        //클릭되었으면
			        if($("#checkAll").prop("checked")){
			            //input태그의 name이 checkbox인 태그들을 찾아서 checked옵션을 true로 정의
			            console.log("전체선택");
			            $("input[type=checkbox]").prop("checked",true);
			            //클릭이 안되있으면
			        }else{
			            //input태그의 name이 checkbox인 태그들을 찾아서 checked옵션을 false로 정의
			            console.log("전체선택 해제");
			            $("input[type=checkbox]").prop("checked",false);
			        }
			    });
				var checkBoxIndex = [];
				var i = 0;
				$(".stopButton").click(function(){
					$(".checkBox:checked").each(function(){
						checkBoxIndex[i] = $(".checkBox").index(this);
						i++;
					});
					if(checkBoxIndex.length > 0) {
						for(var j=0; j<checkBoxIndex.length; j++) {
							//console.log($('.communityNo').eq(checkBoxIndex[j]).val());
							//console.log($('.reportReason').eq(checkBoxIndex[j]).val());
							var communityNo = $('.communityNo').eq(checkBoxIndex[j]).val();
							var reportReason = $('.reportReason').eq(checkBoxIndex[j]).val();
							var reportNo = $('.reportNo').eq(checkBoxIndex[j]).val();
							$('#reportForm').append(
								'<input type="hidden" name="communityNo" class="communityNo" value="' + communityNo + '">'+
								'<input type="hidden" name="reportReason" class="reportReason" value="' + reportReason + '">'+
								'<input type="hidden" name="reportNo" class="reportNo" value="' + reportNo + '">'
							);
						}
					}
					$('#reportForm').submit();
				});
			})
		</script>
		<style type="text/css">
			thead>tr>th{text-align: center;}
			tbody>tr:HOVER{color:#da8c92;cursor: pointer;}
			/* .menu-wrap{text-align: right;} */
			.form-wrap{text-align: center;}
		</style>
	</head>
	<body>
		<!-- 헤더 -->
		<jsp:include page="../module/header.jsp" />
		<div class="container">
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th><input type="checkbox" id="checkAll"></th>
							<th>신고자</th>
							<th>글번호</th>
							<th>신고날짜</th>
							<th>사유</th>
							<th>신고횟수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach varStatus="status" items="${reportListAll}" var="reportListAll">				
							<tr>
								<td><input type="checkbox" class="checkBox"/><input type="hidden" class="reportNo" value="${reportListAll.reportNo}"> </td>			
								<td>${reportListAll.memberId}</td>
								<td><input type="text" class="communityNo" value="${reportListAll.communityNo}" style="border: 0; background: none;" readonly="readonly"></td>
								<td>${reportListAll.reportDate}</td>
								<td>
									<a style="cursor:hand;" onclick="location.href='/community/communityDetail?communityNo=${reportListAll.communityNo}'">
										<input type="text" class="reportReason" value="${reportListAll.reportReason}" style="border: 0; background: none;cursor:pointer;" readonly="readonly">
									</a>
								</td>	
								<td>${reportListAll.reportCount}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="reportFormDiv">
				<form id="reportForm" action="/community/communityReportSubmit" method="post">
				</form>
			</div>
			<div class="menu-wrap">
				<button type="button" class="stopButton" name="stopButton" class="btn btn-primary">게시글 삭제</button>
			</div>
		</div>
	</body>
</html>