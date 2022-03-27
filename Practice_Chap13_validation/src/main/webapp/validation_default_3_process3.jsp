<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유효성 검사-3 결과</title>
</head>
<body>
	<h3> 입력에 성공하였습니다. 반갑습니다.</h3>
	
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	%>
	<p>아이디 : <%= id %>
	<p>비밀번호 : <%= pw %>
</body>
</html>