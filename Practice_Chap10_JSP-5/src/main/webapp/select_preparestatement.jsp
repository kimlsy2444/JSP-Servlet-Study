<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB SELECT 결과-PrepareStatement</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%> <!-- 접속할 DB코드를 페이지 지시자로 가져옴 -->
	
	<table border="1">
		<tr>
			<th width="300" align="center">아이디</th>
			<th width="300" align="center">비밀번호</th>
			<th width="300" align="center">이름</th>
		</tr>
		<%
			ResultSet rs = null; // select한 결과를 받아오는 객체
			PreparedStatement pstmt =null;
			
			try{
				String sql = "select * from members";
				pstmt = connection.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				// 가져올 행이 있는지 확인
				while(rs.next()){
					// 해당하는 행의 컬럼값들을 각각 저장하고 있다.
					String id = rs.getString("id");
					String pw = rs.getString("pw");
					String username = rs.getString("username");
				%>
		<tr>
			<td width="300" align="center"><%=id %></td>
			<td width="300" align="center"><%=pw %></td>
			<td width="300" align="center"><%=username %></td>
		</tr>
		<%
		}
		
		
			}catch(SQLException e){
				out.println("mebers테이블 select오류 발생");
				out.println("SQLException : " + e.getMessage());

			}finally{
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(connection != null) connection.close();
			}
		%>
	</table>
	<a href ="insert_form_preparestatement.jsp">회원 가입창 으로 이동</a>
</body>
</html>