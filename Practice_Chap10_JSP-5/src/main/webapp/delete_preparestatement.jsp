<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB데이터 삭제</title>
</head>
<body>
<%@ include file="dbconn.jsp"%> <!-- 접속할 DB코드를 페이지 지시자로 가져옴 -->
	<%
		request.setCharacterEncoding("UTF-8");
	
		String id  = request.getParameter("id");
		String pw  = request.getParameter("pw");
		String username  = request.getParameter("username");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		
		try{
			String sql = "select id, pw from members where id = ?";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			
		
			
			if(rs.next()){
				String rId = rs.getString("id");
				String rPw = rs.getString("pw");
				
				// id와 pw 일치하는지 확인한 후에 삭제를 진행한다.
				if(id.equals(rId) && pw.equals(rPw)){
					sql = "delete from members where  id = ? and pw = ?";
					
					 if(pstmt != null) 
						pstmt.close(); 
					
					pstmt = connection.prepareStatement(sql);
					pstmt.setString(1,id);
					pstmt.setString(2,pw);
					pstmt.executeUpdate();
					out.println(rId + "님의 정보가 삭제되었습니다");
				}
				else {
					out.println("아이디 그리고 비밀번호를 확인해주세요");
				}
			}
			else {
				out.println("삭제실패");
				out.println("members테이블에 일치하는 아이디가 없습니다.");
			}
			
		}catch(SQLException e){
			out.println("SQLException : " +e.getMessage());
			e.printStackTrace();

		}finally{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(connection != null) connection.close();
		}
	
	%>
	<br/>
	<a href="select_preparestatement.jsp">회원리스트 보기</a> &nbsp;&nbsp;&nbsp;
	<a href="update_form_preparestatement.jsp">회원정보 수정으로 가기</a> &nbsp;&nbsp;&nbsp;
	<a href="insert_form_preparestatement.jsp">회원 가입창으로 가기</a> &nbsp;&nbsp;&nbsp;
</body>
</html>