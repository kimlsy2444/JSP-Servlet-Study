<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>

<%@page import="java.util.*" %>
<%@page import="java.io.File"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.GameInfo"%>
<%@ page import="dao.GameInfoRepository"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
    
<%@ include file = "dbconn.jsp" %>
<script src="./resources/js/addinputbox.js"></script>
    
<%
	
	request.setCharacterEncoding("utf-8");
	String realPath = "";
	String savePath = "./images";
	String savePath1 = "D:/JSP-Servlet작업/WebGame/src/main/webapp/images";

	String type = "utf-8";
	int maxSize = 100*1024*1024; // 10mb
	ServletContext context = request.getServletContext();
	realPath = context.getRealPath(savePath); 
	int i = 1;
	int j = 0;
	int k = 0;


	PreparedStatement pstmt = null;
 	String sql = "insert into gameinfo values(?,?,?,?,?,?,?,?,?,?,?)";
 	pstmt = conn.prepareStatement(sql);
	
	String[] gametxt = new String[7];
	String[] gameimg = new String[4]; 
 	
	
	String tmp1 = null;
    String tmp2 = null;
    
    String gameTitle = "";
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


	pstmt.setString(1,gameTitle);
 	pstmt.setString(2,gameTeamname);
	pstmt.setString(3,gameMember1);
	pstmt.setString(4,gameMember2);
	pstmt.setString(5,gameMember3);
	pstmt.setString(6,gameDescription);
	pstmt.setString(7,gameurl);
	pstmt.setString(8,gameTitleImage);
	pstmt.setString(9,gameImage1);
	pstmt.setString(10,gameImage2);
	pstmt.setString(11,gameImage3);
	
 	
	// gametxt[j] = item.getString();
	 try {
		DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
		diskFileItemFactory.setRepository(new File(realPath));
		diskFileItemFactory.setSizeThreshold(maxSize);
		diskFileItemFactory.setDefaultCharset("utf-8");
		ServletFileUpload fileUpload = new ServletFileUpload(diskFileItemFactory);
		
		List<FileItem> items = fileUpload.parseRequest(request);
		
		for (FileItem item : items) {
			
			
			if (item.isFormField()) {
				if (j < 7) {
			 		gametxt[j] = item.getString();
					j++;
				}
				
			
			} else {
				if (k < 4) {
					gameimg[k] = item.getName();
					k++;
				} 


				
			if (item.getSize() > 0) {
				String separator = File.separator;
				int index = item.getName().lastIndexOf(separator);
				String fileName = item.getName().substring(index + 1);
				File uploadFile = new File(realPath + separator + fileName);
				item.write(uploadFile);

			}
		}
			
			
		i++;

	}
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} 	
		
     if(gametxt[6] == null) {
     	

	    	tmp1 = gametxt[3];
	    	tmp2 = gametxt[4];
	    	
	    	gametxt[4] = gametxt[6];
	    	gametxt[6] = gametxt[5];
	    	
	    	gametxt[5] = tmp2;
     }
     
     if(gametxt[6] == null) {
     	
	    	tmp1 = gametxt[3];
	    	tmp2 = gametxt[4];
	    	
	    	gametxt[3] = gametxt[6];
	    	gametxt[6] = gametxt[5];
	    	gametxt[5] = tmp1;
     }
     
    	System.out.println(gametxt[0]);
     	System.out.println(gametxt[1]);
     	System.out.println(gametxt[2]);
     	System.out.println(gametxt[3]);
     	System.out.println(gametxt[4]);
		System.out.println(gametxt[5]);
		System.out.println(gametxt[6]);
	
		System.out.println(gameimg[0]);
		System.out.println(gameimg[1]);
		System.out.println(gameimg[2]);
		System.out.println(gameimg[3]);
		
	 	pstmt.setString(1,gametxt[0]);
		pstmt.setString(2,gametxt[1]);
		pstmt.setString(3,gametxt[2]);
		pstmt.setString(4,gametxt[3]);
		pstmt.setString(5,gametxt[4]);
		pstmt.setString(6,gametxt[5]);
		pstmt.setString(7,gametxt[6]); 
		pstmt.setString(8,gameimg[0]);
		pstmt.setString(9,gameimg[1]);
		pstmt.setString(10,gameimg[2]);
		pstmt.setString(11,gameimg[3]);
	
	pstmt.executeUpdate();
	
 	if(pstmt != null) pstmt.close(); 
 	if(conn != null) conn.close();
 	
 	response.sendRedirect("GameWeb_Main.jsp");
%>


