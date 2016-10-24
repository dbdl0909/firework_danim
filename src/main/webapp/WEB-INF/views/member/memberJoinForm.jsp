<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>DANIM JOIN</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
	$(document).ready(function(){
		
	
		jQuery( function($) {
				// 정규식을 변수에 할당
				//아이디 검사
					//첫글자는 무조건 소문자, 5~15자, 특수기호 사용불가(-,_ 제외)
					//특수기호(-,_)만으로 사용불가
					// + 아이디 중복확인
				var reMemberId = /^[a-z]{1}[a-z0-9_-]{3,16}$/;
				//패스워드 검사
	 			   	//6~16자, 영문, 숫자, 특수문자 조합
					//숫자만으로는 사용불가
					//대문자, 소문자 구분
				var reMemberPassword = /^.*(?=.{6,16})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
				//닉네임 검사
					//2~10자의 영문, 한글, 숫자만 가능
				var reMemberName = /[a-zA-Z0-9가-힝]{2,10}$/
				//생년월일 검사
					//1916~2016
				var reMemberBirth = /[12][0-9]{3}-[0-9]{2}-[0-9]{2}/;
							//1000~2000, *000~*999(년) / 00~99(월) / 00~99(일)
				//이메일 검사
					//발송 후 인증
					// + 이메일 중복검사
				var reMemberEmail = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/;
				// 선택할 요소를 변수에 할당
				var
					memberJoinForm = $('.memberJoinForm'),
					memberId = $('#memberId'),
					memberPassword1 = $('#memberPassword1'),
					memberPassword2 = $('#memberPassword2'),
					memberName = $('#memberName'),
					memberBirth = $('#memberBirth'),
					memberGender = $('#memberGender'),
					memberEmail = $('#memberEmail');
	
				memberJoinForm.submit(function() {
					if(reMemberId.test(memberId.val()) != true) {						//아이디검사
						alert('아이디를 확인 후 입력하세요');
						memberId.focus();
						return false;
					} else if(reMemberPassword.test(memberPassword1.val()) != true) {	//비밀번호 검사
						alert('비밀번호를 확인 후 입력하세요');
						memberPassword1.focus();
						return false;
					} else if(memberPassword1.val() != memberPassword2.val()) {			//비밀번호 동일한지 검사
						alert('비밀번호를 동일하게 입력하세요');
						memberPassword2.focus();
						return false;
					} else if(reMemberName.test(memberName.val()) != true) {			//닉네임 검사
						alert('닉네임을 확인 후 입력하세요');
						memberName.focus();
						return false;
					} else if(reMemberBirth.test(memberBirth.val()) != true) {			//생년월일 검사
						alert('생년월일을 확인 후 입력하세요');
						memberBirth.focus();
						return false;
					} else if(reMemberEmail.test(memberEmail.val()) != true) {			//이메일 검사
						alert('이메일을 확인 후 입력하세요');
						memberEmail.focus();
						return false;
					}
				});
		});
	});
	</script>
</head>
<body>
	<div id="twitter">
		<form class="memberJoinForm" action="" method="post"> 
			<div class='outerDiv'>
				<label for="memberId">아이디</label> 
				<input id="memberId" type="text" required /> 
				<div class='message' id='memberIdDiv'> 5~15자의 소문자와 숫자, _, -만 사용 가능합니다</div>
			</div>
			<div class='clearfix'></div>
			
			<div class='outerDiv'>
				<label for="memberPassword1">비밀번호</label> 
				<input id="memberPassword1" type="password" required /> 
				<div class='message' id='memberPassword1Div'> 6~16자 대소문자, 숫자, 특수문자를 사용하세요</div>
			</div>
			<div class='clearfix'></div>
			
			<div class='outerDiv'>
				<label for="memberPassword2">비밀번호 확인</label> 
				<input id="memberPassword2" type="password" required /> 
				<div class='message' id='memberPassword2Div'> 비밀번호를 다시 한 번 입력하세요</div>
			</div>
			<div class='clearfix'></div>
			
			<div class='outerDiv'>
				<label for="memberName">닉네임</label> 
				<input id="memberName" type="text" required  /> 
				<div class='message' id='memberNameDiv'> 2~10자의 영문, 숫자만 가능합니다</div>
			</div>
			<div class='clearfix'></div>
			
			<div class='outerDiv'>
				<label for="memberBirth">생년월일</label> 
				<div>
	                <input class="form-control" id="memberBirth" type="date" style="height: 23px" required  />
					<span class="result"></span>
           		</div>
				<div class='message' id='memberNameDiv'> 생년월일을 입력하세요</div>
			</div>
			<div class='clearfix'></div>
			
			<div class='outerDiv'>
				<label for="memberEmail">이메일</label> 
				<input id="memberEmail" type="email" required  /> 
				<div class='message' id='memberEmailDiv'> 이메일을 입력하세요</div>
			</div>
			<div class='clearfix'></div>
			
			<div class='outerDiv'>
				<label for="memberGender">성별</label> 
				<div class="radio">
	                <label>여자<input class="memberGenderInput" id="memberGender" type="radio" name="memberGender" value="woman" required  /></label>
	                <label>남자<input class="memberGenderInput" id="memberGender" type="radio" name="memberGender" value="man"/></label>
	            	<div class='message' id='memberGenderDiv'> 성별을 선택하세요</div>
	            </div>					
			</div>
			<div class='clearfix'></div>
			<div id='submit' class='outerDiv'>
				<input type="submit" value="가입하기" /> 
			</div>				
		</form>
	</div>
</body>
</html>