<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 오류</title>
<link rel = "stylesheet" href ="./resources/css/bootstrap.min.css"/>
</head>
<body>
	<jsp:include page="menu.jsp"/>	
	<div class="jumbotron">
		<div class="container">
			<h2 class="alert alert-danger">요청하신 페이지를 찾을 수 없습니다.</h2>
		</div>
	</div>
	
	<div class="container">
		 <!-- 요청 URL을 표식을 하고 있는 부분이다. -->
		<p> <%= request.getRequestURL() %>
		<p> <a href="products.jsp" class ="btn btn-secondary">상품 목록 &raquo;</a>
		
		
	</div>
	
</body>
</html>