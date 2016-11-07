<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html> 
<head>
	<head>
		<title>다님 플래너</title>
		<link rel="shortcut icon" href="../../resources/images/favicon.ico">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="../../resources/se/js/HuskyEZCreator.js" charset="utf-8" ></script>
		<script type="text/javascript" src="../../resources/se/js/jindo.min.js" charset="utf-8" ></script>
		<!-- google chrome CDN Jquery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="../../../resources/css/style.css">
		<script>
			$(document).ready(function(){
				var communityCategoryNoVal = '${param.communityCategoryNo}';
				$('#communityCategoryNo option').each(function(i){
					if($('#communityCategoryNo option').eq(i).val() == communityCategoryNoVal) {
						$(this).attr('selected','selected');				
					}			
				});
			});
		</script>
	</head>
<body>
<!-- 헤더 -->
<jsp:include page="../module/header.jsp" />		
<div class="container">
	<form id="communityInsertForm" method="post">
		<div class="communityTitleWrap">
			<label class="communityTitle" for="communityCategoryNo"><span>카테고리</span></label>
			<select  id="communityCategoryNo" name="communityCategoryNo">
			<optgroup label=":::::::: 커뮤니티 ::::::::">
				<option value="community_category_01" selected="selected"> 플랜</option>
				<option value="community_category_02"> 후기</option>
				<option value="community_category_03"> 자유게시판</option>
				<option value="community_category_04"> 동행찾기</option>
			</optgroup>					
			<optgroup label=":::::::: 고객센터 ::::::::">	
				<option value="community_category_05"> 숙박시설</option>
				<option value="community_category_06"> 교통편</option>
				<option value="community_category_07"> 예약/결제</option>
				<option value="community_category_08"> 취소/환불/변경</option>
				<option value="community_category_09"> 회원/로그인</option>
				<option value="community_category_10"> 여행관련</option>
			</optgroup>	
			</select>
		</div>
		<div class="communityTitleWrap">
			<label class="communityTitle"  for="memberId"><span>작성자</span></label>		
			<input type="text" id="memberId" name="memberId" value="${sessionScope.memberId}" readonly="readonly"/>
		</div>
		<div class="communityTitleWrap">
			<label class="communityTitle"  for="communitySubject"><span>글 제목</span></label>
			<input type="text" id="communitySubject" name="communitySubject" />
			<label id="communityNoticeLabel" for="communityNotice"><span>공지사항</span></label>
			<input type="checkbox" id="communityNotice" name="communityNotice" value="T"/>		
		</div>
		<div class="communityContentWrap">
		 	<textarea id="communityContent" name="communityContent" cols="10" rows="30" style="width:100%;"></textarea>
		</div>
		<div class="buttonDiv">
			<button type="button" class="btn btn-primary" onclick="onWrite()">쓰기</button>
			<button type="button" class="btn btn-primary" onclick="history.go(-1);"> 취소</button>
		</div>
	</form>
</div>
<!-- 헤더 -->
<jsp:include page="../module/footer.jsp" />
</body>
<script type="text/javascript">
var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: document.getElementById('communityContent'), // html editor가 들어갈 textarea id
	sSkinURI: "../../resources/se/SmartEditor2Skin.html",  // html editor가 skin url
	fOnAppLoad: function () { 
        //수정모드를 구현할 때 사용할 부분. 로딩이 끝난 후 값이 체워지게 하는 구현을 하면 된다.
         var title = '${item.title}';               
         var contents = '${item.contents}';         //db에서 불러온 값을 여기에서 체워넣으면 됨.
         document.getElementById("title").value = title;     
         oEditors.getById["communityContent"].exec("PASTE_HTML", [contents]); //로딩이 끝나면 contents를 communityContent에 넣음
     },
     fCreator: "createSEditor2"
 });

var onWrite = function(){
	oEditors.getById["communityContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됨
	var boardWriteForm = document.getElementById("communityInsertForm");  
	boardWriteForm.action ="/community/communityInsert";              
	boardWriteForm.submit();  
};

var pasteHTML = function(filename){
    var sHTML = '<img src="${pageContext.request.contextPath}/resources/upload/'+filename+'">';
    oEditors.getById["communityContent"].exec("PASTE_HTML", [sHTML]);
};
</script>
</html>