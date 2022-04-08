<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<link rel = "stylesheet" href ="./resources/css/bootstrap.min.css"/>

<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navber-header">
			<a class="navbar-brand" href = "./welcome.jsp">HOME</a>
		</div>
		<!-- 네비게이션 바의 요소들을 추가등록을 하는 코드 -->
		<div>
			<ul class ="navbar-nav mr-auto"> <!-- mr-auto 마진 알아서 잡아줌  -->
				<li class ="nav-item"><a class ="nav-link" href="./products.jsp">상품목록</a></li>
				<li class ="nav-item"><a class ="nav-link" href="./addProduct.jsp">상품등록</a></li>
				<li class ="nav-item"><a class ="nav-link" href="./editProduct.jsp?edit=update">상품수정</a></li>
				<li class ="nav-item"><a class ="nav-link" href="./editProduct.jsp?edit=delete">상품삭제</a></li>
			</ul>
		</div>
	
	</div>
</nav>