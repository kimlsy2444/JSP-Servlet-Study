<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
    
	/* String name = request.getParameter("name");
	String score = request.getParameter("score"); */
	
	String name = (String)pageContext.getSession().getAttribute("name");
	String score = (String)pageContext.getSession().getAttribute("score");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>불합격</title>
</head>
<body>
	<h1> <%=name %>님은 <%=score %>점으로 불합격하셨습니다. </h1>
	<a href="score.html">점수입력창으로이동</a>
</body>
</html>