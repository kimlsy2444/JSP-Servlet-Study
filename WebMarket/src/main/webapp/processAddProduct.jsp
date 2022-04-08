<%@page import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  

<%@ include file = "dbconn.jsp" %>

    
<%
	request.setCharacterEncoding("utf-8");
	// addProduct.jsp에서 사용자가 업로드한 이미지 부분을 저장을 하고 있다.
	String filename = "";
	String realFolder = "C:\\upload";
	// ** 중요함 **
	// 사용자가 추가한 상품들의 이미지를 현재 프로젝트 images폴더로 잡아서 저장을 해야지
	// 진정한 서버의 역활을 함과 동시에 아울러 이미지를 뿌려줄때 이미지를 가지고 오는데 문제가 없다.
	// String realFolder = "D:/JSP-Servlet작업/WebMarket/src/main/webapp/resources/images";
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
	
	
 	Enumeration files = multi.getFileNames(); 
 	String fname = (String)files.nextElement(); 
 	String fileName = multi.getFilesystemName(fname); 
	
 	PreparedStatement pstmt = null;
 	String sql = "insert into product values(?,?,?,?,?,?,?,?,?)";
 	pstmt = conn.prepareStatement(sql);
 	
 	// 아래 9개의 사용자로부터 입력받은 데이터를 DB에 저장 하고 있다.
 	pstmt.setString(1,productId);
 	pstmt.setString(2,name);
 	pstmt.setInt(3,price);
 	pstmt.setString(4,description);
 	pstmt.setString(5,manufacturer);
 	pstmt.setString(6,category);
 	pstmt.setLong(7,stock);
 	pstmt.setString(8,condition);
 	pstmt.setString(9,fileName);
 	
 	System.out.print("상품 등록 완료");
 	
 	pstmt.executeUpdate();
 	
 	// 자원 해제
 	if(pstmt != null) pstmt.close();
 	if(conn != null) conn.close();
 	
 	
 // 강제로 페이지 이동을 시키고 있다.
 	response.sendRedirect("products.jsp");
 	// 하기 내용을 DB 삽입으로 대체하도록 한다.
/* 	ProductRepository dao = ProductRepository.getInstance();
	Product newProduct = new Product(); */
	
	//Prodcuct객체에 사용자가 입력한 내용을 저장하고 있다.
/* 	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition); */
	// 이미지 저장 부분
	// newProduct.setFilename(fileName); 
	// ArrayList에 새 상품을 추가하고 있다.
	// dao.addProduct(newProduct);
	
	
	
	

%>

