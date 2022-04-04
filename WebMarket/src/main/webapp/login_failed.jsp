<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 실패</title>
</head>
<body>
	<!-- 로그인 인증실패를 하면 eroor값이 1로  설정되어 다시 로그인 페이지로 이동을 한다. -->
	<%response.sendRedirect("login.jsp?error=1"); %>
<%-- 	<% response.sendRedirect("login.jsp?error=1");%> --%>
</body>
</html>