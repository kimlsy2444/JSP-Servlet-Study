<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "dbconn.jsp" %>
    
<% 
request.setCharacterEncoding("utf-8");
String filename = "";
String realFolder = "C:\\upload"; 
String savePath = "D:/JSP-Servlet작업/WebGame/src/main/webapp/images";



int maxSize = 10 * 1024 * 1024; //최대 업로드 크기(10M)
String encType = "utf-8";  //인코딩 유형
	

MultipartRequest multi = new MultipartRequest(request, savePath, maxSize,
        encType);



	PreparedStatement pstmt = null;
	String sql = "insert into gameinfo values(?,?,?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);

	
	String gameTeamname = null;
	String gameMember1 = null;
	String gameMember2 = null;
	String gameMember3 = multi.getParameter("dd");
	String gameTitle = multi.getParameter("id");
	
	String gameDescription = null;
	String gameurl = null;
	String gameTitleImage = null;
	String gameImage1 = null;
	String gameImage2 = null;
	String gameImage3 = null;
	
	pstmt.setString(1,gameTeamname);
	pstmt.setString(2,gameMember1);
	pstmt.setString(3,gameMember2);
	pstmt.setString(4,gameMember3);
	pstmt.setString(5,gameTitle);
	pstmt.setString(6,gameDescription);
	pstmt.setString(7,gameurl);
	pstmt.setString(8,gameTitleImage);
	pstmt.setString(9,gameImage1);
	pstmt.setString(10,gameImage2);
	pstmt.setString(11,gameImage3);


	pstmt.executeUpdate();
	
 	if(pstmt != null) pstmt.close(); 
 	if(conn != null) conn.close();
 	
 	out.println(gameTitle);
	// 클라이언트가 입력한 회원정보를 DTO 객체에 저장하느 ㄴ코드

	
	
	// ArrayList에 새로운 멤버를 추가하고 있다.
	
%>