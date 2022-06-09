<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"></jsp:useBean> --%>
<!DOCTYPE html>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
<link href ="../resources/css/bootstrap.min.css" rel = "stylesheet" />
<link href="../resources/css/List.css?ver=1" rel="stylesheet" />
<link href="../resources/css/login2.css?ver=1" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">   
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>관리자 코드 로그인(login)</title>
</head>
<body class= "bg-light">
    <!-- Navigation--> 
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand" href="GameWeb_Main.jsp"><img src="../resources/assets/img/hoseoGame.png"
                    alt="..." /></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars ms-1"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                    <li class="nav-item"><a class="nav-link" href="../GameWeb_List.jsp">Senior Project</a></li>
                    <li class="nav-item"><a class="nav-link" href="../Code_in.jsp">Upload</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Navigation-->
	 <div class="grid pt-5">	
	     <br/><br/><br/><br/><br/><br/><br/><br/>
			<%
				/* 로그인 인증에서 실패를 했을 때 작동하는 코드를 아래와 같이 작성함 */
				String error = request.getParameter("error");
				if(error != null){
					out.println("<div class='alert alert-danger'>");
					out.println("권한 코드를 입력해 주세요!");
					out.println("</div>");
				}
			%>
			<header class="login__header">
                <h3 class="login__title">Admin Code In</h3>
            </header>
			
			<form class="form login" action="j_security_check" method="post">
				<!-- 아이디를 입력하는 부분 -->
				<div class="login__body">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" class="sr-only" placeholder="ID" 
					       name='j_username' required autofocus value= "admin">
					 <label for="inputPassword" class="sr-only">Password</label>
					<input type="password"  placeholder="Password"name='j_password' required >     
				</div>
		       <div class="login__footer">
                <input type="submit" value="Login">
                <p></p>
            	</div>
				<!-- 비밀번호를 입력하는 부분 -->
			</form>			
		</div>		
    
    <footer class="p-4 p-md-5 fixed-bottom" style="background:#303033">
        <div class="container">
          <small style="display: block; text-align: right; color:white" ;>과사무실 : 아산캠퍼스 제1공학관 504-1호</small>
          <small style="display: block; text-align: right; color:white">전화: 041-540-5696</small>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="./resources/js/nav.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>	
</body>
</html>