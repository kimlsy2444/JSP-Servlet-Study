<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.List"%>
<%@page import="dao.GameInfoRepository"%>
<%@page import="dto.GameInfo"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.File"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<% request.setCharacterEncoding("UTF-8"); %>
<html lang="ko">

<head>
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
<link rel="stylesheet" href="./resources/css/infobody.css" />

<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>
<style type="text/css">
#main_TitleImage {
	width: 1100px;
	height: 600px;
}
</style>

<body>
	<!-- 게임포스터 -->
	<%@ include file="dbconn.jsp"%>
	<%	
		int i = 0;
		StringBuffer sf = new StringBuffer();
		
		//어떤 게임정보 을 편집할지 id값이 넘어오는 것을 받고 있다.
		String gameTitle = request.getParameter("id");
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from gameinfo where gameTitle = ?";
		//Connection객체로 부터 쿼리문를 주고 PreparedStatement를 얻고 있다.
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, gameTitle);
		
		//쿼리문의 결과를 받아오고 있다.
		rs = pstmt.executeQuery();
		if(rs.next()) {
	%>
	<main class="container">
		<!-- 게임포스터 -->
		<div class="text-center">
			<figure class=" p-4 p-md-5 mb-4">
				<img id="main_TitleImage" class="figure-img img-fluid rounded "
					src="./images/<%= rs.getString("gameTitleImage")%>">
			</figure>
		</div>
		<!-- 게임포스터 -->

		<div class="aside">
			<div class="row g-5">
						<p class="fs-3">
					
							<b><%= rs.getString("gameTeamname") %></b>
						</p>

						<p class="fs-3">
						<%	i = 1;
							while(rs.getString("gameMember"+i) != null) {
						%>
							<b><%= rs.getString("gameMember"+i)%></b>
						<%	
						i++;
							if( i == 4)
								break;
							}
						%>
						</p>
				<div class="col-md-7">
					<!-- 게임 타이틀 이미지 -->
					<h2 class=" text-center">
						<p class="fs-3">
							<b><%= rs.getString("gameTitle") %></b>
						</p>
					</h2>
					<!-- 게임 타이틀 이미지 -->
					<!-- 게임 세부 설명 -->
					<p class="fs-5 m-5">
						<b><%= rs.getString("gameDescription") %></b>
					</p>
					<!-- 게임 세부 설명 -->
				</div>
				<!-- 게임 스크린샷, 유튜브 -->
				<div class="col-md-3 ">
					<p class="fs-3">
						<b>게임 스크린샷</b>
					</p>
					<div class="col-md-4">
					<%	 i = 1; 
						while(rs.getString("gameImage"+i) != null) {	%>
						<div class="  text-center " style="width: 350px; height: 195px;">	
							<img class=" img-thumbnail" style="width: 100%; height: 100%" src="./images/<%= rs.getString("gameImage"+i)%>">
						</div>	
						<%i++;
						if(i == 4)
							break;
					} %>							
					</div>
			
				</div>
				<!-- 게임 스크린샷, 유튜브 -->
				
				<!-- 유튜브 링크 -->
				<div class=" mb-3 rounded text-center ">
					<iframe style="width: 1100px; height: 500px;"
						img-thumbnail " src=<%=rs.getString("gameurl") %>> </iframe>
				</div>
				<!-- 유튜브 링크 -->
	</main>

	<%
		}
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		%>

</body>
</html>