
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 입력값 DB저장하기</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%> <!-- 접속할 DB코드를 페이지 지시자로 가져옴 -->
	<%
		request.setCharacterEncoding("UTF-8");
		String id  = request.getParameter("id");
		String pw  = request.getParameter("pw");
		String username  = request.getParameter("username");
		
		// PreparedStatement객체선언
		PreparedStatement pstmt = null;
		 try{
		// prepareStatement 사용 쿼리문 작성
		String sql = "insert into members values(?,?,?)";
		// Connetion 객체로 부터 PreparedStatement객체를 얻어내는 코드
		// 매개변수값으로 sql문을 주어야 한다.
		pstmt = connection.prepareStatement(sql);
		// reparedStatement객체를 이용하여 각각  ? ? ? 에 해당하는 값들을 지정해주면 된다.
		pstmt.setString(1,id);
		pstmt.setString(2,pw);
		pstmt.setString(3,username);
		
		// 쿼리문을 DB에 날리는 코드, 단 쿼리문을 매개변수로 넣지 않도록 한다.
		// 이미 위에서 쿼리문으로 PreparedStatement 객체가 생성되었다.
		pstmt.executeUpdate();
		out.println("정상적으로 삽입성공");
		 }catch(SQLException e){
				out.println("정상적으로 삽입실패");
				out.println(e.getMessage());
				e.printStackTrace();
		 }finally{
			 // 자원 해제하는 습관 매우 필수 메모리 누수
			 if(pstmt != null) pstmt.close();
			 
			 if(connection != null) connection.close();
		 }
	%>
	<a href ="select_preparestatement.jsp">회원 조회하기</a>
	
</body>
</html>