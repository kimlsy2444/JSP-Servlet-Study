<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	request.setCharacterEncoding("utf-8");
	
	// addProduct.jsp에서 사용자가 입력한 부분을 받아서 저장을 하고 있다.
	String productId = request.getParameter("productId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String description = request.getParameter("description");
	String manufacturer = request.getParameter("manufacturer");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");
	
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

	// ArrayList에 새 상품을 추가하고 있다.
	dao.addProduct(newProduct);
	
	// 강제로 페이지 이동을 시키고 있다.
	response.sendRedirect("products.jsp");
	
	
	
	
	
%>

