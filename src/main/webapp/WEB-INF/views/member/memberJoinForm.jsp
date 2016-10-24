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
		//������� �޷�
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
				// ���Խ��� ������ �Ҵ�
				//���̵� �˻�
					//ù���ڴ� ������ �ҹ���, 5~15��, Ư����ȣ ���Ұ�(-,_ ����)
					//Ư����ȣ(-,_)������ ���Ұ�
					// + ���̵� �ߺ�Ȯ��
				var reMemberId = /^[a-z]{1}[a-z0-9_-]{3,16}$/;
				//�н����� �˻�
	 			   	//6~16��, ����, ����, Ư������ ����
					//���ڸ����δ� ���Ұ�
					//�빮��, �ҹ��� ����
				var reMemberPassword = /^.*(?=.{6,16})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
				//�г��� �˻�
					//2~10���� ����, �ѱ�, ���ڸ� ����
				var reMemberName = /[a-zA-Z0-9��-��]{2,10}$/
				//������� �˻�
					//1916~2016
				var reMemberBirth = /[12][0-9]{3}-[0-9]{2}-[0-9]{2}/;
							//1000~2000, *000~*999(��) / 00~99(��) / 00~99(��)
				//�̸��� �˻�
					//�߼� �� ����
					// + �̸��� �ߺ��˻�
				var reMemberEmail = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/;
				// ������ ��Ҹ� ������ �Ҵ�
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
					if(reMemberId.test(memberId.val()) != true) {						//���̵�˻�
						alert('���̵� Ȯ�� �� �Է��ϼ���');
						memberId.focus();
						return false;
					} else if(reMemberPassword.test(memberPassword1.val()) != true) {	//��й�ȣ �˻�
						alert('��й�ȣ�� Ȯ�� �� �Է��ϼ���');
						memberPassword1.focus();
						return false;
					} else if(memberPassword1.val() != memberPassword2.val()) {			//��й�ȣ �������� �˻�
						alert('��й�ȣ�� �����ϰ� �Է��ϼ���');
						memberPassword2.focus();
						return false;
					} else if(reMemberName.test(memberName.val()) != true) {			//�г��� �˻�
						alert('�г����� Ȯ�� �� �Է��ϼ���');
						memberName.focus();
						return false;
					} else if(reMemberBirth.test(memberBirth.val()) != true) {			//������� �˻�
						alert('��������� Ȯ�� �� �Է��ϼ���');
						memberBirth.focus();
						return false;
					} else if(reMemberEmail.test(memberEmail.val()) != true) {			//�̸��� �˻�
						alert('�̸����� Ȯ�� �� �Է��ϼ���');
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
				<label for="memberId">���̵�</label> 
				<input id="memberId" type="text" required /> 
				<div class='message' id='memberIdDiv'> 5~15���� �ҹ��ڿ� ����, _, -�� ��� �����մϴ�</div>
			</div>
			<div class='clearfix'></div>
			
			<div class='outerDiv'>
				<label for="memberPassword1">��й�ȣ</label> 
				<input id="memberPassword1" type="password" required /> 
				<div class='message' id='memberPassword1Div'> 6~16�� ��ҹ���, ����, Ư�����ڸ� ����ϼ���</div>
			</div>
			<div class='clearfix'></div>
			
			<div class='outerDiv'>
				<label for="memberPassword2">��й�ȣ Ȯ��</label> 
				<input id="memberPassword2" type="password" required /> 
				<div class='message' id='memberPassword2Div'> ��й�ȣ�� �ٽ� �� �� �Է��ϼ���</div>
			</div>
			<div class='clearfix'></div>
			
			<div class='outerDiv'>
				<label for="memberName">�г���</label> 
				<input id="memberName" type="text" required  /> 
				<div class='message' id='memberNameDiv'> 2~10���� ����, ���ڸ� �����մϴ�</div>
			</div>
			<div class='clearfix'></div>
			
			<div class='outerDiv'>
				<label for="memberBirth">�������</label> 
				<div>
	                <input class="form-control" id="memberBirth" type="date" style="height: 23px" required  />
					<span class="result"></span>
           		</div>
				<div class='message' id='memberNameDiv'> ��������� �Է��ϼ���</div>
			</div>
			<div class='clearfix'></div>
			
			<div class='outerDiv'>
				<label for="memberEmail">�̸���</label> 
				<input id="memberEmail" type="email" required  /> 
				<div class='message' id='memberEmailDiv'> �̸����� �Է��ϼ���</div>
			</div>
			<div class='clearfix'></div>
			
			<div class='outerDiv'>
				<label for="memberGender">����</label> 
				<div class="radio">
	                <label>����<input class="memberGenderInput" id="memberGender" type="radio" name="memberGender" value="woman" required  /></label>
	                <label>����<input class="memberGenderInput" id="memberGender" type="radio" name="memberGender" value="man"/></label>
	            	<div class='message' id='memberGenderDiv'> ������ �����ϼ���</div>
	            </div>					
			</div>
			<div class='clearfix'></div>
			<div id='submit' class='outerDiv'>
				<input type="submit" value="�����ϱ�" /> 
			</div>				
		</form>
	</div>
</body>
</html>