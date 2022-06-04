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
<head>
    <meta charset="utf-8" />
    <title>Agency - Start Bootstrap Theme</title>
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
  <link href="./resources/css/styles.css" rel="stylesheet"  />
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
<% Connection conn = DBConn.getConnection(); 
	int listcount = 1;
%>
<body id="page-top">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand" href="#page-top"><img src="./resources/assets/img/hoseoGame.png"
                    alt="..." /></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars ms-1"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                    <li class="nav-item"><a class="nav-link" href="#portfolio">Senior Project</a></li>
                    <li class="nav-item"><a class="nav-link" href="#about">CLUB</a></li>
                    <li class="nav-item"><a class="nav-link" href="#SNS">SNS</a></li>
                    <li class="nav-item"><a class="nav-link" href="Code_in.jsp">Upload</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Navigation-->

    <!-- Masthead-->
    <header class="masthead">
        <div class="container">
            <img src="./resources/assets/img/Group 2.png" class="figure-img img-fluid rounded" alt="...">

        </div>
    </header>

    <!-- Portfolio Grid-->
    <section class="page-section bg-light" id="portfolio">
        <div class="container">
            <div class="text-center">
                <h2 class="section-heading text-uppercase">졸업작품 </h2>
                <h3 class="section-subheading text-muted">Hoseo Game SoftWare Senior Project</h3>
            </div>
            <div class="row">
                <div class="mb-4">
                  
                    <a type="button" style="float: right;" href= "GameWeb_List.jsp"><i class="fas fa-plus fa-2x"></i><span class="section-subheading text-muted">Add More</span></a>
                </div>
            </div>
            <div class="row">
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
                <div class="col-lg-4 col-sm-6 mb-4">
                    <!-- Portfolio item 1-->
                    <div class="portfolio-item">
                        <a class="portfolio-link" data-bs-toggle="modal" href="./GameWeb_Info.jsp?id=<%=rs.getString("gameTitle")%>">
                            <div class="portfolio-hover">
                                <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <img class ="card-img-top img-thumbnail" style="height: 30rem;" src="./resources/images/<%= rs.getString("gameTitleImage")%>">
                        </a>
                        <div class="portfolio-caption">
							<div class="portfolio-caption-heading"><a href="./GameWeb_Info.jsp?id=<%=rs.getString("gameTitle")%>"><%=rs.getString("gameTitle")%></a></div>
                            <div class="portfolio-caption-subheading text-muted"><a href="./GameWeb_Info.jsp?id=<%=rs.getString("gameTitle")%>"><%= rs.getString("gameTeamname") %></a></div>
                        </div>
                    </div>
                </div>
            				<%}listcount++;
				if(listcount == 4) {
					break;
				}
			}%>
            </div>
        </div>
    </section>
