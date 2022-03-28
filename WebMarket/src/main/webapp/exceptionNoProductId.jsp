<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 아이디 오류</title>
<link rel = "stylesheet" href ="./resources/css/bootstrap.min.css"/>
</head>
<body>
	<jsp:include page="menu.jsp"/>	
	<div class="jumbotron">
		<div class="container">
			<h2 class="alert alert-danger">해당 상품이 존재하지 않습니다.</h2>
		</div>
	</div>
	
	<div class="container">
		 <!-- 요청 URL을 표시하고 요청 파라메터의 값도 같이 표식을 하고 있는 부분이다. -->
		<p> <%= request.getRequestURL() %> ?<%= request.getQueryString() %>
		<p> <a href="products.jsp" class ="btn btn-secondary">상품 목록 &raquo;</a>
		
		
	</div>
	
</body>
</html>