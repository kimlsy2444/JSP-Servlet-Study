<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
	<%
		Enumeration<String> en = session.getAttributeNames();
	
		while(en.hasMoreElements()){
			String sName = en.nextElement();
			String sValue = (String)session.getAttribute(sName);
			
			
			if(sValue.equals("김연아")){
				out.println(sValue+"님이 로그아웃 하셨습니다"+"<br/>");
				session.removeAttribute(sName);
			}
		}
	%>
	<br/><br/>
	<a href="sessionTest.jsp">세션 확인</a>
</body>
</html>