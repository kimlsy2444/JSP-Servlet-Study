<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정규표현식의 결과</title>
</head>
<body>
	<h3> 회원 가입 축하드립니다.반갑습니다. </h3>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");	
		String name = request.getParameter("name");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String email = request.getParameter("email");		
	%>
	<p>아이디 : <%= id %>
	<p>비밀번호 : <%= pw %>
	<p>이름 : <%= name %>
	<p>연락처 <%= phone1%>-<%= phone2%>-<%= phone3%>
	<p>이메일 : <%= email%>	
</body>
</html>