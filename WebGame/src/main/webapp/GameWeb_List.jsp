<%@page import="java.sql.Connection"%>
<%@page import="dbconn.DBConn"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URI"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dto.GameInfo"%>
<%@page import="dao.GameInfoRepository"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<!-- 한글 인코딩  -->
<%
request.setCharacterEncoding("UTF-8");
String gameCode = (String) session.getAttribute("gameCode");

%>
<html lang="ko">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Game List</title>
  <!-- Favicon-->
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
    <link rel="icon" type="image/x-icon" href="./resources/assets/img/hoseoGame.png" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
  <!-- Core theme CSS (includes Bootstrap)-->

 
    <link href="./resources/css/List.css?ver=1" rel="stylesheet" />
<style type="text/css">
a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: none;
}

</style>
</head>  
<body class= "bg-light">
<% Connection conn = DBConn.getConnection(); %>
    <!-- Navigation-->
    <br><br><br><br><br><br>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand" href="GameWeb_Main.jsp"><img src="./resources/assets/img/hoseoGame.png"
                    alt="..." /></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars ms-1"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                    <li class="nav-item"><a class="nav-link" href="#">Senior Project</a></li>
                    <li class="nav-item"><a class="nav-link" href="#Code_in.jsp">Upload</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Navigation-->
    <div  class ="container">
    		<div class="row">
			<h2 class=" pt-4 pb-4">
				<p class="col-xs-2 fs-3">
					<b class= "">게임소프트웨어 졸업 작품 2022 </b><span class="fs-5 malgun"
						style="color: gray;"> HoseoGameSoftWare</span>
				</p>
				
			</h2>
		</div>
    </div>
   <section class="pt-4" id="portfolio">
	<div  class ="container">
		<!-- 게임 목록 -->
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 ">
			<%
			session.invalidate();
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String sql = "select * from GameInfo";
			// Connection 객체로 부터 쿼리를 주고 PreparedStatement 얻고있다.
			pstmt = conn.prepareStatement(sql);

			// 쿼리문의 결과를 받아오고 있다.
			rs = pstmt.executeQuery();

			while (rs.next()) {
				if(rs.getString("gameTitle") != null){
			%>
			<div class="col mb-5" id="portfolio">
                    <div class="portfolio-item">
                       <div class="card" style="width: 18rem;">
                        <a class="portfolio-link" data-bs-toggle="modal" href="./GameWeb_Info.jsp?id=<%=rs.getString("gameTitle")%>">
                            <div class="portfolio-hover">
                                <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                         
                            <img class ="card-img-top img-thumbnail" style="height: 20rem;"  src="./resources/images/<%= rs.getString("gameTitleImage")%>">
                            </div>
                        </a>
                     <div class="portfolio-caption">
                            <div class="portfolio-caption-heading"><a href="./GameWeb_Info.jsp?id=<%=rs.getString("gameTitle")%>"><%=rs.getString("gameTitle")%></a></div>
                            <div class="portfolio-caption-subheading text-muted"><a href="./GameWeb_Info.jsp?id=<%=rs.getString("gameTitle")%>"><%= rs.getString("gameTeamname") %></a></div>
                        </div>
                    </div>
			</div>
	
		
				<%}
			}%>
		</div>
		</div>
		</section>
		<%
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		%>
 

	
    <!-- Footer-->
    <footer class="footer py-4">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-4 text-lg-start">Copyright &copy; Your Website 2022</div>
                <div class="col-lg-4 my-3 my-lg-0">

                </div>
                <div class="col-lg-4 text-lg-end">
                    <a class="link-dark text-decoration-none me-3" href="#!">Privacy Policy</a>
                    <a class="link-dark text-decoration-none" href="#!">Terms of Use</a>
                </div>
            </div>
        </div>
    </footer>

    <footer class="p-4 p-md-5" style="background:#303033">
        <div class="container">
            <small style="display: block; text-align: right; color:white">과사무실 : 아산캠퍼스 제1공학관 504-1호</small>
            <small style="display: block; text-align: right; color:white">전화: 041-540-5696</small>
        </div>
    </footer>
    <!-- Bootstrap core JS-->
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