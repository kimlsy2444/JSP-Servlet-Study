<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
	<%
		// 페이지 모듈화를 위해서 연결부분을 따로 파일로 만들었다.
		Connection connection = null;
		
		String url			= "jdbc:mysql://localhost:3306/testdb";
		String user 		= "root";
		String password 	= "1234";
		String driver 		= "com.mysql.jdbc.Driver";
		
		Class.forName(driver); 
		connection = DriverManager.getConnection(url, user, password);
	
	%>