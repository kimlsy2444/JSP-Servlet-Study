<%@page import="dbconn.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.List"%>
<%@page import="dao.GameInfoRepository"%>
<%@page import="dto.GameInfo"%>
<%@page import="java.util.*"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp" %>
<!doctype html>
<% request.setCharacterEncoding("UTF-8"); %>
<html lang="ko">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게임소프트웨어 졸업작품</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link href="./resources/css/slider.css?ver=2" rel="stylesheet" />
<link href="./resources/css/List.css?ver=1" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

<script src="./resources/js/reply.js"></script>
<style>
.form-item input:focus{
    border-color:#0982f0;
    outline: none;
}
#swiper-slide-img2{
  	 display: flex;
     justify-content: center;
     align-items: center;
     height: 25vh}
</style>
</head>
<body>
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
                    <li class="nav-item"><a class="nav-link" href="GameWeb_List.jsp">Senior Project</a></li>
                    <li class="nav-item"><a class="nav-link" href="Code_in.jsp">Upload</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Navigation-->
<main class="container">



<!-- 게임포스터 -->
<% Connection conn = DBConn.getConnection(); %>

<%	
	int i = 0;
		
	//어떤 게임정보 을 편집할지 id값이 넘어오는 것을 받고 있다.
	String gameTitle = request.getParameter("id");
	String gameNum = null;
	String gameurl  = null;
	String gameCode = null;
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from GameInfo where gameTitle = ?";
	//Connection객체로 부터 쿼리문를 주고 PreparedStatement를 얻고 있다.
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, gameTitle);
	
	//쿼리문의 결과를 받아오고 있다.
	rs = pstmt.executeQuery();


	if(rs.next()) {
		// gameurl 변환 코드 
		gameurl  = rs.getString("gameurl");
		gameCode = rs.getString("gameCode");
		gameNum  = rs.getString("gameNum");
		String url = null;
		if(gameurl.length() >= 24){
			url = gameurl.substring(0,24);
		}

 		String youtube = "https://www.youtube.com/";

		if(!youtube.equals(url)){
			gameurl = "errorPage_iframe.jsp";
		}
		else {
			gameurl = gameurl.replace("watch?v=","embed/");
			
			if(gameurl.contains("&") == true){
		        
				int idx = gameurl.indexOf("&"); 
				
		        gameurl = gameurl.substring(0, idx);
		        System.out.println(gameurl);
			}
		}	
%>
<!-- 게임포스터 -->
<br/><br/><br/><br/>
<section class="pb-5">
<div class="text-center">
	<figure >
		<img id="main_TitleImage" class="figure-img img-fluid rounded "
			src="./resources/images/<%= rs.getString("gameTitleImage")%>" style="height: 45rem;  width: 45rem;">
	</figure>
</div>

<!-- 게임포스터 -->

<!-- 세부 정보  -->
<div class="row g-5">
		<!-- 팀, 팀원 이름  -->
		<div class= "text-center" id="portfolio">
		<p class="fs-3">
			<h2 class="section-heading text-uppercase"><%= rs.getString("gameTeamname") %></h2>
		</p>
	
		<p class="fs-3">
		<%	i = 1;
		/* 와일문이 아닌 for문으로 변경 */
		for(int j=1;j<7;j++){
			
			if(rs.getString("gameMember"+i) != null){
		%>
				<b><%= rs.getString("gameMember"+i)%></b>
		
		<% } i++;
			} %>
		
		</p>
		</div>
		<!-- 팀, 팀원 이름  -->
		
	<div class="">
		<!-- 게임 제목  -->
		<h2 class=" text-center">
			<p class="fs-3">
				<b><%= rs.getString("gameTitle") %></b>
			</p>
		</h2>
		<!-- 게임 제목 -->
		<!-- 게임 세부 설명 -->
		<p class="fs-5 m-5">
			<b><%= rs.getString("gameDescription") %></b>
		</p>
		<!-- 게임 세부 설명 -->
	</div>
	</section>
	<!-- 게임 스크린샷 -->
<section class="py-3 bg-light">
  <div class="container px-5 px-lg-5 mt-5">
    <h2 class="fw-bolder mb-4">스크린샷</h2>

    <!-- Swiper -->
    <div id="body_slider" style="--swiper-navigation-color: #000; --swiper-pagination-color: #000"
      class="swiper mySwiper2 pb-4 ">
      <div class="swiper-wrapper" >
     		<%	 i = 1; 
			while(rs.getString("gameImage"+i) != null) {%>
			 <div class="swiper-slide">
				<img class="img-thumbnail"  src="./resources/images/<%= rs.getString("gameImage"+i)%>">
			</div>
			<%i++;
			if(i == 6)
				break;
		} %>	
       
      </div>
      <div class="swiper-button-next" onselectstart="return false"></div>
      <div class="swiper-button-prev" onselectstart="return false"></div>
    </div>
    <div class="swiper mySwiper" id="over_slider">
      <div class="swiper-wrapper">

         		<%	 i = 1; 
			while(rs.getString("gameImage"+i) != null) {	%>
	        <div class="swiper-slide" id ="swiper-slide-img2">
				<img src="./resources/images/<%= rs.getString("gameImage"+i)%>">
		    </div>
			<%i++;
			if(i == 6)
				break;
		} %>	
        </div>
      </div>
    </div>
<!-- 게임 스크린샷 -->
  
	<!-- 유튜브 링크 -->
	<div class="container px-5 px-lg-5 mt-5">
		<h2 class="fw-bolder mb-4">플레이 영상</h2>
			<div class=" mb-3 rounded text-center ">
				<div class="ratio ratio-16x9">
				<iframe src=<%=gameurl %>  allowfullscreen></iframe>
				</div>
			</div>
	</div>
	<!-- 유튜브 링크 -->
</section>
<!-- 세부 정보  -->
			




<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>


<!-- Initialize Swiper -->
<script>
  var swiper = new Swiper(".mySwiper", {
    loop: true,
    spaceBetween: 10,
    slidesPerView: 4,
    freeMode: true,
    watchSlidesProgress: true,
  });
  var swiper2 = new Swiper(".mySwiper2", {
    loop: true,
    spaceBetween: 10,
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    thumbs: {
      swiper: swiper,
    },
  });
</script>



			
<!-- 댓글 입력  -->	
<form method="post" action="./Reply_Registration.jsp" >
<div class="card mb-2">
	<div class="card-header bg-light">
	        <i class="fa fa-comment fa"></i> REPLY
	</div>
	<div class="card-body">
		<ul class="list-group list-group-flush">
		    <li class="list-group-item">
			<div class="form-inline mb-2">
				<div class="row">
					<div class="col-auto">
					
						<label for=""><i class="fas fa-user-circle fa-2x"></i></label>
					</div>
					<div class="col-sm-2">
						<input type="text" class="form-control ml-2" placeholder="닉네임"  id="inpName"  name ="replyId" value="" id="invalidCheck" required>
					</div>
					<div class="col-auto">
						<label for="" class="ml-4"><i class="fa fa-unlock-alt fa-2x"></i></label>
					</div>						
					<div class="col-sm-2">
						<input type="password" class="form-control ml-2" placeholder="비밀번호" id="replyPw" name = "replyPw" value=""  required>
					</div>
				</div>
				    <input type="hidden" id="gameNum" name="gameNum" value="<%=rs.getString("gameNum")  %>"> 		
				    <input type="hidden" id="gameTitle" name="gameTitle" value="<%=rs.getString("gameTitle")%>"> 		
			</div>
			<textarea id ="replyComment"name ="replyComment" class="form-control" id="" rows="3" required></textarea>
			<button type="submit" class="btn btn-dark mt-3">댓글 달기</button>
		    </li>
		</ul>
	</div>
</div>
</from>
<!-- 댓글 입력  -->	

<!-- 댓글창 -->
<% Connection conn2 = DBConn.getConnection(); %>
<%
			session.invalidate();
			PreparedStatement pstmt2 = null;
			ResultSet rs2 = null;
			
			String sql2 = "select * from Reply where gameNum =  ? ";
			
			
			// Connection 객체로 부터 쿼리를 주고 PreparedStatement 얻고있다.
			pstmt2 = conn2.prepareStatement(sql2);
			pstmt2.setString(1, gameNum);

			// 쿼리문의 결과를 받아오고 있다.
			rs2 = pstmt2.executeQuery();
			
			%>


 <div class="card bg-light">
     <div class="card-body">
     		<%
			while (rs2.next()) {
			if(rs2.getString("Replynum") != null){
			%>
         <div class="d-flex mb-4">
             <!-- Parent comment-->
             <div class="flex-shrink-0"><label for=""><i class="fas fa-user-circle fa-2x"></i></label></div>
             <div class="ms-3">
                 <div class="fw-bold"><%=rs2.getString("replyId") %>
                 <button name = "Replyremove_btn" type="button" class="btn-close" aria-label="Close" onclick="showMap('<%=rs2.getString("replyPw") %>','<%=rs2.getString("Replynum") %>','<%= rs.getString("gameTitle")%>')"></button></div>
                 <pre><%=rs2.getString("replyComment") %></pre>          
             </div>
         </div>
         	<%}
			}%>
	</div>
	
</div>
	<%
		if(rs2 != null) rs2.close();
		if(pstmt2 != null) pstmt2.close();
		if(conn2 != null) conn2.close();
	%>

<!-- 댓글창 -->
	<hr>
    <!-- Footer-->

</main>

	<%
		}
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		%>
    <footer class="footer py-4">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-4 text-lg-start">Copyright &copy; Your Website 2022</div>
                <div class="col-lg-4 my-3 my-lg-0">
         
                </div>
                <div class="col-lg-4 text-lg-end">
                    <a class="link-dark text-decoration-none me-3" >Privacy Policy</a>
                    <a class="link-dark text-decoration-none" >Terms of Use</a>
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
