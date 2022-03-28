<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정규표현식 이용</title>
</head>
<script type="text/javascript">	 
	
	function checkMember() {
		/* 각각의 정규표현식으로 작성함 */		
		var regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; /* 숫자로 시작하면 안된다. */
		var regExpName = /^[가-힣]*$/;   /* 한글만 받겠다. */
		var regExpPasswd = /^[0-9]*$/;  /* 비밀번호는 숫자로만 받겠다. */
		var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;
		var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		/* form태그 내에 있는 값들을 DOM객체형의 멤버로 변수에 할당함 */
		var form = document.Member;
		var id = form.id.value;
		var pw = form.pw.value;
		var name = form.name.value;
		var phone = form.phone1.value + "-" + form.phone2.value + "-" + form.phone3.value;
		var email = form.email.value;
		
		if(!regExpId.test(id)){
			alert("아이디는 문자로 시작해 주세요.")
			return;
		}
		
		if(!regExpPasswd.test(pw)){
			alert("비밀번호는 숫자로만 입력해 주세요.")
			return;
		}
		
		if(!regExpName.test(name)){
			alert("이름은 한글만으로 입력해 주세요.")
			return;
		}
		
		if(!regExpPhone.test(phone)){
			alert("연락처 입력을 확인해 주세요.")
			return;
		}
		
		if(!regExpEmail.test(email)){
			alert("이메일 입력을 확인해 주세요.")
			return;
		}		
		form.submit();
	}	
</script>
<body>
	<h3>회원 가입</h3>
	<form name="Member" action="validation_regular_process.jsp" method="post">
		<p>아이디 :  <input type="text" name="id">
		<p>비밀번호 : <input type="password" name="pw">
		<p>이름 :    <input type="text" name="name">
		<p>연락처 : <select name="phone1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>	
				</select> - <input type="text" maxlength="4" size="4" name="phone2"> -  
						    <input type="text" maxlength="4" size="4" name="phone3">
		<p>이메일 :    <input type="text" name="email" >   
		<p><input type="button" value="가입하기" onclick="checkMember()">	
	</form>
</body>
</html>