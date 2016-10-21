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
		function init() {
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
		window.onload = init;
	</script>
	<script type="text/javascript">
	$(document).ready(function() {
	    $("#memberInsertButton").click(function() {
	    	//모든 항목 필수 입력
	    	if ($("#memberId").val() == "") {
                alert("아이디를 꼭 입력하세요!");
                $("#memberId").focus();
	    	} else if ($("#memberPassword1").val() == "") {
	    		alert("패스워드를 꼭 입력하세요!");
                $("#memberPassword1").focus();
	    	} else if ($("#memberPassword2").val() == "") {
	    		alert("패스워드를 꼭 재입력하세요!");
                $("#memberPassword2").focus();
	    	} else if ($("#memberName").val() == "") {
	    		alert("닉네임을 꼭 입력하세요!");
                $("#memberName").focus();
	    	} else if ($("#memberBirth").val() == "") {
	    		alert("생년월일을 꼭 입력하세요!");
                $("#memberBirth").focus();
	    	} else if ($("#memberBirth").val() == "") {
	    		alert("생년월일을 꼭 입력하세요!");
                $("#memberBirth").focus();
	    	} else if ($("#memberGender").val() == "") {
	    		alert("성별을 꼭 선택하세요!");
                $("#memberGender").focus();
	    	} else if ($("#memberEmail").val() == "") {
	    		alert("이메일을 꼭 입력하세요!");
                $("#memberEmail").focus();
              //아이디 검사
				//첫글자는 무조건 소문자, 5~15자, 특수기호 사용불가(-,_ 제외)
				//특수기호(-,_)만으로 사용불가
				// + 아이디 중복확인
	    	} else if ($("memberId").val().length >4 && $("memberId").val().length <16){
	    		
	    	} else if ($("#memberPassword1").val() != $("#memberPassword2").val()) {
                alert("비밀번호와 비밀번호 확인이 일치하지않습니다.");
                $("#memberPassword1").val("");
                $("#memberPassword2").val("");
                $("#memberPassword1").focus();
	    	//아이디 검사
				//첫글자는 무조건 소문자, 5~15자, 특수기호 사용불가(-,_ 제외)
				//특수기호(-,_)만으로 사용불가
				// + 아이디 중복확인
	    }
/* 	function validate() {
		console.log('안녕');
		//정규식 => 유효성검사
			//모두 필수 입력
		var memberId = document.getElementById("memberId")						//아이디
		var memberPassword1 = document.getElementById("memberPassword1");		//패스워드1
		var memberPassword2 = document.getElementById("memberPassword2");		//패스워드2
		var memberName = document.getElementById("memberName");					//닉네임
		var memberBirth = document.getElementById("memberBirth");				//생년월일
		var memberGender = document.getElementById("memberGender");				//성별
		var memberEmail = document.getElementById("memberEmail");				//이메일
		
		//아이디 검사
			//첫글자는 무조건 소문자, 5~15자, 특수기호 사용불가(-,_ 제외)
			//특수기호(-,_)만으로 사용불가
			// + 아이디 중복확인
			// \d : [0-9]와 같다.
		if (!idChk(/^[a-z]{1}[a-z\d_-]{5,15}$/, memberId, "잘못된 형식의 ID입니다."))
			return false;
	    if (!idChk(/[\d]/, userid, "잘못된 형식의 ID입니다."))
	    	return false;
	    
	    //패스워드 검사
	    	//6~16자, 영문, 숫자, 특수문자 조합
			//숫자만으로는 사용불가
			//대문자, 소문자 구분
	    if (!passChk.test(/^(?=.*[a-zA-Z0-9])(?=.*[^a-zA-Z0-9)(?=.*[0-9]).{6,16}$/, memberPassword1, "비밀번호를 확인해주세요."))
	    	return false;
		if (pw.length < 6 || pw.length > 16)
			return false;
		//if (!pwChk(memberPassword1, memberPassword2, "비밀번호가 다릅니다."));		//패스워드1, 2 동일한지 확인
		if(memberPassword1.value!=memberPassword2.value) {alert("비밀번호가 다릅니다.");}	//패스워드1, 2 동일한지 확인
		
		//닉네임 검사
			//2~10자의 영문, 한글, 숫자만 가능
		if(!nameChk(/[a-zA-Z0-9]{2,10}$/, memberName, "2~10자의 영문, 숫자만 가능합니다."))
			return false;
		
		//생년월일 검사
			//1916~2016
		if(data.search(/[12][0-9]{3}-[0-9]{2}-[0-9]{2}/, memberBirth, "생년월일을 확인하세요") == -1)
					//1000~2000, *000~*999(년) / 00~99(월) / 00~99(일)
	        return false;
			var _year = data.substr(0,4);
			var _month= data.substr(5,2);
			var _day = data.substr(8,2);
			return isValidDate(_year, _month, _day);
		
		//이메일 검사
			//발송 후 인증
			// + 이메일 중복검사		
		if(!emailChk(/^[\w-]{4,}@[\w-]+(\.\w+){1,3}$/, memberEmail, "이메일 형식이 잘못되었습니다."))
			return false;
		
	} */
	</script>
		
</head>
<body>
	<div id="twitter">
		<form action="" method="post" onsubmit="return validate();"> 
			<div id='memberId' class='outerDiv'>
				<label for="memberId">아이디</label> 
				<input type="text" name="memberId" required /> 
				<div class='message' id='memberIdDiv'> 5~15자의 소문자와 숫자, _, -만 사용 가능합니다</div>
			</div>
			<div class='clearfix'></div>
			
			<div id='memberPassword1' class='outerDiv'>
				<label for="memberPassword1">비밀번호</label> 
				<input type="password" name="memberPassword1" required /> 
				<div class='message' id='memberPassword1Div'> 6~16자 대소문자, 숫자, 특수문자를 사용하세요</div>
			</div>
			<div class='clearfix'></div>
			
			<div id='memberPassword2' class='outerDiv'>
				<label for="memberPassword2">비밀번호 확인</label> 
				<input type="password" name="memberPassword2" required /> 
				<div class='message' id='memberPassword2Div'> 비밀번호를 다시 한 번 입력하세요</div>
			</div>
			<div class='clearfix'></div>
			
			<div id='memberName' class='outerDiv'>
				<label for="memberName">닉네임</label> 
				<input type="text" name="memberName" required  /> 
				<div class='message' id='memberNameDiv'> 2~10자의 영문, 숫자만 가능합니다</div>
			</div>
			<div class='clearfix'></div>
			
			<div id='memberBirth' class='outerDiv'>
				<label for="memberBirth">생년월일</label> 
				<div>
	                <input type="date" class="form-control" id="memberBirth" style="height: 23px" required  />
					<span class="result"></span>
           		</div>
				<div class='message' id='memberNameDiv'> 생년월일을 입력하세요</div>
			</div>
			<div class='clearfix'></div>
			
			<div id='memberEmail' class='outerDiv'>
				<label for="memberEmail">이메일</label> 
				<input type="email" name="memberEmail" required  /> 
				<div class='message' id='memberEmailDiv'> 이메일을 입력하세요</div>
			</div>
			<div class='clearfix'></div>
			
			<div id='memberGender' class='outerDiv'>
				<label for="memberGender">성별</label> 
				<div class="radio">
	                <label>여자<input class="memberGenderInput" type="radio" name="memberGender" value="woman" required  /></label>
	                <label>남자<input class="memberGenderInput" type="radio" name="memberGender" value="man"/></label>
	            	<div class='message' id='memberGenderDiv'> 성별을 선택하세요</div>
	            </div>					
			</div>
			<div class='clearfix'></div>
			<div id='submit' class='outerDiv'>
				<input type="button" id="memberInsertButton" value="가입하기" /> 
			</div>				
		</form>
		<div class="clearfix"></div>
	</div>
</body>
</html>