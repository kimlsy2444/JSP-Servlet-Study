<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 내장객체</title>
</head>
<body>
	<form action="innerObjectOk.jsp" method="get">
		<p>아이디 : <input type="text" name = "id">
		<p>비밀 번호 : <input type="password" name = "pw">
		<input type ="submit" value="login"/>
	</form>
	
	<%
		// 각각 내장객체들에게 속성들을 지정하고 있다.
		application.setAttribute("application_name", "application내장객체");
		session.setAttribute("session_name","session내장객체");
		pageContext.setAttribute("page_name","pageContext내장객체");
		request.setAttribute("request_name","request내장객체");	
		
		
	%>
	<!-- pageScope requestScope내장객체의 범위는 현재 페이지만 적용이 된다. -->
	<p> pageScope : ${pageScope.page_name }
	<p> requestScope : ${requestScope.request_name }
</body>
</html>