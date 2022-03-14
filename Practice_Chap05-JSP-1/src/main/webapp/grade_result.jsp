<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	request.setCharacterEncoding("utf-8");
 	int score = Integer.parseInt(request.getParameter("score"));
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학점 출력</title>
</head>


<body>
	<h1>시험 점수<%=score %></h1>
	<%
		if(score >= 90){
	%>
		<h1>A학점입니다</h1>
	<%
		}
		else if(score >= 80){
	%>
		<h1>B학점입니다</h1>
	<%
		}
		else if(score >= 70){
	%>
		<h1>C학점입니다</h1>
	<%
		}
		else if(score >= 60){
	%>
		<h1>D학점입니다</h1>
	<%
		}
		else {
	%>
		<h1>F학점입니다</h1>
	<%} %>
	<br/>
	<a href ="scoreinput.html"></a>
</body>
</html>