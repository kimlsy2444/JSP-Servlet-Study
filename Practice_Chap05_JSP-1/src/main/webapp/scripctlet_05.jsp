<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언문, 표현식-2</title>
</head>
<body>
	<%!
		public int sum(){
			int total = 0;
			for(int i = 1; i<=100;i++){
				total += i;
			}
			return total;
		}
	%>
	<% 
		String str = "1부터 100까지의 합";
	%>
	<h2><%=str %>은<b><%=sum() %></b>입니다.</h2>
	<br/>
	<h2><%=str%>에 3을 곱하면 <b><%=sum()*3 %></b>가 됩니다.</h2>
	<h2><%=str%>에 1000을 나누면 <b><%=sum()/1000.0%></b>가 됩니다.</h2>
	
</body>
</html>