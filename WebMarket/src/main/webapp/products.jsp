<%@page import="dao.ProductRepository"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"></jsp:useBean> --%>
<!DOCTYPE html>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
<!-- CDN 방식은 더이상 사용하지 않는다.(인터넷이 되는 곳 허용) -->
<link rel = "stylesheet" href ="./resources/css/bootstrap.min.css"/>

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

		ProductRepository dao = ProductRepository.getInstance();
		ArrayList<Product> listOfProducts = dao.getAllProducts();
	%>
	
	<div class="container">
		<div class="row" align="center">
			<%
				for(int i=0;i<listOfProducts.size();i++){
				Product product = listOfProducts.get(i);
			%>
			<div class="col-md-4">
				<!-- 경로를 지정해서 이미지를 출력하고 있다. -->
				<img src="c:/upload/<%= product.getFilename() %>" 
				 style="width: 100%">
				<h3><%=product.getPname()%></h3>
				<p> <%=product.getDescription()%></p>
				<p> <%=product.getUnitPrice()%>원</p>		
				<!-- 상품의 아이디에 대한 상세정보 페이지를 연결시키기 위해서 아래코드를 작성하였다. -->
				<p><a href ="./product.jsp?id=<%= product.getProductId()%>"
				class ="btn btn-secondary" role="button">상세정보 &raquo;</a></p>			
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