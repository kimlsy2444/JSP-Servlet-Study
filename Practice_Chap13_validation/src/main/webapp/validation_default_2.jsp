<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유효성 검사-2</title>
</head>
<script type="text/javascript">

	function checkLogin() {
		var form = document.loginFrm;
		// 아이디의 값이 없다면
		if(form.id.value == ""){
			alert("아이디를 입력해주세요.");
			form.id.focues(); // id입력창으로 포커스를 준다.
			return false;
		}
		else if(form.pw.value ==""){
			alert("비밀번호를 입력해주세요.");
			form.pw.focues(); // id입력창으로 포커스를 준다.
			return false;
		}
		// 위의 유효성 검사를 다 통과하면..
		form.submit();
	}
</script>
<body>
	<form name = "loginFrm" action ="validation_default_2_process.jsp" method="post">
		<p>아이디 : <input type = "text" name = "id">
		<p>비밀번호 : <input type = "password" name = "pw">
		<!-- submit타입에서 onclick속성은 클릭을 했을 때, 매핑 되어있는 checkLogin()를 호출한다 -->
		<!-- submit타입에서 onclick을 누르면 경고창을 띄우고 페이지 이동이 일어난다 -->
		<!-- button타입에서 onclick을 누르면 경고창을 띄우고 페이지 이동이 안일어난다 -->
		<p><input type ="button" value="전송" onclick="checkLogin()">
	</form>
</body>
</html>