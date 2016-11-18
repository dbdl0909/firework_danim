<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>다님플래너</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<meta http-equiv="X-UA-Compatible" content="chrome=1"><!-- Optimistically rendering in Chrome Frame in IE. --> 
	<link rel="stylesheet" href="../../../resources/css/style.css" type="text/css">
	<style type="text/css">
	    .bs-example{
	    	margin: 20px;
	    }
		/* Fix alignment issue of label on extra small devices in Bootstrap 3.2 */
	    .form-horizontal .control-label{
	        padding-top: 7px;
	    }
	</style>
	<script>
		//생년월일 달력
		/* function init() {
		    var _inputs = document.getElementsByTagName('input');
		    for (var i = 0; i < _inputs.length; i++) {
		        if(!Modernizr.inputtypes[_inputs[i].type]) {
		            _inputs[i].className = 'not-supported';
		        }
		        _inputs[i].parentNode.getElementsByClassName('result')[0].innerHTML = _inputs[i].value;
		        _inputs[i].onchange = function () {
		            //console.log(this.value);
		            var result_node = this.parentNode.getElementsByClassName('result');
		            result_node[0].innerHTML = this.value;
		        }
		    }
		}
		window.onload = init; */
	</script>
</head>
<jsp:include page="../module/header.jsp"></jsp:include>
<body>
	<div id="twitter">
		<form class="memberJoinForm" action="/member/memberJoinSubmit" method="post"> 
			<input type="hidden" name="memberIdCheck" value="T">	<!-- T(내부회원) : 이 페이지는 내부회원가입페이지 -->
			<div class='outerDiv'>
				<label for="memberId">아이디</label>
				<input id="memberId" name="memberId" type="text" required />
				<div class='message' id='memberIdDiv'> 5~15자의 소문자와 숫자, _, -만 사용 가능합니다</div>
			</div>
			<div class='clearfix'></div>
			
			<div class='outerDiv'>
				<label for="memberInfoPassword1">비밀번호</label> 
				<input id="memberInfoPassword1" name="memberInfoPassword" type="password" required /> 
				<div class='message' id='memberInfoPassword1Div'> 6~16자 대소문자, 숫자, 특수문자를 사용하세요</div>
			</div>
			<div class='clearfix'></div>
			
			<div class='outerDiv'>
				<label for="memberInfoPassword2">비밀번호 확인</label>
				<input id="memberInfoPassword2" type="password" required /> 
				<div class='message' id='memberInfoPassword2Div'> 비밀번호를 다시 한 번 입력하세요</div>
			</div>
			<div class='clearfix'></div>
			
			<div class='outerDiv'>
				<label for="memberName">닉네임</label> 
				<input id="memberName" name="memberName" type="text" required  /> 
				<div class='message' id='memberNameDiv'> 2~10자의 영문, 숫자만 가능합니다</div>
			</div>
			<div class='clearfix'></div>
			
			<div class='outerDiv'>
				<label for="memberInfoBirth">생년월일</label> 
				<div>
	                <input class="form-control" id="memberInfoBirth" name="memberInfoBirth" type="date" required />
					<span class="result"></span>
           		</div>
				<div class='message' id='memberInfoBirthDiv'> 생년월일을 입력하세요</div>
			</div>
			<div class='clearfix'></div>
			
			<div class='outerDiv'>
				<label for="memberInfoEmail">이메일</label> 
				<input id="memberInfoEmail" name="memberInfoEmail" type="email" required /> 
				<div class='message' id='memberInfoEmailDiv'> 이메일을 입력하세요</div>
			</div>
			<div class='clearfix'></div>
			
			<div class='outerDiv'>
				<label for="memberInfoGender">성별</label>
                <label class="memberInfoGenderLabel">여자</label>
                <div class='memberInfoGenderRadio'>
                	<input class="memberInfoGenderInput" id="memberInfoGender" name="memberInfoGender" type="radio" value="F" required />
                </div>
                <label class="memberInfoGenderLabel">남자</label>
                <div class='memberInfoGenderRadio'>
                	<input class="memberInfoGenderInput" id="memberInfoGender" name="memberInfoGender" type="radio" value="M"/>
                </div>
            	<div class='message' id='memberInfoGenderDiv'> 성별을 선택하세요</div>
			</div>
			<div class='clearfix'></div>
			
			<div id='joinSubmitButton' class='outerDiv'>
				<input type="submit" value="가입하기" /> 
			</div>				
		</form>
	</div>
</body>
<jsp:include page="../module/footer.jsp"></jsp:include>
</html>