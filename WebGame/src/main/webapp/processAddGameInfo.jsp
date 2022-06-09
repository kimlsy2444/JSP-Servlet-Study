<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
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
    pageEncoding="UTF-8"  errorPage="errorPage.jsp" %>  

<% Connection conn = DBConn.getConnection(); %>

<script src="./resources/js/addinputbox.js"></script>
    
<%	Date nowDate = new Date();
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("mmss");
	String date = simpleDateFormat.format(nowDate);
	request.setCharacterEncoding("utf-8");
	String realPath = "";
	String savePath = "./resources/images";
	String type = "utf-8";
	int maxSize = 100*1024*1024; // 10mb
	ServletContext context = request.getServletContext();
	realPath = context.getRealPath(savePath); 
	int i = 1;
	int j = 0;
	int k = 0;



	
	String[] gametxt = new String[11];
	String[] gameimg = new String[6]; 
 	
	int n = gametxt.length;
	
	String tmp1 = null;
    String tmp2 = null;
    

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
					if(item.getName() !=""){
						gameimg[k] = item.getName()+date;
					}
					else{
						gameimg[k] = null;
	
					}
					k++;
				} 


				
			if (item.getSize() > 0) {
				String separator = File.separator;
				int index = item.getName().lastIndexOf(separator);
				String fileName = item.getName().substring(index + 1);
				System.out.println("이름"+fileName);
				if(fileName != ""){
					fileName +=date;
				}

				//fileName = date;	
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

 	PreparedStatement pstmt = null;
 	ResultSet rs = null;
 	String sql = "select * from GameInfo where gameTitle = ?";
 	pstmt = conn.prepareStatement(sql);
 	pstmt.setString(1,data[1]);
	rs = pstmt.executeQuery();	
 	 	
	// 고치고 싶지만 시간이 부족한 관계.... 이미지 업로드시 ....
	if(rs.next()){ // 모든값 있
		if(gameimg[0] != null && gameimg[1] != null && gameimg[2] != null && gameimg[3] != null && gameimg[4] != null  && gameimg[5] != null){
	 	sql ="update GameInfo set gameTitle=?, gameTeamname=?, gameMember1=?, gameMember2=?, gameMember3=?, gameMember4=?,gameMember5=?,gameMember6=?, gameDescription=?, gameurl=?, gameTitleImage=?, gameImage1=?, gameImage2=?, gameImage3=?, gameImage4=? , gameImage5=? where gameCode=?";
		 	pstmt = conn.prepareStatement(sql);
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
		}
		
		else if(gameimg[0] != null && gameimg[1] == null && gameimg[2] == null && gameimg[3] == null && gameimg[4] == null  && gameimg[5] == null){
		 	sql ="update GameInfo set gameTitle=?, gameTeamname=?, gameMember1=?, gameMember2=?, gameMember3=?, gameMember4=?,gameMember5=?,gameMember6=?, gameDescription=?, gameurl=?, gameTitleImage=? where gameCode=?";
		 	pstmt = conn.prepareStatement(sql);
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
			pstmt.setString(12,data[0]);
			pstmt.executeUpdate();
		}
		 
		else if(gameimg[0] != null && gameimg[1] != null && gameimg[2] == null && gameimg[3] == null && gameimg[4] == null  && gameimg[5] == null){
		 	sql ="update GameInfo set gameTitle=?, gameTeamname=?, gameMember1=?, gameMember2=?, gameMember3=?, gameMember4=?,gameMember5=?,gameMember6=?, gameDescription=?, gameurl=?, gameTitleImage=?,gameImage1=? where gameCode=?";
		 	pstmt = conn.prepareStatement(sql);
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
			pstmt.setString(13,data[0]);
			pstmt.executeUpdate();
		}	
	
		else if(gameimg[0] != null && gameimg[1] != null && gameimg[2] != null && gameimg[3] == null && gameimg[4] == null  && gameimg[5] == null){
		 	sql ="update GameInfo set gameTitle=?, gameTeamname=?, gameMember1=?, gameMember2=?, gameMember3=?, gameMember4=?,gameMember5=?,gameMember6=?, gameDescription=?, gameurl=?, gameTitleImage=?,gameImage1=?,gameImage2=? where gameCode=?";
		 	pstmt = conn.prepareStatement(sql);
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
			pstmt.setString(14,data[0]);
			pstmt.executeUpdate();
		}		


	
		else if(gameimg[0] != null && gameimg[1] != null && gameimg[2] != null && gameimg[3] != null && gameimg[4] == null  && gameimg[5] == null){
		 	sql ="update GameInfo set gameTitle=?, gameTeamname=?, gameMember1=?, gameMember2=?, gameMember3=?, gameMember4=?,gameMember5=?,gameMember6=?, gameDescription=?, gameurl=?, gameTitleImage=?,gameImage1=?,gameImage2=?,gameImage3=? where gameCode=?";
		 	pstmt = conn.prepareStatement(sql);
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
			pstmt.setString(15,data[0]);
			pstmt.executeUpdate();
		}		

		else if(gameimg[0] != null && gameimg[1] != null && gameimg[2] != null && gameimg[3] != null && gameimg[4] != null  && gameimg[5] == null){
		 	sql ="update GameInfo set gameTitle=?, gameTeamname=?, gameMember1=?, gameMember2=?, gameMember3=?, gameMember4=?,gameMember5=?,gameMember6=?, gameDescription=?, gameurl=?, gameTitleImage=?,gameImage1=?,gameImage2=?,gameImage3=? ,gameImage4=?  where gameCode=?";
		 	pstmt = conn.prepareStatement(sql);
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
			pstmt.setString(16,data[0]);
			pstmt.executeUpdate();
		}	
	
	
		else if(gameimg[0] == null && gameimg[1] == null && gameimg[2] == null && gameimg[3] == null && gameimg[4] == null  && gameimg[5] == null){
			sql ="update GameInfo set gameTitle=?, gameTeamname=?, gameMember1=?, gameMember2=?, gameMember3=?, gameMember4=?,gameMember5=?,gameMember6=?, gameDescription=?, gameurl=? where gameCode=?";
		 	pstmt = conn.prepareStatement(sql);	     
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
			//pstmt.setString(11,gameimg[0]);
			//pstmt.setString(11,gameimg[1]);
			//pstmt.setString(11,gameimg[2]);
			//pstmt.setString(11,gameimg[3]);
			//pstmt.setString(11,gameimg[4]);
			//pstmt.setString(11,gameimg[5]);
			pstmt.setString(11,data[0]);
			pstmt.executeUpdate();		

		}		
		
		else if(gameimg[0] == null && gameimg[1] == null && gameimg[2] == null && gameimg[3] == null && gameimg[4] == null ){
			sql ="update GameInfo set gameTitle=?, gameTeamname=?, gameMember1=?, gameMember2=?, gameMember3=?, gameMember4=?,gameMember5=?,gameMember6=?, gameDescription=?, gameurl=?, gameImage5=? where gameCode=?";
		 	pstmt = conn.prepareStatement(sql);	     
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
			//pstmt.setString(11,gameimg[0]);
			//pstmt.setString(11,gameimg[1]);
			//pstmt.setString(11,gameimg[2]);
			//pstmt.setString(11,gameimg[3]);
			//pstmt.setString(11,gameimg[4]);
			pstmt.setString(11,gameimg[5]);
			pstmt.setString(12,data[0]);
			pstmt.executeUpdate();		
				
		}			
		
		
		
		else if(gameimg[0] == null && gameimg[1] == null && gameimg[2] == null && gameimg[3] == null  ){
			sql ="update GameInfo set gameTitle=?, gameTeamname=?, gameMember1=?, gameMember2=?, gameMember3=?, gameMember4=?,gameMember5=?,gameMember6=?, gameDescription=?, gameurl=?, gameImage4=? , gameImage5=? where gameCode=?";
		 	pstmt = conn.prepareStatement(sql);	     
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
			//pstmt.setString(11,gameimg[0]);
			//pstmt.setString(11,gameimg[1]);
			//pstmt.setString(11,gameimg[2]);
			//pstmt.setString(11,gameimg[3]);
			pstmt.setString(11,gameimg[4]);
			pstmt.setString(12,gameimg[5]);
			pstmt.setString(13,data[0]);
			pstmt.executeUpdate();		
				
		}		
		
		
		else if(gameimg[0] == null && gameimg[1] == null && gameimg[2] == null  ){
			sql ="update GameInfo set gameTitle=?, gameTeamname=?, gameMember1=?, gameMember2=?, gameMember3=?, gameMember4=?,gameMember5=?,gameMember6=?, gameDescription=?, gameurl=?, gameImage3=?, gameImage4=? , gameImage5=? where gameCode=?";
		 	pstmt = conn.prepareStatement(sql);	     
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
			//pstmt.setString(11,gameimg[0]);
			//pstmt.setString(11,gameimg[1]);
			//pstmt.setString(11,gameimg[2]);
			pstmt.setString(11,gameimg[3]);
			pstmt.setString(12,gameimg[4]);
			pstmt.setString(13,gameimg[5]);
			pstmt.setString(14,data[0]);
			pstmt.executeUpdate();		
				
		}

		
		else if(gameimg[0] == null && gameimg[1] == null ){
			sql ="update GameInfo set gameTitle=?, gameTeamname=?, gameMember1=?, gameMember2=?, gameMember3=?, gameMember4=?,gameMember5=?,gameMember6=?, gameDescription=?, gameurl=?, gameImage2=?, gameImage3=?, gameImage4=? , gameImage5=? where gameCode=?";
		 	pstmt = conn.prepareStatement(sql);	     
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
			//pstmt.setString(11,gameimg[0]);
			//pstmt.setString(11,gameimg[1]);
			pstmt.setString(11,gameimg[2]);
			pstmt.setString(12,gameimg[3]);
			pstmt.setString(13,gameimg[4]);
			pstmt.setString(14,gameimg[5]);
			pstmt.setString(15,data[0]);
			pstmt.executeUpdate();		
				
		}			
		
		
		else if(gameimg[0] == null ){
			sql ="update GameInfo set gameTitle=?, gameTeamname=?, gameMember1=?, gameMember2=?, gameMember3=?, gameMember4=?,gameMember5=?,gameMember6=?, gameDescription=?, gameurl=?,  gameImage1=?, gameImage2=?, gameImage3=?, gameImage4=? , gameImage5=? where gameCode=?";
		 	pstmt = conn.prepareStatement(sql);	     
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
			//pstmt.setString(11,gameimg[0]);
			pstmt.setString(11,gameimg[1]);
			pstmt.setString(12,gameimg[2]);
			pstmt.setString(13,gameimg[3]);
			pstmt.setString(14,gameimg[4]);
			pstmt.setString(15,gameimg[5]);
			pstmt.setString(16,data[0]);
			pstmt.executeUpdate();		
				
		}
		
	
		
		
	}
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();	
 	
 	response.sendRedirect("GameWeb_Main.jsp");
%>


