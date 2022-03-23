<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인클루드 액션페이지 결과</title>
</head>
<body>
	<h2>inclde_param_result.jsp페이지 입니다.</h2>
	<%
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
	%>
	넘어온 이름 : <%=name %><br/>
	넘어온 나이 : <%=age %><br/>
	
</body>
</html>