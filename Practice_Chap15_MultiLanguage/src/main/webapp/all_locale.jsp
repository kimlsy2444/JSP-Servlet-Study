<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 Locale인자값 출력하기</title>
</head>
<body>
	<%
	
		for(Locale locale : Locale.getAvailableLocales()){
	%>
		<p>언어 코드 : <%= locale.getLanguage() %>
		<p>국가 코드 : <%= locale.getCountry() %>
		<p> 국가명 :  <%= locale.getDisplayCountry() %>
		<p>언어,국가: <%= locale.getDisplayName() %>
	
	
	<% } %>
	
	<p>총 Locale수 : <%= Locale.getAvailableLocales().length %>
</body>
</html>