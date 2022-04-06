<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page errorPage = "exceptionNoProductId.jsp"%>  <!-- id값이 유효하지 않으면 에러 페이지로 이동한다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--  <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/> --%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>

<link rel = "stylesheet" href ="./resources/css/bootstrap.min.css"/>
<meta charset="UTF-8">
<title>상품 상세 정보</title>
<!-- 장바구니에 추가 하기 위한 핸들러 함수 -->
<script type="text/javascript">
	
	function addToCart() {
	
		if(confirm("해당 상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		}
		else{
			document.addForm.reset();
			
		}
	}
	
</script>





</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>	
	</div>
	<%
		//넘어온 상품 아이디값을 얻어낸다.
		String id = request.getParameter("id");
		ProductRepository dao = ProductRepository.getInstance();
		//넘어온 상품 아이디값을 이용해서 실제 해당하는 Product객체를 얻고 있다.
		Product product = dao.getProductById(id);		
		
	%>
	<div class="container">
		<div class="row">
		<!-- 이미지 추가 -->
			<div class="col-md-5">	
			 <img src="${pageContext.request.contextPath}/resources/images/<%= product.getFilename()%>"
				 			 style="width: 100%"> 
			
			</div>
			<div class="col-md-6">

				<h3><%= product.getPname() %> </h3>
				<p><%= product.getDescription() %></p>
				<p><b>상품 코드 : </b><span class="badge badge-danger"><%= product.getProductId()%></span></p>
				<p><b>제조사 : </b><%= product.getManufacturer()%></p>			
				<p><b>분류 : </b><%= product.getCategory() %></p>
				<p><b>재고 수 : </b><%= product.getUnitsInStock()%></p>
				<h4><%= product.getUnitPrice()%>원</h4>
				
				<p><form name = "addForm" action="./addCart.jsp?id=<%= product.getProductId()%>" method ="post">
				
				
					<!-- 상품 주문을 클릭하면 자바스크립트의 핸들러 함수 addToCart () 호출 되도록 만들었다. -->
					<a href="#" class="btn btn-info" onclick="addToCart()">상품 주문 &raquo;</a>
					<!-- 장바구니 버튼을 추가 하였다. 클릭하면 /cart.jsp 로 이동하게 만들어 주었다. -->
					<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
					
					<a href="./products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
				</form>
				
			</div>		
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>