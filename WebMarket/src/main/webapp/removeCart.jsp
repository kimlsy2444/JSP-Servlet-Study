<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제하기</title>
</head>
<body>
	<% 
		//삭제될 상품 id를 얻고 있다. 
		String id = request.getParameter("id");
		
			
		//상품 id가 넘어오지 않았을 때 강제로 products.jsp이동시키고 종료시키는 코드
			if(id == null || id.trim().equals("")){
			response.sendRedirect("products.jsp");
			return;
		}
		
		// 상품 데이터 접근 클래스의 인스턴스를 받아오는 콛
		ProductRepository dao = ProductRepository.getInstance();
		
		//해당 id값을 이용해서 상품상세정보를 얻어오는 코드
		Product product = dao.getProductById(id);
		//해당 상품이 없을 때....
	 	if(product == null){
			response.sendRedirect("exceptionNoProductId.jsp");
		} 
		
		ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
		
		Product goodQnt = new Product();
		
		// 전체 상품 목록 중에서 삭제할 물품 id값가 동일하면 cartList에서 삭제를 하는 코드
		for(int i=0; i<cartList.size(); i++){
			goodQnt = cartList.get(i);
			if(goodQnt.getProductId().equals(id)){
				cartList.remove(goodQnt);
			}
		}
		
		response.sendRedirect("cart.jsp");
	%>
</body>
</html>