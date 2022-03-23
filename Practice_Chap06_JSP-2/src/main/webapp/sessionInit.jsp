<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 만들기</title>
</head>
<body>
	<%
		// 스크립트릿으로 내부객체인 session객체를 이용하여 값을 설정한다.
		// 현재 이 jsp 파일이 서버에 요청을 하게 되면 컨테이너가 서블릿 변환 되면서 
		// session객체가 자동으로 생성되면서 컴파일이 이루어진다
		
		// 세션의 속성을 지정하는 코드
		session.setAttribute("abcde",12345);
		session.setAttribute("feed","feed");
	%>
	<a href="sessionGet.jsp">세션값 확인 이동</a>
</body>
</html>