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
	String sql = "insert into GameInfo values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	
	
	String gameNum = null;
	String gameCode = request.getParameter("gameCode");
	String gameTitle = null;
	String gameTeamname = null;
	String gameMember1 = null;
	String gameMember2 = null;
	String gameMember3 = null;
	String gameMember4 = null;
	String gameMember5 = null;
	String gameMember6 = null;
	String gameDescription = null;
	String gameurl = null;
	String gameTitleImage = null;
	String gameImage1 = null;
	String gameImage2 = null;
	String gameImage3 = null;
	String gameImage4 = null;
	String gameImage5 = null;
	
	
	pstmt.setString(1,gameNum);
	pstmt.setString(2,gameCode);
	pstmt.setString(3,gameTitle);
	pstmt.setString(4,gameTeamname);
	pstmt.setString(5,gameMember1);
	pstmt.setString(6,gameMember2);
	pstmt.setString(7,gameMember3);
	pstmt.setString(8,gameMember4);
	pstmt.setString(9,gameMember5);
	pstmt.setString(10,gameMember6);
	pstmt.setString(11,gameDescription);
	pstmt.setString(12,gameurl);
	pstmt.setString(13,gameTitleImage);
	pstmt.setString(14,gameImage1);
	pstmt.setString(15,gameImage2);
	pstmt.setString(16,gameImage3);
	pstmt.setString(17,gameImage4);
	pstmt.setString(18,gameImage5);
	
	pstmt.executeUpdate();
	
 	if(pstmt != null) pstmt.close(); 
 	if(conn != null) conn.close();
 	
 	out.println(gameTitle);
 	
 	response.sendRedirect("Admin_Main.jsp");	
	
%>