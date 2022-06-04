<%@page import="dbconn.DBConn"%>
<%@page import="java.sql.Connection"%>
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
    pageEncoding="UTF-8" errorPage="errorPage.jsp"%>  
    <!-- " -->
<%-- <%@ include file = "dbconn.jsp" %> --%>
<% Connection conn = DBConn.getConnection(); %>

<script src="./resources/js/addinputbox.js"></script>
    
<%
	
	request.setCharacterEncoding("utf-8");
	String realPath = "";
	String savePath = "./resources/images";
	/* String savePath = "D:/JSP-Servlet/WebGame/src/main/webapp/resources/images"; */
	String type = "utf-8";
	int maxSize = 100*1024*1024; // 10mb
	ServletContext context = request.getServletContext();
	realPath = context.getRealPath(savePath); 
	int i = 1;
	int j = 0;
	int k = 0;


	PreparedStatement pstmt = null;
 	String sql ="update GameInfo set gameTitle=?, gameTeamname=?, gameMember1=?, gameMember2=?, gameMember3=?, gameMember4=?,gameMember5=?,gameMember6=?, gameDescription=?, gameurl=?, gameTitleImage=?, gameImage1=?, gameImage2=?, gameImage3=?, gameImage4=? , gameImage5=? where gameCode=?";
 	pstmt = conn.prepareStatement(sql);
	
	String[] gametxt = new String[11];
	String[] gameimg = new String[6]; 
 	
	int n = gametxt.length;
	System.out.println("크기 " +n);
	
	String tmp1 = null;
    String tmp2 = null;
    
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
	String gameCode = null;
	
	pstmt.setString(17,gameCode);
	pstmt.setString(1,gameTitle);
 	pstmt.setString(2,gameTeamname);
	pstmt.setString(3,gameMember1);
	pstmt.setString(4,gameMember2);
	pstmt.setString(5,gameMember3);
	pstmt.setString(6,gameMember4);
	pstmt.setString(7,gameMember5);
	pstmt.setString(8,gameMember6);
	pstmt.setString(9,gameDescription);
	pstmt.setString(10,gameurl);
	pstmt.setString(11,gameTitleImage);
	pstmt.setString(12,gameImage1);
	pstmt.setString(13,gameImage2);
	pstmt.setString(14,gameImage3);
	pstmt.setString(15,gameImage3);
	pstmt.setString(16,gameImage3);
 	
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
				if (j < 11) {
			 		gametxt[j] = item.getString();
					j++;
				}
				
			
			} else {
				if (k < 6) {
					gameimg[k] = item.getName();
					System.out.println(gameimg[k]);
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
		
     // 데이터를 담을 배열
     
     String[] data = new String[gametxt.length];
     
     for(int m = 0 ; m < n; m++){
    	 data[m] = gametxt[m];
     }

   
     String last = data[data.length - 1];
     
     while (last == null) {
         // 오른쪽으로 1칸 Shift
         String temp = data[n-1];
         for(int m=n-1; m>2; m--) {
             data[m] = data[m-1];
         }
         data[3] = temp;
         last = data[data.length - 1];
        
     	
     	if(last !=null) {
     		break;
     	}
     }
     
     // 바뀐 후
     for(int m= 0; n-1<m; m++) {
        
     }
     System.out.println();
     		
     
     for(int l=0; l<data.length-1; l++){
    	
     }
     
     
	 	pstmt.setString(1,data[1]);
		pstmt.setString(2,data[2]);
		
		pstmt.setString(3,data[3]);
		pstmt.setString(4,data[4]);
		pstmt.setString(5,data[5]);
		pstmt.setString(6,data[6]);
		pstmt.setString(7,data[7]);
		pstmt.setString(8,data[8]);
		pstmt.setString(9,data[9]);
		pstmt.setString(10,data[10]);
		pstmt.setString(11,gameimg[0]);
		pstmt.setString(12,gameimg[1]);
		pstmt.setString(13,gameimg[2]);
		pstmt.setString(14,gameimg[3]);
		pstmt.setString(15,gameimg[4]);
		pstmt.setString(16,gameimg[5]);
		pstmt.setString(17,data[0]);
	pstmt.executeUpdate();
	
 	if(pstmt != null) pstmt.close(); 
 	if(conn != null) conn.close();
 	
 	response.sendRedirect("GameWeb_Main.jsp");
%>


