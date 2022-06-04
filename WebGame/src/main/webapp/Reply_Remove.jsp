<%@page import="java.sql.ResultSet"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbconn.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>

<% Connection conn = DBConn.getConnection(); %>
<% 
request.setCharacterEncoding("UTF-8");


String Replynum = request.getParameter("Replynum");

String gameTitle = request.getParameter("gameTitle");


	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from Reply";
	pstmt = conn.prepareStatement(sql);
	
	rs = pstmt.executeQuery();
	
	if(rs.next()){		
		sql = "DELETE FROM Reply WHERE Replynum = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, Replynum);
		pstmt.executeUpdate();
	}
	
	
	
	
 	if(pstmt != null) pstmt.close(); 
	if(conn != null) conn.close();
 	
	String name = URLEncoder.encode(gameTitle,"UTF-8");
  	response.sendRedirect("./GameWeb_Info.jsp?id="+name); 

%>  