<!-- 동아리 -->
    <section class="page-section" id="about">
        <div class="container">
            <div class="text-center">
                <h2 class="section-heading text-uppercase">University Club</h2>
                <h3 class="section-subheading text-muted">Hoseo Game SoftWare University Club</h3>
            </div>
            <ul class="timeline">
                <li>
                    <div><img class="timeline-image rounded-circle img-fluid" src="./resources/assets/img/about/CREATOR.jpg"
                            alt="..." /></div>
                    <div class="timeline-panel">
                        <div class="timeline-heading">
                            <h4>팀 크리에이터</h4>
                            <h4 class="subheading">학술 동아리</h4>
                        </div>
                        <div class="timeline-body">
                            <p class="text-muted">
                                94년도에 처음 창설되어 <br />
                                기획, 프로그래밍, 그래픽의 3파트 구성으로 <br />
                                게임 개발을 원한다면 누구나 가입 가능하고<br />
                                게임 개발자의 꿈을 키워나가는 공간입니다.</p>
                        </div>
                    </div>
                </li>
                <li class="timeline-inverted">
                    <div><img class="timeline-image rounded-circle img-fluid" src="./resources/assets/img/about/BUGSOFT.jpg"
                            alt="..." /></div>
                    <div class="timeline-panel">
                        <div class="timeline-heading">
                            <h4>버그 소프트</h4>
                            <h4 class="subheading">학술 동아리</h4>
                        </div>
                        <div class="timeline-body">
                            <p class="text-muted">
                                다양한 교육과 소통을 병행하는 학술동아리<br />
                                학과 친구들, 선배들과 더 친해지고 싶다면?<br />
                                정규 수업 외에 전공에 대해 배우고 싶은 것이 더 많다면 ?<br />
                                게임을 직접 만들어보는 경험을 해보고 싶다면?<br />
                                게임과의 신입생이라면?
                            </p>
                        </div>
                    </div>
                </li>


                <li class="timeline-inverted">
                    <div><img class="timeline-image rounded-circle img-fluid" src="./resources/assets/img/about/MAROSOFT.jpg"
                            alt="..." /></div>
                    <div class="timeline-panel">
                        <div class="timeline-heading">
                            <h4>마로 소프트</h4>
                            <h4 class="subheading">학술 동아리</h4>
                        </div>
                        <div class="timeline-body">
                            <p class="text-muted">1998 설립 <br />
                                파트별 스터디 및 세미나 창작 게임 제안서 작성<br />
                                프로그래밍 팀 구성 여름방학 8주간 합숙 제작<br />
                                완성된 게임 발표 이후 교수님 피드백 <br />
                                게임 제작 경험 나만의 게임을 제작하자</p>
                        </div>
                    </div>
                </li>

                <li>
                    <div><img class="timeline-image rounded-circle img-fluid" src="./resources/assets/img/about/CYPICS.jpg"
                            alt="..." /></div>
                    <div class="timeline-panel">
                        <div class="timeline-heading">
                            <h4>CYPICS</h4>
                            <h4 class="subheading">벤처 동아리</h4>
                        </div>
                        <div class="timeline-body">
                            <p class="text-muted">
                                CYPICS는 2003년 게임 및 서비스 개발을 목적으로 두고 설립된 벤처 동아리입니다.<br />
                                소속된 학술 동아리와 상관없이 중복 가입이 가능합니다.<br />
                                세미나를 통해 학습한 것을 바탕으로 3,4학년때 함께<br />프로젝트를 진행
                                경험한 바탕으로 교내 지원 사업 출품을 목표로 활동 하고있습니다</p>
                        </div>
                    </div>
                </li>


                <li class="timeline-inverted">
                    <div><img class="timeline-image rounded-circle img-fluid" src="./resources/assets/img/about/HADADO.PNG"
                            alt="..." /></div>
                    <div class="timeline-panel">
                        <div class="timeline-heading">
                            <h4>HADADO</h4>
                            <h4 class="subheading">벤처 동아리</h4>
                        </div>
                        <div class="timeline-body">
                            <p class="text-muted">게임 그래픽 동아리로<br />
                                2D ~ 3D 파트로 나누어져 있으며 자신의 작업물을 <br />
                                서로 비드백을 주고 받는 작업위주 스터디 진행<br />
                                게임회사 실무에 계신 졸업생 선배들과 도움 요청및 소통 피드백 위주의 그래픽 동아리</p>
                        </div>
                    </div>
                </li>


                <li>
                    <div class=""><img class="timeline-image rounded-circle img-fluid"
                            src="./resources/assets/img/about/Butterfly.png" alt="..." /></div>
                    <div class="timeline-panel">
                        <div class="timeline-heading">
                            <h4>버터플라이</h4>
                            <h4 class="subheading">일반 동아리</h4>
                        </div>
                        <div class="timeline-body">
                            <p class="text-muted">
                                버터플라이는 학과 구분없이 누구나 자유롭게<br />
                                학과 상관없이 활동 하고있습니다.<br />
                                유니티,언리얼 엔진 사용법 및 게임 기획 분석 세미나를<br />
                                진행하는 일반 동아리 입니다. </p>
                        </div>
                    </div>
                </li>
                <li class="timeline-inverted">
                    <div class="timeline-image">
                        <h4>
                            <img class="rounded-circle img-fluid"
                                src="./resources/assets/img/hoseoGame.png" alt="..." />
                        </h4>
                    </div>
                </li>
            </ul>
        </div>
    </section>


    <!-- SNS-->
    <section class="page-section" id="SNS">
        <div class="container">
            <div class="text-center">
                <h2 class="section-heading text-uppercase"> Department SNS</h2>
                <h3 class="section-subheading text-muted"></h3>
            </div>

            <div id="table_body">
                <table class="table table-borderless" id="tble_images">
                    <tbody>
                        <tr>
                            <td class="text-center ">
                                <a target="_blank"
                                    href="https://www.facebook.com/%ED%98%B8%EC%84%9C%EB%8C%80%ED%95%99%EA%B5%90-%EA%B2%8C%EC%9E%84%EC%86%8C%ED%94%84%ED%8A%B8%EC%9B%A8%EC%96%B4%ED%95%99%EA%B3%BC-299370977681043/">
                                    <img src="./resources/assets/img/face.png" class="figure-img img-fluid rounded" alt="..."></a>
                                <br><strong class="fs-3 ">페이스북</strong>

                            </td>
                            <td class="text-center">
                                <a target="_blank" href="https://www.instagram.com/hoseo_game_pr/">
                                    <img src="./resources/assets/img/instar.png" class="figure-img img-fluid rounded" alt="..."></a>
                                <br><b class="fs-3">인스타그램</b>
                            </td>
                            <td class="text-center">
                                <a target="_blank"
                                    href="https://www.youtube.com/channel/UCzaDoADK7Z8Qf2qR1kD2QYw?view_as=subscriber">
                                    <img src="./resources/assets/img/youtube.png" class="figure-img img-fluid rounded"
                                        alt="..."></a>
                                <br><b class="fs-3">유튜브</b>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

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
    <!-- Portfolio Modals-->
		<%
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		%>
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