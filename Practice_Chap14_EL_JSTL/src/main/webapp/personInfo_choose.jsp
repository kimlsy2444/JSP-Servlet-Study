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

<c:remove var = "name"/>


<head>
<meta charset="UTF-8">
<title>JSTL라이브러리 if태그</title>
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

	<c:choose>
		<%-- 주석 태그를 옳바르게 사용하자 !는 오류남;; --%>
		
		<%--이름 변수가 null 이거나 빈 문자열인지 체크하는 부분--%>
		<%-- <c:when test="${name == null }"> --%>
		<c:when test="${empty name }">
			<tr align="center">
				<td colspan="5">이름을 입력하세요</td>
			</tr>
		</c:when>
		<c:otherwise>
			<td>${id }</td>
			<td>${pw }</td>
			<td>${name }</td>
			<td>${age }</td>
			<td>${height }</td>
		</c:otherwise>
	</c:choose>
		
	</table>
</body>
</html>