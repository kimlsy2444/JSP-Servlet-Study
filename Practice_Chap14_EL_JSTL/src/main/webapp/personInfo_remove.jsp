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

<!-- 위에서 저장한 값을 아래에서 remove를 이용하여 변수 값을 삭제 하고있다.  -->
<c:remove var = "age"/>
<c:remove var = "height"/>

<head>
<meta charset="UTF-8">
<title>JSTL라이브러리 set태그</title>
</head>
<body>
	<table border ="1">
		<tr align="center" bgcolor ="yellow">
			<td width = "7%"><b>아이디</b></td>
			<td width = "7%"><b>비밀번호</b></td>
			<td width = "7%"><b>이름</b></td>
			<td width = "7%"><b>나이</b></td>
			<td width = "7%"><b>키</b></td>			
		</tr>
		
			<tr align="center">
			<td>${id}</td>
			<td>${pw}</td>
			<td>${name}</td>
			<!-- 아래의 2개의 값은 출력되지 않을것이다 -->
			<td>${age}</td>
			<td>${height}</td>	
		</tr>
		
	</table>
</body>
</html>