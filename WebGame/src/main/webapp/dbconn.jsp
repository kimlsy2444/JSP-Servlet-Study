<%-- <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    					  
<%@ page import="java.sql.Connection"%>

<% 
	Connection conn = null;

	try{
					
		String url = "jdbc:mysql://localhost:3306/WebGameDB";
		String user = "WebGame";
		String password ="1234";
		
		Class.forName("com.mysql.jdbc.Driver"); // 드라이버명
		conn = DriverManager.getConnection(url,user,password); // 연결객체를 얻고 있다.
		System.out.println("데이터베이스 연결이 되었습니다.");
		
	}catch(SQLException e){
		System.out.println("데이터베이스 연결이 실패되었습니다.");
		System.out.println("예외 이유 : ");
		e.printStackTrace();
	}

%> --%>