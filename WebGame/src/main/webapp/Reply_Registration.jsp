<%@page import="java.sql.ResultSet"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbconn.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>

<% Connection conn = DBConn.getConnection(); %>
<% 

	PreparedStatement pstmt = null;
	String sql = "insert into Reply values(?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);

	/* String gameCode = request.getParameter("gameCode"); */
	String Replynum = null;
	String gameNum = request.getParameter("gameNum");
	String gameTitle = request.getParameter("gameTitle");
	String replyId = request.getParameter("replyId");
	String replyPw = request.getParameter("replyPw");
	String replyComment = request.getParameter("replyComment");

	
	
	
	pstmt.setString(1,Replynum);
	pstmt.setString(2,gameNum);
	pstmt.setString(3,gameTitle);
	pstmt.setString(4,replyId);
	pstmt.setString(5,replyPw);
	pstmt.setString(6,replyComment);


	pstmt.executeUpdate();

 	if(pstmt != null) pstmt.close(); 
	if(conn != null) conn.close();
 	
	String name = URLEncoder.encode(gameTitle,"UTF-8");
  	response.sendRedirect("./GameWeb_Info.jsp?id="+name); 
%>  


