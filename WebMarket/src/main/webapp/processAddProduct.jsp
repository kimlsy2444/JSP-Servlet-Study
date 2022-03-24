<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  

    
<%
	request.setCharacterEncoding("utf-8");
	// addProduct.jsp에서 사용자가 업로드한 이미지 부분을 저장을 하고 있다.
	String filename = "";
	String realFolder = "C:\\upload";	// 웹 어플리케이션에서 절대 경로
	int maxSize = 10* 1024 * 1024; 		// 최대 업로드 크기 (10M)
	String encType = "utf-8";			// 인코딩 유형
	
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
	
	ProductRepository dao = ProductRepository.getInstance();
	Product newProduct = new Product();
	
	//Prodcuct객체에 사용자가 입력한 내용을 저장하고 있다.
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	// 이미지 저장 부분
	newProduct.setFilename(fileName); 
	// ArrayList에 새 상품을 추가하고 있다.
	dao.addProduct(newProduct);
	
	// 강제로 페이지 이동을 시키고 있다.
	response.sendRedirect("products.jsp");
	
	
	
	
	
%>

