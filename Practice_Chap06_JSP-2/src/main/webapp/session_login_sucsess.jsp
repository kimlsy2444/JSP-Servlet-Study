<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
	<script type="text/javascript">
		alert('로그인 성공');
	</script>	
	<%
		request.setCharacterEncoding("UTF-8");
		Enumeration<String> en = session.getAttributeNames();
		
		while(en.hasMoreElements()){
			String sName = en.nextElement();
			String sValue = (String)session.getAttribute(sName);
			
			if(sValue.equals("김연아")){
				out.println(sValue+"님 안녕하세요!"+"<br/>");
				
			}
		}
	%>
	<a href="session_logout.jsp">로그아웃</a>
	
		
		
</body>
</html>