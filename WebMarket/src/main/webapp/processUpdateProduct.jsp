<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ include file = "dbconn.jsp"%>

<%
	request.setCharacterEncoding("utf-8");
	// processUpdateProduct.jsp에서 사용자가 업로드한 이미지 부분을 저장을 하고 있다.
	String filename = "";
	String realFolder = "C:\\upload";
	int maxSize = 10 * 1024 * 1024; // 최대 업로드 크기 (10m)
	String encType = "utf-8"; // 인코딩 유형
	
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, 
			 maxSize,encType, new DefaultFileRenamePolicy()); 

	// addProduct.jsp에서 사용자가 입력한 부분을 받아서 저장을 하고 있다.
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	
	Integer price;
	 long stock;
	// isEmpty공백 유무 함수
	// 단가(unitPrice)입력창에 미 입력시에 0으로 처리하겠다는 뜻
	if(unitPrice.isEmpty()){
		price = 0; // 자동 박싱
	}
	else {
		// String -> int형으로 변환 
		price = Integer.valueOf(unitPrice);
	}
	
	
	if(unitsInStock.isEmpty()){
		stock = 0; // 자동 박싱
	}
	else {
		// String -> long형으로 변환 
		stock = Long.valueOf(unitsInStock);
	}
	
	System.out.println("update");
	
	Enumeration files = multi.getFileNames(); 
 	String fname = (String)files.nextElement(); 
 	String fileName = multi.getFilesystemName(fname); 
	
 	PreparedStatement pstmt = null;
 	ResultSet rs = null;
 	
 	String sql = "select * from product where p_id = ?";
 	
 	pstmt = conn.prepareStatement(sql);
 	
 	pstmt.setString(1,productId);
 	rs = pstmt.executeQuery();
 	
 	// 이미지 변경이 있다면
 	if(rs.next()){
 		if(fileName != null){
 			sql = "update product set p_name=?, p_unitPrice=?, p_description=?, p_manufacturer=?,"+
 				  "p_category=?, p_unitsInStock=?, p_condition=?, p_fileName=? where p_id=?";
 			
 			pstmt = conn.prepareStatement(sql);
 			pstmt.setString(1,name);
 			pstmt.setInt(2,price);
 			pstmt.setString(3,description);
 			pstmt.setString(4,manufacturer);
 			pstmt.setString(5,category);
 			pstmt.setLong(6, stock);
 			pstmt.setString(7,condition);
 			pstmt.setString(8,fileName);
 			pstmt.setString(9,productId);
 			pstmt.executeUpdate();
 		}
 		// 이미지 변경이 없다면
 		else{
 			sql = "update product set p_name=?, p_unitPrice=?, p_description=?, p_manufacturer=?,"+
 	 				  "p_category=?, p_unitsInStock=?, p_condition=? where p_id=?";
 			
 			pstmt = conn.prepareStatement(sql);
 			pstmt.setString(1,name);
 			pstmt.setInt(2,price);
 			pstmt.setString(3,description);
 			pstmt.setString(4,manufacturer);
 			pstmt.setString(5,category);
 			pstmt.setLong(6, stock);
 			pstmt.setString(7,condition);
 			pstmt.setString(8,productId);
 			pstmt.executeUpdate();
 			
 		}
 	}
 	if(rs != null) rs.close();
 	if(pstmt != null) pstmt.close();
 	if(conn != null) conn.close();
 	
 	response.sendRedirect("editProduct.jsp?edit=update");
%>