<%@page import="java.io.File"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.GameInfo"%>
<%@ page import="dao.GameInfoRepository"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
    
<%@ include file = "dbconn.jsp" %>

    
<%

	request.setCharacterEncoding("utf-8");
	// 사용자가 업로드한 이미지 부분을 저장을 하고 있다.
	// String realFolder = "C:\\upload";
	String realFolder = "D:/JSP-Servlet작업/WebGame/src/main/webapp/resources/images";
						
	int maxSize = 10 * 1024 * 1024; // 최대 업로드 크기 (10m)
	String encType = "utf-8"; // 인코딩 유형
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, 
							 maxSize,encType);  
	
	
	
	String gameTitle = multi.getParameter("gameTitle");
	String gameTrailer = multi.getParameter("gameTrailer");
	String gameDescription = multi.getParameter("gameDescription");
	String gameurl = multi.getParameter("gameurl");
	String gameTitleImage = "";
/* 	String gameTitleImage = multi.getParameter("gameTitleImage"); */
	String gameImage = multi.getParameter("gameImage");
	
	
	
	Enumeration files = multi.getFileNames(); 
	String fname = (String)files.nextElement(); 
	String fileName = multi.getFilesystemName(fname); 
		

	gameTitleImage = multi.getParameter(multi.getFilesystemName(fname));

 	
	
 	PreparedStatement pstmt = null;
 	String sql = "insert into gameinfo values(?,?,?,?,?,?)";
 	pstmt = conn.prepareStatement(sql);
 	
 	
 	pstmt.setString(1,gameTitle);
 	pstmt.setString(2,gameTrailer);
 	pstmt.setString(3,gameDescription);
 	pstmt.setString(4,fileName);
 	pstmt.setString(5,gameImage);
 	pstmt.setString(6,gameurl);

	
 	pstmt.executeUpdate();
 	
 	// 자원 해제
 	if(pstmt != null) pstmt.close();
 	if(conn != null) conn.close();
 	
 	response.sendRedirect("GameWeb_Main.jsp");
%>




