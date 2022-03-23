<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 결과</title>
</head>
<body>
	<%!
		String  name, id, pw, major, gender, jop;
		String[] hobby;
	%>
	<%
		request.setCharacterEncoding("UTF-8");
		// 각각의 인자값들을 받아오고 있다.
		name = request.getParameter("name");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		major = request.getParameter("major");
		gender = request.getParameter("gender");
		jop = request.getParameter("jop");
		// 다중값이므로 getParameterValues() 이용한다.
		hobby = request.getParameterValues("hobby");
	%>
	<!-- 표현식 이용 출력 -->
	전송받은 이름 : <%= name %><br>
	전송받은 아이디 : <%= id %><br>
	전송받은 비밀번호 : <%= pw %><br>
	전송받은 전공 : <%= major %><br>
	전송받은 성별 : <%= gender %><br>
	전송받은 직업 : <%= jop %><br>
	전송받은 취미 : <%= Arrays.toString(hobby) %><br>
	
</body>
</html>