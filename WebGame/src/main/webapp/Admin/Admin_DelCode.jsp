<%@page import="dbconn.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%@ include file = "../dbconn.jsp" %> --%>
<% Connection conn = DBConn.getConnection(); %>


<% 
	String gameCode = request.getParameter("gameCode");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from GameInfo";
	pstmt = conn.prepareStatement(sql);
	
	rs = pstmt.executeQuery();
	
	if(rs.next()){		
		sql = "delete from GameInfo where gameCode = ?";
		System.out.println("게임코드 : " + gameCode);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, gameCode);
		pstmt.executeUpdate();
	}
	else{
		out.println("일치하는 상품이 없습니다.");
	}
	
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	
 	response.sendRedirect("Admin_Main.jsp");	
	
%>