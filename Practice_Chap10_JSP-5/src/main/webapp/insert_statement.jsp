
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert 실습</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%> <!-- 접속할 DB코드를 페이지 지시자로 가져옴 -->
	<%
		request.setCharacterEncoding("UTF-8");
	
		String id  = request.getParameter("id");
		String pw  = request.getParameter("pw");
		String username  = request.getParameter("username");
		
		Statement stmt = null;
		 try{
		//개극혐 쿼리문
		String sql = "insert into members(id,pw,username) values('"+ id + "','"+pw+"','"+username+"')";
		// connection객체로 부터 Statement객체를 얻어내는 코드
		stmt = connection.createStatement();
		// 쿼리문을 DB에 날리는 코드
		stmt.executeUpdate(sql);
		out.println("정상적으로 삽입성공");
		 }catch(SQLException e){
				out.println("정상적으로 삽입실패");
				out.println(e.getMessage());
				e.printStackTrace();
		 }finally{
			 // 자원 해제하는 습관 매우 필수 메모리 누수
			 if(stmt != null) stmt.close();
			 
			 if(connection != null) connection.close();
		 }
	%>
	<a href ="select_statement.jsp">회원 조회하기</a>
	
</body>
</html>