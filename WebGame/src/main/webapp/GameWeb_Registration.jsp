<%@page import="dbconn.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  errorPage="errorPage.jsp"%>

<!-- errorPage="errorPage.jsp" -->
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
 <link href="./resources/css/List.css?ver=1" rel="stylesheet" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<title>졸업작품 업로드</title>
<style>
body {
	background: #eaeaea;
}

.card img {
	width: 100%;
	height: 280px;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}


@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>

<link href="./resources/css/form-validation.css" rel="stylesheet">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="./resources/libs/jquery.MultiFile.min.js"></script>
<script src="./resources/js/addinputbox.js"></script>
<script src="./resources/js/form-validation.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.tiny.cloud/1/0l59628fv3vfh59v9iuukenyrgaoye49tl7juif9c89v6vkz/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
<script src="./resources/js/img-exception.js"></script>

</head>

<%-- <%@ include file = "dbconn.jsp" %> --%>
<% Connection conn = DBConn.getConnection(); %>

<!-- null 이면 빈공백 출력 함수  -->
<%!
public static String checkNull(String str) {
	return (str == null || str.equals("")) ? "" : str;
}
%>

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

<% 	
	int i = 6;
	int j = 1;
	//어떤 제품을 편집할지 id값이 넘어오는 것을 받고 있다.
	String gameCode = request.getParameter("gameCode");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from GameInfo where gameCode = ?";
	//Connection객체로 부터 쿼리문를 주고 PreparedStatement를 얻고 있다.
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, gameCode);
	
	//쿼리문의 결과를 받아오고 있다.
	rs = pstmt.executeQuery();
	
	

	if(rs.next()) {
%>
 <br/><br/><br/><br/><br/> 
<main class="container mt-5">
	<!-- 이미지 유튜브 업로드 -->
	<form  method="post" class="needs-validation"  action="./processAddGameInfo.jsp"   
		  enctype="multipart/form-data" novalidate>
    <input type="hidden" id="gameCode" name="gameCode" value="<%=gameCode %>"> 
		<!-- 졸작 소개 텍스트 창 -->
		<h4>
			<span class="badge bg-secondary rounded-pill  text-center">졸업작품 업로드</span>
		</h4>
		<div class="col-sm-12">
			<label class="form-label"></label> <input type="text"
				class="form-control" name="gameTitle" placeholder="게임 제목" value="<%= checkNull(rs.getString("gameTitle"))%>"
				required>
		</div>
		<!-- 팀명 -->
		<div class="col-sm-12">
			<label class="form-label"> </label> 
			<input type="text"
				class="form-control" name="gameTeamname" placeholder="팀명" value="<%= checkNull(rs.getString("gameTeamname"))%>"required>
		</div>
		<label class="form-label"> </label> 
		<!-- 팀명 -->
		
		<!-- 인원 추가 -->
		<div class="col-sm-12">
			<input type="button" class="pt-1 mb-3 btn btn-outline-success" id="btn1" name="btn1" value="추가">
			<input type="button" class="pt-1 mb-3 btn btn-outline-danger"  id="btn2" name="btn2" value="삭제">
			<div>
				<% if (rs.getString("gameMember"+i) == null){ %><div id="div_chk" class="row row-cols-4"></div><%} %>
				<% if (rs.getString("gameMember"+i) !=null){ %>
				
				<div id="div_chk" class="row row-cols-4"><%
				
				} %>
					<%for(int m=6;m>0;m--){ %>
					
					<%if (rs.getString("gameMember"+j) != null){ %>
					<div id='id_chk'>
						<input type='text' class='form-control class_chk'  name="<%= rs.getString("gameMember"+j)%>" value="<%=rs.getString("gameMember"+j)%>" required>
					</div>
	
					<% }
					System.out.println(j);
						j++;

					}
				 	%>
	 	
				</div>
			</div>
		</div>
		<!-- 인원 추가 -->
		
		<!-- 게임 소개 -->
		<div class="col-12">
			<label class="form-label"></label>
			<div class="input-group has-validation">
				<textarea class="form-control" id = "editor" name="gameDescription" style=" height: 600px; width: 1200px;" 
					placeholder="게임 소개" value="" required><%= checkNull(rs.getString("gameDescription"))%></textarea>
			</div>
		</div>
		<hr class="my-4">
		<!-- 게임 소개 -->


		<!--  유튜브 업로드 -->
		<h4 class="d-flex justify-content-between ">
			<span class="badge bg-secondary rounded-pill  text-center">게임 소개 영상 유튜브 링크</span>
		</h4>
		<div class="input-group pt-2 pb-3">
			<input type="text" name="gameurl" class="form-control " value="<%= checkNull(rs.getString("gameurl"))%>"
				required placeholder="게임 소개 영상">
		</div>
		<!--  유튜브 업로드 -->
		
		<!-- 이미지 등록 -->
		<div class="row row-cols-2 ">
			  <!-- 타이틀 이미지 등록 및 미리보기 -->
		      <div class="col">
  			      <h4 class="d-flex justify-content-between ">
		          <span class="badge bg-secondary rounded-pill  text-center">타이틀 이미지</span>
		      </h4>
		          <div class="card p-2" style="width:100%; height:330px;">
		              <table>
		                  <tr>
		                      <div class="input-group">
		                          <div class="form-control">
		                              <div id="image_container" class="card-img-top">
		                              <%
		                          			if(rs.getString("gameTitleImage") != null) {	%>
		                          			<img alt="" src="./resources/images/<%= rs.getString("gameTitleImage")%>">
		                              <%}%>
		                              	
		                              </div>
		                          </div>
		                      </div>
		                  </tr>
		              </table>
		          </div>
		          <div class="input-group pt-2">
		              <input id ="image" class="form-control" type="file" name="gameTitleImage"value=""
		                     onchange="addFile(this); setThumbnail(event);" accept="image/gif, image/jpeg, image/png"> 
		          </div>
		      </div>
		      <!-- 타이틀 이미지 등록 및 미리보기 -->
		
		      <!-- 썸네일 이미지 등록 및 미리보기 -->
		      <div class="col">
  			      <h4 class="d-flex justify-content-between ">
		          <span class="badge bg-secondary rounded-pill  text-center">인게임 이미지</span>
		      </h4>			      
		          <div class="card p-2" style="width:100%; height:330px;">
		              <table>
		                  <tr>
		                      <div class="input-group">
		                          <div class="form-control">
		                              <div id="images_container" style="overflow-y:auto; white-space:nowrap;">
             							<%	 i = 1; 
											while(rs.getString("gameImage"+i) != null) {	%>
												
												<img src="./resources/images/<%= rs.getString("gameImage"+i)%>">
											
											<%i++;
											if(i == 6){
												
												break;
											}
												
											} 
									%>
		                              </div>
		                          </div>
		                      </div>
		                  </tr>
		              </table>
		          </div>
		          <div class="input-group pt-2">
		              <input id ="images" class="form-control" type="file" name="gameImage" value=""  multiple
		                  onchange="addFile(this); setDetailImage(event);" accept="image/gif, image/jpeg, image/png">
		          </div>
		      </div>
           	<!-- 썸네일 이미지 등록 및 미리보기 -->
		</div>
		<!-- 이미지 등록 -->
		
		<div class="pt-3 pb-3">
			<input  class="w-20 btn btn-outline-dark " type="submit" value="작품 등록"/>
			<a href="GameWeb_Main.jsp"class="w-20 btn btn-outline-danger ">등록 취소</a>
		</div>
	</form>
	<script src="./resources/js/form-validation.js"></script>
	<script src="./resources/js/thumbnail.js"></script>
	<script src="./resources/js/tinyeditor.js"></script>
</main>


	
	<%}
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();	
	%>
	
</body>
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
</html>