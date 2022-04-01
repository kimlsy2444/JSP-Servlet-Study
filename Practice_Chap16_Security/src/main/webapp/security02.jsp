<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증처리 페이지(Security)</title>
</head>
<body>
	<!-- 인증된 사용자명을 가져오기 위해서 아래와 같이 코드를 작성함 -->
	<p><b>사용자명 : </b> <%= request.getRemoteUser() %>
	<!-- 인증 방법이 어떤 건지 가져오는 코드 -->
	<p><b>인증방법 : </b> <%= request.getAuthType() %>
	
	<p><b>인증한 사용자명이 역할명 "tomcat"에 속하는 사용자인가? <%= request.isUserInRole("tomcat") %></b>
	<p><b>인증한 사용자명이 역할명 "role1"에 속하는 사용자인가? <%= request.isUserInRole("role1") %></b>
	<p><b>프로토콜이 무엇인가요?<%= request.getProtocol() %></b>
	<p><b>HTTPS요청으로 요청이 들어 왔나요?<%= request.isSecure() %></b>
</body>
</html>