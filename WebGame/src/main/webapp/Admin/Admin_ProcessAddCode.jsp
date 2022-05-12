<%@page import="dbconn.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%@ include file = "../dbconn.jsp" %> --%>
<% Connection conn = DBConn.getConnection(); %>
    
<% 

	PreparedStatement pstmt = null;
	String sql = "insert into gameinfo values(?,?,?,?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);

	String gameCode = request.getParameter("gameCode");
	String gameTitle = null;
	String gameTeamname = null;
	String gameMember1 = null;
	String gameMember2 = null;
	String gameMember3 = null;
	String gameDescription = null;
	String gameurl = null;
	String gameTitleImage = null;
	String gameImage1 = null;
	String gameImage2 = null;
	String gameImage3 = null;
	
	
	pstmt.setString(1,gameCode);
	pstmt.setString(2,gameTitle);
	pstmt.setString(3,gameTeamname);
	pstmt.setString(4,gameMember1);
	pstmt.setString(5,gameMember2);
	pstmt.setString(6,gameMember3);
	pstmt.setString(7,gameDescription);
	pstmt.setString(8,gameurl);
	pstmt.setString(9,gameTitleImage);
	pstmt.setString(10,gameImage1);
	pstmt.setString(11,gameImage2);
	pstmt.setString(12,gameImage3);
	
	pstmt.executeUpdate();
	
 	if(pstmt != null) pstmt.close(); 
 	if(conn != null) conn.close();
 	
 	out.println(gameTitle);
 	
 	response.sendRedirect("Admin_Main.jsp");	
	
%>