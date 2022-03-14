<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"></jsp:useBean>
<!DOCTYPE html>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<% 
		ArrayList<Product> listOfProducts = productDAO.getAllProducts();
	%>
	
	<div class="container">
		<div class="row" align="center">
			<%
				for(int i=0;i<listOfProducts.size();i++){
				Product product = listOfProducts.get(i);
				
			%>
			<div class="col-md-4">
				<h3><%=product.getPname()%></h3>
				<p> <%=product.getDescription()%></p>
				<p> <%=product.getUnitPrice()%>원</p>				
			</div>
			<%
				}
			%>
		 </div>
		 <hr>
	</div>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>