<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유효성 검사-3</title>
</head>
<script type="text/javascript">

	function checkLogin() {
		var form = document.loginFrm;
		// 아이디의 값이 없다면
		if(form.id.value == ""){
			
			alert("아이디를 입력해주세요.");
			form.id.select();
			form.id.focues(); // id입력창으로 포커스를 준다.
			return;
		}
		// 비밀번호의 값이 없다면
		if(form.pw.value ==""){
			alert("비밀번호를 입력해주세요.");
			form.pw.select();
			form.pw.focues(); // pw입력창으로 포커스를 준다.
			return;
		}
		
		// 아이디의 길이가 4미만이거나 12초과라면
		if(form.id.value.length<4||form.id.value.length>12){
			alert("아이디는 4~12자 이내로 입력해주세요.");
			form.id.select();
			form.id.focues(); // id입력창으로 포커스를 준다.
			return;
		}
		
		// 비밀번호가 4자리 미만이라면
		if(form.pw.value.length<4){
			alert("비밀번호는 4자리 이상으로 입력해주세요");
			form.pw.select();
			form.pw.focues(); // id입력창으로 포커스를 준다.
			return;
		}

		// 위의 유효성 검사를 다 통과하면..
		form.submit();
	}
</script>
<body>
	<form name = "loginFrm" action ="validation_default_3_process3.jsp" method="post">
		<p>아이디 : <input type = "text" name = "id">
		<p>비밀번호 : <input type = "password" name = "pw">
		<p><input type ="button" value="전송" onclick="checkLogin()">
	</form>
</body>
</html>