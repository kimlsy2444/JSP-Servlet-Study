<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- core태그 라이브러리를 사용하기 위해서 반드시 선언을 해야한다. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>

<!-- 코어 태그 중에 set(변수값 저장)을 이용하여 var는 변수 이름 ,value는 변수에 저장되는 값, scope은 범위 --> 
<c:set var="id" 	value="lee" 			scope="page" />
<c:set var="pw" 	value="1234"		 	scope="page" />
<!-- 아래 변수값들은 el 태그를 이용하여 저장하고 있다.  -->
<c:set var="name" 	value="${'이준성'}"		scope="page" />
<c:set var="age" 	value="${26}" 			scope="page" />
<c:set var="height" value="${165}" 			scope="page" />


<head>
<meta charset="UTF-8">
<title>JSTL라이브러리 choose태그</title>
</head>
<body>

	<c:if test="${true }">
		<h2>항상 참입니다.</h2>
	</c:if>
	
	<c:if test="${11==11 }">
		<h2>두 값은 같습니다.</h2>
	</c:if>
	
	<c:if test="${11!=21 }">
		<h2>두 값은 틀립니다.</h2>
	</c:if>
	
	<c:if test="${(id == 'lee') && (name == '이준성') }">
		<h2>아이디는 ${id }이고 ${name }입니다.</h2>
	</c:if>

	<c:if test="${(age == 26) }">
		<h2>나이는 ${age }입니다.</h2>
	</c:if>
	
	<c:if test="${(height > 160) }">
		<h2>${name }의 키 160보다 큰 ${height }입니다.</h2>
	</c:if>
	
</body>
</html>