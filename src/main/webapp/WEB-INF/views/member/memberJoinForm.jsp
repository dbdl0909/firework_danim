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
	    	//��� �׸� �ʼ� �Է�
	    	if ($("#memberId").val() == "") {
                alert("���̵� �� �Է��ϼ���!");
                $("#memberId").focus();
	    	} else if ($("#memberPassword1").val() == "") {
	    		alert("�н����带 �� �Է��ϼ���!");
                $("#memberPassword1").focus();
	    	} else if ($("#memberPassword2").val() == "") {
	    		alert("�н����带 �� ���Է��ϼ���!");
                $("#memberPassword2").focus();
	    	} else if ($("#memberName").val() == "") {
	    		alert("�г����� �� �Է��ϼ���!");
                $("#memberName").focus();
	    	} else if ($("#memberBirth").val() == "") {
	    		alert("��������� �� �Է��ϼ���!");
                $("#memberBirth").focus();
	    	} else if ($("#memberBirth").val() == "") {
	    		alert("��������� �� �Է��ϼ���!");
                $("#memberBirth").focus();
	    	} else if ($("#memberGender").val() == "") {
	    		alert("������ �� �����ϼ���!");
                $("#memberGender").focus();
	    	} else if ($("#memberEmail").val() == "") {
	    		alert("�̸����� �� �Է��ϼ���!");
                $("#memberEmail").focus();
              //���̵� �˻�
				//ù���ڴ� ������ �ҹ���, 5~15��, Ư����ȣ ���Ұ�(-,_ ����)
				//Ư����ȣ(-,_)������ ���Ұ�
				// + ���̵� �ߺ�Ȯ��
	    	} else if ($("memberId").val().length >4 && $("memberId").val().length <16){
	    		
	    	} else if ($("#memberPassword1").val() != $("#memberPassword2").val()) {
                alert("��й�ȣ�� ��й�ȣ Ȯ���� ��ġ�����ʽ��ϴ�.");
                $("#memberPassword1").val("");
                $("#memberPassword2").val("");
                $("#memberPassword1").focus();
	    	//���̵� �˻�
				//ù���ڴ� ������ �ҹ���, 5~15��, Ư����ȣ ���Ұ�(-,_ ����)
				//Ư����ȣ(-,_)������ ���Ұ�
				// + ���̵� �ߺ�Ȯ��
	    }
/* 	function validate() {
		console.log('�ȳ�');
		//���Խ� => ��ȿ���˻�
			//��� �ʼ� �Է�
		var memberId = document.getElementById("memberId")						//���̵�
		var memberPassword1 = document.getElementById("memberPassword1");		//�н�����1
		var memberPassword2 = document.getElementById("memberPassword2");		//�н�����2
		var memberName = document.getElementById("memberName");					//�г���
		var memberBirth = document.getElementById("memberBirth");				//�������
		var memberGender = document.getElementById("memberGender");				//����
		var memberEmail = document.getElementById("memberEmail");				//�̸���
		
		//���̵� �˻�
			//ù���ڴ� ������ �ҹ���, 5~15��, Ư����ȣ ���Ұ�(-,_ ����)
			//Ư����ȣ(-,_)������ ���Ұ�
			// + ���̵� �ߺ�Ȯ��
			// \d : [0-9]�� ����.
		if (!idChk(/^[a-z]{1}[a-z\d_-]{5,15}$/, memberId, "�߸��� ������ ID�Դϴ�."))
			return false;
	    if (!idChk(/[\d]/, userid, "�߸��� ������ ID�Դϴ�."))
	    	return false;
	    
	    //�н����� �˻�
	    	//6~16��, ����, ����, Ư������ ����
			//���ڸ����δ� ���Ұ�
			//�빮��, �ҹ��� ����
	    if (!passChk.test(/^(?=.*[a-zA-Z0-9])(?=.*[^a-zA-Z0-9)(?=.*[0-9]).{6,16}$/, memberPassword1, "��й�ȣ�� Ȯ�����ּ���."))
	    	return false;
		if (pw.length < 6 || pw.length > 16)
			return false;
		//if (!pwChk(memberPassword1, memberPassword2, "��й�ȣ�� �ٸ��ϴ�."));		//�н�����1, 2 �������� Ȯ��
		if(memberPassword1.value!=memberPassword2.value) {alert("��й�ȣ�� �ٸ��ϴ�.");}	//�н�����1, 2 �������� Ȯ��
		
		//�г��� �˻�
			//2~10���� ����, �ѱ�, ���ڸ� ����
		if(!nameChk(/[a-zA-Z0-9]{2,10}$/, memberName, "2~10���� ����, ���ڸ� �����մϴ�."))
			return false;
		
		//������� �˻�
			//1916~2016
		if(data.search(/[12][0-9]{3}-[0-9]{2}-[0-9]{2}/, memberBirth, "��������� Ȯ���ϼ���") == -1)
					//1000~2000, *000~*999(��) / 00~99(��) / 00~99(��)
	        return false;
			var _year = data.substr(0,4);
			var _month= data.substr(5,2);
			var _day = data.substr(8,2);
			return isValidDate(_year, _month, _day);
		
		//�̸��� �˻�
			//�߼� �� ����
			// + �̸��� �ߺ��˻�		
		if(!emailChk(/^[\w-]{4,}@[\w-]+(\.\w+){1,3}$/, memberEmail, "�̸��� ������ �߸��Ǿ����ϴ�."))
			return false;
		
	} */
	</script>
		
