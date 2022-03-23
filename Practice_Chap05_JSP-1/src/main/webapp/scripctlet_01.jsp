<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트릿-1</title>
</head>
<body>
	<%
		int i = 0;
		while(true){
			i++;
			out.println("2 *" + i + "="+ 2*i +"<br/>");
		
	%>
	=================<br/>
	
	<%
		if( i >=9){
			break;
			}
			
		}
	%>
</body>
</html>