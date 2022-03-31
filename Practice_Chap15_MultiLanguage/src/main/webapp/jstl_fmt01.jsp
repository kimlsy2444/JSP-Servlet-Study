<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- fmt태그 라이브러리를 사용하기 위해서 페이지 지시자를 통하여 uri를 설정함 -->
<%@ taglib prefix="fmt"  uri = "http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다국어처리 -fmt태그01(로케일)</title>
</head>
<body>
	<p>--------------------- 한글 로케일 ---------------------</p>
	<!--  가져올 번들을 resourceBundle변수에 저장함 -->
	<fmt:setBundle basename="bundle.myBundle_ko"  var ="resourceBundle"/>
	<p>제목 : <fmt:message key="title" bundle ="${resourceBundle}"/> 
	<!-- username의 키를 주면 value값 관리자를 리턴하는데 그값을 user변수에 저장을 하고 있다. -->
	<p> <fmt:message key="username" var = "user" bundle ="${resourceBundle}"/> 
	이름 : ${user }
	<p>비밀번호 :  <fmt:message key="password"  bundle ="${resourceBundle}"/> 
	
	
	
	<p>--------------------- 영문 로케일 ---------------------</p>
	<!-- 로케일 지정함 -->
	<fmt:setLocale value="en"/>
	<fmt:setBundle basename="bundle.myBundle"  var ="resourceBundle"/>
	<p>제목 : <fmt:message key="title" bundle ="${resourceBundle}"/> 
	<!-- username의 키를 주면 value값 admin을 리턴하는데 그값을 user변수에 저장을 하고 있다. -->
	<p> <fmt:message key="username" var = "user" bundle ="${resourceBundle}"/> 
	이름 : ${user }
	<p>비밀번호 :  <fmt:message key="password"  bundle ="${resourceBundle}"/> 
</body>
</html>