<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼인증</title>
</head>
<body>
	<!-- 로그인 인증처리를 위해서 아래와 같이 폼 태그를 작성하였다 -->
	<!-- 폼의 action을 j_security_cheak, 사용자명과 비밀번호도 역시 name 에 각각 설정을 했다. -->
	<form name="loginForm" action="j_security_check" method="post">
		<p><b>사용자명 : </b> <input type="text" 	 name="j_username" />
		<p><b>비밀번호 : </b> <input type="password" name="j_password" />
		<p>                   <input type="submit" value="전송" />
	</form>
</body>
</html>