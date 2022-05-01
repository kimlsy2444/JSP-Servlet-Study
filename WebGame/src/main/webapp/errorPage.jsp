<!-- 페이지 지시자를 이용하여 isErrorPage속성을 true로 설정을 해준다. 설정을 해줘야 exception객체를
창조하여 메세지를 활용 할 수가 있다. -->
<%@ page isErrorPage="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외 페이지</title>
</head>
<body>
	<%-- <%
		// setStatus(200) 정상적인 페이지를 의미한다.
		// 아래와 같이 지정을 해주지 않으면 컨테이너가 500으로 설정으로 하는 경우가 많다.
		// 우리가 설정한 페이지가 아닌 다른 페이지로 이동하기 떄문
		response.setStatus(200);
		response.setCharacterEncoding("UTF-8");
	%>	
	에러발생<br/>
	<%= exception.getMessage() %> --%>
	<%
		response.setStatus(200);
		response.setCharacterEncoding("UTF-8");
	%>
	<h1>죄송합니다 서비스실행중 오류가 발생했습니다.</h1>
	<h1>잠시후 다시 시도해 주세요.</h1>

</body>
</html>