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
	String type = "utf-8";
	int maxSize = 100*1024*1024; // 10mb
	ServletContext context = request.getServletContext();
	realPath = context.getRealPath(savePath); 
	int i = 1;
	
	PreparedStatement pstmt = null;
 	String sql = "insert into gameinfo values(?,?,?,?,?,?,?,?,?,?)";
 	pstmt = conn.prepareStatement(sql);
	
 	
	String gameTeamname = null;
	String gameMembers = null;
	String gameTitle = null;
	String gameTrailer =null;
	String gameDescription = null;
	String gameurl = null;
	String gameTitleImage = null;
	String gameImage1 = null;
	String gameImage2 = null;
	String gameImage3 = null;

	pstmt.setString(1,gameTeamname);
	pstmt.setString(2,gameMembers);
	pstmt.setString(3,gameTitle);
	pstmt.setString(4,gameTrailer);
	pstmt.setString(5,gameDescription);
	pstmt.setString(6,gameurl);
	pstmt.setString(7,gameTitleImage);
	pstmt.setString(8,gameImage1);
	pstmt.setString(9,gameImage2);
	pstmt.setString(10,gameImage3);
	
 	
 	
	try {
		DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
		diskFileItemFactory.setRepository(new File(realPath));
		diskFileItemFactory.setSizeThreshold(maxSize);
		diskFileItemFactory.setDefaultCharset("utf-8");
		ServletFileUpload fileUpload = new ServletFileUpload(diskFileItemFactory);
		
		List<FileItem> items = fileUpload.parseRequest(request);
		
		for (FileItem item : items) {
			
			if (item.isFormField()) {
				
			
				pstmt.setString(i,item.getString());
			
			
			} else {
				pstmt.setString(i,item.getName());

				
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

			
	pstmt.executeUpdate();
	
 	if(pstmt != null) pstmt.close(); 
 	if(conn != null) conn.close();
 	
 	response.sendRedirect("GameWeb_Main.jsp");
%>


