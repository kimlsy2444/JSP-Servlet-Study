<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"></jsp:useBean> --%>
<!DOCTYPE html>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
<link rel = "stylesheet" href ="../resources/css/bootstrap.min.css"/>

<meta charset="UTF-8">
<title>관리자 코드 로그인(login)</title>
</head>
<body>

	<div class="jumbotron">
		<div class="container">
			<a class = "btn badge bg-info" href ="../GameWeb_Main.jsp" style="float: right;">메인화면</a> 
			<h1 class="display-3">관리자 코드 입력</h1>
		</div>	
	</div>    
	
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please Code In</h3>
			
			<%
				/* 로그인 인증에서 실패를 했을 때 작동하는 코드를 아래와 같이 작성함 */
				String error = request.getParameter("error");
				if(error != null){
					out.println("<div class='alert alert-danger'>");
					out.println("권한 코드를 입력해 주세요!");
					out.println("</div>");
				}
			%>
			<form class="form-signin" action="j_security_check" method="post">
				<!-- 아이디를 입력하는 부분 -->
				<div class="form_group">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" class="sr-only" placeholder="ID" 
					       name='j_username' required autofocus value= "admin">
				</div>
				
				
				<!-- 비밀번호를 입력하는 부분 -->
				<!-- sr-only 웹 접근성을 위한 코드이며 역할을 Label 내용을 숨긴다 히든은 검색해도 서칭 x 이건 o -->

				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="Password"name='j_password' required >
				</div>
				
				
				<!-- btn-lg버튼 크기, btn-success초록색 버튼 -->
				<button class="btn btn-lg btn-success btn-block" type="submit">로그인</button>	
			</form>			
		</div>		
	</div>	
</body>
</html>