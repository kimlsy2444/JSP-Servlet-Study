<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- core태그 라이브러리를 사용하기 위해서 반드시 선언을 해야한다. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>

<!-- pageContext내장객체를 이용하여 컨텍스트 이름(웹 프로젝트 이름 :Practice_Chap14_EL_JSTL 이런거 ) 
	contextPath에 미리 저장을 해두면 경로를 설정하거나 경로 관련된 부분에 쉽게 적용을 할수가 있다.--> 
<c:set var="contextPath" value="${pageContext.request.contextPath }" scope="application" />




<head>
<meta charset="UTF-8">
<title>JSTL라이브러리 set태그-컨텍스트 이름</title>
</head>
<body>
	<form action="#">
		<p>아이디 : 	<input type="text" 		size = "20"/><br/>
		<p>비밀번호 : 	<input type="password" 	size = "20"/><br/>
		<p><input type="submit" value="로그인"/><br/>
	</form>
	<p>컨텍스트 패스 값 : ${contextPath }
	<!-- 긴 내장 객체의 속성을  사용할 필요가 없이 간단한 변수 이름 컨텍스트 패스를 사용할 수 있다. -->
	<a href="#">회원 가입하기</a>

</body>
</html>