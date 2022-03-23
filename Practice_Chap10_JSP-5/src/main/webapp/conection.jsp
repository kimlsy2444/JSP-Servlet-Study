<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB연결 테스트</title>
</head>
<body>
	<%
		Connection connection = null;
		
		// mysql 서버에 접속하기 위한 경로를 설정함 (jdbc:mysql -> 프로토콜, //localhost -> 도메인)
		// 3306 -> vhxmqjsgh , testdb-> 접속할(db명)
		String url	= "jdbc:mysql://localhost:3306/testdb";
		String id 	= "root";
		String pw 	= "1234";
		String driver = "com.mysql.jdbc.Driver";
		
		try{
		// 드라이버명을 주고 동적객체를 생성한다. 이 과정을 지나면 비로소 driver가 DrivaerManger에 등록이 되어
		// 연결 객체를 얻을 수 있다.
		Class.forName(driver); 
		connection = DriverManager.getConnection(url, id, pw);
		out.println("데이터 베이스 연결성공");
		}catch(Exception e){
			out.println("데이터 베이스 연결실패<br/>");
			out.println(e.getMessage()); // 웹페이지 출력
			e.printStackTrace();	// zhsthf cnffur
		}finally {
			if(connection != null){
				connection.close();
			}
		}
	%>
</body>
</html>