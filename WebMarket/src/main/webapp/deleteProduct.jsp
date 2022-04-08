<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %> <!-- db를 연동하는 부분 -->
<% 

	//어떤 제품을 편집할지 id값이 넘어오는 것을 받고 있다.
	String productId = request.getParameter("id");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from product";
	//Connection객체로 부터 쿼리문를 주고 PreparedStatement를 얻고 있다.
	pstmt = conn.prepareStatement(sql);
	//쿼리문의 결과를 받아오고 있다.
	rs = pstmt.executeQuery();
	
	//가져온 결과가 있다면...
	if(rs.next()){		
		sql = "delete from product where p_id = ?";
		System.out.println("상품아이디 : " + productId);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		pstmt.executeUpdate();
	}
	else{
		out.println("일치하는 상품이 없습니다.");
	}
	
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	
	response.sendRedirect("editProduct.jsp?edit=delete");
%>