</head>
<body>
	<div id="twitter">
		<form action="" method="post" onsubmit="return validate();"> 
			<div id='memberId' class='outerDiv'>
				<label for="memberId">���̵�</label> 
				<input type="text" name="memberId" required /> 
				<div class='message' id='memberIdDiv'> 5~15���� �ҹ��ڿ� ����, _, -�� ��� �����մϴ�</div>
			</div>
			<div class='clearfix'></div>
			
			<div id='memberPassword1' class='outerDiv'>
				<label for="memberPassword1">��й�ȣ</label> 
				<input type="password" name="memberPassword1" required /> 
				<div class='message' id='memberPassword1Div'> 6~16�� ��ҹ���, ����, Ư�����ڸ� ����ϼ���</div>
			</div>
			<div class='clearfix'></div>
			
			<div id='memberPassword2' class='outerDiv'>
				<label for="memberPassword2">��й�ȣ Ȯ��</label> 
				<input type="password" name="memberPassword2" required /> 
				<div class='message' id='memberPassword2Div'> ��й�ȣ�� �ٽ� �� �� �Է��ϼ���</div>
			</div>
			<div class='clearfix'></div>
			
			<div id='memberName' class='outerDiv'>
				<label for="memberName">�г���</label> 
				<input type="text" name="memberName" required  /> 
				<div class='message' id='memberNameDiv'> 2~10���� ����, ���ڸ� �����մϴ�</div>
			</div>
			<div class='clearfix'></div>
			
			<div id='memberBirth' class='outerDiv'>
				<label for="memberBirth">�������</label> 
				<div>
	                <input type="date" class="form-control" id="memberBirth" style="height: 23px" required  />
					<span class="result"></span>
           		</div>
				<div class='message' id='memberNameDiv'> ��������� �Է��ϼ���</div>
			</div>
			<div class='clearfix'></div>
			
			<div id='memberEmail' class='outerDiv'>
				<label for="memberEmail">�̸���</label> 
				<input type="email" name="memberEmail" required  /> 
				<div class='message' id='memberEmailDiv'> �̸����� �Է��ϼ���</div>
			</div>
			<div class='clearfix'></div>
			
			<div id='memberGender' class='outerDiv'>
				<label for="memberGender">����</label> 
				<div class="radio">
	                <label>����<input class="memberGenderInput" type="radio" name="memberGender" value="woman" required  /></label>
	                <label>����<input class="memberGenderInput" type="radio" name="memberGender" value="man"/></label>
	            	<div class='message' id='memberGenderDiv'> ������ �����ϼ���</div>
	            </div>					
			</div>
			<div class='clearfix'></div>
			<div id='submit' class='outerDiv'>
				<input type="button" id="memberInsertButton" value="�����ϱ�" /> 
			</div>				
		</form>
		<div class="clearfix"></div>
	</div>
</body>
</html>