<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유효성 검사-1</title>
</head>
<script type="text/javascript">
	// document : 윈도우화면, loginFrm : doucment의 구성요소 중 name이 loginFrm인 폼
	// id : 폼안에 id값, pw : 폼안에 pw 값, value는 값을 의미한다.
	function printForm() {
		alert("아이디 : " + document.loginFrm.id.value+"\n"+
			  "비밀 번호 : " +document.loginFrm.pw.value);
	}
</script>
<body>
	<form name = "loginFrm" action ="#" method="post">
		<p>아이디 : <input type = "text" name = "id">
		<p>비밀번호 : <input type = "password" name = "pw">
		<!-- submit타입에서 onclick속성은 클릭을 했을 때, 매핑 되어있는 printForm()를 호출한다 -->
		<p><input type ="submit" value="전송" onclick="printForm()">
	</form>
</body>
</html>